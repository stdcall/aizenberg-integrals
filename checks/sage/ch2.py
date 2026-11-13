"""Exact checks of Chapter II, §§8-12, "Integral Representations of Special
Form" (printed pp. 59-92).

Run: sage -python checks/sage/ch2.py (plain asserts; do not use -O).  The
last line of the output is "ok ch2: N checks" (last run with SageMath 10.9,
2026-11-13, about ten seconds).

Book: L. A. Aizenberg and A. P. Yuzhakov, Integral Representations and
Residues in Multidimensional Complex Analysis, AMS Translations of
Mathematical Monographs 58, 1983.  Pages are the printed pages, formula
numbers those of the book, labels those of content/02-08-...02-12-....
Expected values are the book's formulas, written below as they are printed
(with the corrections of corrections.json where marked); the Typst sources
are not parsed.  Where the book is wrong, the printed reading is kept as a
refuted check (`refuted`: the printed reading must fail) beside the
corrected one.

Exact arithmetic only: Q, Q(i), cyclotomic fields, polynomial rings and
their fraction fields, Laurent polynomials, exact symbolic integrals of
polynomials and powers, exact gamma values at rational points, pi as a
symbol.  (Sage's factorial and binomial return Python ints for Python int
arguments; they are redefined below to return exact integers.)

Conventions.  The orientation of C^n is that of the Preliminaries (p. 6):
dx_1 ^ ... ^ dx_n ^ dy_1 ^ ... ^ dy_n = (-i/2)^n dzbar ^ dz > 0, and bD is
oriented as the boundary of D.  Every kernel of the Cauchy-Fantappie type
is wedged with d zeta = d zeta_1 ^ ... ^ d zeta_n, so only the d zetabar
parts of differentials matter; a form is a dict {generators: coefficient}.
"Jets": an identity of kernels that, at a point, involves only the values
and the first zetabar-derivatives of the data is checked with these values
and derivatives as independent symbols (functions holomorphic in zeta have
d = 0 there), which proves it for all data in that dimension.  Integrals
over Reinhardt domains use polar coordinates in each variable (only
zeta^c zetabar^c survive) and the Dirichlet integral over the simplex,
computed by iterated exact integration; boundary integrals are turned into
volume integrals by Stokes' formula (section A).  Integrals over U(2) use
X = e^(i psi) [[a, -bbar], [b, abar]] and the moments of the sphere S^3.

What is checked (ranges are exhaustive unless stated):

A  Preliminaries used here: the orientation formula and the factor
   (-1)^(n(n-1)/2) of Vladimirov's orientation, n <= 4; the Stokes
   reduction d(g d zetabar_[k] ^ d zeta) = (-1)^(k-1) g_(zetabar_k)
   d zetabar ^ d zeta, n <= 4; the Dirichlet integrals c!/(|c| + n)!,
   n <= 3, |c| <= 4.
B  §8, 1°-2° (pp. 59-61): (8.1), phi(z, z) = 1 for two injective maps of
   the disc; Propositions 8.2 and 8.3: the numerator of (3.13) for P^T w
   is det P times that for w (P holomorphic), n = 2, 3, 4, and its
   homogeneity in w; an explicit Hefer decomposition of Q and
   <q^T w, zeta - z> = <w, Q(zeta) - Q(z)> (so (8.4) is (8.3) for q^T w,
   Omega = det q); Proposition 8.2, 1, for two biholomorphic maps
   (P(a, a) = g'(a)); Proposition 8.2, 2, as an identity of kernels for
   n = 2 (jets); 2°: w = zetabar - zbar gives the Martinelli-Bochner
   kernel (1.2), n <= 4.
C  §8, 3° (pp. 61-62): the numerator of (8.5) for w = grad rho is
   sum delta_k d zetabar_[k] with the printed delta_k, n <= 5 (generic
   symbols); L(rho) = sum (-1)^(l-1) rho'_(zetabar_l) delta_l for the
   printed L(rho), n <= 5 (all n: Lean, Ch2.lean); on Gamma_m the relation
   d zetabar_[k] ^ d zeta = (-1)^(m-k) rho'_(zetabar_k)/rho'_(zetabar_m)
   d zetabar_[m] ^ d zeta and the restored (8.6)
   (ii-61-formula-8-6), all m, n <= 4 (the opposite sign refuted);
   Proposition 8.4 (L(rho) = |grad rho|^2 times the product of the
   eigenvalues of the Levi form on (8.7)), rho real, generic Hermitian
   data, n = 2, 3; the ellipsoid: delta_k, L(rho), the denominator of
   (8.8), n <= 4, and (8.8) reproduces every zeta^a, |a| <= 3 (n = 2),
   |a| <= 2 (n = 3), alpha and R symbolic.
D  §8, 4°-5° (pp. 62-64): the identity behind the corrected chain before
   (8.9) (ii-63-bochner-ono-chain), n <= 4 (the inequalities: Lean);
   (8.10) for Psi = F(z) + F(zetabar) + sum a_k z_k^(m_k)
   zetabar_k^(m_k) (= sum a_k |z_k^(m_k) - zeta_k^(m_k)|^2) and the
   printed z_k^m zetabar_k^(m_k) refuted (Psi(z, zbar) not real)
   (ii-64-exponent-mk), m in {(1,1), (1,2), (2,3), (3,1)}, F of degree 2;
   Bishop's example; the kernel for B^alpha (Hefer w, denominator and
   numerator) for alpha in {(1,2), (2,1), (2,3), (3,3), (1,1,2), (2,1,3)},
   and its reproduction of zeta^a, |a| <= 2, n = 2, alpha in {(1,2),
   (2,1), (1,3), (2,2)} (terms of z-degree <= |a| + 1).
E  §9 (pp. 65-66): sum (-1)^(k-1) lambda_k d lambda_[k] on the simplex
   (orientation by lambda_2, ..., lambda_n) and its volume 1/(n-1)!,
   n <= 6 (ii-66-simplex); the substitution u = U lambda and
   det U = Omega/prod (chi(zeta) - chi(z)), n <= 4; the computation for
   n = 2 (bracket = -Omega/prod; lambda_1 d lambda_2 - lambda_2
   d lambda_1 = -d lambda_1, so with the orientation of (4.2) lambda_1
   runs from 1 to 0 and the result is +Omega/prod; the printed
   int_0^1 d lambda_1 refuted, ii-66-weil-orientation); q(z, z) = chi'(z)
   for three explicit chi (the Cauchy formula on the torus then gives
   (9.1)).
F  §10 (pp. 66-73), n = 2, real quadratic rho with generic coefficients:
   Taylor's formula of Lemma 10.2 (corrected; the printed 1/2 and the
   printed w_1 refuted) (ii-69-taylor, ii-69-w1); (10.9): in the
   coordinates w_1, w_2 = z_2, rho = x_1 + Hermitian form + O(|w|^3)
   (jets of order 2); Lemma 10.1, convex case: 2 Re F - rho(zeta) +
   rho(z) = quadratic part at zeta - z exactly, assertion 3), the ball
   (sigma = 1, equality), the printed sigma = 1 refuted for |z_1|^2/4 +
   |z_2|^2 (ii-67-sigma-convex); Lemma 10.6: d Re F = (1/2) d rho at
   zeta = z; Lemma 10.7: the inner integral, the volume element of
   R^(2n-1) (the factor |S^(2n-3)| = 2 pi^(n-1)/(n-2)! dropped in the
   printed proof), the last integral, n <= 6; the printed bound
   r^(2n-3)/(r^2 + eps^2)^(n-1) <= 1/(r + eps) refuted (n = 2, r = 2,
   eps = 1), the corrected bound with 2^(n-1) on samples only (proved in
   Ch2.lean) (ii-72-lemma-10-7-constants); Theorem 10.5: the bound for
   |F|; the ball as model of Theorem 10.5: int d mu/|1 - r zetabar_1|^n
   = sum e_j r^(2j), e_j = 1/(j + 1) for n = 2 (= -ln(1 - r^2)/r^2),
   (j + 1) e_j increasing and bounded for n = 3, 4 (j < 200 only).
G  §11, 1° (pp. 73-75): the functions phi_j of (11.1) from rho =
   |zeta_1| - psi (w/<w, zeta> = (phi_k/zeta_k), sum phi = 1, y_j, the
   numerator d phi_2 ^ ... ^ d phi_n/(zeta_1...zeta_n)), n <= 5; the
   printed psi^2 refuted (ii-73-phi-denominator, ii-73-y-phi); on the
   torus d zeta/zeta = i^(n-1) d xi/xi ^ d theta_[1], n <= 6, hence the
   constant (n-1)!/((2 pi)^n i) of (11.2), (11.3), (11.5), (11.6)
   (ii-74-formula-11-2 ...); (11.6) reproduces z^a for every k, n = 2, 3
   (|a| <= 3) and n = 4 (|a| <= 2), the printed constant (2 pi i)^(-n)
   refuted; the Temlyakov constants 1/(4 pi^2 i); the kernel of (11.3);
   (11.4) L_k(M_k) = (n-1)! xi^(n-1)/(xi - u)^n, n <= 6, all k
   (ii-74-m-k).
H  §11, 2°-3° (pp. 75-80): Example 1: a_k^(p) by exact integration,
   p <= 4, k1, k2 <= 3 (and directly in t, p <= 2), the series of
   1/((1 - x_2)^p - x_1) and of h_p (total degree <= 5); p = 1: (11.8)
   uses the moments of the normalized sphere measure; Example 2: a_k,
   k1, k2 <= 4, the closed form (identity in Q(s1, s2)) and its series
   (degree <= 5); Example 3: a_k for D_(p,q) and the roots-of-unity
   formula for h_(p,q) (coefficients l1 <= 2, l2 <= 3), its rationality
   and h_(p,1) = h_p, (p, q) in {(1,1), (2,1), (1,2), (2,2), (2,3),
   (3,2)}; (11.13) for the ball with d lambda = (n-1)! d tau, n <= 4,
   k_i <= 2; Theorem 11.3: the decomposition alpha = l k (n = 2,
   |alpha| <= 30; n = 3, |alpha| <= 12).
M  §12 (pp. 80-91): sphere moments from the ball moments, n <= 4; the
   measure of Example 2 has mass 1, the printed one 2^(1-n)
   (ii-89-ball-measure); the form of (8.8) on the sphere is 2^(n-1) i^n
   ds, so its kernel is (n-1)!/(2 pi^n)(1 - <z, zetabar>)^(-n) ds, n <= 4;
   the Szego kernels of the ball and the polydisc; (12.4) with Q = 2h - 1,
   the formula with Im f, the middle term of the last display of the
   proof of Proposition 12.1 at z^0 = 0, and (12.5), for polynomials of
   degree <= 4 (disc), 3 (polydisc, ball n = 2), 2 (ball n = 3) with
   generic complex coefficients; (12.1); Proposition 12.3 on the ball
   n = 2 (series to degree 4); Lemma 12.5 with the corrected
   coefficients a_(J frakJ k) (conjugated phi) and (12.17) read with
   conj(phi_l^k), all |J|, |frakJ| <= 2, against all z^N, zbar^N with
   |N| <= 4, n = 1 (circle), 2, 3 (sphere), 2 (torus), and the printed
   coefficients refuted in each case (ii-85-coefficients-conjugate);
   (12.20) with the corrected coefficients orthogonal to all z^N, zbar^N,
   |N| <= 5, |J|, |frakJ| <= 2, n = 2, 3 (sphere), 2 (torus), the printed
   order refuted on the sphere (ii-87-formula-12-20), the ball
   polynomials of Example 2 (ii-89-ball-polynomial), alpha = 1 on the
   polydisc; Proposition 12.7 as polynomials on the sphere, n = 2: in
   every weight |m_i| <= 2 the second and third types span the kernel of
   the pairing with the pluriharmonic monomial (|c| <= 3); Lemma 12.8:
   the printed H_a vanishes on Im(z_1 zbar_2) (ii-87-h-a).  Example 3:
   mu = (4 pi^3)^(-1) d phi ^ du has mass 1 and is the Haar probability
   measure of U(2); conj X = (det X)^(-1) [[x22, -x21], [-x12, x11]];
   (12.25) with (-1)^(q1 - q2) as a polynomial identity, 2j <= 8, the
   printed (-1)^(q1 + q2) refuted for every half-integer j
   (ii-90-d-conjugate); orthogonality of (det X)^m D^j_(q1,q2) and
   ||.||^2 = 1/(2j + 1), 2j <= 3, -3 <= m <= 2, so the coefficient in
   (12.27) is (2j + 1) int ..., the printed 1/(2j + 1) refuted
   (ii-91-coefficient-2j-plus-1); Lemma 12.10: the functions (12.23)
   with 2j = 2, 3 and -2j < m < 0 are orthogonal to all holomorphic and
   antiholomorphic polynomials of degree <= 4 in X, and for m <= -2j
   they are antiholomorphic; the Szego kernel det^(-2)(I - w X^*)
   reproduces all polynomials of degree <= 2 in w.

What this does NOT establish: any analytic statement (convergence,
existence of the kernels, Hefer's theorem, Theorems 10.5, 10.8, 11.2,
12.2, 12.9, Lemma 10.1 beyond quadratic rho, the density statements of
§12), anything beyond the stated dimensions, degrees and indices; checks
marked "samples" are not proofs; the correspondence of our text with the
printed book.
"""

import itertools
import time

from sage.all import *

COUNT = [0]
T0 = time.time()


def check(condition, label):
    assert bool(condition), label
    COUNT[0] += 1


def refuted(condition, label):
    """The printed reading must fail."""
    assert not bool(condition), "printed reading holds: " + label
    COUNT[0] += 1


def section(name):
    print("%-5s %6.1f s, %d checks" % (name, time.time() - T0, COUNT[0]))


K = QuadraticField(-1, "i")
II = K.gen()


# Sage's symbolic factorial and binomial return a Python int for Python int
# arguments, and int/int is a float: use exact integers throughout.
def factorial(k):
    return ZZ(k).factorial()


def binomial(a, b):
    return ZZ(a).binomial(ZZ(b))


# ---------------------------------------------------------------------------
# Exterior algebra of single forms: a form is a dict {gens: coefficient},
# gens an increasing tuple of integer generators (anticommuting).
# ---------------------------------------------------------------------------


def sort_sign(seq):
    seq = list(seq)
    if len(set(seq)) != len(seq):
        return 0, None
    inv = 0
    for a in range(len(seq)):
        for b in range(a + 1, len(seq)):
            if seq[a] > seq[b]:
                inv += 1
    return (-1 if inv % 2 else 1), tuple(sorted(seq))


def fclean(f):
    return {k: c for k, c in f.items() if c != 0}


def fadd(*fs):
    out = {}
    for f in fs:
        for k, c in f.items():
            out[k] = out.get(k, 0) + c
    return fclean(out)


def fscale(c, f):
    return fclean({k: c * v for k, v in f.items()})


def fsub(f, g):
    return fadd(f, fscale(-1, g))


def wedge(f, g):
    out = {}
    for A1, c1 in f.items():
        for A2, c2 in g.items():
            s, A = sort_sign(A1 + A2)
            if s == 0:
                continue
            out[A] = out.get(A, 0) + s * c1 * c2
    return fclean(out)


ONE = {(): 1}


def wedges(fs):
    r = dict(ONE)
    for f in fs:
        r = wedge(r, f)
    return r


def gen(i, c=1):
    return {(i,): c}


def fun(c):
    return {(): c}


