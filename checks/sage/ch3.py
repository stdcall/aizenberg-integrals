"""Exact checks of Chapter III, "The Theory of Residues", §§13-19
(printed pp. 93-136).

Run: sage -python checks/sage/ch3.py (plain asserts; do not use -O).
The last line of the output is "ok ch3: N checks".

Book: L. A. Aizenberg and A. P. Yuzhakov, Integral Representations and
Residues in Multidimensional Complex Analysis, AMS Translations of
Mathematical Monographs 58, 1983.  Pages are the printed pages, numbers of
statements and formulas those of the book; the ids in parentheses are the
entries of corrections.json.  Expected values are the book's formulas,
written below as literals (with the corrections where marked); the Typst
sources are not parsed.  Where the book is wrong, the printed reading is
kept as a refuted check (`refuted`: the printed reading must fail) beside
the corrected one.

Exact arithmetic only: Q, Q(i), cyclotomic and other number fields
(conjugate roots are handled in stem fields), polynomial rings with
symbolic coefficients and their fraction fields, Laurent series in an
auxiliary variable t over Laurent polynomials (truncation guarded by
an assertion on the precision), Sage's Orlik-Solomon Betti numbers of
hyperplane arrangements, Sage's function fields (genus, different,
places at infinity).

Model.  Holomorphic differential forms with rational coefficients are
dicts {I: c} over the basis dz_I (I increasing); d is the holomorphic
exterior derivative.  Integrals of rational forms over tori and tubes are
iterated residues: for a cycle {|zeta_1| = eps_1, ..., |zeta_n| = eps_n}
with eps_1 << ... << eps_n (or equal radii where the other polar sets
stay away), the integral divided by (2 pi i)^n is the iterated residue at
0 in zeta_1, then zeta_2, ...; the tube delta(l) over a loop l on a
smooth curve {u = 0} (fibre first, as delta in §16, 2°) gives 2 pi i times
the integral over l of the fibre residue in u.  Regimes such as
eps^2 << delta << eps are realised by zeta_1 = t^3 x, zeta_2 = t^2 y
(|x| = |y| = 1) and Laurent expansion in t.  "Jets": an identity that at a
point involves only the values and first derivatives of the data (second
derivatives of s_j entering only through d(ds_j) = 0) is checked with
generic affine data, which proves it for all holomorphic data in that
dimension.

What is checked:

A  §14 (pp. 94-98): Example 3: the Jacobian sign +1 at (2, 2), the
   boundary orientation of c, chi(sigma, b) = +1, the symmetry of the
   linking coefficient (property 3), r, q <= 8; R = sum_k (k!)^(-2)
   d^(2k) f/dw^k dz^k(0, 0) for the generic f of degree <= 6 in each
   variable, by iterated residues and termwise.  Example 1: t -> (t^m, t^k)
   is injective iff gcd(k, m) = 1, and w^k - z^m splits otherwise,
   k, m <= 8.  Example 2: b_n = 0 for parallel hyperplanes, n = 2, 3,
   N <= 3, while for n = 1 b_1 = N (the printed statement without n >= 2
   is refuted: iii-97-example-2-dimension).
B  §15, Example 15.8 (pp. 100-101): the exactness of c z^alpha dz with the
   sign (-1)^(j-1) (iii-101-laurent-sign), all alpha in {-2, ..., 1}^n,
   all j, n <= 4 (printed reading without the sign refuted for even j);
   the periods (2 pi i)^(-n) int_(gamma_0) z^alpha dz = [alpha = -I].
C  §16 (pp. 101-113): Example 1, ds/s ^ psi = (f/s) dz with
   psi = (-1)^(j-1) (f/s'_(z_j)) dz_[j], generic s of degree <= 2, n <= 4,
   all j.  The factor 2 pi i in the proof of Theorem 16.5 in the model
   X = C x C^*, S = {z_1 = 0}, phi = dz_1 ^ dz_2/(z_1 z_2), 2 pi i an
   indeterminate T: with the printed {chi} = delta^*{phi} the step
   int phi = int phi_1 and Theorem 16.8 fail (T^3 against T^2); with
   {chi} = (2 pi i)^(-1) delta^*{phi} (iii-108-residue-class-factor) they
   hold, and chi = res phi.  Example 3 (|z| > 1), n <= 5.  Example 4: two
   arrangements in general position (with a parallel pair), n = 2, 3: the
   independent n-subsets are b_n many and int_(gamma_I) omega_J =
   delta_IJ.  Composite residues: res^2 of ds_1 ^ ds_2 ^ omega/(s_1 s_2)
   is omega|_S, the other order gives the sign -1.
D  §17 (pp. 113-120): the identity of the proof of Theorem 17.2 (the
   denominator with s_j, iii-116-identity-denominator-index; the printed
   s_i refuted) and ds[j] ^ d omega = (-1)^(m-j) ds ^ omega_j, jets,
   (n, m) = (2, 1), (2, 2), (3, 1), (3, 2), (3, 3), r_k <= 1, r_j <= 2;
   Example 1 (Res f dz/z^(r+1) = f^((r))(0)/r!), n = 2, 3, r <= 2; (17.11)
   for all J, jets, m <= n <= 4; (17.12) as an exact form, jets, n = 3,
   m = 2, r <= 3; Example 2: the decomposition with the squares
   (iii-118-example-2-exponents; printed one refuted, defect computed),
   both Nullstellensatz identities, the Jacobians, and
   omega ~ omega* (iii-119-example-2-differential): all fibre residues of
   omega - omega* on w = 0, wz = 1, w^2 + z^2 = 1 have zero residues at all
   their poles, so all periods over H_2 (rank 8, E2) vanish; a perturbed
   omega* is detected.  Theorem 17.7 (Griffiths): the printed bound
   n - E(n/q) equals floor((n + 1)(q - 1)/q), the largest pole order
   with R_(kq-n-1) != 0 in the Jacobian ring of the Fermat hypersurface
   (Hilbert series ((1 - t^(q-1))/(1 - t))^(n+1); Griffiths' theorem as
   stated in Huybrechts, The Geometry of Cubic Hypersurfaces, 2023,
   Ch. 1, Lemma 4.23, Proposition 4.3), unless no pole order occurs
   (H^n = 0, e.g. the conic), n <= 9, 2 <= q <= 9.
E  §18 (pp. 119-129): Theorem 18.1 (Riemann) against Sage's genus for 8
   curves (genus <= 3); (18.6) and (18.7) for 11 curves (the Example of
   §18, Example 2 of §17, Examples 1 and 3 of §14, curves of genus 1, 2,
   nodal and reducible curves, line arrangements with Orlik-Solomon); the
   singular points (0, 0), (0, -1) and the data of the Example; 5°: the
   residue class Res[F/omega^(r_s) d omega ^ d zeta] with
   F = P Q_s^(r_s)/(Q dQ_s/dw) equals the fibre residue (model
   Q_s = wz - 1, r_s = 2, generic P; iii-126-jacobian; the printed F and
   the order d zeta ^ d omega refuted); the Example: R_1 with
   (-1)^(k+1) (iii-128-r1-sign), dQ/dw = -2z^7 on w^2 = z^3 and R_2 with
   the minus signs (iii-128-r2-sign), R_3 = P(0, -1), the printed formula
   for R_4 equal to the residue computed on the rational parametrization
   z = 1/(v^2 - 1), w = v/(v^2 - 1)^2 of the third component (generic P
   of degree <= 8); (18.11); Theorem 18.7 as 1 + m - chi(T) (symbolic,
   m, k <= 5) and by Orlik-Solomon for 3, 4, 4, 5 projective lines.
F  §19 (pp. 129-136): Theorem 19.3 in the linear model: binom(N - 1,
   n - 1) = #A = b_n and the duality matrix is the identity, n = 2,
   N <= 6, n = 3, N <= 6; the residues R_alpha of 3°-4° for nonlinear
   phi_1, phi_2, phi_3 (n = 2, N = 3), 5 exponent vectors, both alpha:
   the definition (nonlinear substitution (19.3)) equals the method of 4°
   (linear substitution) on Gamma with eps^2 << delta << eps, and differs
   for delta = eps^3, which the printed "eps, delta, delta/eps
   sufficiently small" allows (iii-134-eps-squared-over-delta); in
   phi_1 = z_1 + z_2^2 the point (-eps^2, eps) of Gamma lies on T_1 for
   delta = eps^2; the factorized denominator of (19.5): leading term
   with the exponents r_(alpha_j) and the coefficient
   prod_(j not in alpha) a_(j n)^(r_j), and further terms of degree
   r_1 + ... + r_N (iii-134-factorized-denominator); the printed bound
   of Theorem 19.3 admits a zero (iii-132-delta-epsilon-bound; general
   statement in Lean).  Theorem 19.8: canonical systems built step by
   step as printed for 5 non-generic arrangements (n = 2, 3): sum |J| =
   b_n = 4, 9, 6, 8, 10 and the duality matrix is the identity;
   Proposition 19.7: b_3 = 0 for rank 2.

What is NOT established: the topological theorems (Alexander-Pontryagin
and de Rham dualities, the Leray sequence, Theorems 16.2-16.5 and 16.10 in
general, Froissart's and Pedan's theorems, Theorems 18.2, 18.4, 18.6,
18.8, 19.2, 19.3 and 19.8 in general); the checks above are models,
instances and identities with the stated ranges.  The bases of Theorem
18.4 are not constructed (only the numbers p and the residues of the
Example), the limit arguments of the proofs are not checked, and Theorem
17.7 is compared with Griffiths' theory only for Fermat hypersurfaces.
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
    print("%-4s %6.1f s, %d checks" % (name, time.time() - T0, COUNT[0]),
          flush=True)


# ---------------------------------------------------------------------------
# Holomorphic differential forms with rational coefficients.  A form is a
# dict {I: c}, I an increasing tuple of 0-based indices (k <-> d z_(k+1)),
# c an element of a fraction field Frac(B[z_1, ..., z_n]).  d is the
# holomorphic exterior derivative (all forms here are holomorphic).
# ---------------------------------------------------------------------------


def perm_sign(seq):
    seq = list(seq)
    if len(set(seq)) != len(seq):
        return 0
    s = 1
    for i in range(len(seq)):
        for j in range(i + 1, len(seq)):
            if seq[i] > seq[j]:
                s = -s
    return s


def fclean(f):
    return {k: v for k, v in f.items() if v != 0}


def fadd(*fs):
    out = {}
    for f in fs:
        for k, v in f.items():
            out[k] = out.get(k, 0) + v
    return fclean(out)


def fscale(c, f):
    return fclean({k: c * v for k, v in f.items()})


def fsub(f, g):
    return fadd(f, fscale(-1, g))


def wedge(*fs):
    out = {(): 1}
    for g in fs:
        new = {}
        for I, a in out.items():
            for J, b in g.items():
                s = perm_sign(I + J)
                if s == 0:
                    continue
                K = tuple(sorted(I + J))
                new[K] = new.get(K, 0) + s * a * b
        out = fclean(new)
    return out


def dform(f, zs):
    out = {}
    for I, c in f.items():
        for k, zk in enumerate(zs):
            if k in I:
                continue
            dc = c.derivative(zk)
            if dc == 0:
                continue
            K = tuple(sorted((k,) + I))
            out[K] = out.get(K, 0) + perm_sign((k,) + I) * dc
    return fclean(out)


def fun(c):
    return fclean({(): c})


def dz(k):
    return {(k,): 1}


def dz_all(n):
    return {tuple(range(n)): 1}


def dz_omit(n, ks):
    """d z_[k] (k omitted, no sign), several omitted indices allowed."""
    return {tuple(i for i in range(n) if i not in ks): 1}


def feq(f, g):
    return fsub(f, g) == {}


# ---------------------------------------------------------------------------
# Residues of rational functions.  res0(G, x) is the coefficient of x^(-1)
# in the Laurent expansion of G at x = 0 (the other variables are
# parameters): G = num/(x^k den) with den(x = 0) != 0, the coefficient of
# x^(k-1) in num/den by power series division.
# ---------------------------------------------------------------------------


def res0(G, x):
    R = x.parent()
    FF = R.fraction_field()
    G = FF(G)
    num, den = R(G.numerator()), R(G.denominator())
    k = 0
    while den.subs({x: 0}) == 0:
        q, r = den.quo_rem(x)
        assert r == 0
        den = q
        k += 1
    if k == 0:
        return FF(0)
    if hasattr(num, "polynomial"):
        nl, dl = num.polynomial(x).list(), den.polynomial(x).list()
    else:
        nl, dl = num.list(), den.list()
    nc = [FF(c) for c in nl]
    dc = [FF(c) for c in dl]
    coeffs = []
    for i in range(k):
        s = nc[i] if i < len(nc) else FF(0)
        for j in range(i):
            if i - j < len(dc):
                s -= coeffs[j] * dc[i - j]
        coeffs.append(s / dc[0])
    return coeffs[k - 1]


def res_at(G, x, a):
    """Residue at x = a (a in the coefficient ring)."""
    FF = x.parent().fraction_field()
    G = FF(G)
    shifted = G.numerator().subs({x: x + a}) / G.denominator().subs({x: x + a})
    return res0(shifted, x)


def iterated_res(G, xs):
    """Res_(xs[-1] = 0) ... Res_(xs[0] = 0) G."""
    for x in xs:
        G = res0(G, x)
    return G




def all_residues_zero(G, x):
    """G rational in the single variable x over Q or a number field:
    the residue of G at every finite pole is 0 (computed exactly in the
    stem field of each irreducible factor of the denominator)."""
    R = x.parent()
    K = R.base_ring()
    G = R.fraction_field()(G)
    for h, _ in R(G.denominator()).factor():
        if h.degree() == 1:
            if res_at(G, x, -h[0] / h[1]) != 0:
                return False
            continue
        Kh = (NumberField(h, "th") if K is QQ
              else K.extension(h, "th"))
        Rh = PolynomialRing(Kh, "xh")
        xh = Rh.gen()
        num = Rh([Kh(c) for c in R(G.numerator()).list()])
        den = Rh([Kh(c) for c in R(G.denominator()).list()])
        if res_at(num / den, xh, Kh.gen()) != 0:
            return False
    return True


section("init")

# ===========================================================================
# A. §14, Application of Alexander-Pontryagin duality (pp. 94-98)
# ===========================================================================

# A1. Example 3 (exm:hyperbola-cycles), p. 98.  C^2 is oriented by
# (u, v, x, y), w = u + iv, z = x + iy.  c is oriented by (x, u), gamma by
# (t, tau).  At the point (w, z) = (2, 2) (t = tau = 0) the tangent vectors
# of c are d/dx -> (0, 0, 1, 0), d/du -> (1, 0, 0, 0); of gamma
# d/dt -> (0, 2, 0, 0), d/dtau -> (0, 0, 0, 2).
Jc = matrix(QQ, [[0, 1, 0, 0], [0, 0, 2, 0], [1, 0, 0, 0], [0, 0, 0, 2]])
check(sign(Jc.det()) == 1, "A1 chi(c, gamma) = +1 at (2, 2)")
# boundary orientation of c = {x u >= 1}: outward normal n = (-1, -1) at
# (x, u) = (1, 1); the tangent T with det(n, T) > 0 is (1, -1): x increases
# along partial c, which is sigma parametrized by x.
nrm, tng = vector(QQ, [-1, -1]), vector(QQ, [1, -1])
check(matrix(QQ, [nrm, tng]).transpose().det() > 0, "A1 partial c = sigma")
# |gamma| meets |c| only at (2, 2): on c, w = u > 0 and z = x > 0 are real,
# on gamma |w| = |z| = 2; and x u = 4 >= 1.
check(2 * 2 >= 1, "A1 (2, 2) in c")
# alternative: chi(sigma, b), b = {w = r e^(it), z = 2 e^(i tau)}; sigma
# meets |b| where z = 2, w = 1/2 (r = 1/2 <= 2); tangent of sigma
# d/dx (u = 1/x) = (-1/4, 0, 1, 0); of b: d/dr = (1, 0, 0, 0),
# d/dt = (0, 1/2, 0, 0), d/dtau = (0, 0, 0, 2); (-1)^r = 1 for r = 2.
Jb = matrix(QQ, [[-QQ(1) / 4, 1, 0, 0], [0, 0, QQ(1) / 2, 0],
                 [1, 0, 0, 0], [0, 0, 0, 2]])
check(sign(Jb.det()) == 1, "A1 chi(sigma, b) = +1")
# linking coefficient property 3) of 1°: v(s, g) = (-1)^r chi(s, b) and
# chi(s_(r-1), b_(q+1)) = (-1)^((r-1)(q+1)) chi(b, s) give the printed sign
# (-1)^((r-1) q - 1)
for r in range(0, 9):
    for q in range(0, 9):
        check((-1) ** (r + (r - 1) * (q + 1)) == (-1) ** ((r - 1) * q - 1),
              "A1 linking symmetry r=%d q=%d" % (r, q))

# A2. The residue R of Example 3 (p. 98): for an entire f the inner
# integral over |w| = 2 of f/(w z - 1) has the single pole w = 1/z inside
# (|1/z| = 1/2), residue f(1/z, z)/z; the outer residue is the constant
# term of f(1/z, z) = sum_k c_kk.  Check against the printed
# sum_k (k!)^(-2) d^(2k) f(0, 0)/dw^k dz^k for the generic f of degree
# <= 6 in each variable, and against the termwise series
# (2 pi i)^(-2) int f/(wz)^(k+1) = c_kk.
DEG = 6
cnames = ["c%d_%d" % (a, b) for a in range(DEG + 1) for b in range(DEG + 1)]
Cr = PolynomialRing(QQ, cnames)
cc = dict(zip([(a, b) for a in range(DEG + 1) for b in range(DEG + 1)],
              Cr.gens()))
Rwz = PolynomialRing(Cr, "w,z")
w, z = Rwz.gens()
fgen = sum(cc[(a, b)] * w ** a * z ** b for (a, b) in cc)
# z^DEG f(1/z, z) is a polynomial; its coefficient of z^DEG is sum c_kk
fz = sum(cc[(a, b)] * z ** (b - a + DEG) for (a, b) in cc)
const_term = sum(cc[(a, b)] for (a, b) in cc if a == b)
printed_R = sum(fgen.derivative(w, k).derivative(z, k).subs({w: 0, z: 0})
                / factorial(k) ** 2 for k in range(DEG + 1))
check(Rwz(printed_R) == Rwz(const_term), "A2 R = sum (k!)^-2 d^2k f")
check(iterated_res(Rwz.fraction_field()(fz) / z ** (DEG + 1), [z])
      == const_term, "A2 outer residue of f(1/z, z)/z")
for k in range(DEG + 1):
    G = Rwz.fraction_field()(fgen) / (w * z) ** (k + 1)
    check(iterated_res(G, [w, z]) == cc[(k, k)], "A2 term k=%d" % k)

# A3. Example 1 (p. 97): t -> (t^m, t^k) is injective iff gcd(k, m) = 1:
# its fibre over (1, 1) is the set of common roots of t^m - 1, t^k - 1,
# i.e. the roots of their gcd t^d - 1, d = gcd(k, m).
Rt = PolynomialRing(QQ, "t")
tt = Rt.gen()
for k in range(1, 9):
    for m in range(1, 9):
        g = gcd(tt ** m - 1, tt ** k - 1)
        check(g.degree() == gcd(k, m), "A3 fibre k=%d m=%d" % (k, m))
        if gcd(k, m) > 1:
            # w^k - z^m splits: with d = gcd, it is the product of the
            # w^(k/d) - zeta z^(m/d), zeta^d = 1 (two components at least)
            d = gcd(k, m)
            Kd = CyclotomicField(d)
            R2 = PolynomialRing(Kd, "W,Z")
            W, Z = R2.gens()
            prodd = prod(W ** (k // d) - Kd.gen() ** j * Z ** (m // d)
                         for j in range(d))
            check(prodd == W ** k - Z ** m, "A3 split k=%d m=%d" % (k, m))

# A4. Example 2 (p. 97).  Parallel hyperplanes sum a_k z_k + b_j = 0:
# the Betti number b_n of the complement (Orlik-Solomon, Sage) is 0 for
# n >= 2 but N for n = 1, where the integral over |z + b_1| = 1 of
# dz/(z + b_1) is 2 pi i != 0 (residue 1); the example needs n >= 2
# (iii-97-example-2-dimension).
for n in range(1, 4):
    H = HyperplaneArrangements(QQ, tuple("x%d" % i for i in range(n)))
    xs = H.gens()
    for N in range(1, 4):
        lin = sum((i + 1) * xs[i] for i in range(n))
        A = H([lin + j for j in range(N)])
        bn = A.poincare_polynomial().coefficients(sparse=False)
        bn = bn[n] if len(bn) > n else 0
        if n == 1:
            check(bn == N, "A4 n=1 N=%d: b_1 = N" % N)
            refuted(bn == 0, "A4 Example 2 for n = 1, N=%d" % N)
        else:
            check(bn == 0, "A4 n=%d N=%d: b_n = 0" % (n, N))
Rz1 = PolynomialRing(QQ, "z1,z2")
check(res0(1 / Rz1.fraction_field()(Rz1.gen(0)), Rz1.gen(0)) == 1,
      "A4 residue of dz/z")
section("A")

# ===========================================================================
# B. §15, Application of de Rham duality (pp. 98-101), Example 15.8
# ===========================================================================

# B1. p. 101: for alpha_j != -1,
#   c z^alpha dz = (-1)^(j-1) c (alpha_j + 1)^(-1)
#                  d(z_1^alpha_1 ... z_j^(alpha_j+1) ... z_n^alpha_n dz_[j])
# (iii-101-laurent-sign); dz_[j] omits dz_j without a sign.  All
# alpha in {-2, ..., 1}^n, all j, n <= 4; the printed reading without
# (-1)^(j-1) fails for every even j.
for n in range(1, 5):
    Rn = PolynomialRing(QQ, n, "z")
    zs = Rn.gens()
    Fn = Rn.fraction_field()
    for alpha in itertools.product(range(-2, 2), repeat=n):
        mono = prod(Fn(zs[i]) ** alpha[i] for i in range(n))
        for j in range(n):
            if alpha[j] == -1:
                continue
            prim = fscale(mono * zs[j], dz_omit(n, [j]))
            lhs = fscale(mono, dz_all(n))
            rhs = fscale((-1) ** j / QQ(alpha[j] + 1), dform(prim, zs))
            check(feq(lhs, rhs), "B1 n=%d alpha=%s j=%d" % (n, alpha, j + 1))
            if j % 2 == 1:
                refuted(feq(lhs, fscale(1 / QQ(alpha[j] + 1),
                                        dform(prim, zs))),
                        "B1 printed sign n=%d alpha=%s j=%d"
                        % (n, alpha, j + 1))
        # (2 pi i)^(-n) int over gamma_0 of z^alpha dz = [alpha = -I]
        check(iterated_res(mono, zs) == (1 if all(a == -1 for a in alpha)
                                         else 0),
              "B1 period n=%d alpha=%s" % (n, alpha))
section("B")

# ===========================================================================
# C. §16, The Leray theory of residues (pp. 101-113)
# ===========================================================================

# C1. Example 1 (exm:simple-pole-residue), p. 104: with
# psi = (-1)^(j-1) (f/s'_(z_j)) dz_[j], ds ^ psi = f dz, so
# (f/s) dz = ds/s ^ psi exactly (theta = 0 in (16.6)).  s is the generic
# polynomial of degree <= 2 (symbolic coefficients), f an independent
# indeterminate (no derivative of f occurs), n <= 4, all j.
for n in range(1, 5):
    mons = [m for m in itertools.product(range(3), repeat=n) if sum(m) <= 2]
    names = ["a%d" % i for i in range(len(mons))] + ["f"]
    Rn = PolynomialRing(QQ, names + ["z%d" % i for i in range(n)])
    gens = Rn.gens()
    acoef, ff, zs = gens[:len(mons)], gens[len(mons)], gens[len(mons) + 1:]
    s = sum(acoef[i] * prod(zs[k] ** mons[i][k] for k in range(n))
            for i in range(len(mons)))
    Fn = Rn.fraction_field()
    ds = dform(fun(Fn(s)), zs)
    for j in range(n):
        psi = fscale((-1) ** j * ff / Fn(s.derivative(zs[j])),
                     dz_omit(n, [j]))
        check(feq(wedge(ds, psi), fscale(ff, dz_all(n))),
              "C1 ds ^ psi = f dz n=%d j=%d" % (n, j + 1))
        check(feq(wedge(fscale(1 / Fn(s), ds), psi),
                  fscale(ff / Fn(s), dz_all(n))),
              "C1 (f/s) dz = ds/s ^ psi n=%d j=%d" % (n, j + 1))


# C2. The factor 2 pi i in the proof of Theorem 16.5 (p. 108) in a model.
# X = C x C^*, S = {z_1 = 0}, phi = dz_1 ^ dz_2/(z_1 z_2) (closed, first
# order pole on S), gamma_1 = {z_1 = 0, |z_2| = 1}; T stands for 2 pi i
# (an indeterminate).  Integrals over the torus delta gamma_1 (fibre
# first, as delta in 2°) are T^2 times the iterated residue; on S,
# int_(gamma_1) c dz_2/z_2 = T c.
def res_coord(phi, k, zs):
    """res along {z_k = 0} of a form with a first-order pole there:
    phi = dz_k/z_k ^ psi + theta, psi free of dz_k; returns psi|_(z_k=0)."""
    out = {}
    for I, c in phi.items():
        if k not in I:
            continue
        rest = tuple(i for i in I if i != k)
        sgn = perm_sign((k,) + rest)
        val = (zs[k] * c)
        val = val.numerator().subs({zs[k]: 0}) / val.denominator().subs(
            {zs[k]: 0})
        out[rest] = out.get(rest, 0) + sgn * val
    return fclean(out)


RT = PolynomialRing(QQ, "T,z1,z2")
TT, z1, z2 = RT.gens()
FT = RT.fraction_field()
phi = fscale(1 / FT(z1 * z2), dz_all(2))
torus = TT ** 2 * iterated_res(phi[(0, 1)], [z1, z2])
check(torus == TT ** 2, "C2 int over delta gamma_1 of phi = (2 pi i)^2")
res_phi = res_coord(phi, 0, [z1, z2])          # = dz_2/z_2 on S
check(res_phi == {(1,): 1 / FT(z2)}, "C2 res phi = dz_2/z_2")
check(TT * (TT * res0(res_phi[(1,)], z2)) == torus,
      "C2 Leray formula (16.8) in the model")
# printed: {chi} = delta^*{phi}, i.e. int_(gamma_1) chi = int phi = T^2,
# chi = c dz_2/z_2 with T c = T^2; res phi_1 = chi and Theorem 16.4 give
# int_(delta gamma_1) phi_1 = T (T c) = T^3 != T^2 = int phi.
c_printed = torus / TT
refuted(TT * (TT * c_printed) == torus,
        "C2 printed {chi} = delta^*{phi}: int phi = int phi_1")
# corrected: {chi} = (2 pi i)^(-1) delta^*{phi}: T c = T^2/T, c = 1, and
# int phi_1 = T (T c) = T^2 = int phi; res[phi_3] = chi = res phi.
c_corr = (torus / TT) / TT
check(TT * (TT * c_corr) == torus, "C2 corrected normalization")
check(c_corr == 1, "C2 corrected chi = res phi")
# Theorem 16.8: int_(delta h) {phi} = 2 pi i int_h Res[phi] holds with
# Res = res[phi_3] = chi only for the corrected normalization
check(TT * (TT * c_corr) == torus, "C2 Theorem 16.8 corrected")
refuted(TT * (TT * c_printed) == torus, "C2 Theorem 16.8 printed")

# C3. Example 3 of 5° (exm:coordinate-hyperplanes), p. 113:
# X = {|z| > 1}, gamma = {|z_j| = 2}.  gamma bounds the solid torus
# {|z_j| <= 2, |z_k| = 2 (k != j)}, which lies in X (|z|^2 >= 4(n-1) > 1)
# and avoids S_k, k != j; S_1 cap ... cap S_n = {0} does not meet X; and
# (2 pi i)^(-n) int_gamma dz/(z_1 ... z_n) = 1 != 0.
for n in range(2, 6):
    check(4 * (n - 1) > 1, "C3 solid torus in X n=%d" % n)
    check(not (0 > 1), "C3 origin not in X")
    Rn = PolynomialRing(QQ, n, "z")
    check(iterated_res(1 / Rn.fraction_field()(prod(Rn.gens())),
                       Rn.gens()) == 1, "C3 gamma not ~ 0 n=%d" % n)


# C4. Example 4 (exm:linear-functions), pp. 112-113: hyperplanes in general
# position.  "phi_(i_1), ..., phi_(i_n) linearly independent" has to be
# read for the linear parts (the gradients, as in 1°): n affine functions
# with independent gradients meet in one point, a parallel pair is
# independent as functions but does not meet.  Checked: the number of such
# n-subsets is the Betti number b_n (Sage, Orlik-Solomon), and
# int_(gamma_I) omega_J = delta_IJ (iterated residues at the point p_I in
# the coordinates u = phi_I; on the torus |u_k| = eps every phi_j, j not
# in I, is bounded away from 0 because p_I is not on S_j).
def check_general_position(n, rows, label):
    names = ["x%d" % i for i in range(n)]
    H = HyperplaneArrangements(QQ, tuple(names))
    hs = H.gens()
    funcs = [sum(r[k + 1] * hs[k] for k in range(n)) + r[0] for r in rows]
    A = H(funcs)
    pp = A.poincare_polynomial().coefficients(sparse=False)
    bn = pp[n] if len(pp) > n else 0
    m = len(rows)
    # general position: k functions with a common zero have independent
    # gradients, k <= n + 1
    for k in range(2, min(m, n + 1) + 1):
        for sub in itertools.combinations(range(m), k):
            Mx = matrix(QQ, [rows[i] for i in sub])
            meet = Mx.rank() == Mx.matrix_from_columns(
                range(1, n + 1)).rank()
            if meet:
                check(Mx.matrix_from_columns(range(1, n + 1)).rank() == k,
                      "%s general position %s" % (label, sub))
    basis = [I for I in itertools.combinations(range(m), n)
             if matrix(QQ, [rows[i][1:] for i in I]).rank() == n]
    check(len(basis) == bn, "%s count = b_n" % label)
    Ru = PolynomialRing(QQ, n, "u")
    us = Ru.gens()
    Fu = Ru.fraction_field()
    for I in basis:
        Mi = matrix(QQ, [rows[i][1:] for i in I])
        bi = vector(QQ, [rows[i][0] for i in I])
        # z = Mi^(-1) (u - bi)
        zu = Mi.inverse() * (vector(Ru, us) - bi)
        for J in basis:
            Mj = matrix(QQ, [rows[j][1:] for j in J])
            jac = (Mj * Mi.inverse()).det()   # d phi_J = jac du
            den = prod(rows[j][0] + sum(rows[j][k + 1] * zu[k]
                                        for k in range(n)) for j in J)
            val = iterated_res(jac / Fu(den), us)
            check(val == (1 if I == J else 0),
                  "%s int gamma_%s omega_%s" % (label, I, J))
    return basis


# rows (b_j, a_j1, ..., a_jn) of phi_j = sum a_jk z_k + b_j
check_general_position(2, [(0, 1, 0), (-1, 1, 0), (0, 0, 1), (-3, 1, 1),
                           (5, 1, -1)], "C4 n=2")
check_general_position(3, [(0, 1, 0, 0), (-1, 1, 0, 0), (0, 0, 1, 0),
                           (0, 0, 0, 1), (-7, 1, 2, 3), (3, 1, -1, 1)],
                       "C4 n=3")


# C5. Composite residues (5°, p. 111): for
# phi = ds_1 ^ ... ^ ds_m ^ omega/(s_1 ... s_m), res^m[phi] = omega|_S, and
# exchanging the order of S_1, S_2 changes the sign.  Model: s = z_1, z_2
# in C^3, omega = g dz_3 with g generic.
Rg = PolynomialRing(QQ, "g0,g1,g2,g3,z1,z2,z3")
g0, g1, g2, g3, y1, y2, y3 = Rg.gens()
Fg = Rg.fraction_field()
gg = g0 + g1 * y1 + g2 * y2 + g3 * y3
phi3 = fscale(gg / Fg(y1 * y2), dz_all(3))
r12 = res_coord(res_coord(phi3, 0, [y1, y2, y3]), 1, [y1, y2, y3])
r21 = res_coord(res_coord(phi3, 1, [y1, y2, y3]), 0, [y1, y2, y3])
check(r12 == {(2,): g0 + g3 * y3}, "C5 res^2 = omega|_S")
check(fscale(-1, r21) == r12, "C5 order of S_1, S_2: sign -1")
section("C")

# ===========================================================================
# D. §17, Cohomological reduction (pp. 113-120)
# ===========================================================================


# Jets.  The identities D1 and D3 are pointwise: at a point they involve
# the values and first derivatives of s_j (Q_j) and of the coefficients of
# omega (P); second derivatives of s_j enter only through d(ds_j) = 0.
# Checking them as identities of rational forms for GENERIC AFFINE s_j and
# GENERIC AFFINE coefficients (independent symbolic coefficients) therefore
# proves them for all holomorphic data in that dimension.
#
# D1. The identity in the proof of Theorem 17.2 (p. 116):
#   ds_1^...^ds_m^omega / (s_1^(r_1+1) ... s_j^(r_j+2) ... s_m^(r_m+1))
#   = (-1)^j/(r_j+1) d(ds_1^..[j]..^ds_m^omega / D)
#     + (-1)^(m-j)/(r_j+1) ds_1^..[j]..^ds_m^d omega / D,
# D = s_1^(r_1+1) ... s_j^(r_j+1) ... s_m^(r_m+1) (iii-116-identity-
# denominator-index: s_j, not s_i), and for any forms omega_k,
#   ds_1^..[j]..^ds_m ^ (sum_k ds_k ^ omega_k) = (-1)^(m-j) ds ^ omega_j,
# which gives the last line ("approx").  (n, m) = (2, 1), (2, 2), (3, 1),
# (3, 2), (3, 3); r_k in {0, 1}, r_j in {0, 1, 2}.
def gs_case(n, m):
    mons2 = [e for e in itertools.product(range(2), repeat=n) if sum(e) <= 1]
    mons1 = [e for e in itertools.product(range(2), repeat=n) if sum(e) <= 1]
    deg_om = n - m
    om_keys = list(itertools.combinations(range(n), deg_om))
    names = (["a%d_%d" % (j, i) for j in range(m) for i in range(len(mons2))]
             + ["b%d_%d" % (k, i) for k in range(len(om_keys))
                for i in range(len(mons1))]
             + ["z%d" % i for i in range(n)])
    R = PolynomialRing(QQ, names)
    gens = R.gens()
    zs = gens[-n:]
    FR = R.fraction_field()

    def mono(e):
        return prod(zs[k] ** e[k] for k in range(n))
    pos = 0
    ss = []
    for j in range(m):
        ss.append(sum(gens[pos + i] * mono(mons2[i])
                      for i in range(len(mons2))))
        pos += len(mons2)
    om = {}
    for K in om_keys:
        om[K] = FR(sum(gens[pos + i] * mono(mons1[i])
                       for i in range(len(mons1))))
        pos += len(mons1)
    om = fclean(om)
    dss = [dform(fun(FR(s)), zs) for s in ss]
    dom = dform(om, zs)
    for j in range(m):
        for r in itertools.product(range(2), repeat=m):
            for rj in range(3):
                rr = list(r)
                rr[j] = rj
                D = prod(FR(ss[i]) ** (rr[i] + 1) for i in range(m))
                lhs = fscale(1 / (D * ss[j]), wedge(*(dss + [om])))
                others = [dss[i] for i in range(m) if i != j]
                A = fscale(1 / D, wedge(*(others + [om])))
                rhs = fadd(fscale(QQ((-1) ** (j + 1)) / (rr[j] + 1),
                                  dform(A, zs)),
                           fscale(QQ((-1) ** (m - j - 1)) / ((rr[j] + 1) * D),
                                  wedge(*(others + [dom]))))
                check(feq(lhs, rhs), "D1 n=%d m=%d j=%d r=%s"
                      % (n, m, j + 1, rr))
                if m >= 2 and rr == [1] * m:
                    # printed: s_i in place of s_j, i = j+1 (mod m)
                    i = (j + 1) % m
                    Dp = D / ss[j] ** (rr[j] + 1) * ss[i] ** (rr[j] + 1)
                    Ap = fscale(1 / Dp, wedge(*(others + [om])))
                    rhsp = fadd(fscale(QQ((-1) ** (j + 1)) / (rr[j] + 1),
                                       dform(Ap, zs)),
                                fscale(QQ((-1) ** (m - j - 1))
                                       / ((rr[j] + 1) * Dp),
                                       wedge(*(others + [dom]))))
                    refuted(feq(lhs, rhsp), "D1 printed s_i n=%d m=%d j=%d"
                            % (n, m, j + 1))
    # ds[j] ^ sum_k ds_k ^ omega_k = (-1)^(m-j) ds ^ omega_j, generic
    # omega_k with symbolic constant coefficients
    Rk = PolynomialRing(FR, ["e%d_%d" % (k, i) for k in range(m)
                             for i in range(len(om_keys))])
    egs = Rk.gens()
    omk = []
    for k in range(m):
        omk.append(fclean({om_keys[i]: egs[k * len(om_keys) + i]
                           for i in range(len(om_keys))}))
    dssk = [{K: Rk(v) for K, v in d.items()} for d in dss]
    dom_k = fadd(*[wedge(dssk[k], omk[k]) for k in range(m)])
    for j in range(m):
        others = [dssk[i] for i in range(m) if i != j]
        check(feq(wedge(*(others + [dom_k])),
                  fscale((-1) ** (m - j - 1), wedge(*(dssk + [omk[j]])))),
              "D1 ds[j] ^ d omega n=%d m=%d j=%d" % (n, m, j + 1))


for (n, m) in [(2, 1), (2, 2), (3, 1), (3, 2), (3, 3)]:
    gs_case(n, m)
section("D1")

# D2. Example 1 after Theorem 17.2 (p. 116): for s_j = z_j, omega = f,
# omega_(p..q) = d^(r_1+...+r_n) f/dz^r and (17.6) says that
# Res[f dz/z^(r+1)] = f^((r))(0)/r! (iterated residue), f generic of
# degree <= 4, n = 2, 3, r in {0, 1, 2}^n.
for n in (2, 3):
    mons = [e for e in itertools.product(range(5), repeat=n) if sum(e) <= 4]
    R = PolynomialRing(QQ, ["c%d" % i for i in range(len(mons))]
                       + ["z%d" % i for i in range(n)])
    gens = R.gens()
    zs = gens[-n:]
    f = sum(gens[i] * prod(zs[k] ** mons[i][k] for k in range(n))
            for i in range(len(mons)))
    for r in itertools.product(range(3), repeat=n):
        der = f
        for k in range(n):
            der = der.derivative(zs[k], r[k])
        val = der.subs({zk: 0 for zk in zs}) / prod(factorial(x) for x in r)
        G = R.fraction_field()(f) / prod(zs[k] ** (r[k] + 1)
                                         for k in range(n))
        check(iterated_res(G, zs) == val, "D2 n=%d r=%s" % (n, r))


# D3. Theorem 17.4 (pp. 117-118).  (17.11): for every J = {j_1 < ... <
# j_m}, d(Q_1, ..., Q_m)/d(z_J) dz = (-1)^(eps[J]) dQ_1^...^dQ_m^dz[J],
# eps[J] the parity of (j_1, ..., j_m, complement); generic affine Q (jets),
# 1 <= m <= n <= 4.  (17.12): for r_j >= 2,
#   P dQ_1^..^dQ_m^dz[J]/Q^r - (-1)^(j-1) dP^dQ_1^..[j]..^dQ_m^dz[J]
#     /((r_j - 1) Q^r/Q_j)
#   = d( -(-1)^(j-1)/(r_j - 1) P dQ_1^..[j]..^dQ_m^dz[J] / (Q^r/Q_j) ),
# an exact form; generic affine Q_1, Q_2 and P (jets), n = 3, m = 2,
# r in {1, 2, 3}^2, all J and j.
for n in range(1, 5):
    for m in range(1, n + 1):
        mons = [e for e in itertools.product(range(2), repeat=n)
                if sum(e) <= 1]
        R = PolynomialRing(QQ, ["q%d_%d" % (j, i) for j in range(m)
                                for i in range(len(mons))]
                           + ["z%d" % i for i in range(n)])
        gens = R.gens()
        zs = gens[-n:]
        Qs = [sum(gens[j * len(mons) + i] * prod(zs[k] ** mons[i][k]
                                                 for k in range(n))
                  for i in range(len(mons))) for j in range(m)]
        dQ = [dform(fun(q), zs) for q in Qs]
        for J in itertools.combinations(range(n), m):
            jac = matrix(R, [[q.derivative(zs[k]) for k in J]
                             for q in Qs]).det()
            comp = tuple(k for k in range(n) if k not in J)
            eps = perm_sign(J + comp)
            check(feq(fscale(jac, dz_all(n)),
                      fscale(eps, wedge(*(dQ + [dz_omit(n, J)])))),
                  "D3 (17.11) n=%d m=%d J=%s" % (n, m, J))

R = PolynomialRing(QQ, ["p%d" % i for i in range(4)]
                   + ["q%d_%d" % (j, i) for j in range(2) for i in range(4)]
                   + ["z0", "z1", "z2"])
gens = R.gens()
zs = gens[-3:]
FR = R.fraction_field()
aff = [1, zs[0], zs[1], zs[2]]
PJ = sum(gens[i] * aff[i] for i in range(4))
Qs = [sum(gens[4 + 4 * j + i] * aff[i] for i in range(4)) for j in range(2)]
dQ = [dform(fun(FR(q)), zs) for q in Qs]
for J in itertools.combinations(range(3), 2):
    for r in itertools.product(range(1, 4), repeat=2):
        for j in range(2):
            if r[j] < 2:
                continue
            Dfull = prod(FR(Qs[i]) ** r[i] for i in range(2))
            Dj = Dfull / Qs[j]
            lhs = fscale(PJ / Dfull, wedge(*(dQ + [dz_omit(3, J)])))
            oth = [dQ[i] for i in range(2) if i != j]
            red = fscale(QQ((-1) ** j) / ((r[j] - 1) * Dj),
                         wedge(*([dform(fun(FR(PJ)), zs)] + oth
                                 + [dz_omit(3, J)])))
            prim = fscale(-QQ((-1) ** j) / (r[j] - 1) * PJ / Dj,
                          wedge(*(oth + [dz_omit(3, J)])))
            check(feq(fsub(lhs, red), dform(prim, zs)),
                  "D3 (17.12) J=%s r=%s j=%d" % (J, r, j + 1))
section("D3")

# D4. Example 2 after Theorem 17.5 (pp. 118-119): omega = dw^dz/w^3 (wz-1)
# (w^2+z^2-1)^2.  The decomposition with the squares
# (iii-118-example-2-exponents) holds, the printed one fails; the two
# Nullstellensatz identities and the Jacobians are exact.  The final
# omega* = dw^dz/4w(w^2+z^2-1) + (5z^3 - 6z^5) dw^dz/6(wz-1)(w^2+z^2-1)
# is cohomologous to omega: Delta = omega - omega* has zero periods on
# H_2(C^2 \ S).  H_2 is generated by tubes delta(l) over loops l on the
# three components S_1 = {w = 0}, S_2 = {wz = 1}, S_3 = {w^2 + z^2 = 1}
# punctured at the other components (Leray sequence; its rank is 8, see
# E2), and int over delta(l) of Delta = 2 pi i int_l rho_j, rho_j the
# fibre residue in coordinates (u, t) with S_j = {u = 0}:
#   S_1: (u, t) = (w, z);  S_2: u = wz - 1, t = z, w = (u + 1)/z;
#   S_3: a = w + iz, b = w - iz = (u + 1)/a, u = w^2 + z^2 - 1, t = a.
# All residues of rho_1, rho_2, rho_3 at all their poles vanish (each S_j is
# a punctured sphere, so the small loops generate its H_1).
Rwz = PolynomialRing(QQ, "w,z")
w, z = Rwz.gens()
Fwz = Rwz.fraction_field()
Qc = w ** 2 + z ** 2 - 1
om17 = 1 / Fwz(w ** 3 * (w * z - 1) * Qc ** 2)
dec = (z ** 3 / Fwz((w * z - 1) * Qc ** 2) - 1 / Fwz(w ** 3 * Qc ** 2)
       - z / Fwz(w ** 2 * Qc ** 2) - z ** 2 / Fwz(w * Qc ** 2))
check(om17 == dec, "D4 decomposition with squares")
dec_printed = (z ** 3 / Fwz((w * z - 1) * Qc) - 1 / Fwz(w ** 3 * Qc ** 2)
               - z / Fwz(w ** 2 * Qc ** 2) - z ** 2 / Fwz(w * Qc))
refuted(om17 == dec_printed, "D4 printed decomposition")
check(om17 - dec_printed == -z ** 2 * (w ** 2 + z ** 2 - 2)
      / Fwz(w * (w * z - 1) * Qc ** 2), "D4 printed defect")
check(w * w - 1 * Qc + z / 2 * (2 * z) == 1, "D4 identity 1")
check(-QQ(4) / 3 * (1 + w * z) * (w * z - 1) + QQ(1) / 3
      * (w ** 2 + z ** 2 + 1) * Qc + QQ(1) / 6 * (w ** 2 - z ** 2)
      * (2 * z ** 2 - 2 * w ** 2) == 1, "D4 identity 2")
check(matrix(Rwz, [[1, 0], [Qc.derivative(w), Qc.derivative(z)]]).det()
      == 2 * z, "D4 Jacobian 2z")
check(matrix(Rwz, [[z, w], [Qc.derivative(w), Qc.derivative(z)]]).det()
      == 2 * z ** 2 - 2 * w ** 2, "D4 Jacobian 2z^2 - 2w^2")
omstar = (1 / Fwz(4 * w * Qc)
          + (5 * z ** 3 - 6 * z ** 5) / Fwz(6 * (w * z - 1) * Qc))
Delta = om17 - omstar


def to_uni(G, var, Runi):
    """A rational function of the multivariate ring that depends on var
    only, as an element of Frac(Runi)."""
    K = Runi.base_ring()

    def conv(p):
        cs = []
        for c in p.polynomial(var).list():
            c0 = c.constant_coefficient()
            assert c == c0
            cs.append(K(c0))
        return Runi(cs)
    return conv(G.numerator()) / conv(G.denominator())


def tube_residues_vanish(coef):
    """coef: the coefficient of dw^dz of a rational 2-form on C^2 minus
    w (wz - 1)(w^2 + z^2 - 1) = 0; True iff all fibre residues rho_j of
    the three components have zero residues at all their poles."""
    ok = True
    # S_1
    rho1 = res0(coef, w)
    Rz = PolynomialRing(QQ, "zz")
    rho1z = to_uni(rho1, z, Rz)
    ok = ok and all_residues_zero(rho1z, Rz.gen())
    # S_2: w = (u + 1)/z, dw ^ dz = du ^ dz / z
    Ruz = PolynomialRing(QQ, "u,t")
    u, t = Ruz.gens()
    Fut = Ruz.fraction_field()
    sub2 = coef.numerator()((u + 1) / Fut(t), Fut(t)) / coef.denominator()(
        (u + 1) / Fut(t), Fut(t)) / t
    rho2 = res0(sub2, u)
    rho2t = to_uni(rho2, t, Rz)
    ok = ok and all_residues_zero(rho2t, Rz.gen())
    # S_3 over Q(i): w = (a + b)/2, z = (a - b)/(2i), b = (u + 1)/a
    Ki = QuadraticField(-1, "I")
    Ii = Ki.gen()
    Rua = PolynomialRing(Ki, "u,a")
    uu, aa = Rua.gens()
    Fua = Rua.fraction_field()
    bb = (uu + 1) / Fua(aa)
    ww = (aa + bb) / 2
    zz = (aa - bb) / (2 * Ii)
    jac = (ww.derivative(uu) * zz.derivative(aa)
           - ww.derivative(aa) * zz.derivative(uu))
    num = coef.numerator().change_ring(Ki)
    den = coef.denominator().change_ring(Ki)
    sub3 = num(ww, zz) / den(ww, zz) * jac
    rho3 = res0(sub3, uu)
    Ra = PolynomialRing(Ki, "aa")
    rho3a = to_uni(rho3, aa, Ra)
    ok = ok and all_residues_zero(rho3a, Ra.gen())
    return ok


check(tube_residues_vanish(Delta), "D4 omega ~ omega* (all periods 0)")
# sensitivity: a wrong constant (1/2 instead of 1/4) is detected
refuted(tube_residues_vanish(om17 - (1 / Fwz(2 * w * Qc) + (5 * z ** 3 - 6
                                    * z ** 5) / Fwz(6 * (w * z - 1) * Qc))),
        "D4 perturbed omega*")
section("D4")

# D5. Theorem 17.7 (Griffiths), p. 120: k <= n - E(n/q).  For a smooth
# hypersurface of degree q in CP^n the classes of pole order k occur iff
# the Jacobian ring R has R_(kq-n-1) != 0 (Griffiths; Huybrechts 2023,
# Ch. 1, Lemma 4.23 and Theorem 4.21), R_i != 0 exactly for
# 0 <= i <= (n+1)(q-2) (Proposition 4.3, Hilbert series
# ((1 - t^(q-1))/(1 - t))^(n+1)).  The largest such k equals the printed
# n - E(n/q) for the Fermat hypersurfaces, n <= 9, 2 <= q <= 9.
Rt = PowerSeriesRing(QQ, "t", default_prec=200)
tt = Rt.gen()
for n in range(1, 10):
    for q in range(2, 10):
        hs = ((1 - tt ** (q - 1)) / (1 - tt)) ** (n + 1)
        co = hs.list()
        ks = [k for k in range(1, n + 3) if 0 <= k * q - n - 1 < len(co)
              and co[k * q - n - 1] != 0]
        kmax = max(ks) if ks else 0
        bound = n - floor(QQ(n) / q)
        check(floor(QQ((n + 1) * (q - 1)) / q) == bound,
              "D5 floor identity n=%d q=%d" % (n, q))
        # the printed bound is the sharp one, unless H^n of the complement
        # vanishes (no admissible k at all, e.g. the conic, n = q = 2)
        check(kmax == bound or not ks, "D5 n=%d q=%d" % (n, q))
section("D5")

# ===========================================================================
# E. §18, Residues of rational functions of two variables (pp. 119-129)
# ===========================================================================
KF = FunctionField(QQ, "zz")
zzF = KF.gen()
RwF = PolynomialRing(KF, "ww")
wwF = RwF.gen()


def curve_field(Qpoly):
    """Function field of the irreducible curve Qpoly(w, z) = 0 over
    Q(z) (Qpoly in Rwz)."""
    coeffs = Qpoly.polynomial(w).list()
    pol = sum(KF(c.polynomial(z).change_ring(QQ)(zzF) if c != 0 else 0)
              * wwF ** i for i, c in enumerate(coeffs))
    if pol.degree() == 1:
        return KF, -pol[0] / pol[1], 1
    L = KF.extension(pol, "W")
    return L, L.gen(), pol.degree()


def genus_and_infinity(Qpoly):
    """(genus, number of points at infinity) of the curve: the points at
    infinity of the affine curve are the places where z or w has a pole,
    counted over Qbar (degrees of the places)."""
    L, W, nn = curve_field(Qpoly)
    g = L.genus()
    D = L(zzF).divisor_of_poles()
    if L(W) not in QQ:
        D = D + L(W).divisor_of_poles()
    return g, sum(p.degree() for p in D.support()), L, nn


# E1. Theorem 18.1 (Riemann), p. 121: rho = omega/2 - n + 1 with omega the
# ramification index sum (k_j - 1) over all points of the n-sheeted
# surface; in characteristic 0 omega is the degree of the different of
# the function field over Q(z).  Checked against Sage's genus for 8 curves
# (genus 0 to 3).  The algebra (18.3)-(18.5) is formalised in Lean
# (riemann_genus_count).
for Qpoly in [w ** 2 - z ** 3 + z, w ** 2 - z ** 5 + 1, w ** 3 + z ** 3 - 1,
              w ** 3 - z ** 4 - 1, w ** 2 - z ** 3, w ** 2 - z ** 3 - z ** 4,
              w * z - 1, w ** 4 + w * z + z ** 3 + 1]:
    L, W, nn = curve_field(Qpoly)
    if nn == 1:
        check(True, "E1 rational")
        continue
    check(L.genus() == L.different().degree() / 2 - nn + 1,
          "E1 Riemann %s" % Qpoly)

# E2. Theorem 18.2, p = sum 2 rho_j + sum (q_i - 1) + l - m (18.6), and
# Proposition 18.3, p = (N - 1) n - sum r_j + m (18.7).  (18.7) is computed
# from the discriminant (Sage, exact, conjugate roots handled in stem
# fields); for (18.6) the genera rho_j and the numbers l_j of points at
# infinity are computed from the function fields, the branch numbers q_i
# at the self-intersection points are given (by hand, listed below).  For
# line arrangements also the Orlik-Solomon Betti number b_2 (Sage).
def p_discriminant(factors):
    Qs = prod(factors)
    nn = Qs.degree(w)
    Dz = Qs.resultant(Qs.derivative(w), w)
    Rz1 = PolynomialRing(QQ, "zz1")

    def zcoeffs(c):
        c = Rwz(c)
        assert c.degree(w) <= 0
        return [QQ(c.coefficient({z: e}).constant_coefficient())
                for e in range(c.degree(z) + 1)] if c != 0 else [QQ(0)]
    Dz1 = Rz1(zcoeffs(Dz))
    N = 0
    rsum = 0
    for h, _ in Dz1.factor():
        N += h.degree()
        Kh = NumberField(h, "th") if h.degree() > 1 else QQ
        th = Kh.gen() if h.degree() > 1 else -h[0] / h[1]
        Rw1 = PolynomialRing(Kh, "w1")
        fib = Rw1([sum(Kh(cc) * th ** e for e, cc in enumerate(zcoeffs(
            Qs.coefficient({w: i})))) for i in range(nn + 1)])
        rad = Rw1(prod(f for f, _ in fib.factor()))
        rsum += h.degree() * rad.degree()
    return (N - 1) * nn - rsum + len(factors)


def p_genus(factors, qlist):
    data = [genus_and_infinity(Qj) for Qj in factors]
    rho = [d[0] for d in data]
    l = sum(d[1] for d in data)
    return 2 * sum(rho) + sum(q - 1 for q in qlist) + l - len(factors), rho, l


E2_CASES = [
    # (label, components, branch numbers q_i, p)
    ("Example of §18", [w, w ** 2 - z ** 3, w ** 2 - z ** 3 - z ** 4],
     [3, 2], 4),
    ("Example 2 of §17", [w, w * z - 1, w ** 2 + z ** 2 - 1], [2] * 6, 8),
    ("hyperbola (Example 3 of §14)", [w * z - 1], [], 1),
    ("cusp w^2 = z^3 (Example 1 of §14)", [w ** 2 - z ** 3], [], 0),
    ("w^2 = z^4, two parabolas", [w - z ** 2, w + z ** 2], [2], 1),
    ("elliptic", [w ** 2 - z ** 3 + z], [], 2),
    ("nodal cubic", [w ** 2 - z ** 2 * (z + 1)], [2], 1),
    ("genus 2", [w ** 2 - z ** 5 + 1], [], 4),
    ("three lines", [w, w - z, w + z - 1], [2, 2, 2], 3),
    ("lines with a parallel pair", [w, w - 1, w - z], [2, 2], 2),
    ("three concurrent lines", [w, w - z, w + z], [3], 2),
]
for label, comps, qlist, pval in E2_CASES:
    pg, rho, l = p_genus(comps, qlist)
    pd = p_discriminant(comps)
    check(pg == pval, "E2 (18.6) %s" % label)
    check(pd == pval, "E2 (18.7) %s" % label)
    if all(c.degree() == 1 for c in comps):
        H = HyperplaneArrangements(QQ, ("x", "y"))
        hx, hy = H.gens()
        A = H([c.monomial_coefficient(w) * hx + c.monomial_coefficient(z) * hy
               + c.constant_coefficient() for c in comps])
        check(A.poincare_polynomial()[2] == pval, "E2 Orlik-Solomon %s"
              % label)
# the data of the Example of §18 (p. 127): genera 0, l = 1 + 1 + 2;
# the singular points of T are exactly (w, z) = (0, 0) and (0, -1)
Qex = w * (w ** 2 - z ** 3) * (w ** 2 - z ** 3 - z ** 4)
check([genus_and_infinity(c)[:2] for c in
       [w, w ** 2 - z ** 3, w ** 2 - z ** 3 - z ** 4]]
      == [(0, 1), (0, 1), (0, 2)], "E2 Example genera and l_j")
Ising = Rwz.ideal([Qex, Qex.derivative(w), Qex.derivative(z)])
check(sorted(Ising.radical().primary_decomposition(), key=str)
      == sorted([Rwz.ideal([w, z]), Rwz.ideal([w, z + 1])], key=str),
      "E2 Example singular points (0,0), (0,-1)")
# Example 2 of §17: six transversal double points (S_1 cap S_3: z = +-1;
# S_2 cap S_3: z^4 - z^2 + 1 = 0), S_1 cap S_2 empty
check(Rwz.ideal([w, w * z - 1]) == Rwz.ideal([1]), "E2 S_1 cap S_2 empty")
check(Rwz.ideal([w * z - 1, w ** 2 + z ** 2 - 1]).vector_space_dimension()
      == 4, "E2 S_2 cap S_3: 4 points")
check(Rwz.ideal([w * z - 1, w ** 2 + z ** 2 - 1, (2 * z ** 2 - 2 * w ** 2)])
      == Rwz.ideal([1]), "E2 S_2, S_3 transversal")
section("E2")

# E3. 5°, pp. 125-126: in the coordinates zeta = z, omega = Q_s(w, z),
# dw ^ dz = d omega ^ d zeta/(dQ_s/dw), so
#   Res[P/Q dw ^ dz] = Res[F/omega^(r_s) d omega ^ d zeta]
#     = 1/(r_s - 1)! d^(r_s - 1) F/d omega^(r_s - 1)|_(omega = 0) d zeta,
# F = P Q_s^(r_s)/(Q dQ_s/dw) (iii-126-jacobian).  The residue class is
# rho(z) dz with rho the fibre residue of P/Q at the root w(z) of Q_s
# (Leray's formula (16.8) for the tube over a curve on S, fibre first).
# Model: Q_s = wz - 1 (dQ_s/dw = z), Q = (wz - 1)^2 (w - 2), r_s = 2,
# P generic of degree <= 3; and Q = Q_s = 2w, P = 1 (r_s = 1).
mons = [(a, b) for a in range(4) for b in range(4) if a + b <= 3]
Rp = PolynomialRing(QQ, ["p%d" % i for i in range(len(mons))]
                    + ["w", "z", "om"])
pg_ = Rp.gens()
pw, pz, pom = pg_[-3], pg_[-2], pg_[-1]
Fp = Rp.fraction_field()
Pgen = sum(pg_[i] * pw ** a * pz ** b for i, (a, b) in enumerate(mons))
Qs_ = pw * pz - 1
Qfull = Qs_ ** 2 * (pw - 2)
rho_fibre = res_at(Fp(Pgen) / Qfull, pw, 1 / Fp(pz))
w_of = (pom + 1) / Fp(pz)


def in_omega_coords(G):
    return Fp(G.numerator().subs({pw: w_of})) / Fp(
        G.denominator().subs({pw: w_of}))


F_corr = in_omega_coords(Fp(Pgen) * Qs_ ** 2 / (Qfull * Qs_.derivative(pw)))
F_print = in_omega_coords(Fp(Pgen) * Qs_ ** 2 / Qfull)


def taylor_coeff(G, var, k):
    num, den = G.numerator(), G.denominator()
    D = G
    for _ in range(k):
        D = D.derivative(var)
    return Fp(D.numerator().subs({var: 0})) / Fp(D.denominator().subs(
        {var: 0})) / factorial(k)


check(taylor_coeff(F_corr, pom, 1) == rho_fibre, "E3 corrected F, r_s = 2")
refuted(taylor_coeff(F_print, pom, 1) == rho_fibre, "E3 printed F")
# d zeta ^ d omega (printed order) gives -rho
refuted(-taylor_coeff(F_corr, pom, 1) == rho_fibre,
        "E3 printed d zeta ^ d omega")
# P = 1, Q = Q_s = 2w: Res[dw ^ dz/2w] = dz/2; printed F = P Q_s/Q = 1
check(res0(1 / Fp(2 * pw), pw) == QQ(1) / 2, "E3 P=1, Q=2w: dz/2")
refuted(Fp(1) * (2 * pw) / Fp(2 * pw) == QQ(1) / 2, "E3 printed F = 1")
section("E3")

# E4. The Example of §18 (pp. 127-128).  Q = w (w^2 - z^3)(w^2 - z^3 - z^4),
# P generic of degree <= 8.
mons = [(a, b) for a in range(9) for b in range(9) if a + b <= 8]
Rq = PolynomialRing(QQ, ["c%d_%d" % m for m in mons] + ["w", "z"])
qg = Rq.gens()
cq = dict(zip(mons, qg[:len(mons)]))
qw, qz = qg[-2], qg[-1]
Fq = Rq.fraction_field()
Pq = sum(cq[m] * qw ** m[0] * qz ** m[1] for m in mons)
Qq = qw * (qw ** 2 - qz ** 3) * (qw ** 2 - qz ** 3 - qz ** 4)
dQw = Qq.derivative(qw)
# R_1: fibre residue at w = 0 is P(0, z)/(z^3 (z^3 + z^4)); R_1 is the
# coefficient of z^5 in P(0, z)/(1 + z) = sum (-1)^(5-k) c_(0,k)
f1 = res0(Fq(Pq) / Qq, qw)
check(f1 == Fq(Pq.subs({qw: 0})) / (qz ** 3 * (qz ** 3 + qz ** 4)),
      "E4 R_1 fibre residue")
R1 = res0(f1, qz)
check(R1 == sum((-1) ** (k + 1) * cq[(0, k)] for k in range(6)),
      "E4 R_1 corrected (iii-128-r1-sign)")
refuted(R1 == sum((-1) ** k * cq[(0, k)] for k in range(6)),
        "E4 R_1 printed")
# R_2: on w^2 = z^3, dQ/dw = w 2w (w^2 - z^3 - z^4) = -2 z^7; with z = u^2,
# w = u^3 the cycle (0 <= t <= 4 pi) is |u| = eps^(1/2) once, dz = 2u du
Ru = PolynomialRing(QQ, ["c%d_%d" % m for m in mons] + ["u"])
ug = Ru.gens()
uu_ = ug[-1]
phiRu = Rq.hom(list(ug[:len(mons)]) + [uu_ ** 3, uu_ ** 2], Ru)
check(phiRu(dQw) == -2 * uu_ ** 14, "E4 dQ/dw = -2 z^7 on w^2 = z^3")
refuted(phiRu(dQw) == 2 * uu_ ** 14, "E4 printed z^(3/2) 2 z^(3/2) z^4")
R2 = res0(Ru.fraction_field()(phiRu(Pq)) * 2 * uu_ / phiRu(dQw), uu_)
cR = dict(zip(mons, ug[:len(mons)]))
check(R2 == -(cR[(0, 6)] + cR[(2, 3)] + cR[(4, 0)]),
      "E4 R_2 corrected (iii-128-r2-sign)")
refuted(R2 == cR[(0, 6)] + cR[(2, 3)] + cR[(4, 0)], "E4 R_2 printed")
# the coefficients are the printed derivatives: c_(0,6) = P_(z^6)/6!,
# c_(2,3) = P_(w^2 z^3)/(2! 3!), c_(4,0) = P_(w^4)/4!
for (a, b) in [(0, 6), (2, 3), (4, 0)]:
    der = Pq.derivative(qw, a).derivative(qz, b).subs({qw: 0, qz: 0})
    check(der / (factorial(a) * factorial(b)) == cq[(a, b)],
          "E4 R_2 coefficient %s" % ((a, b),))
# R_3 = P(0, -1)
R3 = res_at(f1, qz, -1)
check(R3 == Pq.subs({qw: 0, qz: -1}), "E4 R_3 = P(0, -1)")
# R_4: printed formula res_(zeta=0) P(sqrt(1+zeta)/zeta^2, 1/zeta)
# zeta^6/2(zeta + 1), with sqrt(1+zeta) a power series; independently,
# T_3 = {w^2 = z^3 + z^4} is z = 1/(v^2 - 1), w = v/(v^2 - 1)^2, the branch
# w ~ +z^2 at z = infinity is v -> +1, and |z| = R counterclockwise is a
# clockwise loop about v = 1: R_4 = -res_(v=1) P/(dQ/dw) dz/dv.
Cb = PolynomialRing(QQ, ["c%d_%d" % m for m in mons])
cb = dict(zip(mons, Cb.gens()))
Pb = lambda W_, Z_: sum(cb[m] * W_ ** m[0] * Z_ ** m[1] for m in mons)
LSz = LaurentSeriesRing(Cb, "zeta", default_prec=40)
zeta = LSz.gen()
sq = (1 + zeta).sqrt()
expr = Pb(sq / zeta ** 2, 1 / zeta) * zeta ** 6 / (2 * (zeta + 1))
R4_book = expr.residue()
Rv = PolynomialRing(Cb, "v")
vv = Rv.gen()
Fv = Rv.fraction_field()
zv = 1 / Fv(vv ** 2 - 1)
wv = Fv(vv) / (vv ** 2 - 1) ** 2
check(wv ** 2 == zv ** 3 + zv ** 4, "E4 parametrization of T_3")
dQw_v = wv * (wv ** 2 - zv ** 3) * 2 * wv
check(dQw_v == 2 * zv ** 4 * (zv ** 3 + zv ** 4), "E4 dQ/dw on T_3")
integrand = Pb(wv, zv) / dQw_v * zv.derivative(vv)
Rv2 = PolynomialRing(Cb, "v,s")
v2, s2 = Rv2.gens()
shifted = (Rv2(integrand.numerator()(v2 + 1))
           / Rv2(integrand.denominator()(v2 + 1)))
R4_param = -res0(shifted, v2)
check(R4_book == R4_param, "E4 R_4 printed formula = parametrization")
# (R_4 is a nonzero linear form in the coefficients of P)
check(R4_book != 0, "E4 R_4 nonzero")
section("E4")

# E5. 6°, (18.11): with w = z_1/z_0, z = z_2/z_0,
# dw ^ dz = (z_0 dz_1^dz_2 - z_1 dz_0^dz_2 + z_2 dz_0^dz_1)/z_0^3.
R3h = PolynomialRing(QQ, "z0,z1,z2")
h0, h1, h2 = R3h.gens()
F3h = R3h.fraction_field()
lhs = wedge(dform(fun(F3h(h1) / h0), [h0, h1, h2]),
            dform(fun(F3h(h2) / h0), [h0, h1, h2]))
rhs = fscale(1 / F3h(h0 ** 3), fadd(fscale(h0, {(1, 2): 1}),
                                    fscale(-h1, {(0, 2): 1}),
                                    fscale(h2, {(0, 1): 1})))
check(feq(lhs, rhs), "E5 (18.11)")

# E6. Theorem 18.7, p = sum 2 rho_j + sum (alpha_i - 1) - m + 1 for a curve
# T in CP^2: by Lefschetz duality b_1(CP^2 \ T) = m - 1, b_3 = 0, so
# b_2(CP^2 \ T) = 1 + m - chi(T) with chi(T) = sum (2 - 2 rho_j) -
# sum (alpha_i - 1) (normalization); this equals the printed formula.
# For line arrangements b_2 is also computed by Orlik-Solomon, one line
# sent to infinity: 3 and 4 general lines, 4 lines with a triple point,
# 5 lines with two triple points.
for m_ in range(1, 6):
    for k_ in range(0, 6):
        Rs = PolynomialRing(ZZ, ["rho%d" % i for i in range(m_)]
                            + ["al%d" % i for i in range(k_)])
        rhos, alphas = Rs.gens()[:m_], Rs.gens()[m_:]
        chi = sum(2 - 2 * r for r in rhos) - sum(a - 1 for a in alphas)
        check(1 + m_ - chi == 2 * sum(rhos) + sum(a - 1 for a in alphas)
              - m_ + 1, "E6 formula m=%d k=%d" % (m_, k_))
H = HyperplaneArrangements(QQ, ("x", "y"))
hx, hy = H.gens()
for affine, alphas in [([hx, hy], [2, 2, 2]),
                       ([hx, hy, hx + hy - 1], [2] * 6),
                       ([hx, hy, hx + hy], [3, 2, 2, 2]),
                       ([hx, hy, hx + hy, hx - 1], [3, 3, 2, 2, 2, 2])]:
    # projective lines: the affine ones and the line at infinity
    m_ = len(affine) + 1
    pform = sum(a - 1 for a in alphas) - m_ + 1
    check(H(affine).poincare_polynomial()[2] == pform,
          "E6 Orlik-Solomon %d lines" % m_)
section("E")

# ===========================================================================
# F. §19, Local residues (pp. 129-136)
# ===========================================================================


def betti_top(n, rows):
    """b_n of C^n minus the hyperplanes sum a_k z_k + a_0 = 0 (rows
    (a_0, a_1, ..., a_n)), by Orlik-Solomon (Sage)."""
    H = HyperplaneArrangements(QQ, tuple("x%d" % i for i in range(n)))
    hs = H.gens()
    A = H([sum(r[k + 1] * hs[k] for k in range(n)) + r[0] for r in rows])
    pp = A.poincare_polynomial().coefficients(sparse=False)
    return pp[n] if len(pp) > n else 0


def iterated_duality(n, rows, cycles, forms):
    """Matrix of (2 pi i)^(-n) int_(gamma_alpha) phi_beta.  gamma_alpha =
    {|L_(alpha_1)| = eps_1, ..., |L_(alpha_n)| = eps_n} near the point
    L_alpha = 0, with eps_1 <= ... <= eps_n hierarchical (eps_1 <<
    ... << eps_n) or equal; in the coordinates zeta_k = L_(alpha_k) the
    integral is the iterated residue at 0 in zeta_1, ..., zeta_n."""
    Ru = PolynomialRing(QQ, n, "u")
    us = Ru.gens()
    Fu = Ru.fraction_field()
    M = []
    for al in cycles:
        Ma = matrix(QQ, [rows[i][1:] for i in al])
        ba = vector(QQ, [rows[i][0] for i in al])
        zu = Ma.inverse() * (vector(Ru, us) - ba)
        line = []
        for be in forms:
            Mb = matrix(QQ, [rows[j][1:] for j in be])
            jac = (Mb * Ma.inverse()).det()
            den = prod(rows[j][0] + sum(rows[j][k + 1] * zu[k]
                                        for k in range(n)) for j in be)
            line.append(iterated_res(jac / Fu(den), us))
        M.append(line)
    return matrix(QQ, M)


# F1. Theorem 19.3 (p. 131), linear model at a = 0: N generic hyperplanes
# through 0 in C^n.  dim H_n = binom(N-1, n-1) = #A (Orlik-Solomon), and
# int_(gamma_alpha) omega_beta = delta_(alpha beta) for the cycles
# {|phi_(alpha_1)| = ... = |phi_(alpha_(n-1))| = delta, |phi_(alpha_n)| =
# eps}, delta << eps (iterated residue in zeta_1, ..., zeta_(n-1), then
# zeta_n; every phi_j, j not in alpha, is dominated by its zeta_n term).
GEN = {2: [(1, 0), (0, 1), (1, 1), (1, -1), (1, 2), (2, 1)],
       3: [(1, 0, 0), (0, 1, 0), (0, 0, 1), (1, 1, 1), (1, 2, 3),
           (1, -1, 2)]}
for n, normals in GEN.items():
    for N in range(n, len(normals) + 1):
        nv = normals[:N]
        for S in itertools.combinations(range(N), n):
            check(matrix(QQ, [nv[i] for i in S]).rank() == n,
                  "F1 generic n=%d N=%d %s" % (n, N, S))
        rows = [(0,) + tuple(v) for v in nv]
        Aset = [al for al in itertools.combinations(range(N), n)
                if al[-1] == N - 1]
        check(len(Aset) == binomial(N - 1, n - 1), "F1 #A n=%d N=%d"
              % (n, N))
        check(betti_top(n, rows) == binomial(N - 1, n - 1),
              "F1 b_n n=%d N=%d" % (n, N))
        Mx = iterated_duality(n, rows, Aset, Aset)
        check(Mx == identity_matrix(QQ, len(Aset)),
              "F1 duality n=%d N=%d" % (n, N))
section("F1")

# F2. 3°-4° (pp. 131-134) with nonlinear phi_j (n = 2, N = 3, a = 0):
# phi_1 = z_1 + z_2^2 + z_1 z_2, phi_2 = z_2 + z_1^2,
# phi_3 = z_1 + 2 z_2 + z_2^2, f = F/(phi_1^r_1 phi_2^r_2 phi_3^r_3).
# R_alpha is computed (i) from the definition, in the coordinates
# zeta = phi_alpha (the substitution (19.3), inverted as a t-adic series)
# on Gamma = {|zeta_1| = delta, |zeta_2| = eps}, delta << eps:
# zeta_1 = t^2 x, zeta_2 = t y; (ii) by the method of 4°: the linear
# substitution (19.4) and the expansion of (19.5) on Gamma with
# eps^2 << delta << eps: zeta_1 = t^3 x, zeta_2 = t^2 y.  Both agree.  In
# the regime delta = eps^3 (allowed by the printed "eps, delta, delta/eps
# sufficiently small", iii-134-eps-squared-over-delta), the expansion of
# (ii) gives a different value.  The coefficient of x^(-1) y^(-1) t^(w)
# with w the t-weight of zeta_1 zeta_2 is R_alpha.
LPxy = LaurentPolynomialRing(QQ, "x,y")
lx, ly = LPxy.gens()
PREC = 14
LSt = LaurentSeriesRing(LPxy, "t", default_prec=PREC)
lt = LSt.gen()
OO = O(lt ** PREC)
phis = [lambda a, b: a + b ** 2 + a * b, lambda a, b: b + a ** 2,
        lambda a, b: a + 2 * b + b ** 2]
grads = [(lambda a, b: (1 + b, 2 * b + a)), (lambda a, b: (2 * a, 1)),
         (lambda a, b: (1, 2 + 2 * b))]
Fnum = lambda a, b: 1 + a + 3 * b ** 2 - a * b
lin = [(1, 0), (0, 1), (1, 2)]


def coeff_xy(series, tw):
    assert tw < series.prec(), "precision"
    c = series.coefficients()
    ex = series.exponents()
    val = dict(zip(ex, c)).get(tw, LPxy(0))
    return val.monomial_coefficient(lx ** -1 * ly ** -1) if val != 0 else 0


def R_definition(al, r):
    # solve phi_al(z) = zeta, zeta = (t^2 x, t y), by Newton with the
    # constant Jacobian (t-adic convergence)
    zeta = [lt ** 2 * lx + OO, lt * ly + OO]
    J0 = matrix(QQ, [lin[al[0]], lin[al[1]]]).inverse()
    zc = [LSt(0) + OO, LSt(0) + OO]
    for _ in range(PREC + 2):
        res_ = [phis[al[0]](*zc) - zeta[0], phis[al[1]](*zc) - zeta[1]]
        zc = [zc[0] - (J0[0, 0] * res_[0] + J0[0, 1] * res_[1]),
              zc[1] - (J0[1, 0] * res_[0] + J0[1, 1] * res_[1])]
    jac = (grads[al[0]](*zc)[0] * grads[al[1]](*zc)[1]
           - grads[al[0]](*zc)[1] * grads[al[1]](*zc)[0])
    den = prod(phis[j](*zc) ** r[j] for j in range(3) if j not in al)
    g = Fnum(*zc) / (jac * zeta[0] ** r[al[0]] * zeta[1] ** r[al[1]] * den)
    return coeff_xy(g, -3)


def R_linear(al, r, w1, w2):
    Ma = matrix(QQ, [lin[al[0]], lin[al[1]]])
    Mi = Ma.inverse()
    zeta = [lt ** w1 * lx + OO, lt ** w2 * ly + OO]
    zc = [Mi[0, 0] * zeta[0] + Mi[0, 1] * zeta[1],
          Mi[1, 0] * zeta[0] + Mi[1, 1] * zeta[1]]
    den = prod(phis[j](*zc) ** r[j] for j in range(3))
    g = Fnum(*zc) / (Ma.det() * den)
    return coeff_xy(g, -(w1 + w2))


for r in [(1, 1, 1), (2, 1, 1), (1, 2, 1), (1, 1, 2), (2, 2, 1)]:
    for al in [(0, 2), (1, 2)]:
        Rdef = R_definition(al, r)
        check(Rdef == R_linear(al, r, 3, 2),
              "F2 4° method = definition, alpha=%s r=%s" % (al, r))
        refuted(Rdef == R_linear(al, r, 3, 1),
                "F2 regime delta = eps^3, alpha=%s r=%s" % (al, r))
        # (19.5) in the linear coordinates: the part of degree
        # r_1 + ... + r_N of the denominator has the leading monomial
        # zeta_1^(r_(alpha_1)) zeta_2^(r_(alpha_2) + sum_(j not in alpha) r_j)
        # with coefficient prod_(j not in alpha) a_(j 2)^(r_j)
        # (iii-134-factorized-denominator) and other monomials of the same
        # degree (so the printed |beta| > r_1 + ... + r_N is wrong).
        Rzz = PolynomialRing(QQ, "s1,s2")
        s1_, s2_ = Rzz.gens()
        Ma = matrix(QQ, [lin[al[0]], lin[al[1]]])
        Mi = Ma.inverse()
        zl = [Mi[0, 0] * s1_ + Mi[0, 1] * s2_, Mi[1, 0] * s1_ + Mi[1, 1] * s2_]
        Dd = prod(phis[j](*zl) ** r[j] for j in range(3))
        tot = sum(r)
        top = sum(c * mo for c, mo in zip(Dd.coefficients(), Dd.monomials())
                  if mo.degree() == tot)
        rest_ = [j for j in range(3) if j not in al]
        a_j2 = {j: (vector(QQ, lin[j]) * Mi)[1] for j in rest_}
        lead = s1_ ** r[al[0]] * s2_ ** (r[al[1]] + sum(r[j] for j in rest_))
        check(top.monomial_coefficient(lead)
              == prod(a_j2[j] ** r[j] for j in rest_),
              "F2 (19.5) leading term alpha=%s r=%s" % (al, r))
        check(len(top.monomials()) > 1,
              "F2 (19.5) other terms of degree sum r alpha=%s r=%s"
              % (al, r))
# the simplest instance: phi_1 = z_1 + z_2^2, phi_2 = z_2, f = 1/phi_1 phi_2:
# R = 1; on Gamma with delta = eps^3 the expansion gives 0, and for
# delta = eps^2 the point (-eps^2, eps) of Gamma lies on T_1 (eps = 1/10)
g1 = 1 / ((lt ** 3 * lx + (lt ** 2 * ly) ** 2) * (lt ** 2 * ly))
check(coeff_xy(g1, -5) == 1, "F2 simple instance, eps^2 << delta")
g2 = 1 / ((lt ** 3 * lx + (lt * ly) ** 2) * (lt * ly))
refuted(coeff_xy(g2, -4) == 1, "F2 simple instance, delta = eps^3")
eps_ = QQ(1) / 10
z1p, z2p = -eps_ ** 2, eps_
check(abs(z1p) == eps_ ** 2 and abs(z2p) == eps_ and z1p + z2p ** 2 == 0,
      "F2 (-eps^2, eps) in Gamma cap T_1 for delta = eps^2")
# the printed inequality |sum_(|beta|>1) a beta zeta^beta| < |zeta_1| fails
# on all of Gamma for delta = eps^3: |zeta_2^2| = eps^2 > eps^3
refuted(eps_ ** 2 < eps_ ** 3, "F2 printed inequality, delta = eps^3")

# F3. Theorem 19.3 proof (p. 132): the printed bound delta/eps <
# sum |c_k/c_n| admits phi_(beta) = 2 zeta_1 + zeta_2 = 0 on {|zeta_1| = 1,
# |zeta_2| = 2} (delta/eps = 1/2 < 2); the corrected bound delta/eps <
# (sum |c_k/c_n|)^(-1) = 1/2 excludes it (iii-132-delta-epsilon-bound;
# general statement in Lean, dominant_sum_ne_zero).
check(2 * (-1) + 2 == 0 and QQ(1) / 2 < 2, "F3 printed bound admits 0")
refuted(QQ(1) / 2 < QQ(1) / 2, "F3 corrected bound excludes it")
section("F2")


# F4. 5°, Theorem 19.8 (pp. 134-136): canonical systems.  For affine
# arrangements of rank n (several non-generic: multiple points, parallel
# hyperplanes, a line of triple intersection in C^3) the families
# omega in Omega (the hyperplanes through a vertex), the canonical systems
# J(omega) built step by step as printed, the count sum |J(omega)| =
# b_n (Orlik-Solomon), and int_(gamma_alpha) phi_beta = delta_(alpha beta)
# with eps_1 << ... << eps_n.  Proposition 19.7: rank < n gives b_n = 0.
def canonical_systems(n, rows):
    lin_ = [vector(QQ, r[1:]) for r in rows]
    Nn = len(rows)
    Omega = []
    for S in itertools.combinations(range(Nn), n):
        Ms = matrix(QQ, [lin_[i] for i in S])
        if Ms.rank() < n:
            continue
        a = Ms.solve_right(vector(QQ, [-rows[i][0] for i in S]))
        om = tuple(j for j in range(Nn)
                   if rows[j][0] + lin_[j] * a == 0)
        if om not in [o for o, _ in Omega]:
            Omega.append((om, a))
    out = []
    for om, a in Omega:
        # order omega: a lexicographically first independent n-subset first
        first = next(S for S in itertools.combinations(om, n)
                     if matrix(QQ, [lin_[i] for i in S]).rank() == n)
        order = list(first) + [j for j in om if j not in first]
        current = {frozenset(first)}
        for k in range(n, len(order)):
            new = order[k]
            nxt = set()
            for S in current:
                for drop in S:
                    T = (S - {drop}) | {new}
                    if matrix(QQ, [lin_[i] for i in T]).rank() == n:
                        nxt.add(frozenset(T))
            current = nxt
        pos = {j: i for i, j in enumerate(order)}
        for S in current:
            al = tuple(sorted(S, key=lambda j: pos[j]))
            check(al[-1] == order[-1], "F4 alpha_r = j_q")
            out.append(al)
    return Omega, out


ARR = [
    (2, [(0, 1, 0), (0, 0, 1), (-1, 1, 1), (-1, 1, 0)]),
    (2, [(0, 1, 0), (0, 0, 1), (0, 1, 1), (0, 1, -1), (-1, 1, 0),
         (-1, 0, 1)]),
    (2, [(0, 1, 0), (-1, 1, 0), (-2, 1, 0), (0, 0, 1), (0, 1, 1)]),
    (3, [(0, 1, 0, 0), (0, 0, 1, 0), (0, 1, 1, 0), (0, 0, 0, 1),
         (-1, 1, 1, 1), (-1, 0, 0, 1)]),
    (3, [(0, 1, 0, 0), (0, 0, 1, 0), (0, 0, 0, 1), (0, 1, 1, 1),
         (0, 1, 2, 0), (-1, 1, 0, 0)]),
]
F4_EXPECTED = [4, 9, 6, 8, 10]   # b_n: hand count of |mu| for n = 2
for n, rows in ARR:
    Omega, J = canonical_systems(n, rows)
    bn = betti_top(n, rows)
    check(len(J) == bn, "F4 sum |J(omega)| = b_n %s" % (rows,))
    check(len(J) == F4_EXPECTED.pop(0), "F4 b_n value %s" % (rows,))
    Mx = iterated_duality(n, rows, J, J)
    check(Mx == identity_matrix(QQ, len(J)), "F4 duality %s" % (rows,))
check(betti_top(3, [(0, 1, 0, 0), (0, 0, 1, 0), (-1, 1, 1, 0)]) == 0,
      "F4 Proposition 19.7, rank 2 < 3")
section("F")

print("ok ch3: %d checks" % COUNT[0])
