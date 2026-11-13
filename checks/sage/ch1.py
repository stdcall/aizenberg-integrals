"""Exact checks of the Preliminaries and of Chapter I, §§1-7, "Integral
Representations and the Logarithmic Residue" (printed pp. 1-58).

Run: sage -python checks/sage/ch1.py (plain asserts; do not use -O).
The last line of the output is "ok ch1: N checks"; about two minutes.

Book: L. A. Aizenberg and A. P. Yuzhakov, Integral Representations and
Residues in Multidimensional Complex Analysis, AMS Translations of
Mathematical Monographs 58, 1983.  Pages are the printed pages; formula and
statement numbers are those of the book (= our labels in content/00-* and
content/01-0*.typ).  The expected values are the book's statements, written
below as literals or formulas read off the printed text; the Typst sources
are not parsed.  Where the book is wrong, the printed reading is kept as a
refuted check (`refuted`: the printed reading must fail) next to the
corrected one; correction ids refer to corrections.json.

Exact arithmetic only: Q, Q(i), QQbar/AA, polynomial rings and their
fraction fields, Laurent and power series over them, Singular (local
orderings) for multiplicities, exact symbolic integrals of powers.  A
function of zeta in C^n is a rational function of zeta_j, zetabar_j as
independent variables (Wirtinger derivatives are formal partial
derivatives).  Forms are exterior polynomials in dzeta_j, dzetabar_j
(and dz_j, dzbar_j); double forms follow the convention of the
Preliminaries (end of 1°): differentials of z commute with those of zeta.
Integrals over the unit ball are reduced to Dirichlet integrals over the
simplex (polar coordinates), integrals over spheres to ball integrals by
Stokes' formula (the sphere oriented as the boundary of the ball, the
ball by dx_1 ... dx_n dy_1 ... dy_n, p. 5); both reductions are checked
on exact cases (section "init").  "Generic" means independent symbolic
coefficients; an identity of first (second) order in a function, checked
with generic affine (quadratic) coefficients, holds for all C^1 (C^2)
functions pointwise.

What is checked (P = Preliminaries, Sk = §k):
P1-P2 (p. 5): the orientation identity dx dy = (-i/2)^n dzetabar dzeta,
  Vladimirov's orientation and the factor (-1)^(n(n-1)/2), n <= 6; the
  positivity of (-i)^n int_bD sum (-1)^(k-1) zetabar_k dzetabar_[k] dzeta.
P3-P5 (pp. 6, 13): Proposition 0.7 (Leibniz rule, corrected sign
  (-1)^p, printed -(-1) refuted for even p), Proposition 0.8, the corrected
  dbar of a (p, q)-form.
P6 (pp. 10-11): the Euler-Poincare formula (0.9) from q = 0 for 13
  triangulated spaces (printed sums from q = 1 refuted), Propositions
  0.15-0.18 (spheres S^1..S^4, genus 1-3 triangulations, the 4 rho-gon cell
  complex, rho <= 6).
P7 (p. 9): |det f'|^2 = real Jacobian, generic, n <= 3.
P8 (p. 8): Properties 0.12-0.14 for 3 x 3 determinants of generic double
  forms of four degree patterns; D_(1,n-1)(w, theta) and D_n(dz), n <= 4.
P9 (p. 5): Corollary 0.5 needs a closed form (x dy over |z| = 1, 2;
  printed reading refuted).
S1 (pp. 15-18): the Martinelli-Bochner kernel closed (n <= 4); (1.3) on
  the unit sphere (n <= 3, |beta| <= 3); step 4 (three expressions = 1,
  printed dzetabar ^ dzetabar refuted); step 3; Lemma 1.3 (identity, and
  (1.4) exactly at z = 0 on the unit ball for all monomials of degree <= 3
  (n = 2), <= 2 (n = 3)); g of (1.7); the complex Green formula (1.9)
  (del g ^ nu_f = -dbar f ^ omega, d nu_f); the constant of the last display
  of the proof of Theorem 1.2: -(n-1)!/pi^n, printed (2i)^n refuted
  (n <= 4).
S2 (pp. 19-24): the Example of multiplicity 2; omega(f, fbar) closed
  (explicit maps, n = 2, 3); the counterexample to the printed Remark after
  Theorem 2.5; the real and imaginary parts after (2.12) (corrected sign,
  printed refuted, n <= 4), the exact imaginary part (n = 2..4), Sigma_m
  (m <= 10), the determinant form of (2.12).
S3 (pp. 25-30): (3.3) = (n-1)! sum (-1)^(k-1) u_k du_[k] ^ df (n <= 6);
  (3.8) from (3.3) (n = 2, 3); eta(lambda w) = lambda^n eta(w);
  Omega(fbar, ..., fbar, f) = omega(f, fbar); Lemma 3.3; sphere moments and
  the Cauchy-Fantappie formula with w = zetabar on the ball (the Cauchy-Szego
  kernel (1 - <z, zetabar>)^(-n) for the normalized measure).
S4 (pp. 30-38): (4.1), Corollary 4.2 (n <= 3); (4.2) with its
  orientation (n <= 7); the identity on beta_(1..n); the Example after
  Theorem 4.8 (multiplicity 3 at (0, 0), the residues, printed point (0, 1)
  refuted); Theorem 4.13: K for p = 0 is (-1)^q omega(f, fbar), which
  contradicts Theorem 3.1 for n = 2, 3 (printed sign refuted), K for
  p = n - 1 is df/f, and on Gamma for 0 < p < n - 1 (n <= 5) K is (-1)^q
  times a rescaled Martinelli-Bochner kernel times Cauchy kernels.
S5 (pp. 38-42): omega_alpha with the corrected denominator: n = 1 (printed
  refuted), (5.1) on the generalized sphere for n = 2 (6 alpha) and n = 3
  (2 alpha), step 4, closedness (printed not closed); Theorem 5.2: the
  printed condition fails for w = zetabar and admits w with a singular
  kernel (exact points in QQbar), the cycle gamma with w^(alpha+I);
  Omega_alpha with alpha! and f^(alpha+I) (printed refuted for n = 1, 2, 3);
  items 1, 4, 5 of 2° and Proposition 5.4 (residues, multiplicities).
S6 (pp. 44-48): Example 3; the Bergman kernels of the polydisk and the
  ball (monomial norms, series to degree 8 resp. 20, closed forms;
  printed R^(2n) refuted); the weight exponent 4n - 2.
S7 (pp. 49-57): W_(0,0) = omega(zeta - z, w), U_(0,0) = Martinelli-
  Bochner, Pompeiu; D_(p,n-p)(dz, dzeta); (7.2) and (7.3) with all signs
  (n = 2, 3, all p, q); (7.4) with v_q (printed (-n)^n refuted); Lemma 7.2
  for t and for another w; Lemma 7.3 for monomials; (7.10), the step
  before it and (7.12) (printed (7.10) refuted); theta_q on the sphere, the
  expansion of gamma ^ theta_q (n <= 4) and i(z) = gamma(z); the "Note
  that" identities (n <= 5, printed repeated factor refuted).

What is NOT established: the analytic statements (convergence, limits,
homology arguments, Sard, approximation, Keldysh-Lavrent'ev, Bergman and
Gleason theory, Bungart) beyond the listed identities and ranges; the
integral formulas (1.1), (3.5), (4.3), (5.1), (5.5), (7.1) for general
domains (only the listed exact model integrals are computed); a general n
where only n <= N is listed; Theorem 4.13 for 0 < p < n - 1 depends on an
orientation of Gamma_(2n-p-1) which the book does not define (only the
form of the kernel on Gamma and the model integrals are checked).  No
outside literature is used: the expected values are the book's own.
"""

import itertools
import time

from sage.all import *

# In `sage -python` factorial and binomial of Python ints return Python ints,
# and int / int is a float: use Sage Integers throughout.
def factorial(n):
    return Integer(n).factorial()


def binomial(a, b):
    return Integer(a).binomial(b)


COUNT = [0]
T0 = time.time()


def check(condition, label):
    assert bool(condition), label
    COUNT[0] += 1


def refuted(condition, label):
    """The printed reading must fail."""
    assert not bool(condition), "printed reading holds: " + label
    COUNT[0] += 1


def exact(x):
    """x unchanged, after asserting that it is not a floating-point value."""
    assert not isinstance(x, float), "float value"
    P = parent(x)
    if P is SR:
        assert "." not in str(x), "inexact symbolic value %s" % x
    elif hasattr(P, "is_exact"):
        assert P.is_exact(), "inexact parent %s" % P
    return x


def section(name):
    print("%-5s %6.1f s, %d checks" % (name, time.time() - T0, COUNT[0]))


K = QuadraticField(-1, "i")
II = K.gen()

# ---------------------------------------------------------------------------
# Exterior algebra of double forms (Preliminaries, end of 1°: the
# differentials of z commute with those of zeta).  A form is a dict
# {(A, B): coefficient}; A is an increasing tuple of "first" generators
# (zeta-differentials: 2j = d zeta_j, 2j + 1 = d zetabar_j), B an increasing
# tuple of "second" generators (z-differentials: 2j = d z_j, 2j + 1 =
# d zbar_j).  Generators of the same kind anticommute, generators of
# different kinds commute.  The same code serves single forms (B = ()) in
# other generators (e.g. d f_j, d fbar_j).
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
    for (A1, B1), c1 in f.items():
        for (A2, B2), c2 in g.items():
            s1, A = sort_sign(A1 + A2)
            if s1 == 0:
                continue
            s2, B = sort_sign(B1 + B2)
            if s2 == 0:
                continue
            out[(A, B)] = out.get((A, B), 0) + s1 * s2 * c1 * c2
    return fclean(out)


ONE = {((), ()): 1}


def wedges(*fs):
    r = dict(ONE)
    for f in fs:
        r = wedge(r, f)
    return r


def wpow(f, k):
    r = dict(ONE)
    for _ in range(k):
        r = wedge(r, f)
    return r


def g1(i, c=1):
    """A first-kind generator (zeta-differential) with coefficient c."""
    return {((i,), ()): c}


def g2(i, c=1):
    """A second-kind generator (z-differential) with coefficient c."""
    return {((), (i,)): c}


def fun(c):
    return {((), ()): c}


def oper(f, table, F):
    """Exterior derivative-type operator: table = [(var, kind, gen)], the
    new differential is put in front of the first (kind 1) or the second
    (kind 2) part; coefficients are differentiated in the field F."""
    out = {}
    for (A, B), c in f.items():
        if c.parent() is not F and c.parent() is not F.ring():
            c = F(c)
        for var, kind, gi in table:
            dc = c.derivative(var)
            if dc == 0:
                continue
            if kind == 1:
                s, A2 = sort_sign((gi,) + A)
                key = (A2, B)
            else:
                s, B2 = sort_sign((gi,) + B)
                key = (A, B2)
            if s == 0:
                continue
            out[key] = out.get(key, 0) + s * dc
    return fclean(out)


def feq(f, g, F):
    return all(F(c) == 0 for c in fsub(f, g).values())


def fzero(f, F):
    return all(F(c) == 0 for c in f.values())


def det_forms(cols):
    """The determinant with the given columns (lists of forms), expanded
    with the factors in the order of the columns (Preliminaries, 2°)."""
    n = len(cols)
    out = {}
    for perm in itertools.permutations(range(n)):
        s, _ = sort_sign(perm)
        term = dict(ONE)
        for c in range(n):
            term = wedge(term, cols[c][perm[c]])
            if not term:
                break
        if term:
            out = fadd(out, fscale(s, term))
    return out


class Sp:
    """C^n_zeta x C^n_z with x_j = zeta_j, y_j = zetabar_j, u_j = z_j,
    v_j = zbar_j as independent variables (Wirtinger derivatives are formal
    partial derivatives) and extra variables.  Conjugation conjugates the
    coefficients in Q(i) and exchanges x <-> y, u <-> v."""

    def __init__(self, n, extra=()):
        self.n = n
        names = (["x%d" % j for j in range(n)] + ["y%d" % j for j in range(n)]
                 + ["u%d" % j for j in range(n)]
                 + ["v%d" % j for j in range(n)] + list(extra))
        self.R = PolynomialRing(K, names)
        self.F = self.R.fraction_field()
        g = self.R.gens()
        self.x = g[0:n]
        self.y = g[n:2 * n]
        self.u = g[2 * n:3 * n]
        self.v = g[3 * n:4 * n]
        self.extra = g[4 * n:]
        im = list(g)
        for j in range(n):
            im[j], im[n + j] = g[n + j], g[j]
            im[2 * n + j], im[3 * n + j] = g[3 * n + j], g[2 * n + j]
        self.conj_images = im
        F = self.F
        self.t_del_zeta = [(self.x[j], 1, 2 * j) for j in range(n)]
        self.t_dbar_zeta = [(self.y[j], 1, 2 * j + 1) for j in range(n)]
        self.t_del_z = [(self.u[j], 2, 2 * j) for j in range(n)]
        self.t_dbar_z = [(self.v[j], 2, 2 * j + 1) for j in range(n)]
        self.dist2 = F(sum((self.x[j] - self.u[j]) * (self.y[j] - self.v[j])
                           for j in range(n)))

    def conj(self, f):
        f = self.F(f)

        def cp(p):
            p = self.R(p).map_coefficients(lambda c: c.conjugate())
            return p(*self.conj_images)
        return self.F(cp(f.numerator())) / self.F(cp(f.denominator()))

    def del_zeta(self, f):
        return oper(f, self.t_del_zeta, self.F)

    def dbar_zeta(self, f):
        return oper(f, self.t_dbar_zeta, self.F)

    def d_zeta(self, f):
        return oper(f, self.t_del_zeta + self.t_dbar_zeta, self.F)

    def del_z(self, f):
        return oper(f, self.t_del_z, self.F)

    def dbar_z(self, f):
        return oper(f, self.t_dbar_z, self.F)

    def subs(self, f, images):
        f = self.F(f)
        return (self.F(f.numerator()(*images))
                / self.F(f.denominator()(*images)))


def dzeta_all(n):
    """d zeta = d zeta_1 ^ ... ^ d zeta_n."""
    return wedges(*[g1(2 * j) for j in range(n)])


def dzetabar_all(n):
    return wedges(*[g1(2 * j + 1) for j in range(n)])


def dzetabar_omit(n, ks):
    """d zetabar_[k1, ...]: the d zetabar_j, j not in ks, increasing."""
    return wedges(*[g1(2 * j + 1) for j in range(n) if j not in ks])


def dzeta_omit(n, ks):
    return wedges(*[g1(2 * j) for j in range(n) if j not in ks])


# ---------------------------------------------------------------------------
# Real coordinates.  The book orients C^n by dx_1 ... dx_n dy_1 ... dy_n
# (Preliminaries, p. 6).  A real form is {tuple: coefficient} with the
# generators x_j -> j, y_j -> n + j, so that the increasing order of the
# generators is the book's orientation.  d zeta_j = dx_j + i dy_j,
# d zetabar_j = dx_j - i dy_j.
# ---------------------------------------------------------------------------


def sw(f, g):
    out = {}
    for A1, c1 in f.items():
        for A2, c2 in g.items():
            s, A = sort_sign(A1 + A2)
            if s == 0:
                continue
            out[A] = out.get(A, 0) + s * c1 * c2
    return {k: c for k, c in out.items() if c != 0}


def cx_to_real(n, gen):
    j = gen // 2
    if gen % 2 == 0:
        return {(j,): K(1), (n + j,): II}
    return {(j,): K(1), (n + j,): -II}


def to_real(n, single):
    """A form {A: c} in the complex generators -> real generators."""
    out = {}
    for A, c in single.items():
        t = {(): K(1)}
        for gen in A:
            t = sw(t, cx_to_real(n, gen))
        for B, d in t.items():
            out[B] = out.get(B, 0) + c * d
    return {k: c for k, c in out.items() if c != 0}


def top_factor(n, A):
    """The complex top form with generators A (a permutation of 0..2n-1)
    equals top_factor * dV, dV = dx_1 ... dx_n dy_1 ... dy_n."""
    r = to_real(n, {tuple(A): K(1)})
    assert list(r.keys()) == [tuple(range(2 * n))]
    return r[tuple(range(2 * n))]


# ---------------------------------------------------------------------------
# Exact integrals over the unit ball B of C^n.  With zeta_j = r_j e^(i th_j)
# and t_j = r_j^2, dV = prod (1/2) dt_j d th_j, so
#   int_B zeta^a zetabar^b |zeta|^(2k) dV
#     = [a = b] pi^n int_{t >= 0, sum t < 1} t^a (sum t)^k dt
#     = [a = b] pi^n (|a| + n)/(|a| + n + k) int t^a dt   (k > -|a| - n),
# the last step by the scaling t = s theta.  int t^a dt is computed by
# iterated integration of polynomials over Q.  Both reductions are
# validated on exact cases in section P below.
# ---------------------------------------------------------------------------
_SIMPLEX = {}


def simplex_int(alpha):
    alpha = tuple(alpha)
    if alpha not in _SIMPLEX:
        n = len(alpha)
        T = PolynomialRing(QQ, n, ["t%d" % j for j in range(n)])
        t = T.gens()
        p = T(prod(t[j] ** alpha[j] for j in range(n)))
        for j in reversed(range(n)):
            upper = 1 - sum(t[k] for k in range(j))
            prim = p.integral(t[j])
            p = prim.subs({t[j]: upper}) - prim.subs({t[j]: 0})
        _SIMPLEX[alpha] = QQ(p)
    return _SIMPLEX[alpha]


def ball_mono(a, b, k):
    """int_B zeta^a zetabar^b |zeta|^(2k) dV / pi^n (a rational)."""
    if tuple(a) != tuple(b):
        return QQ(0)
    n = len(a)
    m = sum(a)
    assert m + n + k > 0, "divergent"
    return QQ(m + n) / (m + n + k) * simplex_int(a)


def ball_poly(S, c, k=0):
    """int_B c |zeta|^(-2k) dV / pi^n for a polynomial c in x, y (z-free)."""
    c = S.R(c)
    n = S.n
    total = K(0)
    for coef, mono in zip(c.coefficients(), c.monomials()):
        e = mono.exponents()[0]
        assert all(e[i] == 0 for i in range(2 * n, len(e))), "z in c"
        a = tuple(e[0:n])
        b = tuple(e[n:2 * n])
        total += coef * ball_mono(a, b, -k)
    return total


def ball_top(S, f, k=0):
    """int_B f |zeta|^(-2k) / pi^n for a top-degree zeta-form f with
    polynomial coefficients (B-part empty), in the book's orientation."""
    n = S.n
    tot = K(0)
    for (A, B), c in f.items():
        assert B == () and len(A) == 2 * n
        num = S.F(c)
        assert num.denominator() == 1
        tot += top_factor(n, A) * ball_poly(S, num.numerator(), k)
    return tot


def sphere_poly(S, f):
    """int over the unit sphere bB (oriented as the boundary of B) of a
    (2n - 1)-form in zeta with polynomial coefficients, by Stokes' formula:
    int_B d f (divided by pi^n)."""
    return ball_top(S, S.d_zeta(f))