def dform(f, table):
    """Exterior derivative: table = [(variable, generator)]; the new
    differential is put in front."""
    out = {}
    for A, c in f.items():
        for var, gi in table:
            dc = c.derivative(var)
            if dc == 0:
                continue
            s, A2 = sort_sign((gi,) + A)
            if s == 0:
                continue
            out[A2] = out.get(A2, 0) + s * dc
    return fclean(out)


def omit(n, k, base=0):
    """d x_[k] = d x_1 ^ ... (no d x_k) ... ^ d x_n on generators
    base, ..., base + n - 1 (k counted from 1)."""
    return {tuple(base + j for j in range(n) if j != k - 1): 1}


def cf_numerator(ws, dws):
    """sum_k (-1)^(k-1) w_k d w_[k] for given functions w_k and 1-forms
    d w_k."""
    n = len(ws)
    out = {}
    for k in range(n):
        rest = wedges([dws[j] for j in range(n) if j != k])
        out = fadd(out, fscale((-1) ** k * ws[k], rest))
    return out


# ---------------------------------------------------------------------------
# A. Conventions of the Preliminaries used below: orientation and Stokes'
#    formula; Dirichlet integrals over the simplex.
# ---------------------------------------------------------------------------

# Real coordinates: generators 0..n-1 = dx_1..dx_n, n..2n-1 = dy_1..dy_n;
# dz_k = dx_k + i dy_k, dzbar_k = dx_k - i dy_k.
for n in range(1, 5):
    dz = [fadd(gen(k), gen(n + k, II)) for k in range(n)]
    dzb = [fadd(gen(k), gen(n + k, -II)) for k in range(n)]
    vol = wedges(dzb + dz)
    # p. 6: dx_1 ^ ... ^ dx_n ^ dy_1 ^ ... ^ dy_n = (-i/2)^n dzbar ^ dz
    check(fscale((-II / 2) ** n, vol) == {tuple(range(2 * n)): 1},
          "A orientation n=%d" % n)
    # the orientation of [Vladimirov], [Pham] differs by (-1)^(n(n-1)/2)
    vl = wedges([wedge(dzb[k], dz[k]) for k in range(n)])
    check(fscale((-II / 2) ** n, vl)
          == {tuple(range(2 * n)): (-1) ** (n * (n - 1) // 2)},
          "A Vladimirov orientation n=%d" % n)

# Stokes reduction used for every boundary integral below: for a function
# g of (zeta, zetabar), d(g dzetabar_[k] ^ dzeta)
#   = (-1)^(k-1) dg/dzetabar_k dzetabar ^ dzeta,
# so int_(bD) sum_k (-1)^(k-1) g_k dzetabar_[k] ^ dzeta
#   = (2i)^n int_D sum_k dg_k/dzetabar_k dV.
for n in range(1, 5):
    Rz = PolynomialRing(QQ, ["z%d" % j for j in range(n)]
                        + ["zb%d" % j for j in range(n)]
                        + ["c%d" % j for j in range(n)])
    zz = Rz.gens()[:n]
    zb = Rz.gens()[n:2 * n]
    cc = Rz.gens()[2 * n:]
    # generators: 0..n-1 dzetabar, n..2n-1 dzeta
    table = [(zb[j], j) for j in range(n)] + [(zz[j], n + j) for j in range(n)]
    for k in range(1, n + 1):
        g = sum(cc[j] * zz[j] * zb[(j + k) % n] ** 2 for j in range(n)) + zb[0] * zz[n - 1]
        dzeta = {tuple(range(n, 2 * n)): 1}
        lhs = dform(wedge(fun(g), wedge(omit(n, k), dzeta)), table)
        rhs = {tuple(range(2 * n)): (-1) ** (k - 1) * g.derivative(zb[k - 1])}
        check(lhs == rhs, "A Stokes reduction n=%d k=%d" % (n, k))

# Dirichlet integrals: int over {s_i >= 0, sum s_i <= 1} of s^c ds
#   = c!/(|c| + n)!   (iterated exact integration, n <= 3, |c| <= 4).
S_ = [var("s%d" % j) for j in range(8)]


def simplex_integral(expr, n):
    """Iterated exact integral of a polynomial expression in s_0..s_(n-1)
    over {s >= 0, sum s <= 1}."""
    r = expr
    for j in range(n - 1, -1, -1):
        upper = 1 - sum(S_[:j])
        r = integrate(r, S_[j], 0, upper).expand()
    return r


for n in range(1, 4):
    for c in itertools.product(range(5), repeat=n):
        if sum(c) > 4:
            continue
        val = simplex_integral(prod(S_[j] ** c[j] for j in range(n)), n)
        check(val == prod(factorial(x) for x in c) / factorial(sum(c) + n),
              "A Dirichlet %s" % (c,))


def ball_moment(c):
    """int_B |zeta^c|^2 dV over the unit ball of C^n (polar coordinates in
    each variable: dV = prod r_k dr_k dtheta_k, s_k = r_k^2) =
    pi^n c!/(|c| + n)!, returned divided by pi^n."""
    n = len(c)
    return prod(factorial(x) for x in c) / factorial(sum(c) + n)


section("A")

# ---------------------------------------------------------------------------
# B. §8, 1°-2°: (8.1), Propositions 8.1-8.3, the Martinelli-Bochner kernel
#    from the Cauchy-Fantappie kernel.
# ---------------------------------------------------------------------------

# (8.1): phi(zeta, z) = theta'(zeta)(zeta - z)/(theta(zeta) - theta(z)) is
# holomorphic in zeta and phi(z, z) = 1, for two injective maps of the unit
# disc (theta(zeta) - theta(z) = (zeta - z) q(zeta, z), q != 0 there).
Rt = PolynomialRing(QQ, ["t", "x"])
t_, x_ = Rt.gens()
for theta in [Rt.fraction_field()(t_ + t_ ** 2 / 4),
              (t_ - QQ(1) / 3) / (1 - t_ / 3)]:
    num = theta - theta.subs({t_: x_})
    q = num / (t_ - x_)
    check(q.denominator().subs({t_: x_}) != 0, "B (8.1) quotient regular")
    phi = theta.derivative(t_) / q
    check(phi.subs({t_: x_}) == 1, "B (8.1) phi(z, z) = 1")

# Jets.  Every identity of Cauchy-Fantappie kernels below holds pointwise
# and involves only the values of the data and the first zetabar-derivatives
# of w; since every kernel is wedged with d zeta, the d zeta-parts of the
# differentials drop out, and functions holomorphic in zeta (phi, F, P, q,
# zeta - z) have d = 0.  The values and the zetabar-derivatives are taken
# as independent symbols, so the identities are proved for all data in
# that dimension.  Generators 0..n-1 are d zetabar_1..d zetabar_n.


def jet_ring(n, scalars, vectors):
    """Ring with, for each vector name V, values V_k and derivatives
    V_k_j (k, j < n), and plain scalar symbols (zero differential)."""
    names = list(scalars)
    for V in vectors:
        names += ["%s_%d" % (V, k) for k in range(n)]
        names += ["%s_%d_%d" % (V, k, j) for k in range(n) for j in range(n)]
    R = PolynomialRing(QQ, names)
    G = dict(zip(names, R.gens()))
    vals = {V: [G["%s_%d" % (V, k)] for k in range(n)] for V in vectors}
    dmap = {}
    for V in vectors:
        for k in range(n):
            dmap[G["%s_%d" % (V, k)]] = fclean(
                {(j,): G["%s_%d_%d" % (V, k, j)] for j in range(n)})
    return R, G, vals, dmap


def jd(c, dmap):
    """Exterior derivative of a function of the jet symbols (chain rule)."""
    out = {}
    for v, dv in dmap.items():
        dc = c.derivative(v)
        if dc != 0:
            out = fadd(out, fscale(dc, dv))
    return out


def cf_num_jet(ws, dmap):
    return cf_numerator(ws, [jd(w, dmap) for w in ws])


def pairing(ws, vs):
    return sum(a * b for a, b in zip(ws, vs))


for n in [2, 3, 4]:
    scal = ["P%d%d" % (i, j) for i in range(n) for j in range(n)]
    R, G, vals, dmap = jet_ring(n, scal, ["w", "g"])
    w = vals["w"]
    P = matrix(R, n, n, lambda i, j: G["P%d%d" % (i, j)])
    wt = list(P.transpose() * vector(R, w))
    # sum (-1)^(k-1) wt_k d wt_[k] = det P sum (-1)^(k-1) w_k d w_[k] for P
    # holomorphic in zeta (Propositions 8.2, 1, and 8.3)
    check(cf_num_jet(wt, dmap) == fscale(P.det(), cf_num_jet(w, dmap)),
          "B numerator of P^T w, n=%d" % n)
    # homogeneity: multiplying w by a smooth scalar g multiplies the
    # numerator by g^n (the d g terms cancel), so the kernel omega is
    # unchanged
    g = vals["g"][0]
    check(cf_num_jet([g * x for x in w], dmap)
          == fscale(g ** n, cf_num_jet(w, dmap)),
          "B homogeneity of the numerator n=%d" % n)

# Proposition 8.3 (Aizenberg, (8.4)): an explicit Hefer decomposition, and
# <q^T w, zeta - z> = <w, Q(zeta) - Q(z)>; with the identity above,
# Omega omega~(Q(zeta) - Q(z), w) = omega(zeta - z, q^T w), Omega = det q.
Rh = PolynomialRing(QQ, ["x1", "x2", "y1", "y2", "w1", "w2"])
x1, x2, y1, y2, w1, w2 = Rh.gens()
Qx = [x1 ** 2 + x2, x1 * x2 + x2 ** 3]
Qy = [e.subs({x1: y1, x2: y2}) for e in Qx]
qm = matrix(Rh, [[x1 + y1, 1], [x2, y1 + x2 ** 2 + x2 * y2 + y2 ** 2]])
eta = [x1 - y1, x2 - y2]
check(all(Qx[i] - Qy[i] == qm[i, 0] * eta[0] + qm[i, 1] * eta[1]
          for i in range(2)), "B Hefer decomposition of Q")
wt = list(qm.transpose() * vector(Rh, [w1, w2]))
check(pairing(wt, eta) == pairing([w1, w2], [Qx[i] - Qy[i] for i in range(2)]),
      "B <q^T w, zeta - z> = <w, Q(zeta) - Q(z)>")

# Proposition 8.2, 1: two biholomorphic maps g with Hefer matrices P,
# g(zeta) - g(a) = P(zeta, a)(zeta - a) and P(a, a) = g'(a); then
# phi~ = det g'(zeta)/det P(zeta, a) is holomorphic with phi~(a, a) = 1
# and the pulled-back kernel is phi~ omega(zeta - a, P^T w).
Rg = PolynomialRing(QQ, ["x1", "x2", "a1", "a2"])
x1, x2, a1, a2 = Rg.gens()
maps = [([x1, x2 + x1 ** 2], matrix(Rg, [[1, 0], [x1 + a1, 1]])),
        ([x1 * (1 + x2 / 4), x2], matrix(Rg, [[1 + x2 / 4, a1 / 4], [0, 1]]))]
for gmap, Pm in maps:
    ga = [e.subs({x1: a1, x2: a2}) for e in gmap]
    check(all(gmap[i] - ga[i] == Pm[i, 0] * (x1 - a1) + Pm[i, 1] * (x2 - a2)
              for i in range(2)), "B Hefer matrix of g")
    J = matrix(Rg, 2, 2, lambda i, j: gmap[i].derivative([x1, x2][j]))
    check(Pm.subs({x1: a1, x2: a2}) == J.subs({x1: a1, x2: a2}),
          "B P(a, a) = g'(a)")

# Proposition 8.2, 2 (n = 2): with A = <w1, eta>, B = <w2, eta>,
# eta = zeta - a, (F1 phi1 omega(eta, w1) + F2 phi2 omega(eta, w2))/(F1 +
# F2) = phi omega(eta, s), phi = (F1 phi1 + F2 phi2)/(F1 + F2) (holomorphic,
# phi(a, a) = 1 when phi1(a, a) = phi2(a, a) = 1), s = F1 phi1 w1/A + F2
# phi2 w2/B; by homogeneity s may be replaced by S = AB s = F1 phi1 B w1 +
# F2 phi2 A w2, <S, eta> = AB(F1 phi1 + F2 phi2).  Cleared of denominators
# the claim is numer(S) = (F1 phi1 + F2 phi2)(F1 phi1 B^2 numer(w1) + F2
# phi2 A^2 numer(w2)).
R, G, vals, dmap = jet_ring(2, ["F1", "F2", "p1", "p2", "e1", "e2"],
                            ["w", "v"])
eta = [G["e1"], G["e2"]]
wa, wb = vals["w"], vals["v"]
A = pairing(wa, eta)
B = pairing(wb, eta)
c1 = G["F1"] * G["p1"]
c2 = G["F2"] * G["p2"]
S = [c1 * B * wa[k] + c2 * A * wb[k] for k in range(2)]
check(pairing(S, eta) == A * B * (c1 + c2), "B <S, eta> = AB(F1 phi1 + F2 phi2)")
lhs = cf_num_jet(S, dmap)
rhs = fscale(c1 + c2, fadd(fscale(c1 * B ** 2, cf_num_jet(wa, dmap)),
                          fscale(c2 * A ** 2, cf_num_jet(wb, dmap))))
check(lhs == rhs, "B Proposition 8.2, 2 (n = 2)")

# 2°: w = zetabar - zbar in (3.13) gives the Martinelli-Bochner kernel (1.2)
# (d w = d zetabar, <w, zeta - z> = |zeta - z|^2).
for n in range(2, 5):
    Rz = PolynomialRing(QQ, ["zb%d" % j for j in range(n)]
                        + ["c%d" % j for j in range(n)])
    zb = Rz.gens()[:n]
    cz = Rz.gens()[n:]
    w = [zb[k] - cz[k] for k in range(n)]
    dws = [gen(k) for k in range(n)]
    mb = fadd(*[{tuple(j for j in range(n) if j != k): (-1) ** k * w[k]}
                for k in range(n)])
    check(cf_numerator(w, dws) == mb, "B Martinelli-Bochner numerator n=%d" % n)

section("B")

# ---------------------------------------------------------------------------
# C. §8, 3°: (8.5), the restored (8.6), the Levi determinant, Proposition
#    8.4, the ellipsoid formula (8.8).
# ---------------------------------------------------------------------------


def delta_k(b, H, k, n):
    """The printed delta_k (p. 61): first row rho'_(zeta_1..n) = b, then the
    rows l != k with entries rho''_(zeta_j zetabar_l) = H[j][l], j = 1..n."""
    rows = [list(b)] + [[H[j][l] for j in range(n)] for l in range(n) if l != k]
    return matrix(rows).det()


def levi_L(b, a, H, n):
    """The printed L(rho) (p. 62): minus the determinant with first row
    (0, rho'_(zeta_1), ..., rho'_(zeta_n)) and rows
    (rho'_(zetabar_l), rho''_(zeta_1 zetabar_l), ..., rho''_(zeta_n zetabar_l))."""
    rows = [[0] + list(b)] + [[a[l]] + [H[j][l] for j in range(n)]
                              for l in range(n)]
    return -matrix(rows).det()


for n in range(2, 6):
    names = (["b%d" % j for j in range(n)] + ["a%d" % j for j in range(n)]
             + ["H%d%d" % (j, l) for j in range(n) for l in range(n)])
    R = PolynomialRing(QQ, names)
    g = R.gens()
    b = g[:n]
    a = g[n:2 * n]
    H = [[g[2 * n + j * n + l] for l in range(n)] for j in range(n)]
    # w = grad rho = (rho'_(zeta_j)); mod d zeta, d w_j = sum_l
    # rho''_(zeta_j zetabar_l) d zetabar_l
    dws = [fclean({(l,): H[j][l] for l in range(n)}) for j in range(n)]
    num = cf_numerator(list(b), dws)
    deltas = [delta_k(b, H, k, n) for k in range(n)]
    check(num == fclean({omit(n, k + 1).popitem()[0]: deltas[k]
                         for k in range(n)}),
          "C (8.5): numerator = sum delta_k d zetabar_[k], n=%d" % n)
    L = levi_L(b, a, H, n)
    check(L == sum((-1) ** l * a[l] * deltas[l] for l in range(n)),
          "C L(rho) = sum (-1)^(l-1) rho'_(zetabar_l) delta_l, n=%d" % n)
    if n > 4:
        continue
    # On bD, d rho = 0: mod d zeta, theta = sum_l rho'_(zetabar_l) d zetabar_l
    # vanishes on the tangent space.  An (n-1)-form in d zetabar vanishes on
    # ker theta iff its wedge with theta is 0 (both conditions cut out the
    # same (n-1)-dimensional subspace theta ^ Lambda^(n-2)).
    F = R.fraction_field()
    theta = fclean({(l,): F(a[l]) for l in range(n)})
    numF = {k: F(c) for k, c in num.items()}
    for m in range(n):
        dm = omit(n, m + 1)
        for k in range(n):
            # d zetabar_[k] ^ d zeta = (-1)^(m-k) a_k/a_m d zetabar_[m] ^ d zeta
            dif = fsub(omit(n, k + 1), fscale((-1) ** (m - k) * F(a[k]) / F(a[m]),
                                               dm))
            check(wedge(dif, theta) == {}, "C relation on Gamma_m n=%d" % n)
        # (8.6): sum delta_k d zetabar_[k] = (-1)^(m-1) L/rho'_(zetabar_m)
        # d zetabar_[m] on Gamma_m
        restored = fscale((-1) ** m * F(L) / F(a[m]), dm)
        check(wedge(fsub(numF, restored), theta) == {},
              "C restored (8.6) on Gamma_m n=%d m=%d" % (n, m + 1))
        # the opposite sign is excluded
        refuted(wedge(fsub(numF, fscale(-1, restored)), theta) == {},
                "C (8.6) with (-1)^m n=%d" % n)

# Proposition 8.4: L(rho) = |grad rho|^2 times the product of the
# eigenvalues of the Levi form on the complex tangent hyperplane (8.7).
# rho real: rho'_(zetabar_l) = conj(rho'_(zeta_l)), H Hermitian.  With a
# basis E of {sum b_j eta_j = 0} (e_r = b_n e_r - b_r e_n) and the Hermitian
# matrix M of the Levi form, eta^* M eta = sum H_jk eta_j conj(eta_k), the
# product of the eigenvalues is det(E^* M E)/det(E^* E).
for n in [2, 3]:
    names = (["u%d" % j for j in range(n)] + ["v%d" % j for j in range(n)]
             + ["h%d" % j for j in range(n)]
             + ["p%d%d" % (j, k) for j in range(n) for k in range(j + 1, n)]
             + ["q%d%d" % (j, k) for j in range(n) for k in range(j + 1, n)])
    R = PolynomialRing(K, names)
    G = dict(zip(names, R.gens()))

    def cj(f):
        return f.map_coefficients(lambda c: c.conjugate())

    b = [G["u%d" % j] + II * G["v%d" % j] for j in range(n)]
    a = [cj(x) for x in b]
    H = [[None] * n for _ in range(n)]
    for j in range(n):
        H[j][j] = G["h%d" % j]
        for k in range(j + 1, n):
            H[j][k] = G["p%d%d" % (j, k)] + II * G["q%d%d" % (j, k)]
            H[k][j] = cj(H[j][k])
    L = levi_L(b, a, H, n)
    M = matrix(R, n, n, lambda k, j: H[j][k])
    E = matrix(R, n, n - 1, lambda i, r: (b[n - 1] if i == r else 0)
               - (b[r] if i == n - 1 else 0))
    Es = E.transpose().apply_map(cj)
    check(all(sum(b[i] * E[i, r] for i in range(n)) == 0 for r in range(n - 1)),
          "C basis of the complex tangent hyperplane n=%d" % n)
    gram = (Es * E).det()
    levi = (Es * M * E).det()
    norm2 = sum(x * cj(x) for x in b)
    check(L * gram == norm2 * levi, "C Proposition 8.4 n=%d" % n)

# The ellipsoid rho = sum alpha_k |zeta_k|^2 - R^2 (p. 62): delta_k =
# (-1)^(k-1) alpha_1...alpha_n zetabar_k, the denominator is
# R^2 - sum alpha_k zetabar_k z_k on bD, and L(rho) = alpha_1...alpha_n
# sum alpha_k |zeta_k|^2 = alpha_1...alpha_n R^2 on bD: (8.5) and (8.6) give
# (8.8).
for n in range(2, 5):
    names = (["al%d" % j for j in range(n)] + ["x%d" % j for j in range(n)]
             + ["xb%d" % j for j in range(n)] + ["y%d" % j for j in range(n)])
    R = PolynomialRing(QQ, names)
    G = dict(zip(names, R.gens()))
    al = [G["al%d" % j] for j in range(n)]
    ze = [G["x%d" % j] for j in range(n)]
    zb = [G["xb%d" % j] for j in range(n)]
    zz = [G["y%d" % j] for j in range(n)]
    b = [al[j] * zb[j] for j in range(n)]
    a = [al[j] * ze[j] for j in range(n)]
    H = [[al[j] if j == l else 0 for l in range(n)] for j in range(n)]
    pa = prod(al)
    check(all(delta_k(b, H, k, n) == (-1) ** k * pa * zb[k] for k in range(n)),
          "C ellipsoid delta_k n=%d" % n)
    check(levi_L(b, a, H, n) == pa * sum(al[j] * ze[j] * zb[j] for j in range(n)),
          "C ellipsoid L(rho) n=%d" % n)
    rho = sum(al[j] * ze[j] * zb[j] for j in range(n))  # = R^2 on bD
    check(pairing(b, [ze[j] - zz[j] for j in range(n)])
          == rho - sum(al[j] * zb[j] * zz[j] for j in range(n)),
          "C ellipsoid denominator n=%d" % n)


# (8.8) reproduces the monomials: for f = zeta^a, z near 0, the right-hand
# side, with the kernel expanded in powers of X = sum alpha_k zetabar_k z_k,
# equals z^a.  Stokes (section A) and the moments
#   int_D |zeta^c|^2 dV = pi^n prod alpha_k^(-c_k - 1) R^(2|c| + 2n) c!/(|c| + n)!
# (the ball moments of section A after zeta_k -> R zeta_k/sqrt(alpha_k)) give
#   (n-1)!/(2 pi i)^n alpha_1...alpha_n int_bD g sum (-1)^(k-1) zetabar_k
#   d zetabar_[k] ^ d zeta = (n-1)! alpha_1...alpha_n pi^(-n)
#   int_D sum_k d(zetabar_k g)/d zetabar_k dV.


def reinhardt_integral(poly, n, zeta, zetab, moment):
    """int_D poly dV / pi^n for a polynomial in zeta, zetabar (other
    variables are parameters); only the terms zeta^c zetabar^c survive."""
    Rp = poly.parent()
    idx = [Rp.gens().index(v) for v in list(zeta) + list(zetab)]
    total = Rp(0)
    for exps, coeff in poly.dict().items():
        ec = [exps[idx[j]] for j in range(n)]
        ed = [exps[idx[n + j]] for j in range(n)]
        if ec != ed:
            continue
        rest = list(exps)
        for i in idx:
            rest[i] = 0
        total += coeff * moment(ec) * Rp({tuple(rest): 1})
    return total


for n, amax in [(2, 3), (3, 2)]:
    names = (["x%d" % j for j in range(n)] + ["xb%d" % j for j in range(n)]
             + ["y%d" % j for j in range(n)])
    Fa = FractionField(PolynomialRing(QQ, ["al%d" % j for j in range(n)] + ["RR"]))
    al = Fa.gens()[:n]
    RR2 = Fa.gens()[n] ** 2
    R = PolynomialRing(Fa, names)
    G = dict(zip(names, R.gens()))
    ze = [G["x%d" % j] for j in range(n)]
    zb = [G["xb%d" % j] for j in range(n)]
    zz = [G["y%d" % j] for j in range(n)]
    X = sum(al[k] * zb[k] * zz[k] for k in range(n))

    def mom(c):
        return (prod(al[k] ** (-c[k] - 1) for k in range(n))
                * RR2 ** (sum(c) + n) * ball_moment(c))

    for adeg in range(amax + 1):
        for aa in itertools.product(range(adeg + 1), repeat=n):
            if sum(aa) != adeg:
                continue
            fz = prod(ze[k] ** aa[k] for k in range(n))
            total = 0
            for m in range(adeg + 2):
                gpoly = fz * X ** m
                integrand = sum((zb[k] * gpoly).derivative(zb[k]) for k in range(n))
                val = reinhardt_integral(integrand, n, ze, zb, mom)
                total += binomial(n + m - 1, m) / RR2 ** (n + m) * val
            total = factorial(n - 1) * prod(al) * total
            check(total == prod(zz[k] ** aa[k] for k in range(n)),
                  "C (8.8) reproduces zeta^%s, n=%d" % (aa, n))

section("C")

# ---------------------------------------------------------------------------
# D. §8, 4°-5°: Bochner-Ono, the condition (8.10) and its examples.
# ---------------------------------------------------------------------------

# The first line of the chain before (8.9) and the corrected second line:
# <zetabar - vbar, zeta - z> = |zeta - v|^2 - <zetabar - vbar, z - v>
# (the inequalities are in checks/lean/AizenbergIntegrals/Ch2.lean).  For a
# ball B_r(v) (|zeta - v| = r on bD) the kernel of (8.9) is that of (8.8)
# shifted to v.
for n in range(1, 5):
    names = (["x%d" % j for j in range(n)] + ["xb%d" % j for j in range(n)]
             + ["y%d" % j for j in range(n)] + ["v%d" % j for j in range(n)]
             + ["vb%d" % j for j in range(n)])
    R = PolynomialRing(QQ, names)
    G = dict(zip(names, R.gens()))
    ze, zb, zz, vv, vb = [[G["%s%d" % (p, j)] for j in range(n)]
                          for p in ["x", "xb", "y", "v", "vb"]]
    lhs = pairing([zb[j] - vb[j] for j in range(n)], [ze[j] - zz[j] for j in range(n)])
    first = pairing([zb[j] - vb[j] for j in range(n)], [ze[j] - vv[j] for j in range(n)])
    check(first == sum((ze[j] - vv[j]) * (zb[j] - vb[j]) for j in range(n)),
          "D <zetabar - vbar, zeta - v> = |zeta - v|^2 n=%d" % n)
    check(lhs == first - pairing([zb[j] - vb[j] for j in range(n)],
                                 [zz[j] - vv[j] for j in range(n)]),
          "D the chain before (8.9), first step n=%d" % n)

# (8.10) for Psi(z, zetabar) = F(z) + F(zetabar) + sum a_k z_k^(m_k)
# zetabar_k^(m_k) (F with real coefficients, so conj F(zetabar) = F(zeta)):
# the left-hand side is sum a_k |z_k^(m_k) - zeta_k^(m_k)|^2 >= 0.  With the
# printed z_k^m zetabar_k^(m_k), m != m_k, Psi(z, zbar) is not real.
# Complex points are written z = x + i y, zeta = s + i t with real symbols.
for mk in [(1, 1), (1, 2), (2, 3), (3, 1)]:
    names = ["x1", "y1", "x2", "y2", "s1", "t1", "s2", "t2", "A1", "A2",
             "f0", "f1", "f2", "f11", "f12", "f22"]
    R = PolynomialRing(K, names)
    G = dict(zip(names, R.gens()))
    z = [G["x1"] + II * G["y1"], G["x2"] + II * G["y2"]]
    zc = [G["x1"] - II * G["y1"], G["x2"] - II * G["y2"]]
    ze = [G["s1"] + II * G["t1"], G["s2"] + II * G["t2"]]
    zec = [G["s1"] - II * G["t1"], G["s2"] - II * G["t2"]]
    Aco = [G["A1"], G["A2"]]

    def Fp(u):
        return (G["f0"] + G["f1"] * u[0] + G["f2"] * u[1] + G["f11"] * u[0] ** 2
                + G["f12"] * u[0] * u[1] + G["f22"] * u[1] ** 2)

    def Psi(u, wb, mm=mk):
        return Fp(u) + Fp(wb) + sum(Aco[k] * u[k] ** mm[k] * wb[k] ** mk[k]
                                    for k in range(2))

    def cj(f):
        return f.map_coefficients(lambda c: c.conjugate())

    lhs = Psi(z, zc) - Psi(z, zec) - cj(Psi(z, zec)) + Psi(ze, zec)
    rhs = sum(Aco[k] * (z[k] ** mk[k] - ze[k] ** mk[k])
              * (zc[k] ** mk[k] - zec[k] ** mk[k]) for k in range(2))
    check(lhs == rhs, "D (8.10) example m=%s" % (mk,))
    check(cj(Psi(z, zc)) == Psi(z, zc), "D Psi(z, zbar) real m=%s" % (mk,))
    printed = Psi(z, zc, mm=(mk[0] + 1, mk[1]))
    refuted(cj(printed) == printed, "D printed z_k^m zetabar_k^(m_k), m != m_k")

# Bishop's example: Psi = K - R, K(z, zetabar) = sum phi_m(z)
# conj(phi_m(zeta)): the left-hand side of (8.10) is sum |phi_m(z) -
# phi_m(zeta)|^2 (values phi_m(z) = p + i q, phi_m(zeta) = r + i s).
names = []
for m in range(3):
    names += ["p%d" % m, "q%d" % m, "r%d" % m, "s%d" % m]
R = PolynomialRing(K, names + ["RR"])
G = dict(zip(names + ["RR"], R.gens()))
A_ = [G["p%d" % m] + II * G["q%d" % m] for m in range(3)]
B_ = [G["r%d" % m] + II * G["s%d" % m] for m in range(3)]
Ac = [G["p%d" % m] - II * G["q%d" % m] for m in range(3)]
Bc = [G["r%d" % m] - II * G["s%d" % m] for m in range(3)]
Kzz = sum(A_[m] * Ac[m] for m in range(3)) - G["RR"]
Kzw = sum(A_[m] * Bc[m] for m in range(3)) - G["RR"]
Kwz = sum(Ac[m] * B_[m] for m in range(3)) - G["RR"]  # conj of Kzw
Kww = sum(B_[m] * Bc[m] for m in range(3)) - G["RR"]
check(Kzz - Kzw - Kwz + Kww == sum((A_[m] - B_[m]) * (Ac[m] - Bc[m])
                                   for m in range(3)), "D Bishop example")

# The domain B^alpha = {sum |z_k|^(2 alpha_k) < 1} (p. 63): with
# P_k = sum_(i + j = alpha_k - 1) z_k^i zeta_k^j and
# w_k = zetabar_k^(alpha_k) P_k (Hefer for Psi(z, zetabar) - Psi(zeta,
# zetabar)), <w, zeta - z> = 1 - sum z_k^(alpha_k) zetabar_k^(alpha_k) on bD,
# and the numerator of (3.13) is the printed one; the formula is normalized
# (f = 1, z = 0) and reproduces monomials.
for alpha in [(1, 2), (2, 1), (2, 3), (3, 3), (1, 1, 2), (2, 1, 3)]:
    n = len(alpha)
    names = (["x%d" % j for j in range(n)] + ["xb%d" % j for j in range(n)]
             + ["y%d" % j for j in range(n)])
    R = PolynomialRing(QQ, names)
    G = dict(zip(names, R.gens()))
    ze, zb, zz = [[G["%s%d" % (p, j)] for j in range(n)] for p in ["x", "xb", "y"]]
    Pk = [sum(zz[k] ** i * ze[k] ** (alpha[k] - 1 - i) for i in range(alpha[k]))
          for k in range(n)]
    w = [zb[k] ** alpha[k] * Pk[k] for k in range(n)]
    psi_ze = sum((ze[k] * zb[k]) ** alpha[k] for k in range(n)) - 1
    check(pairing(w, [ze[k] - zz[k] for k in range(n)])
          == 1 - sum(zz[k] ** alpha[k] * zb[k] ** alpha[k] for k in range(n)) + psi_ze,
          "D B^alpha denominator alpha=%s" % (alpha,))
    dws = [dform(fun(x), [(zb[j], j) for j in range(n)]) for x in w]
    num = cf_numerator(w, dws)
    pref = prod(alpha[k] * zb[k] ** (alpha[k] - 1) * Pk[k] for k in range(n))
    Fq = R.fraction_field()
    printed = fadd(*[{tuple(j for j in range(n) if j != k):
                      (-1) ** k * Fq(pref) * Fq(zb[k]) / alpha[k]} for k in range(n)])
    check({k: Fq(c) for k, c in num.items()} == printed,
          "D B^alpha numerator alpha=%s" % (alpha,))

# Normalization and reproduction of monomials for B^alpha, n = 2: moments
# int_D |zeta^c|^2 dV / pi^n = int over {sum s_k^(alpha_k) < 1} of s^c ds
#   = prod (1/alpha_k) prod Gamma((c_k + 1)/alpha_k)/Gamma(sum (c_k + 1)/alpha_k + 1)
# (s_k = t_k^(1/alpha_k), Dirichlet integral); exact gamma values.


def balpha_moment(alpha):
    def mom(c):
        bs = [QQ(c[k] + 1) / alpha[k] for k in range(len(c))]
        return (prod(QQ(1) / x for x in alpha) * prod(gamma(x) for x in bs)
                / gamma(sum(bs) + 1))
    return mom


for alpha in [(1, 2), (2, 1), (1, 3), (2, 2)]:
    n = 2
    names = (["x%d" % j for j in range(n)] + ["xb%d" % j for j in range(n)]
             + ["y%d" % j for j in range(n)])
    R = PolynomialRing(SR, names)
    G = dict(zip(names, R.gens()))
    ze, zb, zz = [[G["%s%d" % (p, j)] for j in range(n)] for p in ["x", "xb", "y"]]
    Pk = [sum(zz[k] ** i * ze[k] ** (alpha[k] - 1 - i) for i in range(alpha[k]))
          for k in range(n)]
    pref = prod(alpha[k] * zb[k] ** (alpha[k] - 1) * Pk[k] for k in range(n))
    X = sum(zz[k] ** alpha[k] * zb[k] ** alpha[k] for k in range(n))
    mom = balpha_moment(alpha)
    for aa in [(0, 0), (1, 0), (0, 1), (1, 1), (2, 0)]:
        fz = prod(ze[k] ** aa[k] for k in range(n))
        total = 0
        for m in range(sum(aa) + 2):
            # g_k = f * pref/alpha_k * X^m, the form sum (-1)^(k-1) g_k
            # zetabar_k d zetabar_[k] ^ d zeta; constant (n-1)!/pi^n after
            # Stokes; 1/(1 - X)^n = sum binom(n + m - 1, m) X^m
            integrand = sum((zb[k] * fz * pref * X ** m / alpha[k]).derivative(zb[k])
                            for k in range(n))
            total += binomial(n + m - 1, m) * reinhardt_integral(integrand, n, ze, zb, mom)
        total = factorial(n - 1) * total
        # keep the terms of z-degree <= |a| + 1: compare coefficientwise
        dif = total - prod(zz[k] ** aa[k] for k in range(n))
        ok = all(SR(c).simplify_full() == 0 for mon, c in
                 zip(dif.monomials(), dif.coefficients())
                 if mon.degree() <= sum(aa) + 1)
        check(ok, "D B^alpha reproduces zeta^%s, alpha=%s" % (aa, alpha))

section("D")

# ---------------------------------------------------------------------------
# E. §9: the Bergman-Weil formula (9.1) and its proof.
# ---------------------------------------------------------------------------

# On the simplex {lambda_1 + ... + lambda_n = 1}, parametrized by
# (lambda_2, ..., lambda_n) (lambda_1 = 1 - lambda_2 - ... - lambda_n),
# sum (-1)^(k-1) lambda_k d lambda_[k] pulls back to d lambda_2 ^ ... ^
# d lambda_n; with this orientation its integral is the volume 1/(n-1)!
# used in the proof (as in the proof of Theorem 4.1).
for n in range(2, 7):
    R = PolynomialRing(QQ, ["l%d" % j for j in range(2, n + 1)])
    lam = [1 - sum(R.gens())] + list(R.gens())
    # generators 0..n-2: d lambda_2..d lambda_n
    dl = [fclean({(j,): QQ(-1) for j in range(n - 1)})] + [gen(j) for j in range(n - 1)]
    form = cf_numerator(lam, dl)
    check(form == {tuple(range(n - 1)): 1}, "E simplex form n=%d" % n)
    vol = simplex_integral(SR(1), n - 1)
    check(vol == 1 / factorial(n - 1), "E simplex volume n=%d" % n)

# For u = sum_l lambda_l u^(i_l) with u^(i_l) holomorphic in zeta (d u^(i)
# = 0 mod d zeta): sum (-1)^(k-1) u_k d u_[k] = det U sum (-1)^(k-1)
# lambda_k d lambda_[k], U = (u^(i_1), ..., u^(i_n)) (columns), and
# det U = Omega_(i_1...i_n)/prod_k (chi_(i_k)(zeta) - chi_(i_k)(z)) for
# u_k^i = q_(ik)/(chi_i(zeta) - chi_i(z)).
for n in range(2, 5):
    names = (["U%d%d" % (k, l) for k in range(n) for l in range(n)]
             + ["L%d" % l for l in range(n)])
    R = PolynomialRing(QQ, names)
    G = dict(zip(names, R.gens()))
    U = matrix(R, n, n, lambda k, l: G["U%d%d" % (k, l)])
    lam = [G["L%d" % l] for l in range(n)]
    u = list(U * vector(R, lam))
    du = [fclean({(l,): U[k, l] for l in range(n)}) for k in range(n)]
    dlam = [gen(l) for l in range(n)]
    check(cf_numerator(u, du) == fscale(U.det(), cf_numerator(lam, dlam)),
          "E substitution u = U lambda, n=%d" % n)
    names = (["q%d%d" % (i, k) for i in range(n) for k in range(n)]
             + ["c%d" % i for i in range(n)])
    Rq = PolynomialRing(QQ, names)
    Gq = dict(zip(names, Rq.gens()))
    Fq = Rq.fraction_field()
    # c_i = chi_i(zeta) - chi_i(z)
    Um = matrix(Fq, n, n, lambda k, l: Gq["q%d%d" % (l, k)] / Gq["c%d" % l])
    Om = matrix(Rq, n, n, lambda i, k: Gq["q%d%d" % (i, k)]).det()
    check(Um.det() == Om / prod(Gq["c%d" % i] for i in range(n)),
          "E det U = Omega/prod, n=%d" % n)

# The computation for n = 2 (p. 66): the bracket equals
# -u_1^(i_1) u_2^(i_2) + u_1^(i_2) u_2^(i_1) = -Omega_(i_1 i_2)/prod, and
# lambda_1 d lambda_2 - lambda_2 d lambda_1 pulls back to -d lambda_1 under
# lambda_2 = 1 - lambda_1.  So the printed "int_0^1 d lambda_1" stands for
# the simplex oriented as above (lambda_1 from 1 to 0), and the result
# +Omega/prod of (9.1) agrees with the general computation.
R = PolynomialRing(QQ, ["l1", "a1", "a2", "b1", "b2", "q11", "q12", "q21", "q22",
                        "c1", "c2"])
l1, a1, a2, b1, b2, q11, q12, q21, q22, c1, c2 = R.gens()
# u^(i_1) = (a1, a2), u^(i_2) = (b1, b2)
uu = [l1 * a1 + (1 - l1) * b1, l1 * a2 + (1 - l1) * b2]
bracket = uu[0] * (a2 - b2) - uu[1] * (a1 - b1)
check(bracket == -a1 * b2 + b1 * a2, "E n = 2 bracket")
Fq = R.fraction_field()
val = Fq(-a1 * b2 + b1 * a2).subs({a1: q11 / c1, a2: q12 / c1, b1: q21 / c2,
                                   b2: q22 / c2})
check(val == -(q11 * q22 - q12 * q21) / (c1 * c2), "E bracket = -Omega/prod")
Rl = PolynomialRing(QQ, "t")
tt = Rl.gen()
lam = [tt, 1 - tt]
form = cf_numerator(lam, [gen(0), gen(0, -1)])
check(form == {(0,): -1}, "E lambda_1 d lambda_2 - lambda_2 d lambda_1 = -d lambda_1")
# (4.2) for n = 2: +1 with lambda_1 running from 1 to 0 (the boundary
# orientation used in its proof); the printed int_0^1 d lambda_1 gives -1
# and the opposite sign of the result (ii-66-weil-orientation)
tv = var("tv")
check(integrate(SR(-1), tv, 1, 0) == 1, "E (4.2), n = 2, lambda_1 from 1 to 0")
refuted(integrate(SR(-1), tv, 0, 1) == 1, "E (4.2), n = 2, with int_0^1 d lambda_1")
Om2 = (q11 * q22 - q12 * q21) / (c1 * c2)
check(QQ(integrate(SR(1), tv, 1, 0)) * val == Om2,
      "E n = 2: int_1^0 d lambda_1 of the bracket = Omega/prod")
refuted(QQ(integrate(SR(1), tv, 0, 1)) * val == Om2,
        "E n = 2: int_0^1 d lambda_1 of the bracket = Omega/prod")

# (9.1) for N = n = 2, chi = (z_1, z_2 + z_1^2) and for N = 3: the Hefer
# matrix on the diagonal is the Jacobian, q(z, z) = chi'(z), so after the
# substitution eta = chi(zeta) the Cauchy formula on the torus gives
# f(z) Omega(z, z)/det chi'(z) = f(z) on each edge (for N = 3 every 2x2
# minor).
Rg = PolynomialRing(QQ, ["x1", "x2", "y1", "y2"])
x1, x2, y1, y2 = Rg.gens()
chis = [x1, x2 + x1 ** 2, x1 * x2 + x2]
qs = [[1, 0], [x1 + y1, 1], [x2, y1 + 1]]
for i in range(3):
    chz = chis[i].subs({x1: y1, x2: y2})
    check(chis[i] - chz == qs[i][0] * (x1 - y1) + qs[i][1] * (x2 - y2),
          "E Hefer decomposition of chi_%d" % (i + 1))
    for j, xv in enumerate([x1, x2]):
        check(Rg(qs[i][j]).subs({x1: y1, x2: y2})
              == chis[i].derivative(xv).subs({x1: y1, x2: y2}),
              "E q(z, z) = chi'(z)")

section("E")

# ---------------------------------------------------------------------------
# F. §10: Lemmas 10.1, 10.2, 10.7 and Theorem 10.5 where computable; the
#    ball as the model case of the Khenkin-Ramirez kernel.
# ---------------------------------------------------------------------------

# Real quadratic rho on C^2 (z = x + i y): rho = 2 Re sum b_j z_j +
# sum h_jk z_j zbar_k + Re sum c_jk z_j z_k, with h Hermitian.  Wirtinger
# derivatives in the real coordinates.
names = ["x1", "y1", "x2", "y2", "s1", "t1", "s2", "t2"]
coef = ["bu1", "bv1", "bu2", "bv2", "h11", "h22", "hp", "hq",
        "cu11", "cv11", "cu12", "cv12", "cu22", "cv22"]
R = PolynomialRing(K, names + coef)
G = dict(zip(names + coef, R.gens()))


def cj(f):
    return f.map_coefficients(lambda c: c.conjugate())


def dz_(f, x, y):
    return (f.derivative(x) - II * f.derivative(y)) / 2


def dzb_(f, x, y):
    return (f.derivative(x) + II * f.derivative(y)) / 2


XY = [(G["x1"], G["y1"]), (G["x2"], G["y2"])]
ST = [(G["s1"], G["t1"]), (G["s2"], G["t2"])]
z = [G["x1"] + II * G["y1"], G["x2"] + II * G["y2"]]
zc = [cj(e) for e in z]
bb = [G["bu1"] + II * G["bv1"], G["bu2"] + II * G["bv2"]]
hh = [[G["h11"], G["hp"] + II * G["hq"]], [G["hp"] - II * G["hq"], G["h22"]]]
cc = [[G["cu11"] + II * G["cv11"], G["cu12"] + II * G["cv12"]],
      [G["cu12"] + II * G["cv12"], G["cu22"] + II * G["cv22"]]]


def rho_of(z, zc):
    lin = sum(bb[j] * z[j] for j in range(2))
    q2 = sum(cc[j][k] * z[j] * z[k] for j in range(2) for k in range(2))
    return (lin + cj(lin) + sum(hh[j][k] * z[j] * zc[k] for j in range(2)
                                for k in range(2)) + (q2 + cj(q2)) / 2)


rho = rho_of(z, zc)
check(cj(rho) == rho, "F rho real")
at0 = {v: 0 for v in [G["x1"], G["y1"], G["x2"], G["y2"]]}
# Lemma 10.2 (p. 69), Taylor's formula with the corrected Hermitian term
d1 = [dz_(rho, *XY[j]).subs(at0) for j in range(2)]
dzz = [[dz_(dz_(rho, *XY[j]), *XY[k]).subs(at0) for k in range(2)] for j in range(2)]
dzzb = [[dz_(dzb_(rho, *XY[k]), *XY[j]).subs(at0) for k in range(2)] for j in range(2)]
lin = sum(d1[j] * z[j] for j in range(2))
herm = sum(dzzb[j][k] * z[j] * zc[k] for j in range(2) for k in range(2))
quad = sum(dzz[j][k] * z[j] * z[k] for j in range(2) for k in range(2))
corrected = (lin + cj(lin)) + herm + (quad + cj(quad)) / 2
check(corrected == rho, "F Lemma 10.2: Taylor's formula (corrected)")
printed = (lin + cj(lin)) + herm / 2 + (quad + cj(quad)) / 2
refuted(printed == rho, "F Lemma 10.2: Taylor's formula with 1/2")
# w_1 = 2 sum rho_(z_j)(0) z_j + sum rho_(z_j z_k)(0) z_j z_k: Re w_1 is the
# non-Hermitian part of the expansion; the printed w_1 (without z_j) is a
# constant term 2 sum rho_(z_j)(0) != 0
w1 = 2 * lin + quad
check((w1 + cj(w1)) / 2 == rho - herm, "F Lemma 10.2: rho = Re w_1 + Hermitian")

# (10.9): in the coordinates w_1 (above), w_2 = z_2 (a coordinate on the
# hyperplane sum rho_(z_j)(0) z_j = 0 when rho_(z_1)(0) != 0), rho = Re w_1
# + sum a_jk w_j wbar_k + O(|w|^3): the pure terms w_j w_k cancel.  The
# inverse map up to order 2: z_1 = (w_1 - 2 b_2 w_2 - sum c_jk z_j z_k)/(2 b_1).
Rw = PolynomialRing(FractionField(PolynomialRing(K, coef)),
                    ["W1", "W2", "V1", "V2"])  # V = wbar
W1, W2, V1, V2 = Rw.gens()
Kc = Rw.base_ring()
bbK = [Kc(e) for e in bb]
ccK = [[Kc(e) for e in r] for r in cc]
hhK = [[Kc(e) for e in r] for r in hh]


def cjK(e):
    num = e.numerator().map_coefficients(lambda c: c.conjugate())
    den = e.denominator().map_coefficients(lambda c: c.conjugate())
    # the conjugates of the real coefficient symbols are themselves
    return Kc(num) / Kc(den)


def cjW(f):
    out = Rw(0)
    for (e1, e2, e3, e4), c in f.dict().items():
        out += cjK(c) * V1 ** e1 * V2 ** e2 * W1 ** e3 * W2 ** e4
    return out


def trunc(f, d):
    return sum((c * m for c, m in zip(f.coefficients(), f.monomials())
                if m.degree() <= d), Rw(0))


zl = [(W1 - 2 * bbK[1] * W2) / (2 * bbK[0]), W2]
# fixed point iteration for z_1 to order 2
z1 = zl[0]
for _ in range(2):
    zz_ = [z1, W2]
    z1 = trunc((W1 - 2 * bbK[1] * W2
                - sum(ccK[j][k] * zz_[j] * zz_[k] for j in range(2) for k in range(2)))
               / (2 * bbK[0]), 2)
zw = [z1, W2]
zwc = [cjW(e) for e in zw]
w1chk = trunc(2 * sum(bbK[j] * zw[j] for j in range(2))
              + sum(ccK[j][k] * zw[j] * zw[k] for j in range(2) for k in range(2)), 2)
check(w1chk == W1, "F (10.9): inverse coordinates to order 2")
lin_ = sum(bbK[j] * zw[j] for j in range(2))
q2_ = sum(ccK[j][k] * zw[j] * zw[k] for j in range(2) for k in range(2))
rho_w = trunc(lin_ + cjW(lin_) + sum(hhK[j][k] * zw[j] * zwc[k] for j in range(2)
                                     for k in range(2)) + (q2_ + cjW(q2_)) / 2, 2)
rest = rho_w - (W1 + V1) / 2
check(all(m.degree(V1) + m.degree(V2) == 1 and m.degree() == 2
          for m in rest.monomials()),
      "F (10.9): rho = x_1 + Hermitian form in w + O(|w|^3)")

# Lemma 10.1, convex case: Phi = F = sum rho_(zeta_i)(zeta)(zeta_i - z_i);
# for quadratic rho exactly 2 Re F - (rho(zeta) - rho(z)) = h(zeta - z) +
# Re c(zeta - z) (the quadratic part at zeta - z), whose minimum on the unit
# sphere is the sigma of 2).
ze = [G["s1"] + II * G["t1"], G["s2"] + II * G["t2"]]
zec = [cj(e) for e in ze]
rho_ze = rho_of(ze, zec)
Fsf = sum(dz_(rho_ze, *ST[i]) * (ze[i] - z[i]) for i in range(2))
dd = [ze[j] - z[j] for j in range(2)]
ddc = [cj(e) for e in dd]
qpart = (sum(hh[j][k] * dd[j] * ddc[k] for j in range(2) for k in range(2))
         + (sum(cc[j][k] * dd[j] * dd[k] for j in range(2) for k in range(2))
            + cj(sum(cc[j][k] * dd[j] * dd[k] for j in range(2) for k in range(2)))) / 2)
check(Fsf + cj(Fsf) - (rho_ze - rho) == qpart, "F Lemma 10.1, convex case")
# assertion 3): d_zeta F|_(zeta = z) = -d_z F|_(zeta = z) = d rho(z)
diag = {G["s1"]: G["x1"], G["t1"]: G["y1"], G["s2"]: G["x2"], G["t2"]: G["y2"]}
for j in range(2):
    check(dz_(Fsf, *ST[j]).subs(diag) == dz_(rho, *XY[j]), "F Lemma 10.1, 3) d_zeta")
    check(dz_(Fsf, *XY[j]).subs(diag) == -dz_(rho, *XY[j]), "F Lemma 10.1, 3) d_z")
    check(dzb_(Fsf, *ST[j]).subs(diag) == 0, "F Lemma 10.1, 3) no d zetabar part")
# Lemma 10.6, proof: d_zeta Re F|_(zeta = z) = (1/2) d rho(z) (rho real)
ReF = (Fsf + cj(Fsf)) / 2
for (s_, t_), (x_, y_) in zip(ST, XY):
    check(ReF.derivative(s_).subs(diag) == rho.derivative(x_) / 2, "F Lemma 10.6 Re F")
    check(ReF.derivative(t_).subs(diag) == rho.derivative(y_) / 2, "F Lemma 10.6 Re F")
# The ball: rho = |z|^2 - 1, 2 Re F = rho(zeta) - rho(z) + |zeta - z|^2
# exactly (sigma = 1); for rho = |z_1|^2/4 + |z_2|^2 - 1 (strictly convex)
# the printed constant 1 fails at zeta - z = (1, 0): the quadratic part is
# |zeta_1 - z_1|^2/4.
sub_ball = {G["bu1"]: 0, G["bv1"]: 0, G["bu2"]: 0, G["bv2"]: 0, G["hp"]: 0,
            G["hq"]: 0, G["cu11"]: 0, G["cv11"]: 0, G["cu12"]: 0, G["cv12"]: 0,
            G["cu22"]: 0, G["cv22"]: 0}
sb = dict(sub_ball)
sb.update({G["h11"]: 1, G["h22"]: 1})
check(qpart.subs(sb) == sum(dd[j] * ddc[j] for j in range(2)).subs(sb),
      "F ball: sigma = 1, equality")
se = dict(sub_ball)
se.update({G["h11"]: QQ(1) / 4, G["h22"]: 1})
pt = {G["s1"]: 1, G["t1"]: 0, G["s2"]: 0, G["t2"]: 0, G["x1"]: 0, G["y1"]: 0,
      G["x2"]: 0, G["y2"]: 0}
refuted(QQ(K(qpart.subs(se).subs(pt).constant_coefficient()))
        >= QQ(K(sum(dd[j] * ddc[j] for j in range(2)).subs(pt).constant_coefficient())),
        "F Lemma 10.1, convex case with sigma = 1")

# Lemma 10.7 (p. 72): exact steps.
rr, ee, ss, AA = var("rr ee ss AA", domain="positive")
for n in range(2, 7):
    # int_0^1 ds/(A + r s)^n = (A^(1-n) - (A + r)^(1-n))/((n - 1) r)
    lhs = integrate(1 / (AA + rr * ss) ** n, ss, 0, 1)
    rhs = (AA ** (1 - n) - (AA + rr) ** (1 - n)) / ((n - 1) * rr)
    check((lhs - rhs).simplify_full() == 0, "F Lemma 10.7 inner integral n=%d" % n)
    # spherical coordinates in R^(2n-1) about the t_2-axis: the volume of
    # the unit ball is |S^(2n-3)| int_0^1 r^(2n-2) dr int_0^pi sin^(2n-3)
    # phi d phi; the factor |S^(2n-3)| = 2 pi^(n-1)/(n-2)! is dropped in
    # the book (a constant).
    m = 2 * n - 1
    ph = var("ph")
    vol = (2 * pi ** (n - 1) / factorial(n - 2) * integrate(rr ** (2 * n - 2), rr, 0, 1)
           * integrate(sin(ph) ** (2 * n - 3), ph, 0, pi))
    check((vol - pi ** (QQ(m) / 2) / gamma(QQ(m) / 2 + 1)).simplify_full() == 0,
          "F volume of the unit ball of R^%d" % m)
    # last step: 2/(n - 1) int_delta^1 dr/(r + eps) = 2/(n - 1) ln((1 + eps)/(eps + delta))
    # (an antiderivative of 1/(r + eps) is ln(r + eps))
    check((diff(log(rr + ee), rr) - 1 / (rr + ee)).simplify_full() == 0,
          "F Lemma 10.7 last integral n=%d" % n)
# the printed r^(2n-3)/(r^2 + eps^2)^(n-1) <= 1/(r + eps) fails for n = 2,
# r = 2, eps = 1 (6 > 5); with the factor 2^(n-1) it holds (Lean, Ch2.lean)
refuted(QQ(2) ** 1 * (2 + 1) <= (QQ(2) ** 2 + 1) ** 1,
        "F Lemma 10.7: r^(2n-3)(r + eps) <= (r^2 + eps^2)^(n-1), n = 2")
for n in range(2, 6):
    for r_ in [QQ(1) / 3, 1, 2, 5]:
        for e_ in [QQ(1) / 7, QQ(1) / 2, 1]:
            check(r_ ** (2 * n - 3) * (r_ + e_) <= 2 ** (n - 1) * (r_ ** 2 + e_ ** 2) ** (n - 1),
                  "F Lemma 10.7 corrected bound, sample")

# Theorem 10.5, the bound for |F|: sqrt(a^2 + b^2) >= (|a| + |b|)/sqrt(2),
# i.e. 2(a^2 + b^2) - (|a| + |b|)^2 = (|a| - |b|)^2 >= 0.
aa_, bb_ = var("aa_ bb_", domain="positive")
check((2 * (aa_ ** 2 + bb_ ** 2) - (aa_ + bb_) ** 2 - (aa_ - bb_) ** 2).expand() == 0,
      "F Theorem 10.5: |F| bound")

# The model case: the unit ball, rho = |z|^2 - 1, F = Phi = sum zetabar_i
# (zeta_i - z_i) = 1 - <z, zetabar> on bD, P = zetabar, and (10.10) is the
# Bochner formula (8.8); its kernel with respect to the normalized measure
# is (1 - <z, zetabar>)^(-n) (section M).  Theorem 10.5 there: at
# z = (r, 0, ..., 0), int_bD d mu/|1 - r zetabar_1|^n = sum_j e_j r^(2j),
# e_j = c_j^2 (n-1)! j!/(n - 1 + j)!, c_j = (n/2)_j/j! (binomial series and
# the moments of section M).  For n = 2, e_j = 1/(j + 1): the integral is
# -ln(1 - r^2)/r^2, the logarithmic growth of (10.11) as |rho(z)| -> 0; for
# n = 3, 4, (j + 1) e_j increases to a finite limit (checked j < 200).
for n in [2, 3, 4]:
    def cfun(j):
        return rising_factorial(QQ(n) / 2, j) / factorial(j)

    es = [cfun(j) ** 2 * factorial(n - 1) * factorial(j) / factorial(n - 1 + j)
          for j in range(200)]
    if n == 2:
        check(all(es[j] == QQ(1) / (j + 1) for j in range(200)), "F ball n=2 e_j")
    seq = [(j + 1) * es[j] for j in range(200)]
    check(all(seq[j] <= seq[j + 1] for j in range(199)), "F ball (j+1) e_j increasing n=%d" % n)
    # the limit (n-1)!/Gamma(n/2)^2 is 1, 8/pi < 3, 6 for n = 2, 3, 4
    check(seq[-1] <= {2: 1, 3: 3, 4: 6}[n], "F ball (j+1) e_j bounded n=%d" % n)
r2 = var("r2")
ser = (-log(1 - r2) / r2).series(r2, 12).truncate()
check(all(ser.coefficient(r2, j) == QQ(1) / (j + 1) for j in range(11)),
      "F ball n=2 closed form")

section("F")

# ---------------------------------------------------------------------------
# G. §11, 1°: the Temlyakov representations (11.1)-(11.6).
# ---------------------------------------------------------------------------

# (11.1) from (8.5) with rho = |zeta_1| - psi(|zeta'|): w = grad rho,
# w_1 = zetabar_1/(2 |zeta_1|), w_j = -psi'_j zetabar_j/(2 |zeta_j|) (j >= 2);
# zetabar_k = r_k^2/zeta_k, r_k = |zeta_k|, p_j = psi'_(|zeta_j|), and
# r_1 = psi on bD.
for n in range(2, 6):
    names = (["r%d" % k for k in range(n)] + ["p%d" % k for k in range(1, n)]
             + ["x%d" % k for k in range(n)] + ["y%d" % k for k in range(n)])
    Fr = FractionField(PolynomialRing(QQ, names))
    G = dict(zip(names, Fr.gens()))
    r = [G["r%d" % k] for k in range(n)]
    p = [None] + [G["p%d" % k] for k in range(1, n)]
    ze = [G["x%d" % k] for k in range(n)]
    zz = [G["y%d" % k] for k in range(n)]
    psi = r[0]
    w = [r[0] / (2 * ze[0])] + [-p[k] * r[k] / (2 * ze[k]) for k in range(1, n)]
    S = sum(r[k] * p[k] for k in range(1, n))
    phi = [-psi / (S - psi)] + [r[k] * p[k] / (S - psi) for k in range(1, n)]
    wz = pairing(w, ze)
    check(all(w[k] / wz == phi[k] / ze[k] for k in range(n)),
          "G (11.1): w/<w, zeta> = (phi_k/zeta_k), n=%d" % n)
    check(sum(phi) == 1, "G phi_1 = 1 - phi_2 - ... - phi_n, n=%d" % n)
    printed = [r[k] * p[k] / (S - psi ** 2) for k in range(1, n)]
    refuted(1 - sum(printed) == -psi / (S - psi),
            "G phi_j with psi^2 in the denominator, n=%d" % n)
    y = [zz[k] * (r[k] ** 2 / ze[k]) * phi[k] / r[k] ** 2 for k in range(n)]
    check(pairing(w, [ze[k] - zz[k] for k in range(n)]) / wz == 1 - sum(y),
          "G <w, zeta - z>/<w, zeta> = 1 - y_1 - ... - y_n, n=%d" % n)
    # numerator: with w~_k = phi_k/zeta_k (phi_k functions of the moduli,
    # d phi_k as generators k; zeta holomorphic), sum (-1)^(k-1) w~_k
    # d w~_[k] = (zeta_1...zeta_n)^(-1) d phi_2 ^ ... ^ d phi_n, using
    # d phi_1 = -(d phi_2 + ... + d phi_n)
    dphi = [fclean({(j,): Fr(-1) for j in range(1, n)})] + [gen(k) for k in range(1, n)]
    num = cf_numerator([phi[k] / ze[k] for k in range(n)],
                       [fscale(1 / ze[k], dphi[k]) for k in range(n)])
    check(num == {tuple(range(1, n)): 1 / prod(ze)}, "G numerator of (11.1), n=%d" % n)

# On the torus Delta_zeta (moduli fixed), zeta_1 = r_1 xi, zeta_j = r_j xi
# e^(i theta_j): d zeta/zeta = i^(n-1) d xi/xi ^ d theta_2 ^ ... ^ d theta_n
# (generator 0 = d xi/xi, j = d theta_j), so the constant (n-1)!/(2 pi i)^n
# of (11.1) becomes (n-1)!/((2 pi)^n i) in (11.2).
for n in range(1, 7):
    forms = [gen(0)] + [fadd(gen(0), gen(j, II)) for j in range(1, n)]
    check(wedges(forms) == {tuple(range(n)): II ** (n - 1)},
          "G d zeta/zeta on the torus, n=%d" % n)
    corrected = factorial(n - 1) / ((2 * pi) ** n * I)
    check((factorial(n - 1) / (2 * pi * I) ** n * I ** (n - 1) - corrected)
          .simplify_full() == 0, "G constant of (11.2), n=%d" % n)

# (11.2) and (11.6) reproduce the monomials: f = zeta^a (resp. L_k f for
# f = z^a); xi-integral by the binomial series of (1 - u xibar)^(-n) and
# int xi^m d xi/xi = 2 pi i [m = 0]; theta-integral = (2 pi)^(n-1) times
# the constant term in T_j = e^(i theta_j); tau-integral over Delta^* by
# iterated exact integration (tau_1 = 1 - tau_2 - ... - tau_n).


def temlyakov_rhs(n, aa, k):
    """(n-k-1)!/((2 pi)^n i) int int int xi^(n-k-1) g/(xi - u)^(n-k) d xi for
    g = L_k(z^a) written on bD; returns (value, factor), value = factor *
    rest, with the transcendental factor separated."""
    names = (["z%d" % j for j in range(n)] + ["r%d" % j for j in range(n)])
    Fz = FractionField(PolynomialRing(QQ, names))
    G = dict(zip(names, Fz.gens()))
    zs = [G["z%d" % j] for j in range(n)]
    rs = [G["r%d" % j] for j in range(n)]
    Rtau = PolynomialRing(Fz, ["s%d" % j for j in range(n - 1)])
    taus = [1 - sum(Rtau.gens())] + list(Rtau.gens())
    LT = LaurentPolynomialRing(Rtau, ["T%d" % j for j in range(1, n)])
    T = [LT(1)] + list(LT.gens())
    # L_k(z^a) = c z^a with c from the recursion L_k = (n - k + E) L_(k-1)
    Rp = PolynomialRing(QQ, ["w%d" % j for j in range(n)])
    f = prod(Rp.gen(j) ** aa[j] for j in range(n))
    Lf = f
    for kk in range(1, k + 1):
        Lf = (n - kk) * Lf + sum(Rp.gen(j) * Lf.derivative(Rp.gen(j)) for j in range(n))
    c = Lf.monomial_coefficient(f) if Lf != 0 else 0
    check(Lf == c * f, "G L_k(z^a) is a multiple of z^a")
    A = sum(aa)
    # g on bD as a function of (xi, r, theta): r^a xi^|a| T^a'; xi-integral
    u = sum(taus[j] * zs[j] / rs[j] * T[j] ** (-1) for j in range(n))
    inner = (binomial(n - k - 1 + A, A) * c
             * prod(rs[j] ** aa[j] for j in range(n))
             * prod(T[j] ** aa[j] for j in range(n)) * u ** A)
    const = inner.constant_coefficient() if n > 1 else inner
    # tau-integral over Delta^*: iterated integration of a polynomial
    poly = Rtau(const)
    val = Fz(0)
    for exps, cf in poly.dict().items():
        ex = (exps,) if isinstance(exps, (int, Integer)) else tuple(exps)
        mon = prod(S_[j] ** ex[j] for j in range(n - 1))
        val += cf * QQ(simplex_integral(mon, n - 1))
    # the factor: constant * 2 pi i * (2 pi)^(n-1)
    factor = factorial(n - k - 1) / ((2 * pi) ** n * I) * 2 * pi * I * (2 * pi) ** (n - 1)
    return val, factor, Fz(prod(zs[j] ** aa[j] for j in range(n)))


for n in range(2, 5):
    for A in range(4 if n < 4 else 3):
        for aa in itertools.product(range(A + 1), repeat=n):
            if sum(aa) != A:
                continue
            for k in range(n):
                val, factor, target = temlyakov_rhs(n, aa, k)
                check((factor - factorial(n - k - 1)).simplify_full() == 0,
                      "G factor of (11.6)")
                check(factorial(n - k - 1) * val == target,
                      "G (11.6) reproduces z^%s, k=%d" % (aa, k))
            # the printed constant (n-1)!/(2 pi i)^n of (11.2): value i^(1-n) z^a
            printed = factorial(n - 1) / (2 * pi * I) ** n * 2 * pi * I * (2 * pi) ** (n - 1)
            refuted((printed - factorial(n - 1)).simplify_full() == 0,
                    "G (11.2) with (n-1)!/(2 pi i)^n")
# the Temlyakov integrals (n = 2): (n-k-1)!/((2 pi)^n i) = 1/(4 pi^2 i) for
# k = 0, 1
for k in [0, 1]:
    check((factorial(1 - k) / ((2 * pi) ** 2 * I) - 1 / (4 * pi ** 2 * I))
          .simplify_full() == 0, "G Temlyakov constants k=%d" % k)

# (11.3) from (11.2): (1 - u xibar)^(-n)/xi = xi^(n-1)/(xi - u)^n on |xi| = 1
Rx = FractionField(PolynomialRing(QQ, ["xi", "u"]))
xi, uu = Rx.gens()
for n in range(1, 7):
    check((1 - uu / xi) ** (-n) / xi == xi ** (n - 1) / (xi - uu) ** n,
          "G (11.3) kernel n=%d" % n)

# (11.4): L_k(M_k) = (n-1)! xi^(n-1)/(xi - u)^n, M_k = (n-k-1)! xi^(n-k-1)
# (xi - u)^(k-n), u linear in z (as in (11.2)); E = sum z_nu d/dz_nu.
for n in range(2, 7):
    names = ["xi"] + ["z%d" % j for j in range(n)] + ["c%d" % j for j in range(n)]
    Fx = FractionField(PolynomialRing(QQ, names))
    G = dict(zip(names, Fx.gens()))
    zs = [G["z%d" % j] for j in range(n)]
    u = sum(G["c%d" % j] * zs[j] for j in range(n))
    xi = G["xi"]
    for k in range(n):
        Mk = factorial(n - k - 1) * xi ** (n - k - 1) * (xi - u) ** (k - n)
        L = Mk
        for kk in range(1, k + 1):
            L = (n - kk) * L + sum(zs[j] * L.derivative(zs[j]) for j in range(n))
        check(L == factorial(n - 1) * xi ** (n - 1) / (xi - u) ** n,
              "G (11.4) n=%d k=%d" % (n, k))

section("G")

# ---------------------------------------------------------------------------
# H. §11, 2°-3°: Szego kernels of n-circular domains (Theorem 11.2,
#    examples 1-3, (11.7)-(11.11)), extended kernels, Theorem 11.3.
# ---------------------------------------------------------------------------

tt = var("tt")
sv = var("sv")
X1, X2 = var("X1 X2")


def series2(expr, d):
    """Coefficients c[k1][k2], k1 + k2 <= d, of a rational function of X1, X2
    regular at 0 (exact Taylor coefficients)."""
    out = {}
    for k1 in range(d + 1):
        e1 = expr.diff(X1, k1).subs(X1=0) / factorial(k1)
        for k2 in range(d + 1 - k1):
            out[(k1, k2)] = (e1.diff(X2, k2).subs(X2=0) / factorial(k2)).simplify_full()
    return out


# Example 1: D_p, lambda' generated by |zeta_1|^2 (t = |zeta_1|^2,
# |zeta_2|^2 = 1 - t^(1/p) on bD): a_k^(p) = [int_0^1 t^k1 (1 - t^(1/p))^k2
# dt]^(-1) = [p(k1+1) + k2]!/(p [p(k1+1) - 1]! k2!)  (t = s^p).
for p in range(1, 5):
    hp = (1 - X2) ** (p - 1) / ((1 - X2) ** p - X1) ** 2
    g = 1 / ((1 - X2) ** p - X1)
    check(((g.diff(X2) / p) - hp).simplify_full() == 0, "H h_p = (1/p) d/dx2 of 1/((1-x2)^p - x1)")
    ch = series2(hp, 5)
    cg = series2(g, 5)
    for k1 in range(4):
        for k2 in range(4):
            integ = integrate(p * sv ** (p * (k1 + 1) - 1) * (1 - sv) ** k2, sv, 0, 1)
            ak = factorial(p * (k1 + 1) + k2) / (p * factorial(p * (k1 + 1) - 1) * factorial(k2))
            check(1 / integ == ak, "H a_k^(p) p=%d k=(%d,%d)" % (p, k1, k2))
            if k1 + k2 <= 5:
                check(ch[(k1, k2)] == ak, "H h_p coefficients p=%d" % p)
                check(cg[(k1, k2)] == factorial(p * (k1 + 1) + k2 - 1)
                      / (factorial(p * (k1 + 1) - 1) * factorial(k2)),
                      "H series of 1/((1-x2)^p - x1) p=%d" % p)
    if p <= 2:
        # the direct integral in t (no substitution)
        for k1 in range(3):
            for k2 in range(3):
                integ = integrate(tt ** k1 * (1 - tt ** (QQ(1) / p)) ** k2, tt, 0, 1)
                check(1 / integ == factorial(p * (k1 + 1) + k2)
                      / (p * factorial(p * (k1 + 1) - 1) * factorial(k2)),
                      "H a_k^(p) direct p=%d" % p)

# p = 1, (11.8): a_k = (k1 + k2 + 1)!/(k1! k2!), the coefficients of
# (1 - x1 - x2)^(-2); the measure d|zeta_1|^2 d theta/(2 pi)^2 on the sphere
# has the moments k1! k2!/(k1 + k2 + 1)! of the normalized surface measure
# (section M, n = 2), so (11.8) is (8.8) for the unit ball.
for k1 in range(5):
    for k2 in range(5):
        m = integrate(tt ** k1 * (1 - tt) ** k2, tt, 0, 1)
        check(m == factorial(k1) * factorial(k2) / factorial(k1 + k2 + 1),
              "H (11.8) moments")

# Example 2: D = {|z_1| + |z_2| < 1}, lambda' = Lebesgue measure in |zeta_1|.
s1, s2 = var("s1 s2")
for k1 in range(5):
    for k2 in range(5):
        integ = integrate(tt ** (2 * k1) * (1 - tt) ** (2 * k2), tt, 0, 1)
        check(1 / integ == factorial(2 * k1 + 2 * k2 + 1)
              / (factorial(2 * k1) * factorial(2 * k2)), "H Example 2 a_k")
Rs = FractionField(PolynomialRing(QQ, ["s1", "s2"]))
S1, S2 = Rs.gens()
four = sum(1 / (1 - e1 * S1 - e2 * S2) ** 2 for e1 in [1, -1] for e2 in [1, -1]) / 4
x1s, x2s = S1 ** 2, S2 ** 2
closed = (((1 - x1s - x2s) * (1 + 2 * x1s * x2s - x1s ** 2 - x2s ** 2) + 8 * x1s * x2s)
          / ((1 - x1s - x2s) ** 2 - 4 * x1s * x2s) ** 2)
check(four == closed, "H Example 2 closed form")
h2 = (((1 - X1 - X2) * (1 + 2 * X1 * X2 - X1 ** 2 - X2 ** 2) + 8 * X1 * X2)
      / ((1 - X1 - X2) ** 2 - 4 * X1 * X2) ** 2)
c2 = series2(h2, 5)
for (k1, k2), c in c2.items():
    check(c == factorial(2 * k1 + 2 * k2 + 1) / (factorial(2 * k1) * factorial(2 * k2)),
          "H Example 2 series")
# (1 - s1 - s2)^(-2) = sum (m1 + m2 + 1)!/(m1! m2!) s1^m1 s2^m2
c1 = series2(1 / (1 - X1 - X2) ** 2, 5)
check(all(c == factorial(k1 + k2 + 1) / (factorial(k1) * factorial(k2))
          for (k1, k2), c in c1.items()), "H (1 - s1 - s2)^(-2) series")

# Example 3: D_(p,q), the same measure d|zeta_1|^2 (|zeta_2|^2 =
# (1 - t^(1/p))^q on bD): a_k = [p(k1+1) + q k2]!/(p [p(k1+1) - 1]! (q k2)!),
# and h_(p,q) = (1/(pq)) d/dx1 sum over roots of unity of
# 1/(1 - y_(j1,1) - y_(j2,2)) has exactly these coefficients (truncated
# power series in s1 = x1^(1/p), s2 = x2^(1/q) over a cyclotomic field).
for p, q in [(1, 1), (2, 1), (1, 2), (2, 2), (2, 3), (3, 2)]:
    CF = CyclotomicField(lcm(p, q))
    e1 = CF.gen() ** (lcm(p, q) // p)
    e2 = CF.gen() ** (lcm(p, q) // q)
    L1, L2 = 3, 3
    D1, D2 = p * (L1 + 1), q * (L2 + 1)
    tot = {}
    for m1 in range(D1 + 1):
        for m2 in range(D2 + 1):
            cfv = binomial(m1 + m2, m1) * sum(e1 ** (j1 * m1) for j1 in range(p)) \
                * sum(e2 ** (j2 * m2) for j2 in range(q))
            tot[(m1, m2)] = cfv
    check(all(c == 0 for (m1, m2), c in tot.items() if m1 % p or m2 % q),
          "H Example 3: only s1^(p l1) s2^(q l2) survive (p,q)=(%d,%d)" % (p, q))
    for l1 in range(L1):
        for l2 in range(L2 + 1):
            # (1/(pq)) d/dx1: coefficient of x1^l1 x2^l2 is (l1 + 1)
            # c(p(l1 + 1), q l2)/(pq)
            hc = (l1 + 1) * tot[(p * (l1 + 1), q * l2)] / (p * q)
            ak = factorial(p * (l1 + 1) + q * l2) / (p * factorial(p * (l1 + 1) - 1)
                                                     * factorial(q * l2))
            check(hc == ak, "H Example 3 coefficients (p,q)=(%d,%d)" % (p, q))
            integ = integrate(p * sv ** (p * (l1 + 1) - 1) * (1 - sv) ** (q * l2), sv, 0, 1)
            check(1 / integ == ak, "H Example 3 a_k integral (p,q)=(%d,%d)" % (p, q))
    # rationality: the sum over the roots of unity is a rational function of
    # x1 = s1^p, x2 = s2^q with rational coefficients
    Rc = PolynomialRing(CF, ["s1", "s2"])
    s1c, s2c = Rc.gens()
    Fc = Rc.fraction_field()
    ssum = sum(Fc(1) / (1 - e1 ** j1 * s1c - e2 ** j2 * s2c)
               for j1 in range(p) for j2 in range(q))
    nu, de = ssum.numerator(), ssum.denominator()
    lc = de.lc()
    nu, de = nu / lc, de / lc
    ok = all(c in QQ and e[0] % p == 0 and e[1] % q == 0
             for P_ in [nu, de] for e, c in P_.dict().items())
    check(ok, "H h_(p,q) rational (p,q)=(%d,%d)" % (p, q))
    if q == 1:
        # h_(p,1) = h_p of Example 1
        Rx2 = FractionField(PolynomialRing(QQ, ["x1", "x2"]))
        xx1, xx2 = Rx2.gens()
        nuq = Rx2(sum(QQ(c) * xx1 ** (e[0] // p) * xx2 ** e[1] for e, c in nu.dict().items()))
        deq = Rx2(sum(QQ(c) * xx1 ** (e[0] // p) * xx2 ** e[1] for e, c in de.dict().items()))
        hpq = (nuq / deq).derivative(xx1) / p
        check(hpq == (1 - xx2) ** (p - 1) / ((1 - xx2) ** p - xx1) ** 2,
              "H h_(p,1) = h_p, p=%d" % p)

# 3°: the extended kernel of the ball, (11.12)-(11.13) and (11.1): with
# d lambda = (n-1)! d phi_[1] and phi = tau in Delta^*,
# a_k = [int phi^k d lambda]^(-1) = (|k| + n - 1)!/((n-1)! k!), the
# coefficients of h(x) = (1 - x_1 - ... - x_n)^(-n): (11.1) is an extended
# Szego kernel of the ball.
for n in range(2, 5):
    for kk in itertools.product(range(3), repeat=n):
        mon = prod(S_[j] ** kk[j + 1] for j in range(n - 1)) * (1 - sum(S_[:n - 1])) ** kk[0]
        integ = factorial(n - 1) * simplex_integral(mon, n - 1)
        check(1 / integ == factorial(sum(kk) + n - 1)
              / (factorial(n - 1) * prod(factorial(x) for x in kk)),
              "H (11.13) for the ball n=%d" % n)

# Theorem 11.3: every multi-index alpha != 0 is uniquely l k with l >= 1
# and k in M (coprime coordinates); n = 2 (|alpha| <= 30), n = 3 (<= 12).
for n, top in [(2, 30), (3, 12)]:
    for alpha in itertools.product(range(top + 1), repeat=n):
        if sum(alpha) == 0 or sum(alpha) > top:
            continue
        reps = [l for l in range(1, sum(alpha) + 1)
                if all(x % l == 0 for x in alpha) and gcd([x // l for x in alpha]) == 1]
        check(len(reps) == 1, "H Theorem 11.3 decomposition")

section("H")

# ---------------------------------------------------------------------------
# M. §12: Schwarz, Szego and Poisson kernels; the orthogonal polynomials
#    (12.16), (12.20); Examples 1-3.
# ---------------------------------------------------------------------------

# Polynomials in z, zbar on a Reinhardt measure are dicts {(alpha, beta):
# c} for z^alpha zbar^beta; int z^alpha zbar^beta d mu = [alpha = beta]
# mom(alpha) (n-rotation invariance).


def pmul(f, g):
    out = {}
    for (a1, b1), c1 in f.items():
        for (a2, b2), c2 in g.items():
            k = (tuple(x + y for x, y in zip(a1, a2)), tuple(x + y for x, y in zip(b1, b2)))
            out[k] = out.get(k, 0) + c1 * c2
    return fclean(out)


def pconj(f):
    return fclean({(b, a): (c.conjugate() if hasattr(c, "conjugate") else c)
                   for (a, b), c in f.items()})


def pint(f, mom):
    return sum((c * mom(a) for (a, b), c in f.items() if a == b), 0)


def mono(a, b=None, c=1):
    n = len(a)
    return {(tuple(a), tuple(b if b is not None else (0,) * n)): c}


def multi_indices(n, d):
    return [a for a in itertools.product(range(d + 1), repeat=n) if sum(a) <= d]


def sphere_moment(a):
    """Normalized surface measure of the unit sphere of C^n:
    int |zeta^a|^2 d mu = (n-1)! a!/(|a| + n - 1)!."""
    n = len(a)
    return factorial(n - 1) * prod(factorial(x) for x in a) / factorial(sum(a) + n - 1)


def torus_moment(a):
    return QQ(1)


# The sphere moments from the ball moments of section A: int_B |zeta^a|^2 dV
# = int_0^1 r^(2|a| + 2n - 1) dr int_S |zeta^a|^2 ds, so int_S |zeta^a|^2 ds
# = 2 pi^n a!/(|a| + n - 1)!; with a = 0 the area is 2 pi^n/(n-1)!.
for n in range(1, 5):
    for a in multi_indices(n, 4):
        sph = (2 * sum(a) + 2 * n) * ball_moment(a)  # / pi^n
        check(sph * factorial(n - 1) / 2 == sphere_moment(a),
              "M sphere moments n=%d" % n)
    # Example 2: d mu = (n-1)! (2 pi^n)^(-1) ds has mass 1; the printed
    # (n-1)! (2 pi)^(-n) ds has mass 2^(1-n)
    area = 2 * pi ** n / factorial(n - 1)
    check((factorial(n - 1) / (2 * pi ** n) * area - 1).simplify_full() == 0,
          "M Example 2: mass of mu n=%d" % n)
    if n > 1:
        refuted((factorial(n - 1) / (2 * pi) ** n * area - 1).simplify_full() == 0,
                "M Example 2: printed measure (n-1)!(2 pi)^(-n) ds, n=%d" % n)

# The form of (8.8) on the unit sphere: sum (-1)^(k-1) zetabar_k
# d zetabar_[k] ^ d zeta = 2^(n-1) i^n ds (U(n)-invariance and the value at
# e_1: dx_1 ^ form = c dV, dx_1 the outward unit conormal), so the Bochner
# kernel is (n-1)!/(2 pi^n) (1 - <z, zetabar>)^(-n) ds: the measure of
# Example 2 and the Szego kernel (1 - <z, zetabar>)^(-n).
for n in range(1, 5):
    dz = [fadd(gen(k), gen(n + k, II)) for k in range(n)]
    dzb = [fadd(gen(k), gen(n + k, -II)) for k in range(n)]
    form = wedges([dzb[k] for k in range(1, n)] + dz)  # zetabar = e_1
    c = wedge(gen(0), form)
    check(c == {tuple(range(2 * n)): 2 ** (n - 1) * II ** n}, "M density on the sphere n=%d" % n)
    check((factorial(n - 1) / (2 * pi * I) ** n * 2 ** (n - 1) * I ** n
           - factorial(n - 1) / (2 * pi ** n)).simplify_full() == 0,
          "M Bochner kernel density n=%d" % n)

# Szego kernels (12.2) as series h(zetabar, z) = sum_alpha c_alpha z^alpha
# zetabar^alpha; reproducing iff c_alpha mom(alpha) = 1; (12.5) h(zetabar, 0)
# = 1.  Ball: c_alpha = (|alpha| + n - 1)!/((n-1)! alpha!) (the coefficients
# of (1 - <z, zetabar>)^(-n)); polydisc: c_alpha = 1.
for n in range(1, 4):
    for a in multi_indices(n, 5):
        cb = factorial(sum(a) + n - 1) / (factorial(n - 1) * prod(factorial(x) for x in a))
        check(cb * sphere_moment(a) == 1, "M ball Szego kernel n=%d" % n)
        check(torus_moment(a) == 1, "M polydisc Szego kernel")


# Schwarz representation (12.4) with Q = 2h - 1 (12.6) and the formula
# f = 2i int Im f h d mu + conj f(z^0), z^0 = 0, for polynomials f of
# degree <= d with generic complex coefficients (c_a = u_a + i v_a), on
# the disc (n = 1), the polydisc (n = 2) and the ball (n = 2, 3).
for n, kind, d in [(1, "torus", 4), (2, "torus", 3), (2, "sphere", 3), (3, "sphere", 2)]:
    mom = torus_moment if kind == "torus" else sphere_moment
    idx = multi_indices(n, d)
    names = (["u%d" % i for i in range(len(idx))] + ["v%d" % i for i in range(len(idx))]
             + ["z%d" % j for j in range(n)] + ["zb%d" % j for j in range(n)])
    Rc = PolynomialRing(K, names)
    G = dict(zip(names, Rc.gens()))
    zs = [G["z%d" % j] for j in range(n)]
    zbs = [G["zb%d" % j] for j in range(n)]

    def cjR(e):
        # conj: K-coefficients conjugated, z <-> zb, u, v real
        sub = {zs[j]: zbs[j] for j in range(n)}
        sub.update({zbs[j]: zs[j] for j in range(n)})
        return e.map_coefficients(lambda c: c.conjugate()).subs(sub)

    coef = [G["u%d" % i] + II * G["v%d" % i] for i in range(len(idx))]
    f = fclean({(a, (0,) * n): coef[i] for i, a in enumerate(idx)})
    fb = fclean({((0,) * n, a): cjR(coef[i]) for i, a in enumerate(idx)})
    fz = sum(coef[i] * prod(zs[j] ** a[j] for j in range(n)) for i, a in enumerate(idx))
    f0 = coef[idx.index((0,) * n)]
    ch = (lambda a: QQ(1)) if kind == "torus" else (
        lambda a: factorial(sum(a) + n - 1) / (factorial(n - 1) * prod(factorial(x) for x in a)))
    hser = fclean({((0,) * n, a): ch(a) * prod(zs[j] ** a[j] for j in range(n))
                   for a in multi_indices(n, d + 1)})
    Qser = fadd(fscale(2, hser), fscale(-1, mono((0,) * n)))
    ref = fscale(QQ(1) / 2, fadd(f, fb))  # Re f on M
    val = pint(pmul(ref, Qser), mom)
    imf0 = (f0 - cjR(f0)) / (2 * II)
    check(val + II * imf0 == fz, "M (12.4) Schwarz formula %s n=%d" % (kind, n))
    imf = fscale(1 / (2 * II), fsub(f, fb))
    val2 = pint(pmul(imf, hser), mom)
    check(2 * II * val2 + cjR(f0) == fz, "M Im-formula after (12.8) %s n=%d" % (kind, n))
    # (12.8) at z^0 = 0: int fbar h d mu = conj f(0)
    check(pint(pmul(fb, hser), mom) == cjR(f0), "M (12.8) middle term %s n=%d" % (kind, n))
    # (12.5): h(zetabar, 0) = 1
    check(all(k == ((0,) * n, (0,) * n) or c.subs({x: 0 for x in zs}) == 0
              for k, c in hser.items()), "M (12.5) %s n=%d" % (kind, n))

# (12.1) for the disc: (zeta + z)/(zeta - z) = 2/(1 - z zetabar) - 1 on
# |zeta| = 1 (the kernel used above), and d mu = d theta/(2 pi).
Rq = FractionField(PolynomialRing(QQ, ["zeta", "z"]))
zt, zq = Rq.gens()
check((zt + zq) / (zt - zq) == 2 / (1 - zq / zt) - 1, "M (12.1) kernel")

# Proposition 12.3 on the ball, n = 2: h(zbar, z) = int |h(zetabar, z)|^2
# d mu and int f P d mu = f(z) for f = zeta^a, |a| <= 1, as power series in
# z, zbar up to degree 4 (P = |h|^2/h(zbar, z), h(zbar, z) = (1 - |z|^2)^(-2)).
n = 2
names = ["z0", "z1", "zb0", "zb1"]
Rz = PolynomialRing(QQ, names)
z0, z1, zb0, zb1 = Rz.gens()
zs, zbs = [z0, z1], [zb0, zb1]


def ballc(a):
    return factorial(sum(a) + n - 1) / (factorial(n - 1) * prod(factorial(x) for x in a))


D = 4
h = fclean({((0, 0), a): ballc(a) * prod(zs[j] ** a[j] for j in range(n))
            for a in multi_indices(n, D)})
hc = fclean({(a, (0, 0)): ballc(a) * prod(zbs[j] ** a[j] for j in range(n))
             for a in multi_indices(n, D)})
hzz = sum(ballc(a) * prod((zs[j] * zbs[j]) ** a[j] for j in range(n))
          for a in multi_indices(n, D))


def trunc_z(e, d):
    return sum((c * m for c, m in zip(e.coefficients(), e.monomials()) if m.degree() <= d),
               Rz(0))


check(trunc_z(pint(pmul(h, hc), sphere_moment) - hzz, 2 * D) == 0,
      "M (12.15) on the ball")
for a in [(0, 0), (1, 0), (0, 1), (1, 1), (2, 0)]:
    val = pint(pmul(mono(a), pmul(h, hc)), sphere_moment)
    za = prod(zs[j] ** a[j] for j in range(n))
    check(trunc_z(val - za * hzz, D) == 0, "M Proposition 12.3 on the ball, f=zeta^%s" % (a,))
check(trunc_z(hzz * (1 - z0 * zb0 - z1 * zb1) ** 2 - 1, D) == 0,
      "M h(zbar, z) = (1 - |z|^2)^(-2)")

# Lemma 12.5 and the coefficients a_(J frakJ k) (pp. 85-86).  With an
# orthonormal system phi_l^k of homogeneous polynomials (phi_(-l) =
# conj phi_l), P_(J frakJ) = sum_k a phi^k_(|J| - |frakJ|).  Corrected:
# a = int z^J zbar^frakJ conj(phi^k_(|J|-|frakJ|)) d mu (the orthogonal
# projection); printed: without the conjugation, a = 0 unless |J| = |frakJ|
# (rotation invariance), and Lemma 12.5 fails: on the unit circle (n = 1,
# d mu = d theta/2 pi, phi_l = z^l) J = 1, frakJ = 0 gives P = 0 and
# z - P = z, while int z zbar d mu = 1 (zbar is pluriharmonic).
# The ball (n = 2) and the polydisc: the monomials z^gamma, |gamma| = l, are
# an orthogonal basis; with psi = z^gamma (l >= 0) or zbar^gamma (l < 0) and
# ||psi||^2 = mom(gamma), a phi = <f, psi> psi/||psi||^2 (corrected) and
# (int f psi d mu) psi/||psi||^2 (printed).
for n, mom in [(1, torus_moment), (2, sphere_moment), (3, sphere_moment), (2, torus_moment)]:
    zero = (0,) * n
    bad = 0
    for Jd in multi_indices(n, 2):
        for Fd in multi_indices(n, 2):
            f = mono(Jd, Fd)
            l = sum(Jd) - sum(Fd)
            gammas = [g for g in multi_indices(n, abs(l)) if sum(g) == abs(l)]
            Pc, Pp = {}, {}
            for g in gammas:
                psi = mono(g) if l >= 0 else mono(zero, g)
                nrm = mom(g)
                ac = pint(pmul(f, pconj(psi)), mom)
                ap = pint(pmul(f, psi), mom)
                Pc = fadd(Pc, fscale(ac / nrm, psi))
                Pp = fadd(Pp, fscale(ap / nrm, psi))
            for N in multi_indices(n, 4):
                for u in [mono(N), mono(zero, N)]:
                    check(pint(pmul(fsub(f, Pc), u), mom) == 0,
                          "M Lemma 12.5 corrected n=%d" % n)
                    if pint(pmul(fsub(f, Pp), u), mom) != 0:
                        bad += 1
            # the proof with (12.17) read with conj(phi_l^k): zero for
            # l' != |J| - |frakJ| by rotation, and for l' = l by the
            # coefficients
            for lp in range(-3, 4):
                for g in [g for g in multi_indices(n, abs(lp)) if sum(g) == abs(lp)]:
                    phi = mono(g) if lp >= 0 else mono(zero, g)
                    v = pint(pmul(fsub(f, Pc), pconj(phi)), mom)
                    check(v == 0, "M (12.17) with conj, n=%d" % n)
    refuted(bad == 0, "M Lemma 12.5 with the printed a_(J frakJ k), n=%d" % n)

# Proposition 12.7, (12.20), for n-circular measures with
# alpha_J^(-2) = mom(J): the corrected polynomials z^J zbar^(J + frakJ)
# (alpha_(J+frakJ)^2 - alpha_(J+frakJ+l_k)^2 |z_k|^2) and their conjugates
# are orthogonal to every z^N, zbar^N; the printed order of the
# coefficients is not.  On the ball they are proportional to the
# polynomials of Example 2, i_k + j_k + 1 - (|J| + |frakJ| + n)|z_k|^2; on
# the polydisc (alpha = 1) they vanish on the torus.
for n, mom in [(2, sphere_moment), (3, sphere_moment), (2, torus_moment)]:
    zero = (0,) * n

    def a2(A):
        return 1 / mom(A)

    bad = 0
    for Jd in multi_indices(n, 2):
        for Fd in multi_indices(n, 2):
            A = tuple(x + y for x, y in zip(Jd, Fd))
            for k in range(n):
                Ak = tuple(A[i] + (1 if i == k else 0) for i in range(n))
                ek = tuple(1 if i == k else 0 for i in range(n))
                zk2 = mono(ek, ek)
                for corrected in [True, False]:
                    c1, c2 = (a2(A), a2(Ak)) if corrected else (a2(Ak), a2(A))
                    base = fsub(mono(zero, zero, c1), fscale(c2, zk2))
                    for P in [pmul(mono(Jd, A), base), pmul(mono(A, Jd), base)]:
                        ok = all(pint(pmul(P, u), mom) == 0
                                 for N in multi_indices(n, 5)
                                 for u in [mono(N), mono(zero, N)])
                        if corrected:
                            check(ok, "M (12.20) corrected n=%d" % n)
                        elif not ok:
                            bad += 1
                if mom is sphere_moment:
                    # Example 2: c1 : c2 = (i_k + j_k + 1) : (|J| + |frakJ| + n)
                    check(a2(A) * (sum(A) + n) == a2(Ak) * (A[k] + 1),
                          "M Example 2 ball polynomials n=%d" % n)
                else:
                    check(a2(A) == a2(Ak) == 1, "M Example 1: alpha = 1")
    if mom is sphere_moment:
        refuted(bad == 0, "M (12.20) with the printed coefficients n=%d" % n)

# Proposition 12.7 spans: for n = 2 on the sphere, in each rotation weight
# m (z^J zbar^frakJ with J - frakJ = m), with the monomials z^(c + m+)
# zbar^(c + m-), |c| <= C: the mixed weights are spanned by the first type;
# for m <= 0 or m >= 0 the polynomials of the second (third) type lie in
# the kernel of the only pairing int P z^(-m) d mu (int P zbar^m d mu) and
# span it (rank = dimension - 1), as polynomials.
n = 2
Cmax = 3
for m in itertools.product(range(-2, 3), repeat=2):
    mp = tuple(max(x, 0) for x in m)
    mn = tuple(max(-x, 0) for x in m)
    cs = multi_indices(2, Cmax)
    basis = [(tuple(c[i] + mp[i] for i in range(2)), tuple(c[i] + mn[i] for i in range(2)))
             for c in cs]
    pos = {b: i for i, b in enumerate(basis)}
    if any(x > 0 for x in m) and any(x < 0 for x in m):
        check(all(not (all(a[i] <= b[i] for i in range(2)) or all(a[i] >= b[i] for i in range(2)))
                  for a, b in basis), "M mixed weight: first type")
        continue
    vecs = []
    for c in multi_indices(2, Cmax - 1):
        for k in range(2):
            ek = tuple(1 if i == k else 0 for i in range(2))
            if all(x <= 0 for x in m):
                Jd, A = c, tuple(c[i] + mn[i] for i in range(2))   # z^J zbar^(J + frakJ)
                low = (Jd, A)
                high = (tuple(Jd[i] + ek[i] for i in range(2)), tuple(A[i] + ek[i] for i in range(2)))
            else:
                A, Jd = tuple(c[i] + mp[i] for i in range(2)), c   # z^(J + frakJ) zbar^J
                low = (A, Jd)
                high = (tuple(A[i] + ek[i] for i in range(2)), tuple(Jd[i] + ek[i] for i in range(2)))
            AA = tuple(c[i] + mn[i] + mp[i] for i in range(2))
            AAk = tuple(AA[i] + ek[i] for i in range(2))
            v = [0] * len(basis)
            v[pos[low]] = 1 / sphere_moment(AA)
            v[pos[high]] = -1 / sphere_moment(AAk)
            vecs.append(v)
    Mv = matrix(QQ, vecs)
    ell = vector(QQ, [sphere_moment(b[1] if all(x <= 0 for x in m) else b[0])
                      for b in basis])
    check(Mv * ell == 0, "M second/third type in the kernel, weight %s" % (m,))
    check(Mv.rank() == len(basis) - 1, "M second/third type span the kernel, weight %s" % (m,))

# Lemma 12.8: H_a(f) = sum f_(z_i zbar_j) a_i conj(a_j) (corrected); with the
# printed a_i a_j, f = Im(z_1 zbar_2) has H_a(f) = 0 for every a although
# f is not pluriharmonic (f_(z_1 zbar_2) = 1/(2i)).
Rf = PolynomialRing(K, ["x1", "y1", "x2", "y2", "p1", "q1", "p2", "q2"])
x1, y1, x2, y2, p1, q1, p2, q2 = Rf.gens()
z1_, z2_ = x1 + II * y1, x2 + II * y2
fIm = (z1_ * (x2 - II * y2) - (x1 - II * y1) * z2_) / (2 * II)
XYf = [(x1, y1), (x2, y2)]
cplx = [[dz_(dzb_(fIm, *XYf[j]), *XYf[i]) for j in range(2)] for i in range(2)]
av = [p1 + II * q1, p2 + II * q2]
avc = [p1 - II * q1, p2 - II * q2]
check(sum(cplx[i][j] * av[i] * av[j] for i in range(2) for j in range(2)) == 0,
      "M Lemma 12.8: printed H_a vanishes on Im(z_1 zbar_2)")
check(sum(cplx[i][j] * av[i] * avc[j] for i in range(2) for j in range(2)) != 0,
      "M Lemma 12.8: corrected H_a does not")
check(cplx[0][1] != 0, "M Im(z_1 zbar_2) is not pluriharmonic")

section("M")

# Example 3 (pp. 89-91): the "generalized unit disk", S(tau_0) = U(2).
# X = e^(i psi) U, U = [[a, -bbar], [b, abar]] in SU(2) = S^3
# (|a|^2 + |b|^2 = 1); the book's X = e^(i phi/2) u, 0 <= phi <= 2 pi, with
# d mu = (4 pi^3)^(-1) d phi ^ du covers U(2) once and has mass
# 2 pi * 2 pi^2/(4 pi^3) = 1 (|S^3| = 2 pi^2): mu is the Haar probability
# measure, here computed as d psi/2 pi (0 <= psi <= 2 pi, a double cover)
# times the normalized measure of S^3, whose moments are those of the
# sphere of C^2: int |a|^(2p) |b|^(2q) = p! q!/(p + q + 1)!.
check((2 * pi * 2 * pi ** 2 / (4 * pi ** 3) - 1).simplify_full() == 0,
      "M Example 3: mass of mu")
check(2 * pi ** 2 / factorial(1) == 2 * pi ** 2, "M |S^3| = 2 pi^2")
RU = PolynomialRing(QQ, ["a", "ab", "b", "bb"])
ua, uab, ub, ubb = RU.gens()
LE = LaurentPolynomialRing(RU, "E")
E = LE.gen()
X = matrix(LE, [[E * ua, -E * ubb], [E * ub, E * uab]])
Xc = matrix(LE, [[E ** -1 * uab, -E ** -1 * ub], [E ** -1 * ubb, E ** -1 * ua]])


def u2_integral(f):
    """int over U(2) of a Laurent polynomial in E with coefficients in
    a, abar, b, bbar (Haar probability measure)."""
    c = LE(f).constant_coefficient()
    tot = QQ(0)
    for (e1, e2, e3, e4), cf in RU(c).dict().items():
        if e1 == e2 and e3 == e4:
            tot += cf * sphere_moment((e1, e3))
    return tot


# det X = E^2 (|a|^2 + |b|^2) = E^2 on S(tau_0); conj X = (det X)^(-1)
# [[x22, -x21], [-x12, x11]] (unitarity)
check(X.det() == E ** 2 * (ua * uab + ub * ubb), "M det X")
adj = matrix(LE, [[X[1, 1], -X[1, 0]], [-X[0, 1], X[0, 0]]])
check(Xc == E ** -2 * adj, "M conj X = (det X)^(-1) [[x22, -x21], [-x12, x11]]")
check(u2_integral(LE(1)) == 1, "M Example 3: mu is a probability measure")


def Dt(j2, q1, q2, w):
    """D^j_(q1,q2)(w) without the square-root factor, j2 = 2j, q = 2q."""
    j, Q1, Q2 = QQ(j2) / 2, QQ(q1) / 2, QQ(q2) / 2
    out = 0
    for s in range(0, j2 + 1):
        e2 = j + Q1 - s
        e3 = j + Q2 - s
        e4 = s - Q1 - Q2
        if min(e2, e3, e4) < 0:
            continue
        out += (binomial(ZZ(j + Q2), s) * binomial(ZZ(j - Q2), ZZ(s - Q1 - Q2))
                * w[0] ** s * w[1] ** ZZ(e2) * w[2] ** ZZ(e3) * w[3] ** ZZ(e4))
    return out


def pref2(j2, q1, q2):
    j, Q1, Q2 = QQ(j2) / 2, QQ(q1) / 2, QQ(q2) / 2
    return (factorial(ZZ(j + Q1)) * factorial(ZZ(j - Q1))
            / (factorial(ZZ(j + Q2)) * factorial(ZZ(j - Q2))))


def qs(j2):
    return list(range(-j2, j2 + 1, 2))   # 2q for q = -j, ..., j


# (12.25), corrected: conj D^j_(q1,q2)(X) = (-1)^(q1-q2) (det X)^(-2j)
# D^j_(-q1,-q2)(X) on U(2).  D has real coefficients, so conj D(X) = D(Xbar)
# = (det X)^(-2j) D(x22, -x21, -x12, x11): the identity is the polynomial
# identity D(x22, -x21, -x12, x11) = (-1)^(q1-q2) D_(-q1,-q2)(x) (the square
# root factors of D_(q1,q2) and D_(-q1,-q2) coincide); checked for
# 2j <= 8.  The printed sign (-1)^(q1+q2) differs for half-integer j.
Rw = PolynomialRing(QQ, ["w11", "w12", "w21", "w22"])
w = Rw.gens()
wt = [w[3], -w[2], -w[1], w[0]]
for j2 in range(0, 9):
    for q1 in qs(j2):
        for q2 in qs(j2):
            lhs = Dt(j2, q1, q2, wt)
            sgn = (-1) ** ZZ((q1 - q2) // 2)
            check(lhs == sgn * Dt(j2, -q1, -q2, w), "M (12.25) j=%s" % (QQ(j2) / 2))
            check(pref2(j2, q1, q2) == pref2(j2, -q1, -q2), "M (12.25) square-root factors")
            check(Dt(j2, q1, q2, w) != 0, "M D^j nonzero")
            printed = (-1) ** ZZ((q1 + q2) // 2)
            if j2 % 2:
                refuted(lhs == printed * Dt(j2, -q1, -q2, w),
                        "M (12.25) printed sign (-1)^(q1+q2), j=%s" % (QQ(j2) / 2))
            else:
                check(printed == sgn, "M (12.25) signs agree for integer j")
# j = 1/2: D_(1/2,-1/2) = x12, D_(-1/2,1/2) = x21
check(Dt(1, 1, -1, w) == w[1] and Dt(1, -1, 1, w) == w[2], "M D^(1/2)")

# The functions (det X)^m D^j_(q1,q2)(X) are orthogonal on U(2) with
# int |(det X)^m D^j_(q1,q2)|^2 d mu = 1/(2j + 1) (2j <= 3, -3 <= m <= 2),
# so sqrt(2j + 1) (det X)^m D^j_(q1,q2) are orthonormal (12.23).
Xe = [X[0, 0], X[0, 1], X[1, 0], X[1, 1]]
Xce = [Xc[0, 0], Xc[0, 1], Xc[1, 0], Xc[1, 1]]
labels = [(j2, m, q1, q2) for j2 in range(4) for m in range(-3, 3)
          for q1 in qs(j2) for q2 in qs(j2)]
vals = {L: E ** (2 * L[1]) * Dt(L[0], L[2], L[3], Xe) for L in labels}
cvals = {L: E ** (-2 * L[1]) * Dt(L[0], L[2], L[3], Xce) for L in labels}
for L1 in labels:
    for L2 in labels:
        v = u2_integral(vals[L1] * cvals[L2])
        if L1 == L2:
            check(v * pref2(L1[0], L1[2], L1[3]) == QQ(1) / (L1[0] + 1),
                  "M ||(det X)^m D^j||^2 = 1/(2j + 1)")
        else:
            check(v == 0, "M orthogonality of (det X)^m D^j")
# Hence the coefficients of (12.27) are
# a = (2j + 1) int P (det Xbar)^m D^j(Xbar) d mu; with P = (det X)^m D^j
# itself (a = 1) the printed factor 1/(2j + 1) gives 1/(2j + 1)^2.
for L in labels:
    if L[0] == 0:
        continue
    inner = u2_integral(vals[L] * cvals[L]) * pref2(L[0], L[2], L[3])
    check((L[0] + 1) * inner == 1, "M (12.27) coefficient with 2j + 1")
    refuted(inner / (L[0] + 1) == 1, "M (12.27) coefficient with 1/(2j + 1)")

# Lemma 12.10: for 2j >= 2 and -2j < m < 0 the functions (12.23) are
# orthogonal to every holomorphic and antiholomorphic polynomial in X of
# degree <= 4; for m >= 0 they are holomorphic, and for m = -2j, -2j - 1 they
# are antiholomorphic by (12.25).
hol = []
for e in itertools.product(range(5), repeat=4):
    if sum(e) <= 4:
        hol.append(prod(Xe[i] ** e[i] for i in range(4)))
holc = [prod(Xce[i] ** e[i] for i in range(4))
        for e in itertools.product(range(5), repeat=4) if sum(e) <= 4]
for L in labels:
    j2, m, q1, q2 = L
    if j2 >= 2 and -j2 < m < 0:
        check(all(u2_integral(vals[L] * u) == 0 for u in hol + holc),
              "M Lemma 12.10: (12.23) in [Ph_C]^perp")
    if m <= -j2:
        # (det X)^m D^j = (-1)^(q1-q2) conj((det X)^(-m-2j) D^j_(-q1,-q2)(X))
        sgn = (-1) ** ZZ((q1 - q2) // 2)
        check(vals[L] == sgn * E ** (-2 * (-m - j2)) * Dt(j2, -q1, -q2, Xce),
              "M m <= -2j: antiholomorphic")

# The Szego kernel h(X, w) = det^(-2)(I - w X^*) reproduces the polynomials
# of degree <= 2 in w (series of det^(-2)(I - A) = (1 - tr A + det A)^(-2)
# = sum (k + 1)(tr A - det A)^k, truncated in the degree in w).
Rww = PolynomialRing(LE, ["w11", "w12", "w21", "w22"])
W = matrix(Rww, 2, 2, Rww.gens())
Xs = matrix(Rww, [[Xc[0, 0], Xc[1, 0]], [Xc[0, 1], Xc[1, 1]]])  # X^* = conj X^T
A_ = W * Xs
trA, detA = A_.trace(), A_.det()
ser = sum((k + 1) * (trA - detA) ** k for k in range(3))


def trunc_w(e, d):
    return sum((c * m for c, m in zip(e.coefficients(), e.monomials()) if m.degree() <= d),
               Rww(0))


ser = trunc_w(ser, 2)
check(u2_integral(LE(1)) == 1 and ser.constant_coefficient() == 1,
      "M Example 3: h(X, 0) = 1")
for e in itertools.product(range(3), repeat=4):
    if sum(e) > 2:
        continue
    pX = prod(Xe[i] ** e[i] for i in range(4))
    integrand = trunc_w(pX * ser, 2)
    res = sum(u2_integral(c) * m for c, m in zip(integrand.coefficients(),
                                                  integrand.monomials()))
    target = prod(Rww.gen(i) ** e[i] for i in range(4))
    check(res == target, "M Example 3: Szego kernel reproduces w^%s" % (e,))

section("M ex3")

print("ok ch2: %d checks" % COUNT[0])