section("init")

# validation of the two reductions used by ball_mono
for n in (1, 2, 3):
    T = PolynomialRing(QQ, n, ["t%d" % j for j in range(n)])
    t = T.gens()
    for alpha in itertools.product(range(3), repeat=n):
        for k in (1, 2, 3):
            p = T(prod(t[j] ** alpha[j] for j in range(n))) * T(sum(t)) ** k
            val = QQ(0)
            for coef, mono in zip(p.coefficients(), p.monomials()):
                val += coef * simplex_int(mono.exponents()[0])
            check(val == ball_mono(alpha, alpha, k),
                  "scaling reduction %s %s" % (alpha, k))
xs_, ys_ = SR.var("xs_ ys_")
for a in range(3):
    for b in range(3):
        cart = integrate(integrate(((xs_ + I * ys_) ** a
                                    * (xs_ - I * ys_) ** b).expand(),
                                   ys_, -sqrt(1 - xs_ ** 2),
                                   sqrt(1 - xs_ ** 2)), xs_, -1, 1)
        check(bool((cart - pi * ball_mono((a,), (b,), 0)).simplify_full()
                   == 0), "polar reduction on the disc %d %d" % (a, b))
# int_B dV = pi^n / n!, the volume of the simplex is 1/n!
for n in range(1, 7):
    check(simplex_int((0,) * n) == QQ(1) / factorial(n), "simplex %d" % n)
    check(ball_mono((0,) * n, (0,) * n, 0) == QQ(1) / factorial(n),
          "ball volume %d" % n)

# ---------------------------------------------------------------------------
# P. Preliminaries (printed pp. 1-14, front:preliminaries).
# ---------------------------------------------------------------------------
# P1 (pp. 5-6): dx_1 ... dx_n dy_1 ... dy_n
#   = (-i/2)^n dzbar_1 ... dzbar_n dz_1 ... dz_n,
# and the orientation dx_1 dy_1 ... dx_n dy_n of Vladimirov and Pham
#   = (-i/2)^n dzbar_1 dz_1 ... dzbar_n dz_n differs by (-1)^(n(n-1)/2).
for n in range(1, 7):
    ours = [2 * j + 1 for j in range(n)] + [2 * j for j in range(n)]
    check((-II / 2) ** n * top_factor(n, ours) == 1,
          "p. 5: orientation of C^n, n = %d" % n)
    vlad_c = []
    for j in range(n):
        vlad_c += [2 * j + 1, 2 * j]
    # dx_1 dy_1 ... dx_n dy_n in our real generators (x_j -> j, y_j -> n+j)
    s_v, _ = sort_sign(sum([[j, n + j] for j in range(n)], []))
    check((-II / 2) ** n * top_factor(n, vlad_c) == s_v,
          "p. 6: Vladimirov's orientation, n = %d" % n)
    check(s_v == (-1) ** (n * (n - 1) // 2),
          "p. 6: the factor (-1)^(n(n-1)/2), n = %d" % n)

# P2 (p. 5): d sum (-1)^(k-1) zetabar_k dzetabar_[k] ^ dzeta
#   = n dzetabar ^ dzeta, and (-i)^n n dzetabar ^ dzeta = n 2^n dV > 0.
for n in range(1, 6):
    S = Sp(n)
    eta = {}
    for k in range(n):
        eta = fadd(eta, fscale((-1) ** k * S.y[k],
                               wedge(dzetabar_omit(n, [k]), dzeta_all(n))))
    deta = S.d_zeta(eta)
    top = wedge(dzetabar_all(n), dzeta_all(n))
    check(feq(deta, fscale(n, top), S.F), "p. 5: d eta = n dzbar dz, %d" % n)
    A = list(top.keys())[0][0]
    val = (-II) ** n * n * top_factor(n, A) * top[(A, ())]
    check(val == n * 2 ** n and val > 0, "p. 5: Stokes positivity, %d" % n)
section("P1-2")


# P3 (p. 6, Proposition 0.7, correction prelim-6-integration-by-parts-sign):
# d(phi ^ psi) = d phi ^ psi + (-1)^p phi ^ d psi for forms on C^2 = R^4
# whose coefficients are affine functions with independent symbolic
# coefficients (the identity is bilinear and of first order in the
# coefficients, so this covers all C^1 coefficients pointwise).  Printed:
# int d phi ^ psi = int_bd phi ^ psi - (-1) int phi ^ d psi, i.e.
# d phi ^ psi = d(phi ^ psi) + phi ^ d psi, false for even p.
def generic_form(S, deg, coeffs, tag):
    gens = list(range(2 * S.n))
    out = {}
    vars_ = list(S.x) + list(S.y)
    for A in itertools.combinations(gens, deg):
        c = coeffs[(tag, A, -1)] + sum(coeffs[(tag, A, i)] * vars_[i]
                                       for i in range(len(vars_)))
        out[(A, ())] = S.F(c)
    return out


for (p, q) in [(0, 1), (0, 2), (1, 1), (1, 2), (2, 1), (2, 0), (0, 3)]:
    names = []
    keys = []
    for tag, deg in (("a", p), ("b", q)):
        for A in itertools.combinations(range(4), deg):
            for i in range(-1, 4):
                names.append("%s%s_%d" % (tag, "".join(map(str, A)),
                                          i + 1))
                keys.append((tag, A, i))
    S = Sp(2, extra=names)
    coeffs = dict(zip(keys, S.extra))
    phi = generic_form(S, p, coeffs, "a")
    psi = generic_form(S, q, coeffs, "b")
    lhs = S.d_zeta(wedge(phi, psi))
    rhs = fadd(wedge(S.d_zeta(phi), psi),
               fscale((-1) ** p, wedge(phi, S.d_zeta(psi))))
    check(feq(lhs, rhs, S.F), "Leibniz rule, p = %d, q = %d" % (p, q))
    cyc = fsub(wedge(S.d_zeta(phi), psi),
               fscale((-1) ** (p - 1), wedge(phi, S.d_zeta(psi))))
    check(feq(cyc, lhs, S.F),
          "p. 6: cycle case (-1)^(p-1), p = %d, q = %d" % (p, q))
    printed = fadd(lhs, wedge(phi, S.d_zeta(psi)))
    if p % 2 == 0:
        refuted(feq(wedge(S.d_zeta(phi), psi), printed, S.F),
                "p. 6: Proposition 0.7 with -(-1), p = %d" % p)
    else:
        check(feq(wedge(S.d_zeta(phi), psi), printed, S.F),
              "p. 6: -(-1) agrees with (-1)^p for odd p = %d" % p)

# P4 (p. 6, Proposition 0.8): for holomorphic F,
# d((-1)^(j-1) F dz_[j]) = (dF/dz_j) dz, so the integral of
# (df/dz_j) phi dz + f (dphi/dz_j) dz over a cycle vanishes; F = f phi with
# f, phi generic holomorphic polynomials of degree <= 2 (n = 2, 3).
for n in (2, 3):
    mons = [m for m in itertools.product(range(3), repeat=n) if sum(m) <= 2]
    names = ["a%d" % i for i in range(len(mons))] + [
        "b%d" % i for i in range(len(mons))]
    S = Sp(n, extra=names)
    a = S.extra[:len(mons)]
    b = S.extra[len(mons):]
    fz = sum(a[i] * prod(S.x[j] ** m[j] for j in range(n))
             for i, m in enumerate(mons))
    ph = sum(b[i] * prod(S.x[j] ** m[j] for j in range(n))
             for i, m in enumerate(mons))
    for j in range(n):
        lhs = S.d_zeta(fscale(S.F((-1) ** j * fz * ph), dzeta_omit(n, [j])))
        rhs = fscale(S.F(fz.derivative(S.x[j]) * ph
                         + fz * ph.derivative(S.x[j])), dzeta_all(n))
        check(feq(lhs, rhs, S.F), "p. 6: Proposition 0.8, n = %d, j = %d"
              % (n, j))
section("P3-4")

# P5 (p. 13, correction prelim-13-dbar-antiholomorphic-differentials):
# for alpha = a dz_J ^ dzbar_frakJ the (p, q + 1)-part of d alpha is
# sum_k (da/dzbar_k) dzbar_k ^ dz_J ^ dzbar_frakJ; the printed
# dzbar_k ^ dz_J ^ dz_frakJ has type (p + q, 1).  n = 2, all (p, q),
# a generic affine coefficient.
S = Sp(2, extra=["c%d" % i for i in range(5)])
aff = S.extra[0] + sum(S.extra[i + 1] * w for i, w in
                       enumerate(list(S.x) + list(S.y)))
for p in range(3):
    for q in range(3):
        for J in itertools.combinations(range(2), p):
            for JJ in itertools.combinations(range(2), q):
                base = wedges(*[g1(2 * j) for j in J],
                              *[g1(2 * j + 1) for j in JJ])
                alpha = fscale(S.F(aff), base)
                dalpha = S.d_zeta(alpha)
                part = {k_: c for k_, c in dalpha.items()
                        if sum(1 for g in k_[0] if g % 2 == 0) == p}
                book = {}
                for k in range(2):
                    book = fadd(book, wedges(g1(2 * k + 1, S.F(aff).derivative(
                        S.y[k])), *[g1(2 * j) for j in J],
                        *[g1(2 * j + 1) for j in JJ]))
                check(feq(part, book, S.F), "p. 13: dbar, (%d, %d)" % (p, q))
                if q >= 1 and part:
                    printed = {}
                    for k in range(2):
                        printed = fadd(printed, wedges(
                            g1(2 * k + 1, S.F(aff).derivative(S.y[k])),
                            *[g1(2 * j) for j in J],
                            *[g1(2 * j) for j in JJ]))
                    refuted(feq(part, printed, S.F),
                            "p. 13: printed dz_frakJ, (%d, %d)" % (p, q))
section("P5")

# P6 (pp. 10-11): the Euler-Poincare formula (0.9), corrected to start at
# q = 0 (correction prelim-10-euler-poincare-from-zero), Propositions
# 0.15-0.18.  alpha_q from the f-vector, beta_q = dim H_q(X; Q).
# Printed: the sums from q = 1.
spaces = [("point", simplicial_complexes.Simplex(0)),
          ("segment", simplicial_complexes.Simplex(1)),
          ("triangle", simplicial_complexes.Simplex(2)),
          ("tetrahedron", simplicial_complexes.Simplex(3)),
          ("torus", simplicial_complexes.Torus()),
          ("Klein bottle", simplicial_complexes.KleinBottle()),
          ("RP^2", simplicial_complexes.RealProjectivePlane()),
          ("genus 2", simplicial_complexes.SurfaceOfGenus(2)),
          ("genus 3", simplicial_complexes.SurfaceOfGenus(3))]
spaces += [("S^%d" % n, simplicial_complexes.Sphere(n)) for n in range(1, 5)]
for name, X in spaces:
    fv = X.f_vector()[1:]
    top = len(fv) - 1
    hq = X.homology(reduced=False, base_ring=QQ)
    beta = [hq[q].dimension() if q in hq else 0 for q in range(top + 1)]
    lhs = sum((-1) ** q * fv[q] for q in range(top + 1))
    rhs = sum((-1) ** q * beta[q] for q in range(top + 1))
    check(lhs == rhs, "p. 10: Euler-Poincare (0.9) from q = 0, " + name)
    if name != "point":
        refuted(sum((-1) ** q * fv[q] for q in range(1, top + 1))
                == sum((-1) ** q * beta[q] for q in range(1, top + 1)),
                "p. 10: Euler-Poincare from q = 1, " + name)
for n in range(1, 5):
    H = simplicial_complexes.Sphere(n).homology(reduced=False)
    for p in range(n + 1):
        check(H[p].invariants() == (() if p not in (0, n) else (0,)),
              "p. 10: Proposition 0.17, H_%d(S^%d)" % (p, n))
for g in (1, 2, 3):
    X = (simplicial_complexes.Torus() if g == 1
         else simplicial_complexes.SurfaceOfGenus(g))
    H = X.homology(reduced=False)
    check(H[0].invariants() == (0,) and H[2].invariants() == (0,)
          and H[1].invariants() == (0,) * (2 * g),
          "p. 11: Proposition 0.18, genus %d (triangulation)" % g)
# the 4 rho-gon a_1 b_1 a_1^(-1) b_1^(-1) ... as a cell complex: one vertex,
# 2 rho edges (loops), one 2-cell whose boundary is the word.
for rho in range(1, 7):
    word = []
    for i in range(rho):
        word += [(2 * i, 1), (2 * i + 1, 1), (2 * i, -1), (2 * i + 1, -1)]
    d2 = matrix(ZZ, 2 * rho, 1, [sum(s for (e, s) in word if e == k)
                                 for k in range(2 * rho)])
    d1 = matrix(ZZ, 1, 2 * rho, [0] * (2 * rho))
    H = ChainComplex({2: d2, 1: d1}, degree=-1).homology()
    check(H[0].invariants() == (0,) and H[2].invariants() == (0,)
          and H[1].invariants() == (0,) * (2 * rho),
          "p. 11: Proposition 0.18, 4 rho-gon, rho = %d" % rho)
    betti = [len(H[q].invariants()) for q in range(3)]
    check(sum((-1) ** q * [1, 2 * rho, 1][q] for q in range(3))
          == sum((-1) ** q * betti[q] for q in range(3)) == 2 - 2 * rho,
          "p. 10: Euler-Poincare for the 4 rho-gon, rho = %d" % rho)
# Propositions 0.15, 0.16: H_0 of a disjoint union of spheres
X = simplicial_complexes.Sphere(1).disjoint_union(
    simplicial_complexes.Sphere(2))
H = X.homology(reduced=False)
check(H[0].invariants() == (0, 0) and H[1].invariants() == (0,)
      and H[2].invariants() == (0,), "p. 10: Propositions 0.15, 0.16")
section("P6")

# P7 (p. 9): |d(f_1..f_n)/d(z_1..z_n)|^2 = d(u, v)/d(x, y) in the order
# (u_1..u_n, v_1..v_n), (x_1..x_n, y_1..y_n), for a generic complex
# Jacobian A = B + iC (Cauchy-Riemann: du/dx = B, du/dy = -C, dv/dx = C,
# dv/dy = B), n <= 3.
for n in (1, 2, 3):
    Rb = PolynomialRing(K, ["b%d%d" % (i, j) for i in range(n)
                            for j in range(n)]
                        + ["c%d%d" % (i, j) for i in range(n)
                           for j in range(n)])
    Bm = matrix(Rb, n, n, Rb.gens()[:n * n])
    Cm = matrix(Rb, n, n, Rb.gens()[n * n:])
    real_jac = block_matrix([[Bm, -Cm], [Cm, Bm]])
    check(real_jac.det() == (Bm + II * Cm).det() * (Bm - II * Cm).det(),
          "p. 9: real Jacobian = |complex Jacobian|^2, n = %d" % n)
section("P7")


# P8 (p. 8): determinants with entries in a ring of double forms,
# expanded with the factors in the order of the columns.
def gen_entry(S, r, q, names, tag):
    """A double form of zeta-degree r and z-degree q: two basis elements
    with affine symbolic coefficients in zeta, zbar."""
    basis = [(A, B) for A in itertools.combinations(range(2 * S.n), r)
             for B in itertools.combinations(range(2 * S.n), q)]
    out = {}
    for i, key in enumerate(basis[:2] if len(basis) > 1 else basis):
        cs = [names["%s_%d_%d" % (tag, i, j)] for j in range(4)]
        out[key] = S.R(cs[0] + cs[1] * S.v[0] + cs[2] * S.v[1]
                       + cs[3] * S.x[0])
    return out


def entry_names(tags):
    return ["%s_%d_%d" % (t, i, j) for t in tags for i in range(2)
            for j in range(4)]


for degs in [((0, 0), (1, 1), (0, 1)), ((1, 0), (0, 2), (1, 1)),
             ((0, 1), (0, 1), (2, 0)), ((1, 1), (0, 0), (0, 2))]:
    tags = ["e%d%d" % (r, c) for r in range(3) for c in range(3)]
    S = Sp(2, extra=entry_names(tags))
    nm = dict(zip(entry_names(tags), S.extra))
    cols = [[gen_entry(S, degs[c][0], degs[c][1], nm, "e%d%d" % (r, c))
             for r in range(3)] for c in range(3)]
    D0 = det_forms(cols)
    # Property 0.14 (with the z-degrees q_i of the columns)
    lhs = S.dbar_z(D0)
    rhs = {}
    for i in range(3):
        sgn = (-1) ** sum(degs[c][1] for c in range(i))
        new = [cols[c] if c != i else [S.dbar_z(e) for e in cols[c]]
               for c in range(3)]
        rhs = fadd(rhs, fscale(sgn, det_forms(new)))
    check(feq(lhs, rhs, S.F), "p. 8: Property 0.14, degrees %s" % (degs,))
    # Property 0.12: rows
    sw_rows = [[col[1], col[0], col[2]] for col in cols]
    check(feq(det_forms(sw_rows), fscale(-1, D0), S.F),
          "p. 8: Property 0.12, rows, %s" % (degs,))
    # Property 0.13: a column or a row multiplied by a function
    h = S.R(S.x[1] + 2 * S.v[0] + 3)
    cm = [cols[0], [fscale(h, e) for e in cols[1]], cols[2]]
    check(feq(det_forms(cm), fscale(h, D0), S.F),
          "p. 8: Property 0.13, column times a function, %s" % (degs,))
    rm = [[fscale(h, col[0]), col[1], col[2]] for col in cols]
    check(feq(det_forms(rm), fscale(h, D0), S.F),
          "p. 8: Property 0.13, row times a function, %s" % (degs,))
    # rows linearly dependent with function coefficients
    h1, h2 = S.R(S.v[1] - 5), S.R(S.x[0] * S.v[0] + 1)
    dep = [[col[0], col[1], fadd(fscale(h1, col[0]), fscale(h2, col[1]))]
           for col in cols]
    check(fzero(det_forms(dep), S.F),
          "p. 8: Property 0.13, dependent rows, %s" % (degs,))
    # Property 0.12: neighbouring columns
    swc = [cols[1], cols[0], cols[2]]
    tot0 = degs[0][0] + degs[0][1]
    tot1 = degs[1][0] + degs[1][1]
    if (degs[0][0] * degs[1][0] + degs[0][1] * degs[1][1]) % 2 == 0:
        check(feq(det_forms(swc), fscale(-1, D0), S.F),
              "p. 8: Property 0.12, commuting columns, %s" % (degs,))
    else:
        check(feq(det_forms(swc), D0, S.F),
              "p. 8: Property 0.12, anticommuting columns, %s" % (degs,))
# equal columns: zero for function columns (Property 0.12), not for columns
# of 1-forms; D_(1, n-1)(w, theta) = (n-1)! sum (-1)^(k-1) w_k theta_[k];
# D_n(partial zeta) = n! d zeta.
for n in range(2, 5):
    names = ["w%d" % k for k in range(n)] + ["a%d_%d" % (k, j)
                                             for k in range(n)
                                             for j in range(2 * n)]
    S = Sp(n, extra=names)
    w = S.extra[:n]
    a = S.extra[n:]
    theta = [{((j,), ()): S.R(a[k * 2 * n + j]) for j in range(2 * n)}
             for k in range(n)]
    wcol = [fun(S.R(w[k])) for k in range(n)]
    D1 = det_forms([wcol] + [theta] * (n - 1))
    expect = {}
    for k in range(n):
        rest = wedges(*[theta[j] for j in range(n) if j != k])
        expect = fadd(expect, fscale(S.R((-1) ** k * w[k]), rest))
    check(feq(D1, fscale(factorial(n - 1), expect), S.F),
          "D_(1, n-1)(w, theta), n = %d" % n)
    check(fzero(det_forms([wcol, wcol] + [theta] * (n - 2)), S.F),
          "equal function columns, n = %d" % n)
    check(not fzero(det_forms([theta, theta] + [wcol] * min(1, n - 2)
                              + [theta] * (n - 3)), S.F),
          "equal columns of 1-forms do not give 0, n = %d" % n)
    dz_col = [g1(2 * k) for k in range(n)]
    check(feq(det_forms([dz_col] * n), fscale(factorial(n), dzeta_all(n)),
              S.F), "D_n(partial zeta) = n! d zeta, n = %d" % n)
section("P8")

# P9 (p. 5, Corollary 0.5; new correction prelim-5-closed-form): the printed
# statement, without closedness, fails for omega_1 = omega_2 = x dy on
# C = R^2 and the homologous circles |z| = 1, |z| = 2: by Stokes the
# integrals are pi r^2 (d(x dy) = dV; the ball integral scales as r^2).
# For a closed form, e.g. (x dy - y dx)/|z|^2 off 0, the integrals over
# |z| = 1 and |z| = 2 coincide (both 2 pi; on |z| = r the form equals
# (x dy - y dx)/r^2, and int_(|z|=r) (x dy - y dx) = 2 pi r^2).
S = Sp(1)
xdy = fscale((S.R(S.x[0]) + S.y[0]) / 2,
             fscale(1 / (2 * II), fsub(g1(0), g1(1))))
val_r1 = sphere_poly(S, xdy)                 # times pi, radius 1
check(val_r1 == 1, "p. 5: int_(|z| = 1) x dy = pi")
refuted(val_r1 * 1 ** 2 == val_r1 * 2 ** 2,
        "p. 5: Corollary 0.5 without closedness")
ydx = fscale((S.R(S.x[0]) - S.y[0]) / (2 * II),
             fscale(QQ(1) / 2, fadd(g1(0), g1(1))))
ang = fsub(xdy, ydx)
check(sphere_poly(S, ang) == 2, "p. 5: int_(|z| = r) (x dy - y dx) = "
      "2 pi r^2 (r = 1)")
check(fzero(S.d_zeta(fscale(1 / S.F(S.x[0] * S.y[0]), ang)), S.F),
      "p. 5: (x dy - y dx)/|z|^2 is closed")
section("P9")


# ---------------------------------------------------------------------------
# S1. §1, the Martinelli-Bochner representation (pp. 15-18,
# sec:martinelli-bochner).  The kernel (1.2) without its constant:
# eta(zeta - z) = sum (-1)^(k-1) (zetabar_k - zbar_k) dzetabar_[k] ^ dzeta,
# omega = (n-1)!/(2 pi i)^n eta / |zeta - z|^(2n).
# ---------------------------------------------------------------------------
def eta_form(S, w, n=None):
    """sum (-1)^(k-1) w_k dzetabar_[k] ^ dzeta (w a list of coefficients)."""
    n = S.n if n is None else n
    out = {}
    for k in range(n):
        out = fadd(out, fscale((-1) ** k * w[k],
                               wedge(dzetabar_omit(n, [k]), dzeta_all(n))))
    return out


def mb_form(S, at_zero=False):
    """eta(zeta - z) / |zeta - z|^(2n) (z = 0 if at_zero)."""
    n = S.n
    if at_zero:
        w = [S.y[k] for k in range(n)]
        den = S.F(sum(S.x[k] * S.y[k] for k in range(n))) ** n
    else:
        w = [S.y[k] - S.v[k] for k in range(n)]
        den = S.dist2 ** n
    return fscale(1 / den, eta_form(S, [S.F(c) for c in w]))


# S1.1 (p. 15, proof of Theorem 1.1, step 1): omega is closed in zeta off
# zeta = z, n = 1..4.
for n in range(1, 5):
    S = Sp(n)
    check(fzero(S.d_zeta(mb_form(S)), S.F), "p. 15: d omega = 0, n = %d" % n)

# S1.2 (p. 15-16, (1.3), steps 2-4): over the unit sphere about z = 0,
# (n-1)!/(2 pi i)^n int zeta^beta eta = [beta = 0], n = 1..3, |beta| <= 3
# (on |zeta| = 1 the denominator is 1; int over bB by Stokes, exact ball
# integrals).  The display of step 4: the three expressions all equal 1;
# the printed d zetabar ^ d zetabar (correction i-16-step-4-dzeta) is 0.
for n in range(1, 4):
    S = Sp(n)
    eta0 = eta_form(S, [S.R(S.y[k]) for k in range(n)])
    for beta in itertools.product(range(4), repeat=n):
        if sum(beta) > 3:
            continue
        mono = S.R(prod(S.x[k] ** beta[k] for k in range(n)))
        val = factorial(n - 1) / (2 * II) ** n * sphere_poly(
            S, fscale(mono, eta0))
        check(val == (1 if sum(beta) == 0 else 0),
              "p. 15: (1.3), n = %d, beta = %s" % (n, beta))
    top = wedge(dzetabar_all(n), dzeta_all(n))
    first = (factorial(n) / (2 * II) ** n
             * ball_top(S, fscale(S.R(1), top)))        # times pi^n / pi^n
    # second: n! 2^n int prod rho_k d rho_k over sum rho^2 < 1 (iterated)
    rhos = [SR.var("rho%d" % k) for k in range(n)]
    integrand = prod(rhos)
    for k in reversed(range(n)):
        upper = sqrt(1 - sum(rhos[j] ** 2 for j in range(k)))
        integrand = integrate(integrand, rhos[k], 0, upper)
    second = factorial(n) * 2 ** n * integrand
    third = factorial(n) * simplex_int((0,) * n)
    check(first == 1 and bool(second == 1) and third == 1,
          "p. 16: step 4 of the proof of Theorem 1.1, n = %d" % n)
    printed = wedge(dzetabar_all(n), dzetabar_all(n))
    refuted(factorial(n) / (2 * II) ** n * ball_top(S, printed) == 1,
            "p. 16: printed d zetabar ^ d zetabar, n = %d" % n)

# S1.3 (p. 16, step 3): under zeta_k -> c_k zeta_k, zetabar_k ->
# zetabar_k / c_k (|c_k| = 1) eta(zeta) is invariant, zeta^beta gets c^beta.
for n in range(1, 5):
    S = Sp(n, extra=["c%d" % k for k in range(n)])
    c = S.extra
    eta0 = eta_form(S, [S.F(S.y[k]) for k in range(n)])
    imgs = [S.F(g) for g in S.R.gens()]
    for k in range(n):
        imgs[k] = c[k] * S.x[k]
        imgs[n + k] = S.y[k] / c[k]
    out2 = {}
    for (A, B), co in eta0.items():
        fac = prod(c[g // 2] if g % 2 == 0 else 1 / S.F(c[g // 2])
                   for g in A)
        out2[(A, B)] = S.subs(co, imgs) * fac
    check(feq(out2, eta0, S.F), "p. 16: step 3 rotation invariance, %d" % n)
section("S1.1-3")

# S1.4 (p. 16, Lemma 1.3): d_zeta(f omega) = dbar f ^ omega for f with
# generic affine coefficients (first-order identity), n = 2, 3; and (1.4)
# exactly at z = 0 on the unit ball for f = zeta^a zetabar^b,
# |a| + |b| <= 3 (n = 2), <= 2 (n = 3): the volume integral has the
# integrable singularity |zeta|^(1-2n), computed in polar coordinates.
for n in (2, 3):
    names = ["f%d" % i for i in range(2 * n + 1)]
    S = Sp(n, extra=names)
    fz = S.extra[0] + sum(S.extra[1 + i] * w for i, w in
                          enumerate(list(S.x) + list(S.y)))
    om = mb_form(S)
    lhs = S.d_zeta(fscale(S.F(fz), om))
    rhs = wedge(S.dbar_zeta(fun(S.F(fz))), om)
    check(feq(lhs, rhs, S.F), "p. 16: d(f omega) = dbar f ^ omega, %d" % n)
    S = Sp(n)
    eta0 = eta_form(S, [S.R(S.y[k]) for k in range(n)])
    top_deg = 3 if n == 2 else 2
    for a in itertools.product(range(top_deg + 1), repeat=n):
        for b in itertools.product(range(top_deg + 1), repeat=n):
            if sum(a) + sum(b) > top_deg:
                continue
            f = S.R(prod(S.x[k] ** a[k] * S.y[k] ** b[k] for k in range(n)))
            bd = sphere_poly(S, fscale(f, eta0))
            vol = ball_top(S, wedge(S.dbar_zeta(fun(f)), eta0), n)
            val = factorial(n - 1) / (2 * II) ** n * (bd - vol)
            check(val == (1 if sum(a) + sum(b) == 0 else 0),
                  "p. 16: (1.4) at z = 0, n = %d, a = %s, b = %s"
                  % (n, a, b))
section("S1.4")

# S1.5 (p. 17, (1.7)): g = (1-n)^(-1) |zeta - z|^(2-2n):
# dg/dzeta_k = (zetabar_k - zbar_k)/|zeta - z|^(2n) (the coefficients of
# omega up to the constant and the sign (-1)^(k-1)), and g is harmonic.
for n in range(2, 6):
    S = Sp(n)
    gg = S.dist2 ** (1 - n) / (1 - n)
    check(all(gg.derivative(S.x[k]) == (S.y[k] - S.v[k]) / S.dist2 ** n
              for k in range(n)), "p. 17: (1.7) derivatives, n = %d" % n)
    check(sum(gg.derivative(S.x[k]).derivative(S.y[k]) for k in range(n))
          == 0, "p. 17: g harmonic, n = %d" % n)


# S1.6 (p. 18, (1.9)): with
# nu_f = (-1)^(n-1) (n-1)!/(2 pi i)^n sum (-1)^(k-1) f_zetabar_k
# dzeta_[k] ^ dzetabar, del g ^ nu_f = -dbar f ^ omega, and
# d(f omega + g nu_f) = g d nu_f, d nu_f = (-1)^(n-1) (n-1)!/(2 pi i)^n
# (sum f_zeta_k zetabar_k) dzeta ^ dzetabar; for generic quadratic f
# (second-order identity), z = 0, n = 2, 3; the constants (2 pi i)^n are
# common to all terms and omitted.
def nu_form(S, fz):
    n = S.n
    out = {}
    for k in range(n):
        out = fadd(out, fscale(S.F((-1) ** k * fz.derivative(S.y[k])),
                               wedge(dzeta_omit(n, [k]), dzetabar_all(n))))
    return fscale((-1) ** (n - 1) * factorial(n - 1), out)


for n in (2, 3):
    mons = [m for m in itertools.product(range(3), repeat=2 * n)
            if sum(m) <= 2]
    S = Sp(n, extra=["f%d" % i for i in range(len(mons))])
    xy = list(S.x) + list(S.y)
    fz = S.R(sum(S.extra[i] * prod(xy[j] ** m[j] for j in range(2 * n))
                 for i, m in enumerate(mons)))
    r2 = S.F(sum(S.x[k] * S.y[k] for k in range(n)))
    gg = r2 ** (1 - n) / (1 - n)
    om = fscale(factorial(n - 1), mb_form(S, at_zero=True))
    nu = nu_form(S, fz)
    check(feq(wedge(S.del_zeta(fun(gg)), nu),
              fscale(-1, wedge(S.dbar_zeta(fun(S.F(fz))), om)), S.F),
          "p. 18: del g ^ nu_f = -dbar f ^ omega, n = %d" % n)
    lap = sum(fz.derivative(S.x[k]).derivative(S.y[k]) for k in range(n))
    dnu = fscale(S.F((-1) ** (n - 1) * factorial(n - 1) * lap),
                 wedge(dzeta_all(n), dzetabar_all(n)))
    check(feq(S.d_zeta(nu), dnu, S.F), "p. 18: d nu_f, n = %d" % n)
    check(feq(S.d_zeta(fadd(fscale(S.F(fz), om), fscale(gg, nu))),
              fscale(gg, dnu), S.F),
          "p. 18: d(f omega + g nu_f) = g d nu_f, n = %d" % n)
section("S1.5-6")

# S1.7 (p. 18, proof of Theorem 1.2; new correction
# i-18-stokes-constant): d(fbar nu_f) = del fbar ^ nu_f (nu_f closed)
# = -(n-1)!/pi^n sum |df/dzetabar_k|^2 dV.  f with independent symbolic
# first derivatives (f = sum (a_k + i b_k) zetabar_k + (c_k + i d_k)
# zeta_k, a, b, c, d real), n = 1..4.  Printed: (2i)^n in place of
# -(n-1)!/pi^n.
for n in range(1, 5):
    names = sum([["a%d" % k, "b%d" % k, "c%d" % k, "d%d" % k]
                 for k in range(n)], [])
    S = Sp(n, extra=names)
    e = S.extra
    fz = sum((e[4 * k] + II * e[4 * k + 1]) * S.y[k]
             + (e[4 * k + 2] + II * e[4 * k + 3]) * S.x[k] for k in range(n))
    fbar = sum((e[4 * k] - II * e[4 * k + 1]) * S.x[k]
               + (e[4 * k + 2] - II * e[4 * k + 3]) * S.y[k]
               for k in range(n))
    form = wedge(S.del_zeta(fun(S.F(fbar))), nu_form(S, S.R(fz)))
    # nu_form omits 1/(2 pi i)^n; restore it: value = coef / (2 pi i)^n
    (A, _), co = list(form.items())[0]
    assert len(form) == 1
    coef = S.F(co) * top_factor(n, A)          # times dV
    sq = sum(e[4 * k] ** 2 + e[4 * k + 1] ** 2 for k in range(n))
    # coef / (2 pi i)^n = -(n-1)!/pi^n * sq  <=>  coef = -(n-1)! (2i)^n sq
    check(coef == -factorial(n - 1) * (2 * II) ** n * sq,
          "p. 18: d(fbar nu_f) = -(n-1)!/pi^n sum |f_zetabar|^2 dV, %d" % n)
    PP = SR.var("PP")
    lhs_c = SR(-factorial(n - 1)) / PP ** n
    refuted(bool(SR((2 * I) ** n) == lhs_c),
            "p. 18: printed constant (2i)^n, n = %d" % n)
section("S1.7")


# ---------------------------------------------------------------------------
# S2. §2, multiplicity and the Rouche principle (pp. 18-25,
# sec:rouche-principle).
# ---------------------------------------------------------------------------
def local_mult(polys, point=None):
    """dim of the local algebra O_a/(f) (Singular, local ordering)."""
    Rl = PolynomialRing(QQ, ["z%d" % (j + 1) for j in range(len(polys))],
                        order="negdegrevlex")
    zz = Rl.gens()
    if point is not None:
        imgs = [zz[j] + point[j] for j in range(len(zz))]
    else:
        imgs = list(zz)
    return Rl.ideal([p(*imgs) for p in polys]).vector_space_dimension()


Rz = PolynomialRing(QQ, "z1,z2")
z1, z2 = Rz.gens()
# S2.1 (p. 19, Example): (0, 0) is a zero of multiplicity 2 of
# (z_1, z_2^2 + z_1^2); for zeta_2 != zeta_1^2 the shifted system has the
# two zeros (zeta_1, +-s), s^2 = zeta_2 - zeta_1^2, with Jacobian 2 z_2 =
# +-2 s != 0.
check(local_mult([z1, z2 ** 2 + z1 ** 2]) == 2, "p. 19: Example, mult 2")
Rs = PolynomialRing(QQ, "c1,c2,s")
c1, c2, s_ = Rs.gens()
Qs = Rs.quotient(Rs.ideal([s_ ** 2 - (c2 - c1 ** 2)]))
for sg in (1, -1):
    pt = (c1, sg * s_)
    check(Qs(pt[0] - c1) == 0 and Qs(pt[1] ** 2 + pt[0] ** 2 - c2) == 0,
          "p. 19: Example, (zeta_1, %s s) is a zero" % sg)
    jac = matrix(Rs, [[1, 0], [2 * pt[0], 2 * pt[1]]]).det()
    check(Qs(jac ** 2) == Qs(4 * (c2 - c1 ** 2)),
          "p. 19: Example, Jacobian^2 = 4 (zeta_2 - zeta_1^2)")

# S2.2 (p. 21, proof of Lemma 2.7): omega(f, fbar) is closed off E_f for
# explicit holomorphic maps (n = 2, 3).
for fs in ([lambda x: x[0] ** 2 + x[1], lambda x: x[0] - x[1] ** 2
            + 3 * x[0] * x[1]],
           [lambda x: x[0] + x[1] * x[2], lambda x: x[1] ** 2 - x[0],
            lambda x: x[2] + 2 * x[0] ** 2]):
    n = len(fs)
    S = Sp(n)
    fz = [S.F(fs[j](S.x)) for j in range(n)]
    fb = [S.conj(c) for c in fz]
    df = wedges(*[S.del_zeta(fun(c)) for c in fz])
    tot = {}
    for j in range(n):
        dfb = wedges(*[S.dbar_zeta(fun(fb[k])) for k in range(n) if k != j])
        tot = fadd(tot, fscale((-1) ** j * fb[j], wedge(dfb, df)))
    norm2 = sum(fz[j] * fb[j] for j in range(n))
    om_f = fscale(1 / norm2 ** n, tot)
    check(fzero(S.d_zeta(om_f), S.F), "p. 21: omega(f, fbar) closed, n = %d"
          % n)

# S2.3 (p. 20, Remark; correction i-20-remark-absolute-values): the printed
# condition Re g_j < Re f_j is satisfied by f = z, g = -10 on the unit
# circle (Re g = -10 < -1 <= Re f) although f has one zero in the unit
# disc and f + g = z - 10 none; the corrected condition |Re g| < |Re f|
# fails for this pair.
Rt = PolynomialRing(QQ, "t")
tt = Rt.gen()
check(QQ(-10) < -1, "p. 20: Re g < Re f on the unit circle")
check(len([r for r, m in (tt).roots(QQbar) if abs(r) < 1]) == 1
      and len([r for r, m in (tt - 10).roots(QQbar) if abs(r) < 1]) == 0,
      "p. 20: f = z has one zero in the disc, f + g none")
refuted(len([r for r, m in (tt).roots(QQbar) if abs(r) < 1])
        == len([r for r, m in (tt - 10).roots(QQbar) if abs(r) < 1]),
        "p. 20: printed Remark (Re g < Re f) gives equal numbers of zeros")
check(not (abs(QQ(-10)) < 1), "p. 20: |Re g| < |Re f| fails at Re z = 1")
section("S2.1-3")


# S2.4 (p. 24, the display after (2.12); corrections
# i-24-imaginary-part-sign, i-24-exact-imaginary-part).  Real coordinates
# zeta_j = u_j + i v_j; generators du_j -> j, dv_j -> n + j (the book's
# orientation).  C = sum (-1)^(j-1) zetabar_j dzetabar_[j] ^ dzeta.
def real_d(Rf, f, gens_vars):
    out = {}
    for A, c in f.items():
        for gi, var in gens_vars:
            dc = c.derivative(var)
            if dc == 0:
                continue
            s, A2 = sort_sign((gi,) + A)
            if s == 0:
                continue
            out[A2] = out.get(A2, 0) + s * dc
    return {k: c for k, c in out.items() if c != 0}


def radd(*fs):
    out = {}
    for f in fs:
        for k, c in f.items():
            out[k] = out.get(k, 0) + c
    return {k: c for k, c in out.items() if c != 0}


def rscale(c, f):
    return {k: c * v for k, v in f.items() if c * v != 0}


def rwedges(*fs):
    r = {(): 1}
    for f in fs:
        r = sw(r, f)
    return r


for n in range(1, 5):
    Rr = PolynomialRing(K, ["u%d" % j for j in range(n)]
                        + ["v%d" % j for j in range(n)])
    Fr = Rr.fraction_field()
    uu = Rr.gens()[:n]
    vv = Rr.gens()[n:]
    du = [{(j,): Rr(1)} for j in range(n)]
    dv = [{(n + j,): Rr(1)} for j in range(n)]
    dzeta = [radd(du[j], rscale(II, dv[j])) for j in range(n)]
    dzbar = [radd(du[j], rscale(-II, dv[j])) for j in range(n)]
    C = {}
    for j in range(n):
        C = radd(C, rscale((-1) ** j * (uu[j] - II * vv[j]),
                           rwedges(*[dzbar[k] for k in range(n) if k != j],
                                   *dzeta)))
    dU = rwedges(*du)
    dV = rwedges(*dv)
    Rb = {}
    for j in range(n):
        Rb = radd(Rb, rscale((-1) ** j * uu[j],
                             sw(rwedges(*[du[k] for k in range(n) if k != j]),
                                dV)))
        Rb = radd(Rb, rscale((-1) ** (j + n) * vv[j],
                             sw(dU, rwedges(*[dv[k] for k in range(n)
                                              if k != j]))))

    def im_part(sign_shift):
        out = {}
        for j in range(n):
            out = radd(out, rscale((-1) ** (j + 1 + sign_shift) * vv[j],
                                   sw(rwedges(*[du[k] for k in range(n)
                                                if k != j]), dV)))
            out = radd(out, rscale((-1) ** (j + n) * uu[j],
                                   sw(dU, rwedges(*[dv[k] for k in range(n)
                                                    if k != j]))))
        return out
    Ic = im_part(0)          # (-1)^j for j = 1..n (index shifted by 1)
    Ip = im_part(1)          # printed (-1)^(j-1)
    # (n-1)!/(2 pi i)^n C = 1/Sigma_2n [R + i I], Sigma_2n = 2 pi^n/(n-1)!
    #   <=>  C = 2^(n-1) i^n (R + i I)
    target_c = rscale(2 ** (n - 1) * II ** n, radd(Rb, rscale(II, Ic)))
    target_p = rscale(2 ** (n - 1) * II ** n, radd(Rb, rscale(II, Ip)))
    check(radd(C, rscale(-1, target_c)) == {},
          "p. 24: real and imaginary parts, corrected sign, n = %d" % n)
    refuted(radd(C, rscale(-1, target_p)) == {},
            "p. 24: printed sign (-1)^(j-1) of the v_j-sum, n = %d" % n)
    # R is the solid-angle form sum (-1)^(j-1) x_j dx_[j], x = (u, v)
    xs = list(uu) + list(vv)
    solid = {}
    for j in range(2 * n):
        solid = radd(solid, rscale((-1) ** j * xs[j],
                                   rwedges(*[{(k,): Rr(1)} for k in
                                             range(2 * n) if k != j])))
    check(radd(Rb, rscale(-1, solid)) == {},
          "p. 24: the real part is the solid-angle form, n = %d" % n)
    if n >= 2:
        r2 = Fr(sum(uu[j] ** 2 + vv[j] ** 2 for j in range(n)))
        pot = {}
        for j in range(n):
            pot = radd(pot, sw(rwedges(*[du[k] for k in range(n) if k != j]),
                               rwedges(*[dv[k] for k in range(n)
                                         if k != j])))
        pot = rscale(1 / ((2 * n - 2) * r2 ** (n - 1)), pot)
        gv = [(j, uu[j]) for j in range(n)] + [(n + j, vv[j])
                                               for j in range(n)]
        dpot = real_d(Fr, pot, gv)
        lhs = rscale(1 / r2 ** n, Ic)
        check(radd(lhs, rscale(-(-1) ** (n - 1), dpot)) == {},
              "p. 24: Im / |zeta|^(2n) = (-1)^(n-1) d(...), n = %d" % n)
        refuted(radd(lhs, rscale(-1 / r2 ** n, dpot)) == {},
                "p. 24: printed 1/|zeta|^(2n) d(...), n = %d" % n)
# Sigma_m = m pi^(m/2)/Gamma(m/2 + 1) (p. 24) = m vol(B^m); for m = 2n it
# is 2 pi^n/(n-1)! (ball volume pi^n/n!); d of the solid-angle form is
# m dx, so its integral over the unit sphere is m vol(B^m) = Sigma_m.
for m in range(1, 11):
    Sig = m * pi ** (QQ(m) / 2) / gamma(QQ(m) / 2 + 1)
    check(bool(Sig == 2 * pi ** (QQ(m) / 2) / gamma(QQ(m) / 2)),
          "p. 24: Sigma_%d" % m)
    if m % 2 == 0:
        check(bool(Sig == 2 * pi ** (m // 2) / factorial(m // 2 - 1)),
              "p. 24: Sigma_2n = 2 pi^n/(n-1)!, m = %d" % m)
    Rr = PolynomialRing(QQ, ["x%d" % j for j in range(m)])
    xs = Rr.gens()
    solid = {}
    for j in range(m):
        solid = radd(solid, rscale((-1) ** j * xs[j],
                                   rwedges(*[{(k,): Rr(1)} for k in range(m)
                                             if k != j])))
    check(real_d(Rr, solid, list(enumerate(xs))) == {tuple(range(m)): m},
          "p. 24: d(solid-angle form) = m dx, m = %d" % m)
# the determinant form of (2.12): the pull-back of the solid-angle form by
# x(t) is det[x; dx/dt_1; ...; dx/dt_(m-1)] dt, m = 2, 3, x generic
# polynomial of degree <= 2 in t.
for m in (2, 3):
    tv = ["t%d" % l for l in range(m - 1)]
    mons = [e for e in itertools.product(range(3), repeat=m - 1)
            if sum(e) <= 2]
    cn = ["c%d_%d" % (j, i) for j in range(m) for i in range(len(mons))]
    Rr = PolynomialRing(QQ, tv + cn)
    ts = Rr.gens()[:m - 1]
    cs = Rr.gens()[m - 1:]
    xt = [sum(cs[j * len(mons) + i] * prod(ts[l] ** e[l] for l in
                                           range(m - 1))
              for i, e in enumerate(mons)) for j in range(m)]
    dxt = [{(l,): xt[j].derivative(ts[l]) for l in range(m - 1)}
           for j in range(m)]
    pull = {}
    for j in range(m):
        pull = radd(pull, rscale((-1) ** j * xt[j],
                                 rwedges(*[dxt[k] for k in range(m)
                                           if k != j])))
    M = matrix(Rr, [xt] + [[xt[j].derivative(ts[l]) for j in range(m)]
                           for l in range(m - 1)])
    check(pull == {tuple(range(m - 1)): M.det()},
          "p. 24: (2.12) as a determinant, m = %d" % m)
section("S2.4")

# ---------------------------------------------------------------------------
# S3. §3, the Leray-Koppelman formula (pp. 25-30, sec:leray-koppelman).
# ---------------------------------------------------------------------------
# S3.1 ((3.3), (3.6) and the proof of Corollary 3.6, p. 28): with
# independent generators du_j (2j) and df_j (2j + 1) and scalars u_j,
# (-1)^(n(n-1)/2) <u, df> ^ (sum du_j ^ df_j)^(n-1)
#   = (n-1)! sum (-1)^(k-1) u_k du_[k] ^ df,  n = 1..6;
# with u = w/<w, f>, the identity behind Omega(w, ..., w, f) = omega(f, w)
# and Omega(fbar, ..., fbar, f) = omega(f, fbar).
for n in range(1, 7):
    Ru = PolynomialRing(QQ, ["u%d" % j for j in range(n)])
    uu = Ru.gens()
    udf = {}
    for j in range(n):
        udf = fadd(udf, {((2 * j + 1,), ()): uu[j]})
    dud = {}
    for j in range(n):
        dud = fadd(dud, wedge(g1(2 * j), g1(2 * j + 1)))
    lhs = fscale((-1) ** (n * (n - 1) // 2), wedge(udf, wpow(dud, n - 1)))
    dfall = wedges(*[g1(2 * j + 1) for j in range(n)])
    rhs = {}
    for k in range(n):
        rhs = fadd(rhs, fscale((-1) ** k * uu[k] * factorial(n - 1),
                               wedge(wedges(*[g1(2 * j) for j in range(n)
                                              if j != k]), dfall)))
    check(fsub(lhs, rhs) == {}, "p. 28: Omega(u, ..., u) = (n-1)! sum, %d"
          % n)

# S3.2 ((3.8), p. 26): (3.3) in determinant form.  Generators dzbar_i (i)
# and df_k (n + k); u^(0)_k scalars, a^(j)_(k,i) = d u^(j)_k / d zbar_i
# and b^(j)_(k,l) the del-parts (combinations of the df_l, since
# df_1 ^ ... ^ df_n != 0); the b-terms drop out.  n = 2, 3.
for n in (2, 3):
    names = (["p%d" % k for k in range(n)]
             + ["a%d_%d_%d" % (j, k, i) for j in range(1, n)
                for k in range(n) for i in range(n)]
             + ["b%d_%d_%d" % (j, k, l) for j in range(1, n)
                for k in range(n) for l in range(n)])
    Ra = PolynomialRing(QQ, names)
    gens_ = dict(zip(names, Ra.gens()))
    u0 = [gens_["p%d" % k] for k in range(n)]
    A_ = lambda j, k, i: gens_["a%d_%d_%d" % (j, k, i)]
    B_ = lambda j, k, l: gens_["b%d_%d_%d" % (j, k, l)]
    lhs = {}
    for k in range(n):
        lhs = fadd(lhs, {((n + k,), ()): u0[k]})
    for j in range(1, n):
        fac = {}
        for k in range(n):
            duk = {}
            for i in range(n):
                duk = fadd(duk, {((i,), ()): A_(j, k, i)})
            for l in range(n):
                duk = fadd(duk, {((n + l,), ()): B_(j, k, l)})
            fac = fadd(fac, wedge(duk, g1(n + k)))
        lhs = wedge(lhs, fac)
    lhs = fscale((-1) ** (n * (n - 1) // 2), lhs)
    rhs = {}
    dfall = wedges(*[g1(n + k) for k in range(n)])
    for tup in itertools.permutations(range(n), n - 1):
        M = matrix(Ra, n, n, lambda r, c: u0[r] if c == 0
                   else A_(c, r, tup[c - 1]))
        rhs = fadd(rhs, fscale(M.det(), wedge(wedges(*[g1(i) for i in tup]),
                                              dfall)))
    check(fsub(lhs, rhs) == {}, "p. 26: (3.8) from (3.3), n = %d" % n)
section("S3.1-2")

# S3.3 (pp. 26, 28-29): eta(w) = sum (-1)^(k-1) w_k dw_[k] (zeta-
# differentials only) satisfies eta(lambda w) = lambda^n eta(w) for
# functions lambda, w_k with generic affine coefficients (first-order
# identity), n = 2, 3.  Hence Omega(w, ..., w, zeta - z) = omega(zeta - z,
# w) (u = w/<w, zeta - z>) and Omega(fbar, ..., fbar, f) = omega(f, fbar)
# (u = fbar/|f|^2) by S3.1.
for n in (2, 3):
    nv = 4 * n + 1
    names = ["l%d" % i for i in range(nv)] + ["w%d_%d" % (k, i)
                                             for k in range(n)
                                             for i in range(nv)]
    S = Sp(n, extra=names)
    allv = list(S.x) + list(S.y) + list(S.u) + list(S.v)

    def aff(prefix):
        cs = [S.extra[names.index("%s%d" % (prefix, i))] for i in range(nv)]
        return S.R(cs[0] + sum(cs[i + 1] * allv[i] for i in range(4 * n)))
    lam = aff("l")
    ww = [aff("w%d_" % k) for k in range(n)]

    def eta_w(wl):
        out = {}
        for k in range(n):
            out = fadd(out, fscale((-1) ** k * wl[k], wedges(
                *[S.d_zeta(fun(wl[j])) for j in range(n) if j != k])))
        return out
    check(feq(eta_w([lam * c for c in ww]), fscale(lam ** n, eta_w(ww)),
              S.F), "p. 28: eta(lambda w) = lambda^n eta(w), n = %d" % n)
# explicit check of Omega(fbar, ..., fbar, f) = omega(f, fbar) from (3.3)
# with u = fbar/|f|^2 (n = 2, 3, explicit polynomial maps)
for fs in ([lambda x: x[0] ** 2 + x[1], lambda x: x[0] - x[1] ** 2],
           [lambda x: x[0] + x[1] * x[2], lambda x: x[1] ** 2 - x[0],
            lambda x: x[2] + 2 * x[0] ** 2]):
    n = len(fs)
    S = Sp(n)
    fz = [S.F(fs[j](S.x)) for j in range(n)]
    fb = [S.conj(c) for c in fz]
    norm2 = sum(fz[j] * fb[j] for j in range(n))
    uu = [fb[j] / norm2 for j in range(n)]
    dfj = [S.d_zeta(fun(c)) for c in fz]
    udf = {}
    for j in range(n):
        udf = fadd(udf, fscale(uu[j], dfj[j]))
    Om = fscale((-1) ** (n * (n - 1) // 2),
                wedge(udf, wpow(S.d_zeta(udf), n - 1)))
    tot = {}
    for j in range(n):
        dfb = wedges(*[S.d_zeta(fun(fb[k])) for k in range(n) if k != j])
        tot = fadd(tot, fscale((-1) ** j * fb[j], wedge(dfb, wedges(*dfj))))
    om_f = fscale(factorial(n - 1) / norm2 ** n, tot)
    check(feq(Om, om_f, S.F), "p. 26: Omega(fbar, ..., fbar, f) = "
          "omega(f, fbar), n = %d" % n)

# S3.4 (p. 27, Lemma 3.3): n columns orthogonal to f != 0 have zero
# determinant (columns in the span of e_k f_1 - e_1 f_k), n = 2..4.
for n in range(2, 5):
    names = ["f%d" % k for k in range(n)] + ["y%d_%d" % (c, k)
                                             for c in range(n)
                                             for k in range(1, n)]
    Ry = PolynomialRing(QQ, names)
    ff = Ry.gens()[:n]
    ys = Ry.gens()[n:]
    basis = []
    for k in range(1, n):
        v_ = [Ry(0)] * n
        v_[k] = ff[0]
        v_[0] = -ff[k]
        basis.append(vector(Ry, v_))
    cols = [sum(ys[c * (n - 1) + k - 1] * basis[k - 1]
                for k in range(1, n)) for c in range(n)]
    check(all(sum(cols[c][k] * ff[k] for k in range(n)) == 0
              for c in range(n)) and matrix(Ry, cols).det() == 0,
          "p. 27: Lemma 3.3, n = %d" % n)
section("S3.3-4")


# S3.5 (p. 28, Corollary 3.6) and the Cauchy-Szego kernel of the ball:
# with w = zetabar on the unit sphere <w, zeta - z> = 1 - <z, zetabar>, and
#   int_bB zeta^beta omega(zeta - z, zetabar) = z^beta,
# n = 2 (|beta| <= 3), n = 3 (|beta| <= 2): the kernel is expanded in
# powers of <z, zetabar> (sum_m C(m+n-1, m) <z, zetabar>^m) and the terms
# m <= |beta| + 1 are integrated exactly (the other terms are orthogonal
# by the moments below).  Moments: (n-1)!/(2 pi i)^n int_bB zeta^b
# zetabar^c eta = [b = c] b! (n-1)!/(|b| + n - 1)!, |b|, |c| <= 3, n <= 3;
# so sum_b z^b zetabar^b (|b|+n-1)!/(b! (n-1)!) = (1 - <z, zetabar>)^(-n)
# is the Szego kernel of the ball for this measure (power series to
# degree 8).
def sphere_poly_z(S, f):
    """sphere_poly for coefficients polynomial in zeta, zetabar and z, zbar
    (z as parameters): returns a polynomial in u, v (times pi^n)."""
    n = S.n
    df = S.d_zeta(f)
    total = S.R(0)
    for (A, B), c in df.items():
        c = S.R(S.F(c).numerator()) / S.R(S.F(c).denominator())
        c = S.R(c)
        for coef, mono in zip(c.coefficients(), c.monomials()):
            e = mono.exponents()[0]
            a = tuple(e[0:n])
            b = tuple(e[n:2 * n])
            zpart = S.R(prod(S.u[j] ** e[2 * n + j] * S.v[j] ** e[3 * n + j]
                             for j in range(n)))
            total += (coef * top_factor(n, A) * ball_mono(a, b, 0)) * zpart
    return total


for n in (1, 2, 3):
    S = Sp(n)
    eta0 = eta_form(S, [S.R(S.y[k]) for k in range(n)])
    for b in itertools.product(range(4), repeat=n):
        for cc in itertools.product(range(4), repeat=n):
            if sum(b) > 3 or sum(cc) > 3:
                continue
            mono = S.R(prod(S.x[k] ** b[k] * S.y[k] ** cc[k]
                            for k in range(n)))
            val = factorial(n - 1) / (2 * II) ** n * sphere_poly(
                S, fscale(mono, eta0))
            exp_ = exact((prod(factorial(x) for x in b) * factorial(n - 1)
                          / factorial(sum(b) + n - 1)) if b == cc else QQ(0))
            check(exact(val) == exp_,
                  "sphere moments, n = %d, %s, %s" % (n, b, cc))
    if n == 1:
        continue
    top = 3 if n == 2 else 2
    zz = sum(S.u[j] * S.y[j] for j in range(n))
    for beta in itertools.product(range(top + 1), repeat=n):
        if sum(beta) > top:
            continue
        mono = S.R(prod(S.x[k] ** beta[k] for k in range(n)))
        tot = S.R(0)
        for m in range(sum(beta) + 2):
            term = binomial(m + n - 1, m) * mono * zz ** m
            tot += sphere_poly_z(S, fscale(S.R(term), eta0))
        val = factorial(n - 1) / (2 * II) ** n * tot
        check(val == prod(S.u[k] ** beta[k] for k in range(n)),
              "p. 28: Cauchy-Fantappie with w = zetabar on the ball, "
              "n = %d, beta = %s" % (n, beta))
for n in (1, 2, 3):
    Rp = PolynomialRing(QQ, ["s%d" % j for j in range(n)])
    sv = Rp.gens()
    N = 8
    series = exact(sum(factorial(sum(b) + n - 1)
                       / (prod(factorial(x) for x in b) * factorial(n - 1))
                       * prod(sv[j] ** b[j] for j in range(n))
                       for b in itertools.product(range(N + 1), repeat=n)
                       if sum(b) <= N))
    xs_ = sum(sv)
    trunc = sum(binomial(m + n - 1, m) * xs_ ** m for m in range(N + 1))
    check(series == trunc, "Szego kernel of the ball, n = %d" % n)
section("S3.5")


# ---------------------------------------------------------------------------
# S4. §4, the Cauchy formula and the logarithmic residue with respect to the
# skeleton (pp. 30-38, sec:cauchy-formula).
# ---------------------------------------------------------------------------
# S4.1 (pp. 30-32, (4.1), Corollary 4.2): on |z - a| = r, z = a + r e^(i th),
# int phi(z) dz/(z - a)^(al+1) = 2 pi i r^(-al) [t^al] phi(a + r t)
# (validated by exact integrals in th for al, b <= 2); hence for the torus
# alpha!/(2 pi i)^n int_T z^beta dz/(z - a)^(alpha + I) = D^alpha z^beta (a),
# a, r symbolic, n <= 3, alpha <= 2, beta <= 3 in each variable.
th, aa_, rr_ = SR.var("th aa_ rr_")
for al in range(3):
    for b in range(3):
        ex = integrate(((aa_ + rr_ * exp(I * th)) ** b * I * rr_ * exp(I * th)
                        / (rr_ * exp(I * th)) ** (al + 1)).expand(),
                       th, 0, 2 * pi)
        Rt = PolynomialRing(QQ, "aa_t,rr_t,t")
        at_, rt_, t_ = Rt.gens()
        coef = ((at_ + rt_ * t_) ** b).coefficient({t_: al})
        coef_sr = sum(c * aa_ ** m.degree(at_) * rr_ ** m.degree(rt_)
                      for c, m in zip(coef.coefficients(), coef.monomials()))
        expected = 2 * pi * I * SR(coef_sr) / rr_ ** al
        check(bool((ex - expected).simplify_full() == 0),
              "p. 30: circle integral formula, al = %d, b = %d" % (al, b))
for n in (1, 2, 3):
    Ra = PolynomialRing(QQ, ["a%d" % k for k in range(n)]
                        + ["r%d" % k for k in range(n)]
                        + ["t%d" % k for k in range(n)])
    av = Ra.gens()[:n]
    rv = Ra.gens()[n:2 * n]
    tv = Ra.gens()[2 * n:]
    Fa = Ra.fraction_field()
    for alpha in itertools.product(range(3), repeat=n):
        for beta in itertools.product(range(4), repeat=n):
            val = Fa(1)
            for k in range(n):
                poly = (av[k] + rv[k] * tv[k]) ** beta[k]
                cf = poly.coefficient({tv[k]: alpha[k]})
                cf = cf.subs({tv[k]: 0})
                val *= Fa(cf) / rv[k] ** alpha[k]
            val *= prod(factorial(x) for x in alpha)
            Dab = prod(falling_factorial(beta[k], alpha[k])
                       * av[k] ** (beta[k] - alpha[k]) if beta[k] >= alpha[k]
                       else 0 for k in range(n))
            check(val == Dab, "p. 32: Corollary 4.2, n = %d, alpha = %s, "
                  "beta = %s" % (n, alpha, beta))

# S4.2 (p. 32, (4.2)): on lambda_1 + ... + lambda_n = 1, in the coordinates
# lambda_1..lambda_(n-1), sum (-1)^(k-1) lambda_k dlambda_[k] =
# (-1)^(n-1) dlambda_1 ... dlambda_(n-1); the boundary orientation of this
# face of {sum lambda <= 1, lambda >= 0} is (-1)^(n-1) times the coordinate
# orientation (det[N, e_1 - e_n, ..., e_(n-1) - e_n] = (-1)^(n-1) n), so
# the integral is 1/(n-1)! = n vol(simplex) (Stokes), n = 2..7.
for n in range(2, 8):
    Rl = PolynomialRing(QQ, ["l%d" % k for k in range(n - 1)])
    lv = list(Rl.gens())
    lam = lv + [1 - sum(lv)]
    dl = [{(k,): Rl(1)} for k in range(n - 1)]
    dl.append({(k,): Rl(-1) for k in range(n - 1)})
    form = {}
    for k in range(n):
        form = radd(form, rscale((-1) ** k * lam[k],
                                 rwedges(*[dl[j] for j in range(n)
                                           if j != k])))
    check(form == {tuple(range(n - 1)): (-1) ** (n - 1)},
          "p. 32: (4.2) pulled back, n = %d" % n)
    Mn = matrix(QQ, n, n, lambda r, c: 1 if c == 0 else
                (1 if r == c - 1 else (-1 if r == n - 1 else 0)))
    check(Mn.det() == (-1) ** (n - 1) * n,
          "p. 32: (4.2) orientation, n = %d" % n)
    check((-1) ** (n - 1) * (-1) ** (n - 1) * simplex_int((0,) * (n - 1))
          == QQ(1) / factorial(n - 1) == n * simplex_int((0,) * n),
          "p. 32: (4.2) value, n = %d" % n)

# S4.3 (pp. 31-32, proof of Theorem 4.1): with u_k = lambda_k/(z_k - a_k),
# sum (-1)^(k-1) u_k du_[k] ^ dz
#   = sum (-1)^(k-1) lambda_k dlambda_[k] ^ dz / prod (z_k - a_k),
# generators dlambda_k (2k + 1), dz_k (2k); n = 2..4.
for n in range(2, 5):
    Rq = PolynomialRing(QQ, ["l%d" % k for k in range(n)]
                        + ["z%d" % k for k in range(n)]
                        + ["a%d" % k for k in range(n)])
    Fq = Rq.fraction_field()
    lv = Rq.gens()[:n]
    zv = Rq.gens()[n:2 * n]
    av = Rq.gens()[2 * n:]
    table = ([(lv[k], 1, 2 * k + 1) for k in range(n)]
             + [(zv[k], 1, 2 * k) for k in range(n)])
    uk = [Fq(lv[k]) / (zv[k] - av[k]) for k in range(n)]
    du = [oper(fun(uk[k]), table, Fq) for k in range(n)]
    dz = wedges(*[g1(2 * k) for k in range(n)])
    lhs = {}
    for k in range(n):
        lhs = fadd(lhs, fscale((-1) ** k * uk[k],
                               wedge(wedges(*[du[j] for j in range(n)
                                              if j != k]), dz)))
    rhs = {}
    for k in range(n):
        rhs = fadd(rhs, fscale(Fq((-1) ** k * lv[k]), wedge(
            wedges(*[g1(2 * j + 1) for j in range(n) if j != k]), dz)))
    rhs = fscale(1 / prod(zv[k] - av[k] for k in range(n)), rhs)
    check(feq(lhs, rhs, Fq), "p. 31: u on beta_(1...n), n = %d" % n)
section("S4.1-3")

# S4.4 (p. 36, Example after Theorem 4.8; correction i-36-example-origin):
# w_1 = z_1 - z_2^2, w_2 = z_1^2 - z_2^3.  Zeros (0, 0) (multiplicity 3)
# and (1, 1) (simple), 4 in all; the printed point (0, 1) is not a zero.
# On Gamma = {|z_1| = e^7, |z_2| = e^4}, 0 < e < 1: |z_2|^2 < |z_1|,
# |z_1|^2 < |z_2|^3; the Jacobian form; the inner residue at
# z_1 = z_2^2 (|z_2^2| = e^8 < e^7; the poles z_1 = +-z_2^(3/2) have modulus
# e^6 > e^7) and the outer residue 3 at z_2 = 0 (z_2 = 1 is outside).
f1 = z1 - z2 ** 2
f2 = z1 ** 2 - z2 ** 3
check(local_mult([f1, f2]) == 3, "p. 36: multiplicity at (0, 0) is 3")
check(local_mult([f1, f2], (1, 1)) == 1, "p. 36: (1, 1) is a simple zero")
check(Rz.ideal([f1, f2]).vector_space_dimension() == 4,
      "p. 36: 4 zeros with multiplicities")
check(sorted((p[z1], p[z2]) for p in Rz.ideal([f1, f2]).variety(QQbar))
      == [(0, 0), (1, 1)], "p. 36: the zero set")
refuted(f1(0, 1) == 0 and f2(0, 1) == 0, "p. 36: printed point (0, 1)")
Re_ = PolynomialRing(QQ, "e")
e_ = Re_.gen()
check(e_ ** 7 - e_ ** 8 == e_ ** 7 * (1 - e_)
      and e_ ** 12 - e_ ** 14 == e_ ** 12 * (1 - e_) * (1 + e_),
      "p. 36: the inequalities on Gamma for 0 < e < 1")
jac = f1.derivative(z1) * f2.derivative(z2) - f1.derivative(z2) * \
    f2.derivative(z1)
check(jac == -3 * z2 ** 2 + 4 * z1 * z2, "p. 36: d w_1 ^ d w_2")
Fz2 = FractionField(PolynomialRing(QQ, "z2"))
zz2 = Fz2.gen()
# inner residue at the simple pole z_1 = z_2^2 of jac/(f1 f2)
inner = Fz2(jac(zz2 ** 2, zz2)) / Fz2(f2(zz2 ** 2, zz2))
check(f1(zz2 ** 2, zz2) == 0 and f1.derivative(z1) == 1,
      "p. 36: z_1 = z_2^2 is a simple pole in z_1")
check(e_ ** 6 - e_ ** 7 == e_ ** 6 * (1 - e_),
      "p. 36: |z_2|^(3/2) = e^6 > e^7: the other poles are outside")
check(inner == Fz2(-3 * zz2 ** 2 + 4 * zz2 ** 3) / (zz2 ** 4 - zz2 ** 3),
      "p. 36: the inner residue")
Lz = LaurentSeriesRing(QQ, "s")
sz = Lz.gen()
outer = (-3 * sz ** 2 + 4 * sz ** 3) / (sz ** 4 - sz ** 3)
check(outer.residue() == 3, "p. 36: m = 3")
check(Fz2(-3 + 4 * zz2) / (zz2 * (zz2 - 1)) == inner,
      "p. 36: outer integrand")

# S4.5 (p. 37, Theorem 4.13, Yuzhakov and Kuprikov; new correction
# i-37-yuzhakov-kuprikov-sign).  Generators df_j (2j), dfbar_j (2j + 1);
# f_j, fbar_j independent.  The printed kernel without 1/(2 pi i)^n:
# K = (n-p-1)! (-1)^q sum (-1)^(al_0 - 1) fbar_al_0 ... fbar_al_p
#     dfbar_[al_0..al_p] ^ df / (|f_1|^2 + ... + |f_(n-p-1)|^2
#     + |f_(n-p)|^2 ... |f_n|^2)^(n-p),
# summed over al_0 < al_1 < ... < al_p, al_0 <= n - p <= al_1.
#  p = 0: K = (-1)^(n(n-1)/2) omega(f, fbar) (n <= 5): with Gamma_(2n-1) =
#   bD (oriented as in the Preliminaries) Theorem 3.1 gives 1 for f = z
#   on the unit ball (S1.2), the printed theorem (-1)^(n(n-1)/2); refuted
#   for n = 2, 3, as stated in the book ("Theorem 3.1 ... is the case
#   p = 0").
#  p = n - 1: K = df/f (Theorem 4.6), n <= 5.
#  0 < p < n - 1 (n = 3, 4, 5): on Gamma (|f_j| = e for j > n - p, so
#   fbar_j = e^2/f_j, dfbar_j = -e^2 df_j/f_j^2) the printed K equals
#   (-1)^q MB_(n-p)(f_1, ..., f_(n-p-1), e^p f_(n-p)) ^ prod_(j > n-p)
#   df_j/f_j (the terms with al_1 = n - p vanish there), i.e. the product of
#   a Martinelli-Bochner kernel of a rescaled map and Cauchy kernels; the
#   former integrates to 1 over the boundary of its ellipsoid
#   {|w'|^2 + c^2 |w_m|^2 < 1} (Stokes and vol = pi^m/(m! c^2)), m <= 3.
#   With Gamma oriented as the product (boundary of the Martinelli-
#   Bochner factor) x (torus), which gives bD for p = 0 and the
#   orientation of the proof of Theorem 4.6 for p = n - 1, the factor
#   (-1)^q must be dropped.
def yk_kernel(n, p, Rf, fv, gv, with_sign=True):
    q = (n - p) * (n - p - 1) // 2
    m = n - p
    out = {}
    dfall = wedges(*[g1(2 * j) for j in range(n)])
    for tup in itertools.combinations(range(1, n + 1), p + 1):
        a0 = tup[0]
        if not (1 <= a0 <= m):
            continue
        if p >= 1 and tup[1] < m:
            continue
        coef = (-1) ** (a0 - 1) * prod(gv[a - 1] for a in tup)
        dfb = wedges(*[g1(2 * (j - 1) + 1) for j in range(1, n + 1)
                       if j not in tup])
        out = fadd(out, fscale(coef, wedge(dfb, dfall)))
    den = (sum(fv[j] * gv[j] for j in range(m - 1))
           + prod(fv[j] * gv[j] for j in range(m - 1, n))) ** m
    sgn = (-1) ** q if with_sign else 1
    return fscale(sgn * factorial(m - 1) / Rf(den), out)


def mb_gen(n, fv, gv, Rf):
    """(n-1)! sum (-1)^(k-1) gbar_k dgbar_[k] ^ df / |f|^(2n) in the
    generators df_j, dfbar_j (no 1/(2 pi i)^n)."""
    out = {}
    dfall = wedges(*[g1(2 * j) for j in range(n)])
    for k in range(n):
        dfb = wedges(*[g1(2 * j + 1) for j in range(n) if j != k])
        out = fadd(out, fscale((-1) ** k * gv[k], wedge(dfb, dfall)))
    nrm = sum(fv[j] * gv[j] for j in range(n))
    return fscale(factorial(n - 1) / Rf(nrm) ** n, out)


for n in range(2, 6):
    Rf = PolynomialRing(QQ, ["f%d" % j for j in range(n)]
                        + ["g%d" % j for j in range(n)] + ["e"])
    Ff = Rf.fraction_field()
    fv = Rf.gens()[:n]
    gv = Rf.gens()[n:2 * n]
    ee = Rf.gens()[2 * n]
    K0 = yk_kernel(n, 0, Ff, fv, gv)
    MB = mb_gen(n, fv, gv, Ff)
    check(feq(K0, fscale((-1) ** (n * (n - 1) // 2), MB), Ff),
          "p. 37: Theorem 4.13, p = 0: K = (-1)^q omega(f, fbar), n = %d" % n)
    if (n * (n - 1) // 2) % 2 == 1:
        refuted((-1) ** (n * (n - 1) // 2) == 1,
                "p. 37: Theorem 4.13 with (-1)^q, p = 0, n = %d, against "
                "Theorem 3.1" % n)
    check(feq(yk_kernel(n, 0, Ff, fv, gv, with_sign=False), MB, Ff),
          "p. 37: Theorem 4.13 without (-1)^q, p = 0, n = %d" % n)
    Kn = yk_kernel(n, n - 1, Ff, fv, gv)
    dlog = wedges(*[g1(2 * j, 1 / Ff(fv[j])) for j in range(n)])
    check(feq(Kn, dlog, Ff), "p. 37: Theorem 4.13, p = n - 1, n = %d" % n)
    for p in range(1, n - 1):
        m = n - p
        q = m * (m - 1) // 2
        Kp = yk_kernel(n, p, Ff, fv, gv)
        # restriction to Gamma
        imgs = list(Ff(x) for x in Rf.gens())
        for j in range(m, n):
            imgs[n + j] = ee ** 2 / Ff(fv[j])
        res = {}
        for (A, B), c in Kp.items():
            cc = Ff(c)
            cc = Ff(cc.numerator()(*imgs)) / Ff(cc.denominator()(*imgs))
            term = {((), ()): cc}
            for gen in A:
                j = gen // 2
                if gen % 2 == 1 and j >= m:
                    term = wedge(term, g1(2 * j, -ee ** 2 / Ff(fv[j]) ** 2))
                else:
                    term = wedge(term, g1(gen))
            res = fadd(res, term)
        # expected: (-1)^q MB_m(f_1..f_(m-1), e^p f_m) ^ prod df_j/f_j
        gf = [Ff(fv[j]) for j in range(m - 1)] + [ee ** p * Ff(fv[m - 1])]
        gg = [Ff(gv[j]) for j in range(m - 1)] + [ee ** p * Ff(gv[m - 1])]
        out = {}
        dG = wedges(*[g1(2 * j) for j in range(m)])
        dG = fscale(ee ** p, dG)
        for k in range(m):
            dgb = wedges(*[g1(2 * j + 1, ee ** p if j == m - 1 else 1)
                           for j in range(m) if j != k])
            out = fadd(out, fscale((-1) ** k * gg[k], wedge(dgb, dG)))
        nrm = sum(gf[j] * gg[j] for j in range(m))
        MBm = fscale(factorial(m - 1) / nrm ** m, out)
        cauchy = wedges(*[g1(2 * j, 1 / Ff(fv[j])) for j in range(m, n)])
        expect = fscale((-1) ** q, wedge(MBm, cauchy))
        check(feq(res, expect, Ff), "p. 37: Theorem 4.13 on Gamma, n = %d, "
              "p = %d" % (n, p))
# the rescaled Martinelli-Bochner kernel over the boundary of its
# ellipsoid E = {|w'|^2 + c^2 |w_m|^2 < 1}: (m-1)!/(2 pi i)^m int_bE
# eta(G) ^ dG, G = (w_1, ..., c w_m); by Stokes = (m-1)!/(2 pi i)^m
# int_E d(...) with d(eta(G) ^ dG) = m c^2 dwbar ^ dw, and
# int_E dwbar ^ dw = (2i)^m vol(E), vol(E) = pi^m/(m! c^2).
for m in range(1, 4):
    S = Sp(m, extra=["c"])
    cpar = S.extra[0]
    Gb = [S.R(S.y[j]) for j in range(m - 1)] + [cpar * S.y[m - 1]]
    eta_G = {}
    dG = fscale(cpar, dzeta_all(m))
    for k in range(m):
        dgb = wedges(*[S.dbar_zeta(fun(Gb[j])) for j in range(m) if j != k])
        eta_G = fadd(eta_G, fscale((-1) ** k * Gb[k], wedge(dgb, dG)))
    dform = S.d_zeta(eta_G)
    top = wedge(dzetabar_all(m), dzeta_all(m))
    check(feq(dform, fscale(m * cpar ** 2, top), S.F),
          "p. 37: d(eta(G) ^ dG) = m c^2 dwbar dw, m = %d" % m)
    A = list(top.keys())[0][0]
    # (m-1)!/(2 pi i)^m * m c^2 * top_factor * pi^m/(m! c^2) = 1
    val = (factorial(m - 1) / (2 * II) ** m * m * top[(A, ())]
           * top_factor(m, A) / factorial(m))
    check(val == 1, "p. 37: rescaled kernel integrates to 1, m = %d" % m)

section("S4.4-5")


# ---------------------------------------------------------------------------
# S5. §5, the Andreotti-Norguet formula (pp. 38-42, sec:andreotti-norguet).
# eta_alpha(w) = sum (-1)^(k-1) w_k^(alpha_k+1) d(w^(alpha+I))_[k] ^ dzeta;
# omega_alpha(f, w) = (n-1)! alpha!/(2 pi i)^n eta_alpha(w) ^ df /
# <w^(alpha+I), f^(alpha+I)>^n (corrected denominator,
# i-38-andreotti-norguet-denominator); printed: <w, f^(alpha+I)>^n.
# ---------------------------------------------------------------------------
def mfact(alpha):
    return prod(factorial(a) for a in alpha)


def eta_alpha(S, w, alpha):
    n = S.n
    W = [w[k] ** (alpha[k] + 1) for k in range(n)]
    out = {}
    for k in range(n):
        dW = wedges(*[S.d_zeta(fun(W[j])) for j in range(n) if j != k])
        out = fadd(out, fscale((-1) ** k * W[k], wedge(dW, dzeta_all(n))))
    return out


# S5.1 (n = 1, p. 38): corrected omega_alpha(zeta, zetabar) =
# alpha! dzeta/(2 pi i zeta^(alpha+1)); printed alpha! zetabar^alpha
# dzeta/(2 pi i zeta^(alpha+1)), on |zeta| = r equal to
# alpha! r^(2 alpha) dzeta/(2 pi i zeta^(2 alpha+1)).  Integrals of
# phi = zeta^beta over |zeta| = r (S4.1): corrected alpha! [beta = alpha]
# = D^alpha phi(0); printed alpha! r^(2 alpha) [beta = 2 alpha].
S = Sp(1)
for al in range(5):
    corr = S.F(S.y[0] ** (al + 1)) / (S.x[0] * S.y[0]) ** (al + 1)
    check(corr == 1 / S.F(S.x[0]) ** (al + 1),
          "p. 38: omega_alpha for n = 1, alpha = %d" % al)
    prin = S.F(S.y[0] ** (al + 1)) / (S.y[0] * S.x[0] ** (al + 1))
    check(prin == S.F(S.y[0] ** al) / S.x[0] ** (al + 1),
          "p. 38: printed omega_alpha for n = 1, alpha = %d" % al)
    for beta in range(2 * al + 3):
        corr_val = factorial(al) * (1 if beta == al else 0)
        prin_val = factorial(al) * (1 if beta == 2 * al else 0)  # times r^2al
        check(corr_val == exact(factorial(beta) / factorial(beta - al)
                                * (1 if beta == al else 0)
                                if beta >= al else QQ(0)),
              "p. 38: (5.1), n = 1, alpha = %d, beta = %d" % (al, beta))
        if beta == al and al >= 1:
            refuted(prin_val == corr_val,
                    "p. 38: printed denominator, n = 1, alpha = %d" % al)


# S5.2 (pp. 38-39, (5.2), step 4): n = 2, 3, z = 0, on the generalized
# sphere sum |zeta_k|^(2(alpha_k+1)) = 1 the corrected denominator is 1;
# by Stokes the integral is over the generalized ball B^(alpha+I) of
# d(zeta^beta eta_alpha).  int over B^(alpha+I) of zeta^a zetabar^b dV =
# [a = b] (2 pi)^n Rad(a), Rad(a) = int prod rho_k^(2 a_k + 1) d rho over
# sum rho_k^(2(alpha_k+1)) < 1 = prod 1/(2(alpha_k + 1)) * prod
# Gamma(s_k)/Gamma(sum s + 1), s_k = (a_k + 1)/(alpha_k + 1) (validated by
# iterated exact integrals for n = 2).  Result: (n-1)! alpha!/(2 pi i)^n
# int zeta^beta eta_alpha = alpha! [beta = alpha], beta <= 3 entrywise.
def rad(alpha, a):
    s = [QQ(a[k] + 1) / (alpha[k] + 1) for k in range(len(a))]
    return (prod(QQ(1) / (2 * (alpha[k] + 1)) for k in range(len(a)))
            * prod(gamma(x) for x in s) / gamma(sum(s) + 1))


r1, r2 = SR.var("r1 r2")
for alpha in [(0, 0), (1, 0), (0, 2), (2, 1)]:
    for a in [(0, 0), (1, 0), (1, 2), (2, 1)]:
        inner = integrate(r2 ** (2 * a[1] + 1), r2, 0,
                          (1 - r1 ** (2 * alpha[0] + 2))
                          ** (QQ(1) / (2 * alpha[1] + 2)))
        val = integrate(r1 ** (2 * a[0] + 1) * inner, r1, 0, 1)
        check(bool((val - rad(alpha, a)).simplify_full() == 0),
              "generalized ball radial integral %s %s" % (alpha, a))


def ksr(c):
    """An element a + b i of Q(i) as a symbolic expression."""
    c = K(c)
    return SR(QQ(c[0])) + I * SR(QQ(c[1]))


def gball_top(S, f, alpha):
    """int over B^(alpha+I) of a top-degree zeta-form with polynomial
    coefficients, divided by (2 pi)^n."""
    n = S.n
    tot = SR(0)
    for (A, B), c in f.items():
        num = S.R(S.F(c).numerator())
        assert S.F(c).denominator() == 1
        for coef, mono in zip(num.coefficients(), num.monomials()):
            e = mono.exponents()[0]
            a = tuple(e[0:n])
            b = tuple(e[n:2 * n])
            if a != b:
                continue
            tot += ksr(coef * top_factor(n, A)) * rad(alpha, a)
    return tot


for n, alphas in ((2, [(0, 0), (1, 0), (0, 1), (1, 1), (2, 0), (2, 1)]),
                  (3, [(1, 0, 0), (0, 1, 1)])):
    S = Sp(n)
    top_beta = 3 if n == 2 else 2
    for alpha in alphas:
        eta_a = eta_alpha(S, [S.R(S.y[k]) for k in range(n)], alpha)
        for beta in itertools.product(range(top_beta + 1), repeat=n):
            mono = S.R(prod(S.x[k] ** beta[k] for k in range(n)))
            dform = S.d_zeta(fscale(mono, eta_a))
            val = (factorial(n - 1) * mfact(alpha) / I ** n
                   * gball_top(S, dform, alpha))
            exp_ = mfact(alpha) if tuple(beta) == tuple(alpha) else 0
            check(bool(val == exp_), "p. 38: (5.1) on the generalized "
                  "sphere, alpha = %s, beta = %s" % (alpha, beta))
        # step 4: the three expressions equal 1
        top = wedge(dzetabar_all(n), dzeta_all(n))
        A = list(top.keys())[0][0]
        aI = prod(x + 1 for x in alpha)
        first = (factorial(n) * aI / I ** n
                 * ksr(top[(A, ())] * top_factor(n, A)) * rad(alpha, alpha))
        second = factorial(n) * aI * 2 ** n * rad(alpha, alpha)
        third = factorial(n) * simplex_int((0,) * n)
        check(bool(first == 1) and bool(second == 1) and third == 1,
              "p. 39: step 4 of the proof of Theorem 5.1, %s" % (alpha,))
section("S5.1-2")

# S5.3 (p. 38, step 1): the corrected omega_alpha(zeta - z, zetabar - zbar)
# is closed off zeta = z (n = 2: alpha = (1, 0), (1, 1), (2, 1); n = 3:
# alpha = (1, 0, 0)); the form with the printed denominator
# <zetabar - zbar, (zeta - z)^(alpha+I)>^n is not closed (n = 2,
# alpha = (1, 0), z = 0).
for n, alpha in ((2, (1, 0)), (2, (1, 1)), (2, (2, 1)), (3, (1, 0, 0))):
    S = Sp(n)
    w = [S.F(S.y[k] - S.v[k]) for k in range(n)]
    f = [S.F(S.x[k] - S.u[k]) for k in range(n)]
    den = sum((w[k] * f[k]) ** (alpha[k] + 1) for k in range(n)) ** n
    ker = fscale(1 / den, eta_alpha(S, w, alpha))
    check(fzero(S.d_zeta(ker), S.F),
          "p. 38: omega_alpha closed, alpha = %s" % (alpha,))
S = Sp(2)
alpha = (1, 0)
w = [S.F(S.y[k]) for k in range(2)]
f = [S.F(S.x[k]) for k in range(2)]
den_p = sum(w[k] * f[k] ** (alpha[k] + 1) for k in range(2)) ** 2
refuted(fzero(S.d_zeta(fscale(1 / den_p, eta_alpha(S, w, alpha))), S.F),
        "p. 38: the printed omega_alpha is closed, alpha = (1, 0)")

# S5.4 (pp. 39-40, Theorem 5.2; new correction
# i-39-andreotti-norguet-fantappie-condition): n = 2, alpha = (1, 0),
# z = 0, |zeta| = 1.  (i) w = zetabar (the case of Theorem 5.1): the printed
# condition <w, zeta^(alpha+I)> = |zeta_1|^2 zeta_1 + |zeta_2|^2 vanishes at
# zeta_1 = -s, |zeta_2| = s^(3/2), s^3 + s^2 = 1, while the corrected
# <w^(alpha+I), zeta^(alpha+I)> = |zeta_1|^4 + |zeta_2|^2 does not; (ii)
# w = (zetabar_1^2, zetabar_2): the printed condition |zeta_1|^4 +
# |zeta_2|^2 != 0 holds on the sphere, but the denominator of
# omega_alpha(zeta, w), <w^(alpha+I), zeta^(alpha+I)> = zetabar_1^4
# zeta_1^2 + |zeta_2|^2, vanishes at zeta_1 = i s, |zeta_2| = s^3,
# s^6 + s^2 = 1.  (iii) On the cycle gamma of the proof, v' =
# W/<W, F> with W = w^(alpha+I) gives sum (-1)^(k-1) v'_k dv'_[k] ^ dzeta =
# eta(W) ^ dzeta/<W, F>^n, the form of omega_alpha(zeta, w); the printed
# v' = w/<w, F> gives another form (w = zetabar).
Rs1 = PolynomialRing(QQ, "s")
sv = Rs1.gen()
s0 = [r for r in (sv ** 3 + sv ** 2 - 1).roots(AA, multiplicities=False)
      if 0 < r < 1][0]
zt1 = -s0
zt2 = AA(s0) ** (QQ(3) / 2)
check(zt1 ** 2 + zt2 ** 2 == 1, "p. 39: the point is on the sphere (i)")
check(abs(zt1) ** 2 * zt1 + abs(zt2) ** 2 == 0,
      "p. 39: printed condition fails for w = zetabar")
check(abs(zt1) ** 4 + abs(zt2) ** 2 != 0,
      "p. 39: corrected condition holds for w = zetabar")
s1 = [r for r in (sv ** 6 + sv ** 2 - 1).roots(AA, multiplicities=False)
      if 0 < r < 1][0]
q1 = QQbar(I) * s1
q2 = QQbar(s1) ** 3
check(abs(q1) ** 2 + abs(q2) ** 2 == 1, "p. 39: the point is on the sphere "
      "(ii)")
check(q1.conjugate() ** 4 * q1 ** 2 + abs(q2) ** 2 == 0,
      "p. 39: denominator of omega_alpha(zeta, w) vanishes, w = "
      "(zetabar_1^2, zetabar_2)")
check(abs(q1) ** 4 + abs(q2) ** 2 > 0, "p. 39: printed condition holds there")
S = Sp(2)
F_ = [S.F(S.x[0]) ** 2, S.F(S.x[1])]
for which in ("corrected", "printed"):
    wv = [S.F(S.y[0]), S.F(S.y[1])]
    Wv = [wv[0] ** 2, wv[1]] if which == "corrected" else wv
    hh = Wv[0] * F_[0] + Wv[1] * F_[1]
    vp = [c / hh for c in Wv]
    form = {}
    for k in range(2):
        form = fadd(form, fscale((-1) ** k * vp[k], wedge(
            S.d_zeta(fun(vp[1 - k])), dzeta_all(2))))
    target = fscale(1 / (S.F(S.y[0] ** 2 * S.x[0] ** 2 + S.y[1] * S.x[1])
                         ** 2), eta_alpha(S, wv, (1, 0)))
    if which == "corrected":
        check(feq(form, target, S.F), "p. 40: gamma with v' = w^(alpha+I)/"
              "<w^(alpha+I), F> carries omega_alpha(zeta, w)")
    else:
        refuted(feq(form, target, S.F), "p. 40: printed v' = w/<w, F>")
section("S5.3-4")


# S5.5 (p. 40, Omega_alpha; new correction i-40-omega-alpha-kernel):
# corrected Omega_alpha = alpha! (-1)^(n(n-1)/2)/(2 pi i)^n
# <w^0, df>/<w^0, f^(alpha+I)> ^ d(<w^1, df>/<w^1, f^(alpha+I)>) ^ ...;
# printed: no alpha!, denominators <w^j, f^(alpha)>.  n = 1: the printed
# kernel is dzeta/(2 pi i zeta^alpha), whose integral against zeta^beta is
# [beta = alpha - 1] (0 for alpha = 0), not D^alpha zeta^beta (0) =
# alpha! [beta = alpha]; the corrected one is alpha! dzeta/(2 pi i
# zeta^(alpha+1)).  n = 2, 3: for w^j = zetabar^(alpha+I) the corrected
# Omega_alpha(w^0, ..., zeta) equals omega_alpha(zeta, zetabar) (so (5.1) is
# a case of (5.5)), the printed one does not.
for al in range(5):
    for beta in range(al + 2):
        prin = 1 if beta == al - 1 else 0
        corr = factorial(al) if beta == al else 0
        Dab = factorial(al) if beta == al else 0
        check(corr == Dab, "p. 40: corrected Omega_alpha, n = 1, alpha = %d, "
              "beta = %d" % (al, beta))
        if beta == al:
            refuted(prin == Dab, "p. 40: printed Omega_alpha, n = 1, "
                    "alpha = %d" % al)


def Omega_alpha(S, wlist, f, alpha, printed=False):
    n = S.n
    shift = 0 if printed else 1
    out = None
    for j, w in enumerate(wlist):
        den = sum(w[k] * f[k] ** (alpha[k] + shift) for k in range(n))
        num = {}
        for k in range(n):
            num = fadd(num, fscale(w[k], S.d_zeta(fun(f[k]))))
        fac = fscale(1 / den, num)
        if j > 0:
            fac = S.d_zeta(fac)
        out = fac if out is None else wedge(out, fac)
    c = (-1) ** (n * (n - 1) // 2) * (1 if printed else mfact(alpha))
    return fscale(c, out)


for n, alpha in ((2, (1, 0)), (2, (1, 1)), (2, (2, 0)), (3, (1, 0, 0))):
    S = Sp(n)
    W0 = [S.F(S.y[k]) ** (alpha[k] + 1) for k in range(n)]
    f = [S.F(S.x[k]) for k in range(n)]
    den = sum(S.F(S.x[k] * S.y[k]) ** (alpha[k] + 1) for k in range(n)) ** n
    om_a = fscale(factorial(n - 1) * mfact(alpha) / den,
                  eta_alpha(S, [S.F(S.y[k]) for k in range(n)], alpha))
    check(feq(Omega_alpha(S, [W0] * n, f, alpha), om_a, S.F),
          "p. 40: corrected Omega_alpha(w, ..., zeta) = omega_alpha, %s"
          % (alpha,))
    refuted(feq(Omega_alpha(S, [W0] * n, f, alpha, printed=True), om_a,
                S.F), "p. 40: printed Omega_alpha, %s" % (alpha,))
# alpha = 0: the corrected Omega_0 is Omega of (3.3) (by definition:
# alpha! = 1, f^(I) = f); the printed <w, f^(0)> = w_1 + ... + w_n is not.
section("S5.5")

# S5.6 (p. 41, item 1; correction i-41-n1-multiplicity-factor): n = 1,
# f = z^mu psi, psi(0) = c_0 != 0 (generic psi of degree 2, generic phi of
# degree 6): alpha! Res_0 phi f'/f^(alpha+1) = alpha!/(mu(alpha+1) - 1)!
# (d/dz)^(mu(alpha+1)-1) [phi f'/psi^(alpha+1)] (0), mu <= 3, alpha <= 2;
# the printed extra factor mu is refuted for f = z^2, alpha = 0, phi = 1
# (2 against 4).
Rc = PolynomialRing(QQ, ["c0", "c1", "c2"] + ["p%d" % i for i in range(7)])
Fc = Rc.fraction_field()
cc = Rc.gens()[:3]
pp = Rc.gens()[3:]
Ls = LaurentSeriesRing(Fc, "z", default_prec=40)
zl = Ls.gen()
Ps = PowerSeriesRing(Fc, "z", default_prec=40)
zp = Ps.gen()
for mu in (1, 2, 3):
    for al in (0, 1, 2):
        psi = cc[0] + cc[1] * zl + cc[2] * zl ** 2
        phi = sum(pp[i] * zl ** i for i in range(7))
        ff = zl ** mu * psi
        lhs = factorial(al) * (phi * ff.derivative() / ff ** (al + 1)
                               ).residue()
        psi_p = cc[0] + cc[1] * zp + cc[2] * zp ** 2
        phi_p = sum(pp[i] * zp ** i for i in range(7))
        ffp = zp ** mu * psi_p
        g_ = phi_p * ffp.derivative() / psi_p ** (al + 1)
        N_ = mu * (al + 1) - 1
        gd = g_
        for _ in range(N_):
            gd = gd.derivative()
        rhs = exact(factorial(al) / factorial(N_) * gd[0])
        check(exact(lhs) == rhs,
              "p. 41: item 1, mu = %d, alpha = %d" % (mu, al))
lhs_ex = (2 * zl / zl ** 2).residue()
check(lhs_ex == 2, "p. 41: f = z^2, alpha = 0, phi = 1: 2")
refuted(lhs_ex == 2 * 2, "p. 41: printed item 1 gives 4")

# S5.7 (p. 41, item 4; correction i-41-item4-factorial):
# omega_alpha(f, fbar) = alpha!/((alpha+I)^I f^alpha) omega(F, Fbar),
# F = f^(alpha+I) (generators df_j, dfbar_j; n = 2, alpha <= (2, 2));
# multiplicities mu_a(F) = (alpha+I)^I mu_a(f) (examples); n = 1, f = zeta,
# phi = zeta^alpha g: (5.1) gives alpha! g(0) = alpha! sum phi/f^alpha
# (corrected); printed without alpha!: g(0).
Rf = PolynomialRing(QQ, ["f0", "f1", "g0", "g1"])
Ff = Rf.fraction_field()
fv = Rf.gens()[:2]
gv = Rf.gens()[2:]
for alpha in itertools.product(range(3), repeat=2):
    Fv = [Ff(fv[k]) ** (alpha[k] + 1) for k in range(2)]
    Gv = [Ff(gv[k]) ** (alpha[k] + 1) for k in range(2)]
    dF = [g1(2 * k, (alpha[k] + 1) * Ff(fv[k]) ** alpha[k]) for k in range(2)]
    dG = [g1(2 * k + 1, (alpha[k] + 1) * Ff(gv[k]) ** alpha[k])
          for k in range(2)]
    df_ = wedges(g1(0), g1(2))
    nrm = Fv[0] * Gv[0] + Fv[1] * Gv[1]
    lhs = fscale(mfact(alpha) / nrm ** 2, fadd(
        fscale(Gv[0], wedge(dG[1], df_)), fscale(-Gv[1], wedge(dG[0], df_))))
    om_F = fscale(1 / nrm ** 2, fadd(
        fscale(Gv[0], wedges(dG[1], dF[0], dF[1])),
        fscale(-Gv[1], wedges(dG[0], dF[0], dF[1]))))
    rhs = fscale(mfact(alpha) / (prod(a + 1 for a in alpha)
                                 * Ff(fv[0]) ** alpha[0]
                                 * Ff(fv[1]) ** alpha[1]), om_F)
    check(feq(lhs, rhs, Ff), "p. 41: item 4 identity, alpha = %s" % (alpha,))
for fs, mu in (([z1 - z2 ** 2, z1 ** 2 - z2 ** 3], 3),
               ([z1, z2 ** 2 + z1 ** 2], 2)):
    for alpha in ((1, 0), (1, 1), (1, 2), (2, 1)):
        check(local_mult([fs[k] ** (alpha[k] + 1) for k in range(2)])
              == prod(a + 1 for a in alpha) * mu,
              "p. 41: mu(f^(alpha+I)) = (alpha+I)^I mu(f), %s" % (alpha,))
Rg = PolynomialRing(QQ, ["g%d" % i for i in range(4)])
gg_ = Rg.gens()
for al in range(5):
    # phi = zeta^al g, g = g0 + g1 zeta + ...: D^al phi(0) = al! g0
    Dphi = factorial(al) * gg_[0]
    corr = factorial(al) * (al + 1) * gg_[0] / (al + 1)
    check(Dphi == corr, "p. 41: item 4, n = 1, alpha = %d" % al)
    if al >= 2:
        refuted(Dphi == (al + 1) * gg_[0] / (al + 1),
                "p. 41: item 4 without alpha!, alpha = %d" % al)

# S5.8 (p. 42, Proposition 5.4, Bolotov; corrections i-41-skeleton-phi,
# i-42-display-phi): f_i = h_i^(m_i): df_i/f_i^(alpha_i+1) =
# m_i dh_i/h_i^(beta_i+1), beta_i = alpha_i m_i (m <= 4, alpha <= 3);
# d h^(m)/h^(m) = m_1...m_n dh/h; n = 1, h = z: alpha!/(2 pi i) int phi
# df/f^(alpha+1) = alpha! m/beta! phi^(beta)(0) (generic phi of degree 12,
# m <= 3, alpha <= 3); multiplicity m_1 m_2 when the lowest homogeneous
# parts have an isolated common zero (examples), and not otherwise
# (z_1 - z_2^2, z_1^2 - z_2^3: 3, not 1 * 2).
Fh = FractionField(PolynomialRing(QQ, "h"))
hv = Fh.gen()
for m in range(1, 5):
    for al in range(4):
        lhs = (hv ** m).derivative() / hv ** (m * (al + 1))
        check(lhs == m / hv ** (al * m + 1), "p. 42: d(h^m)/h^(m(alpha+1)), "
              "m = %d, alpha = %d" % (m, al))
Rpp = PolynomialRing(QQ, ["p%d" % i for i in range(13)])
Lp = LaurentSeriesRing(Rpp, "z", default_prec=30)
zl2 = Lp.gen()
phi = sum(Rpp.gen(i) * zl2 ** i for i in range(13))
for m in (1, 2, 3):
    for al in range(4):
        ff = zl2 ** m
        lhs = factorial(al) * (phi * ff.derivative() / ff ** (al + 1)
                               ).residue()
        b = al * m
        rhs = exact(factorial(al) * m / factorial(b) * factorial(b)
                    * Rpp.gen(b))
        check(exact(lhs) == rhs,
              "p. 42: Proposition 5.4, n = 1, m = %d, alpha = %d" % (m, al))
check(local_mult([z1 ** 2 + z2 ** 3, z2 ** 2 + z1 ** 3]) == 4,
      "p. 42: mu = m_1 m_2 = 4 (isolated lowest parts)")
check(local_mult([z1 ** 2 - z2 ** 2 + z1 ** 3, z1 * z2 + z2 ** 4]) == 4,
      "p. 42: mu = m_1 m_2 = 4 (isolated lowest parts)")
check(local_mult([z1 - z2 ** 2, z1 ** 2 - z2 ** 3]) == 3 != 1 * 2,
      "p. 42: lowest parts z_1, z_1^2 not isolated: mu != m_1 m_2")
section("S5.6-8")


# ---------------------------------------------------------------------------
# S6. §6, the Bergman and Szego kernels (pp. 42-49, sec:kernels).
# ---------------------------------------------------------------------------
# S6.1 (pp. 46-47, the polydisk; corrections i-47-polydisk-k,
# i-47-polydisk-dx): int_(|z| < r) |z|^(2k) dv = pi r^(2k+2)/(k+1) (exact
# polar integrals, k <= 6), so a_k^2 = pi^(-n) prod (k_nu + 1)
# r_nu^(-2 k_nu - 2); sum_k prod (k_nu + 1) x^k = prod (1 - x_nu)^(-2)
# (power series to total degree 8, n <= 3) = d^n/dx_1..dx_n prod
# (1 - x_nu)^(-1); the last two lines of the display.
rho_, rad_ = SR.var("rho_ rad_")
assume(rad_ > 0)
for k in range(7):
    val = integrate(rho_ ** (2 * k) * rho_, rho_, 0, rad_) * 2 * pi
    check(bool(val == pi * rad_ ** (2 * k + 2) / (k + 1)),
          "p. 46: int over the disc of |z|^(2k), k = %d" % k)
forget()
for n in (1, 2, 3):
    Rx = PolynomialRing(QQ, n, ["x%d" % j for j in range(n)])
    xv = Rx.gens()
    Fx = Rx.fraction_field()
    N = 8
    lhs = sum(prod(k[j] + 1 for j in range(n)) * prod(xv[j] ** k[j]
                                                     for j in range(n))
              for k in itertools.product(range(N + 1), repeat=n)
              if sum(k) <= N)
    rhs = prod(sum((i + 1) * xv[j] ** i for i in range(N + 1))
               for j in range(n))
    rhs = sum(c * m for c, m in zip(rhs.coefficients(), rhs.monomials())
              if m.degree() <= N)
    check(lhs == rhs, "p. 47: polydisk series, n = %d" % n)
    G = prod(1 / (1 - Fx(xv[j])) for j in range(n))
    for j in range(n):
        G = G.derivative(xv[j])
    check(G == prod(1 / (1 - Fx(xv[j])) ** 2 for j in range(n)),
          "p. 47: d^n/dx_1...dx_n prod (1 - x)^(-1), n = %d" % n)
    Rr = PolynomialRing(QQ, ["r%d" % j for j in range(n)]
                        + ["w%d" % j for j in range(n)])
    Fr = Rr.fraction_field()
    rv = Rr.gens()[:n]
    wv = Rr.gens()[n:]      # w_nu = z_nu zetabar_nu
    left = 1 / prod(Fr(rv[j]) ** 2 for j in range(n)) * prod(
        1 / (1 - Fr(wv[j]) / rv[j] ** 2) ** 2 for j in range(n))
    right = prod(Fr(rv[j]) ** 2 / (rv[j] ** 2 - wv[j]) ** 2
                 for j in range(n))
    check(left == right, "p. 47: polydisk kernel, last line, n = %d" % n)

# S6.2 (p. 47, the ball; correction i-47-ball-power): int_(B_R) |z^k|^2 dv
# = pi^n k! R^(2(|k|+n))/(|k|+n)! (exact ball integrals for R = 1,
# homogeneity in R), n <= 3, |k| <= 6; the second line of the display
# with R^(2m) (printed R^(2n) refuted); the multinomial step; sum_m
# (m+1)...(m+n) x^m = n!/(1-x)^(n+1) (power series to degree 20); the
# closed form n! R^2/(pi^n (R^2 - <z, zetabar>)^(n+1)).
for n in (1, 2, 3):
    RR_ = PolynomialRing(QQ, "R")
    Rv = FractionField(RR_).gen()
    for k in itertools.product(range(7), repeat=n):
        m = sum(k)
        if m > 6:
            continue
        kf = prod(factorial(x) for x in k)
        check(ball_mono(k, k, 0) == exact(kf / factorial(m + n)),
              "p. 47: int_B |z^k|^2, n = %d, k = %s" % (n, k))
        line1 = exact(factorial(m + n) / (kf * Rv ** (2 * m)))
        line2 = prod(m + j for j in range(1, n + 1)) / Rv ** (2 * m) * \
            factorial(m) / kf
        check(line1 == line2, "p. 47: ball, second line, %s" % (k,))
        if m != n:
            printed = prod(m + j for j in range(1, n + 1)) / Rv ** (2 * n) \
                * factorial(m) / kf
            refuted(line1 == printed, "p. 47: printed R^(2n), %s" % (k,))
    Rw = PolynomialRing(QQ, ["w%d" % j for j in range(n)])
    wv = Rw.gens()
    for m in range(7):
        multi = exact(sum(factorial(m) / prod(factorial(x) for x in k)
                          * prod(wv[j] ** k[j] for j in range(n))
                          for k in itertools.product(range(m + 1), repeat=n)
                          if sum(k) == m))
        check(multi == sum(wv) ** m, "p. 47: multinomial, n = %d, m = %d"
              % (n, m))
    Ps1 = PowerSeriesRing(QQ, "x", default_prec=21)
    xp = Ps1.gen()
    ser = sum(prod(mm + j for j in range(1, n + 1)) * xp ** mm
              for mm in range(21)) + O(xp ** 21)
    check(ser == factorial(n) / (1 - xp) ** (n + 1),
          "p. 47: sum (m+1)...(m+n) x^m, n = %d" % n)
    Fq = FractionField(PolynomialRing(QQ, ["R", "s"]))
    Rq, sq = Fq.gens()
    check(factorial(n) / (Rq ** (2 * n) * (1 - sq / Rq ** 2) ** (n + 1))
          == factorial(n) * Rq ** 2 / (Rq ** 2 - sq) ** (n + 1),
          "p. 47: ball kernel, last line, n = %d" % n)

# S6.3 (p. 44, Example 3): for l > 0, -m s - l s^2 = m^2/(4l)
# - l (s + m/(2l))^2, so |f_(m,l)| <= exp(-m s - l s^2) (s = ln|z_1|) is
# largest at s = -m/(2l), i.e. |z_1| = exp(-m/(2l)) in (0, 1), with
# maximum exp(m^2/(4l)); R(|z_1|) = exp(-s^2) <= 1.
Rml = PolynomialRing(FractionField(PolynomialRing(QQ, "m,l")), "s")
ml_m, ml_l = Rml.base_ring().gens()
s_ = Rml.gen()
check(-ml_m * s_ - ml_l * s_ ** 2 == ml_m ** 2 / (4 * ml_l)
      - ml_l * (s_ + ml_m / (2 * ml_l)) ** 2, "p. 44: Example 3, the square")
for mm in range(1, 11):
    for ll in range(1, 11):
        sstar = -QQ(mm) / (2 * ll)
        check(sstar < 0 and -mm * sstar - ll * sstar ** 2
              == QQ(mm ** 2) / (4 * ll), "p. 44: Example 3, m = %d, l = %d"
              % (mm, ll))

# S6.4 (p. 48, the weight h = rho(zeta, bD)^(4n-2); correction
# i-48-weight-exponent): |M(eta, zeta)|^2 = O(|eta - zeta|^(2(1-2n))) and
# rho(zeta, bD) <= |eta - zeta|, so |M|^2 h is bounded: exponent
# 2(1 - 2n) + (4n - 2) = 0.
for n in range(1, 10):
    check(2 * (1 - 2 * n) + (4 * n - 2) == 0, "p. 48: weight exponent, %d" % n)
section("S6")


# ---------------------------------------------------------------------------
# S7. §7, the Martinelli-Bochner-Koppelman representation (pp. 49-58,
# sec:martinelli-bochner-koppelman).  Double forms: zeta-differentials and
# z-differentials commute (Preliminaries, end of 1°).  All kernels below
# omit the common factor 1/(2 pi i)^n.
# ---------------------------------------------------------------------------
def col_fun(vals):
    return [fun(v) for v in vals]


def D_cols(S, blocks):
    """D_(nu_1, ..., nu_m)(theta^1, ..., theta^m): blocks = [(theta, nu)]."""
    cols = []
    for theta, nu in blocks:
        cols += [theta] * nu
    assert len(cols) == S.n
    return det_forms(cols)


def t_vec(S):
    return [(S.F(S.y[k]) - S.v[k]) / S.dist2 for k in range(S.n)]


def W_pq(S, w, p, q):
    """W_(p,q)(w, zeta, z) times (2 pi i)^n."""
    n = S.n
    if q < 0 or q >= n:
        return {}
    c1 = [fun(c) for c in w]
    c2 = [S.dbar_z(fun(c)) for c in w]
    c3 = [S.dbar_zeta(fun(c)) for c in w]
    D1 = D_cols(S, [(c1, 1), (c2, q), (c3, n - q - 1)])
    D2 = D_cols(S, [([g2(2 * k) for k in range(n)], p),
                    ([g1(2 * k) for k in range(n)], n - p)])
    c = (QQ((-1) ** (q + p * (n - q - 1)) * binomial(n - 1, q))
         / (factorial(p) * factorial(n - p)))
    return fscale(c, wedge(D1, D2))


def sigma_Jk(n, J, k):
    """sigma(J, k): dzbar_k ^ dzbar_J ^ dzbar_[J, k] = sigma(J, k) dzbar."""
    s, srt = sort_sign((k,) + tuple(J)
                       + tuple(j for j in range(n) if j not in J and j != k))
    return s


def sigma_J(n, J):
    s, srt = sort_sign(tuple(J) + tuple(j for j in range(n) if j not in J))
    return s


# S7.1 (p. 50): W_(0,0)(w) = (n-1)! sum (-1)^(k-1) w_k dbar_zeta w_[k] ^
# dzeta (generic w with affine coefficients, n = 2, 3); U_(0,0) is the
# Martinelli-Bochner kernel (correction i-50-martinelli-bochner-kernel:
# second argument zetabar - zbar), n = 2, 3; Pompeiu: n = 1,
# U_(0,0) = dzeta_1/(zeta_1 - z_1).
for n in (2, 3):
    nv = 4 * n + 1
    names = ["w%d_%d" % (k, i) for k in range(n) for i in range(nv)]
    S = Sp(n, extra=names)
    allv = list(S.x) + list(S.y) + list(S.u) + list(S.v)
    ww = [S.R(S.extra[k * nv] + sum(S.extra[k * nv + 1 + i] * allv[i]
                                    for i in range(4 * n)))
          for k in range(n)]
    lhs = W_pq(S, ww, 0, 0)
    rhs = {}
    for k in range(n):
        rhs = fadd(rhs, fscale((-1) ** k * ww[k], wedge(wedges(
            *[S.dbar_zeta(fun(ww[j])) for j in range(n) if j != k]),
            dzeta_all(n))))
    check(feq(lhs, fscale(factorial(n - 1), rhs), S.F),
          "p. 50: W_(0,0)(w) = omega(zeta - z, w), n = %d" % n)
    S = Sp(n)
    U00 = W_pq(S, t_vec(S), 0, 0)
    check(feq(U00, fscale(factorial(n - 1), mb_form(S)), S.F),
          "p. 50: U_(0,0) = omega(zeta - z, zetabar - zbar), n = %d" % n)
S = Sp(1)
check(feq(W_pq(S, t_vec(S), 0, 0),
          fscale(1 / (S.F(S.x[0]) - S.u[0]), dzeta_all(1)), S.F),
      "p. 50: U_(0,0) for n = 1 (Pompeiu)")

# S7.2 (p. 51): D_(p, n-p)(partial z, partial zeta) = p! (n-p)! sum'
# sigma(frakJ) dz_frakJ dzeta_[frakJ], n <= 4, all p.
for n in range(1, 5):
    S = Sp(n)
    for p in range(n + 1):
        D2 = D_cols(S, [([g2(2 * k) for k in range(n)], p),
                        ([g1(2 * k) for k in range(n)], n - p)])
        rhs = {}
        for JJ in itertools.combinations(range(n), p):
            rhs = fadd(rhs, fscale(sigma_J(n, JJ), wedge(
                wedges(*[g2(2 * j) for j in JJ]),
                wedges(*[g1(2 * j) for j in range(n) if j not in JJ]))))
        check(feq(D2, fscale(factorial(p) * factorial(n - p), rhs), S.F),
              "p. 51: D_(p, n-p)(dz, dzeta), n = %d, p = %d" % (n, p))
section("S7.1-2")

# S7.3 (p. 51, (7.2); corrections i-51-determinant-index, i-51-dbar-zbar):
# D_(1,q,n-q-1)(t, dbar_z t, dbar_zeta t)
#   = (-1)^q |zeta - z|^(-2n) D_(1,q,n-q-1)(zetabar - zbar, dbar_z zbar,
#     dbar_zeta zetabar)
#   = (-1)^q q! (n-q-1)! |zeta - z|^(-2n) sum'_J sum_(k not in J)
#     sigma(J, k) (zetabar_k - zbar_k) dzbar_J dzetabar_[J, k],
# n = 2, 3, q = 0..n-1.  S7.4 ((7.3); correction i-51-kernel-sum):
# W_(p,q)(t) = (-1)^(p(n-q-1)) (n-1)! sum'_(J, frakJ) sum_(k not in J)
# sigma(J, k) sigma(frakJ) (zetabar_k - zbar_k)/|zeta - z|^(2n)
# dzetabar_[J, k] ^ dzeta_[frakJ] dzbar_J ^ dz_frakJ, all p, q (the order
# of the factors with the commuting convention).
U_cache = {}
for n in (2, 3):
    S = Sp(n)
    tv = t_vec(S)
    for q in range(n):
        c1 = col_fun(tv)
        c2 = [S.dbar_z(fun(c)) for c in tv]
        c3 = [S.dbar_zeta(fun(c)) for c in tv]
        lhs = D_cols(S, [(c1, 1), (c2, q), (c3, n - q - 1)])
        mid = D_cols(S, [(col_fun([S.F(S.y[k]) - S.v[k] for k in range(n)]),
                          1), ([g2(2 * k + 1) for k in range(n)], q),
                         ([g1(2 * k + 1) for k in range(n)], n - q - 1)])
        check(feq(lhs, fscale((-1) ** q / S.dist2 ** n, mid), S.F),
              "p. 51: (7.2), first equality, n = %d, q = %d" % (n, q))
        rhs = {}
        for J in itertools.combinations(range(n), q):
            for k in range(n):
                if k in J:
                    continue
                rhs = fadd(rhs, fscale(
                    sigma_Jk(n, J, k) * (S.F(S.y[k]) - S.v[k]), wedge(
                        wedges(*[g2(2 * j + 1) for j in J]),
                        wedges(*[g1(2 * j + 1) for j in range(n)
                                 if j not in J and j != k]))))
        rhs = fscale((-1) ** q * factorial(q) * factorial(n - q - 1)
                     / S.dist2 ** n, rhs)
        check(feq(lhs, rhs, S.F), "p. 51: (7.2), n = %d, q = %d" % (n, q))
        for p in range(n + 1):
            W = W_pq(S, tv, p, q)
            U_cache[(n, p, q)] = W
            k73 = {}
            for J in itertools.combinations(range(n), q):
                for JJ in itertools.combinations(range(n), p):
                    for k in range(n):
                        if k in J:
                            continue
                        zeta_part = wedge(
                            wedges(*[g1(2 * j + 1) for j in range(n)
                                     if j not in J and j != k]),
                            wedges(*[g1(2 * j) for j in range(n)
                                     if j not in JJ]))
                        z_part = wedge(wedges(*[g2(2 * j + 1) for j in J]),
                                       wedges(*[g2(2 * j) for j in JJ]))
                        k73 = fadd(k73, fscale(
                            sigma_Jk(n, J, k) * sigma_J(n, JJ)
                            * (S.F(S.y[k]) - S.v[k]),
                            wedge(zeta_part, z_part)))
            k73 = fscale((-1) ** (p * (n - q - 1)) * factorial(n - 1)
                         / S.dist2 ** n, k73)
            check(feq(W, k73, S.F), "p. 51: (7.3), n = %d, p = %d, q = %d"
                  % (n, p, q))
section("S7.3-4")


# S7.5 (p. 52, (7.4); correction i-52-vq-constant):
# U_(0,q) = (-1)^(q+1)/(1-n) del_zeta |zeta - z|^(2-2n) ^ v_q,
# v_q = (-1)^n (n-1)! sum'_J sum_(k not in J) sigma(J, k) (-1)^(k-1)
# dzetabar_[J, k] ^ dzeta_[k] dzbar_J, n = 2, 3, q = 0..n-1; the printed
# constant (-n)^n (n-1)! is refuted.
def v_q(S, q, const=None):
    n = S.n
    if q < 0 or q >= n:
        return {}
    out = {}
    for J in itertools.combinations(range(n), q):
        for k in range(n):
            if k in J:
                continue
            out = fadd(out, fscale(sigma_Jk(n, J, k) * (-1) ** k, wedge(
                wedge(wedges(*[g1(2 * j + 1) for j in range(n)
                               if j not in J and j != k]),
                      wedges(*[g1(2 * j) for j in range(n) if j != k])),
                wedges(*[g2(2 * j + 1) for j in J]))))
    c = (-1) ** n * factorial(n - 1) if const is None else const
    return fscale(c, out)


for n in (2, 3):
    S = Sp(n)
    gpot = S.dist2 ** (1 - n) / (1 - n)        # g of (1.7)
    for q in range(n):
        U = U_cache[(n, 0, q)]
        rhs = fscale((-1) ** (q + 1),
                     wedge(S.del_zeta(fun(gpot)), v_q(S, q)))
        check(feq(U, rhs, S.F), "p. 52: (7.4), n = %d, q = %d" % (n, q))
        rhs_p = fscale((-1) ** (q + 1), wedge(
            S.del_zeta(fun(gpot)),
            v_q(S, q, const=(-n) ** n * factorial(n - 1))))
        refuted(feq(U, rhs_p, S.F), "p. 52: printed v_q constant (-n)^n, "
                "n = %d, q = %d" % (n, q))

# S7.6 (p. 52, Lemma 7.2, (7.5)): dbar_zeta W_(p,q) = (-1)^(p+q) dbar_z
# W_(p,q-1) for w = t (n = 2, 3, all p, q = 0..n) and for
# w = s/<s, zeta - z>, s = (zetabar_1 - zbar_1 + 2(zeta_2 - z_2),
# zetabar_2 - zbar_2) (n = 2, all p, q); in particular dbar_zeta W_(p,0) =
# 0 and dbar_z W_(p,n-1) = 0.
for n in (2, 3):
    S = Sp(n)
    tv = t_vec(S)
    for p in range(n + 1):
        for q in range(n + 1):
            Wq = U_cache.get((n, p, q), {})
            Wq1 = U_cache.get((n, p, q - 1), {})
            check(feq(S.dbar_zeta(Wq),
                      fscale((-1) ** (p + q), S.dbar_z(Wq1)), S.F),
                  "p. 52: Lemma 7.2, w = t, n = %d, p = %d, q = %d"
                  % (n, p, q))
S = Sp(2)
sv_ = [S.F(S.y[0] - S.v[0]) + 2 * (S.x[1] - S.u[1]), S.F(S.y[1] - S.v[1])]
hh = sum(sv_[k] * (S.x[k] - S.u[k]) for k in range(2))
wv_ = [c / hh for c in sv_]
check(sum(wv_[k] * (S.x[k] - S.u[k]) for k in range(2)) == 1,
      "p. 52: <w, zeta - z> = 1")
for p in range(3):
    for q in range(3):
        check(feq(S.dbar_zeta(W_pq(S, wv_, p, q)),
                  fscale((-1) ** (p + q), S.dbar_z(W_pq(S, wv_, p, q - 1))),
                  S.F), "p. 52: Lemma 7.2, another w, p = %d, q = %d"
              % (p, q))
section("S7.5-6")


# S7.7 (p. 53, Lemma 7.3; corrections i-53-derivative-product,
# i-53-remainder): for f = zeta^a zetabar^b (|a| + |b| <= 3, n = 2, 3),
# I(eps) = int_(|zeta| = eps) f dzetabar ^ dzeta_[k] is a sum of powers
# eps^(2n + j), j >= 0, whose eps^(2n) coefficient is
# (-1)^(n-k-1) (2 pi i)^n/n! df/dzeta_k (0) (k 1-indexed); hence (7.8)
# (m = 0 and m > 0) and (7.9).  Ball integrals scale as eps^(2n + degree).
def sphere_eps(S, f, k):
    """{power of eps: value/pi^n} for int_(|zeta| = eps) f dzetabar ^
    dzeta_[k] (by Stokes over B_eps)."""
    n = S.n
    form = fscale(f, wedge(dzetabar_all(n), dzeta_omit(n, [k])))
    df = S.d_zeta(form)
    out = {}
    for (A, B), c in df.items():
        c = S.R(S.F(c).numerator())
        for coef, mono in zip(c.coefficients(), c.monomials()):
            e = mono.exponents()[0]
            a = tuple(e[0:n])
            b = tuple(e[n:2 * n])
            val = coef * top_factor(n, A) * ball_mono(a, b, 0)
            if val != 0:
                pw = 2 * n + sum(a) + sum(b)
                out[pw] = out.get(pw, 0) + val
    return out


for n in (2, 3):
    S = Sp(n)
    for a in itertools.product(range(4), repeat=n):
        for b in itertools.product(range(4), repeat=n):
            if sum(a) + sum(b) > 3:
                continue
            f = S.R(prod(S.x[j] ** a[j] * S.y[j] ** b[j] for j in range(n)))
            for k in range(n):
                I_ = sphere_eps(S, f, k)
                dfk = S.F(f).derivative(S.x[k]).numerator()
                d0 = dfk.subs({w: 0 for w in S.R.gens()})
                expect = (-1) ** (n - (k + 1) - 1) * (2 * II) ** n \
                    / factorial(n) * K(d0)
                check(all(pw >= 2 * n for pw in I_)
                      and I_.get(2 * n, 0) == expect,
                      "p. 53: Lemma 7.3, n = %d, k = %d, a = %s, b = %s"
                      % (n, k + 1, a, b))
section("S7.7")


# S7.8 (pp. 54-55, (7.10)-(7.14); corrections i-54-mixed-derivative,
# i-54-formula-7-10, i-54-formula-7-12, i-55-formula-7-13): for
# gamma = f dzetabar_J (|J| = q, 1 <= q <= n-1, n = 2, 3) and f in
# {1, zeta_j, zetabar_j} (the identities are linear in the 1-jet of f):
#  (a) d_zeta(gamma ^ theta*_q) = dbar_zeta gamma ^ U_(0,q)
#      - del_zeta gamma ^ dbar_z g ^ v_(q-1), theta* = U_(0,q) - dbar_z g ^
#      v_(q-1)  (printed: dbar_zeta gamma in the second term);
#  (b) (-1)^q gamma ^ del_zeta dbar_z g ^ v_(q-1) = (-1)^q gamma ^ dbar_z
#      (del_zeta g ^ v_(q-1)) = gamma ^ dbar_z U_(0,q-1)
#      = (-1)^q gamma ^ dbar_zeta U_(0,q);
#  (c) d_zeta(gamma g v_(q-1)) = del gamma ^ g v_(q-1) + (-1)^q gamma ^
#      del_zeta g ^ v_(q-1), while dbar gamma ^ g v_(q-1) = 0 (the printed
#      dbar gamma of (7.12), (7.13)).
for n in (2, 3):
    S = Sp(n)
    gpot = S.dist2 ** (1 - n) / (1 - n)
    for q in range(1, n):
        U0q = U_cache[(n, 0, q)]
        U0q1 = U_cache[(n, 0, q - 1)]
        vq1 = v_q(S, q - 1)
        dzg = S.dbar_z(fun(gpot))
        theta_star = fsub(U0q, wedge(dzg, vq1))
        for J in itertools.combinations(range(n), q):
            base = wedges(*[g1(2 * j + 1) for j in J])
            for fname, fz in ([("1", S.R(1))]
                              + [("zeta_%d" % j, S.R(S.x[j]))
                                 for j in range(n)]
                              + [("zetabar_%d" % j, S.R(S.y[j]))
                                 for j in range(n)]):
                gam = fscale(fz, base)
                lhs = S.d_zeta(wedge(gam, theta_star))
                rhs = fsub(wedge(S.dbar_zeta(gam), U0q),
                           wedge(wedge(S.del_zeta(gam), dzg), vq1))
                lab = "n = %d, q = %d, J = %s, f = %s" % (n, q, J, fname)
                check(feq(lhs, rhs, S.F), "p. 54: (7.10), " + lab)
                prn = fsub(wedge(S.dbar_zeta(gam), U0q),
                           wedge(wedge(S.dbar_zeta(gam), dzg), vq1))
                if not fzero(wedge(wedge(S.del_zeta(gam), dzg), vq1), S.F):
                    refuted(feq(lhs, prn, S.F), "p. 54: printed (7.10), "
                            + lab)
                t1 = fscale((-1) ** q, wedge(wedge(
                    gam, S.del_zeta(dzg)), vq1))
                t2 = fscale((-1) ** q, wedge(gam, S.dbar_z(
                    wedge(S.del_zeta(fun(gpot)), vq1))))
                t3 = wedge(gam, S.dbar_z(U0q1))
                t4 = fscale((-1) ** q, wedge(gam, S.dbar_zeta(U0q)))
                check(feq(t1, t2, S.F) and feq(t2, t3, S.F)
                      and feq(t3, t4, S.F), "p. 54: before (7.10), " + lab)
                gv = fscale(gpot, vq1)
                lhs_c = S.d_zeta(wedge(gam, gv))
                rhs_c = fadd(wedge(S.del_zeta(gam), gv), fscale(
                    (-1) ** q, wedge(wedge(gam, S.del_zeta(fun(gpot))),
                                     vq1)))
                check(feq(lhs_c, rhs_c, S.F)
                      and fzero(wedge(S.dbar_zeta(gam), gv), S.F),
                      "p. 54: (7.12), " + lab)
section("S7.8")


# S7.9 (pp. 55-57; corrections i-55-sphere-sign, i-55-theta-second-term,
# i-55-theta-constant, i-55-summation-index, i-56-*): (i) d_zeta g =
# g'(r^2) d|zeta - z|^2, so dbar_zeta g = -del_zeta g on the sphere, and
# U_(0,q) - (-1)^q dbar_zeta g ^ v_q is a multiple of d_zeta |zeta - z|^2
# (theta*_q = theta_q there); (ii) with formal g_k (dbar_zeta g = sum g_k
# dzetabar_k, dbar_z g = -sum g_k dzbar_k) and gamma = dzetabar_1 ...
# dzetabar_q, gamma ^ theta_q = (-1)^n (n-1)! sum_k (-1)^(k-1) g_k
# dzetabar ^ dzeta_[k] dzbar_1 ... dzbar_q + chi, chi a combination of
# g_k dzetabar ^ dzeta_[j] dzbar_J with j != k (n = 2..4, q = 0..n-1);
# (iii) the final sum
# (n-1)!/(2 pi i)^n sum_k (-1)^(n+k-1) (-1)^(n-k-1) (2 pi i)^n/n! = 1.
for n in (2, 3):
    S = Sp(n)
    gpot = S.dist2 ** (1 - n) / (1 - n)
    gprime = S.dist2 ** (-n)            # dg/d(r^2)
    dr2 = S.d_zeta(fun(S.dist2))
    check(feq(S.d_zeta(fun(gpot)), fscale(gprime, dr2), S.F),
          "p. 55: d_zeta g = |zeta - z|^(-2n) d|zeta - z|^2, n = %d" % n)
    for q in range(n):
        diff = fsub(U_cache[(n, 0, q)], fscale((-1) ** q, wedge(
            S.dbar_zeta(fun(gpot)), v_q(S, q))))
        expect = fscale((-1) ** (q + 1) * gprime, wedge(dr2, v_q(S, q)))
        check(feq(diff, expect, S.F), "p. 55: U_(0,q) on the sphere, "
              "n = %d, q = %d" % (n, q))
for n in range(2, 5):
    Rg = PolynomialRing(QQ, ["g%d" % k for k in range(n)])
    gk = Rg.gens()
    Sdummy = Sp(n)
    for q in range(n):
        dzg = {}
        dzbg = {}
        for k in range(n):
            dzg = fadd(dzg, g1(2 * k + 1, gk[k]))
            dzbg = fadd(dzbg, g2(2 * k + 1, -gk[k]))
        vq = v_q(Sdummy, q)
        vq1 = v_q(Sdummy, q - 1)
        theta = fsub(fscale((-1) ** q, wedge(dzg, vq)), wedge(dzbg, vq1))
        gam = wedges(*[g1(2 * j + 1) for j in range(q)])
        res = wedge(gam, theta)
        main = {}
        zJ = wedges(*[g2(2 * j + 1) for j in range(q)])
        for k in range(n):
            main = fadd(main, fscale((-1) ** k * gk[k], wedge(wedge(
                dzetabar_all(n), dzeta_omit(n, [k])), zJ)))
        main = fscale((-1) ** n * factorial(n - 1), main)
        chi = fsub(res, main)
        ok = True
        for (A, B), c in chi.items():
            omitted = [j for j in range(n) if 2 * j not in A]
            for cf, mono in zip(Rg(c).coefficients(), Rg(c).monomials()):
                kk = [j for j in range(n) if mono == gk[j]]
                if not (len(omitted) == 1 and len(kk) == 1
                        and kk[0] != omitted[0]):
                    ok = False
        check(ok and all(len([g for g in A if g % 2 == 1]) == n
                         for (A, B) in res),
              "p. 56: gamma ^ theta_q, n = %d, q = %d" % (n, q))
for n in range(1, 7):
    check(exact(sum(QQ((-1) ** (n + k - 1) * (-1) ** (n - k - 1))
                    * factorial(n - 1) / factorial(n)
                    for k in range(1, n + 1))) == 1,
          "p. 57: i(z) = gamma(z), n = %d" % n)

# S7.10 (p. 56, the display after "Note that"; corrections
# i-56-conjugate-differential, i-56-repeated-factor): for k > q
# (-1)^q sigma((1..q), k) dzetabar_1..dzetabar_q ^ dzetabar_k ^
# dzetabar_[1..q, k] = dzetabar; for k <= q sigma((1..[k]..q), k)
# dzetabar_1..dzetabar_q ^ dzetabar_[1..q] dzbar_k ^ dzbar_1..[k]..dzbar_q
# = dzetabar dzbar_1..dzbar_q; the printed repeated dzetabar_q gives 0.
for n in range(2, 6):
    S = Sp(n)
    for q in range(n):
        Jq = tuple(range(q))
        for k in range(q, n):
            lhs = fscale((-1) ** q * sigma_Jk(n, Jq, k), wedges(
                *[g1(2 * j + 1) for j in Jq], g1(2 * k + 1),
                *[g1(2 * j + 1) for j in range(n) if j not in Jq
                  and j != k]))
            check(feq(lhs, dzetabar_all(n), S.F),
                  "p. 56: first identity, n = %d, q = %d, k = %d"
                  % (n, q, k + 1))
        for k in range(q):
            Jk = tuple(j for j in Jq if j != k)
            lhs = fscale(sigma_Jk(n, Jk, k), wedge(wedges(
                *[g1(2 * j + 1) for j in Jq],
                *[g1(2 * j + 1) for j in range(n) if j not in Jq]),
                wedges(g2(2 * k + 1), *[g2(2 * j + 1) for j in Jk])))
            rhs = wedge(dzetabar_all(n), wedges(*[g2(2 * j + 1)
                                                  for j in Jq]))
            check(feq(lhs, rhs, S.F), "p. 56: second identity, n = %d, "
                  "q = %d, k = %d" % (n, q, k + 1))
            prn = wedges(*[g1(2 * j + 1) for j in Jq], g1(2 * q - 1),
                         *[g1(2 * j + 1) for j in range(n) if j not in Jq])
            refuted(feq(prn, dzetabar_all(n), S.F),
                    "p. 56: printed repeated dzetabar_q, n = %d, q = %d"
                    % (n, q))
section("S7.9-10")

print("ok ch1: %d checks" % COUNT[0])
