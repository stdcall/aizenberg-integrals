"""Exact checks of Chapter IV, "Applications of Multidimensional Residues"
(first part), §§20-23 (printed pp. 137-194).

Run: sage -python checks/sage/ch4.py (plain asserts; do not use -O).
The last line of the output is "ok ch4: N checks".

Book: L. A. Aizenberg and A. P. Yuzhakov, Integral Representations and
Residues in Multidimensional Complex Analysis, AMS Translations of
Mathematical Monographs 58, 1983.  Pages are the printed pages, numbers of
statements and formulas those of the book; the ids in parentheses are the
entries of corrections.json.  Expected values are the book's formulas,
written below as literals (with the corrections where marked); the Typst
sources are not parsed.  Where the book is wrong, the printed reading is
kept as a refuted check (`refuted`: the printed reading must fail) beside
the corrected one.

Exact arithmetic only: Q, Q(a_1, ...), polynomial rings with symbolic
coefficients, truncated power series (polynomials truncated by degree;
each truncation is safe because the discarded terms cannot reach the
compared degrees, see the comments), Q(zeta_3), the field AA of real
algebraic numbers for suprema and real roots, Groebner bases, normal forms
and multiplication matrices in zero-dimensional quotient rings (traces =
sums over the roots with multiplicity), Singular's standard bases in a
local ordering for local multiplicities (the multiplicity of an isolated
zero equals the dimension of the local algebra: Tsikh, Multidimensional
Residues and Their Applications, AMS, 1992, §19, 4, Theorem), and Sage's
exact polyhedra for the volumes of Newton polyhedra.  Random instances are
drawn from a seeded generator, so every run checks the same instances.

What is checked:

A  §20 (pp. 137-156).
   A1 (20.1) Lagrange and (20.2) Buermann-Lagrange with generic
      coefficients (identities in Q[f_k, p_k] resp. its fraction field), up
      to zeta^7.
   A2 Theorem 20.2, (20.8): n = 2, m = 1, 4 random systems (with linear
      terms in w), h = 0, h = F(w, 0) and a generic h: the series with
      |beta| <= 2d equals Phi(w, phi(w)) mod w^5; the terms with
      2d < |beta| <= 2d + 2 vanish (h = 0).
   A3 Proposition 20.3, (20.11): n = m = 2, 3 random systems, all
      coefficients with |alpha| <= 3; the terms with
      2|alpha| < |beta| <= 2|alpha| + 2 vanish.
   A4 Proposition 20.4, (20.14) (three choices of h) and (20.15) with
      D^(alpha, k-1) (iv-141-derivative-order), n = 1, m = 2, |alpha| <= 4;
      the printed D^(alpha, k) refuted (F = z - w, Phi = z: c_1 = 0).
   A5 Theorem 20.5 (20.19), Proposition 20.6 (20.21), n = 2, |alpha| <= 5.
   A6 Theorem 20.7, (20.19') with Psi^alpha (iv-142-stieltjes-power),
      n = 1, 2, |alpha| <= 5; the printed Psi^(alpha + I) refuted.
   A7 Proposition 20.8: n = 2, k = (2, 3): the series in w^(1/k) satisfies
      z_j^(k_j) Psi_j(z) = w_j mod degree > 6.
   A8 Theorem 20.9 (Yuzhakov and Bolotov), (20.24)-(20.25), by enumerating
      the systems S, and the remark after it (iv-145-remark-factorial;
      1/s instead of 1/s! refuted): (n, m) = (1, 1), (1, 2), (2, 1),
      |alpha| <= 3 (4).
   A9 Theorem 20.10 (Cayley, Sylvester and Sack), (20.32), minus sign in
      Delta(S) (iv-146-delta-sign; plus refuted), n = 1 (|alpha| <= 6),
      n = 2 (|alpha| <= 4).
   A10 Proposition 20.11 (Sylvester) with 1/n! (iv-146-sylvester-factorial)
      for n <= 7, generic coefficients; the printed 1/n refuted (n = 3).
   A11 Theorem 20.12, Example 3 (folium): the coefficient formula = the
      closed form, n <= 30, the closed form solves the equation mod w^33,
      the printed first terms; the meromorphic example after Corollary
      20.13 (iv-148-meromorphic-sign): (20.36) fails, alpha = (-1, 4).
   A12 Theorem 20.16, (20.47): sup over t of the minimum of the four
      bounds (iv-151-sup-min), exactly, 243 grid points, every case of
      (20.47); the printed braces read as a maximum refuted.  Theorem 20.17
      and the sharper estimate after it, by the same method (our
      reconstruction of "obtained similarly"), 7 values of A.
   A13 Theorem 20.15, proof: sigma < min{R/A, 1} (iv-151-sigma-bound), on a
      grid; the printed min{r/A, 1} admits a counterexample.
   A14 Proof of Theorem 20.19: the identity
      sum_(q>k) C(q+n-1, q) a^q = a^(k+1) sum_p C(k+n-p, k)(1-a)^(-p), the
      corrected contour integral with a < eps < 1 (residues at 0 and a;
      iv-153-remainder-proof), n, k <= 6; the printed middle term equals
      -a^(k+1) C(n+k-1, k-1) (refuted).  The identity for all n, k is in
      Lean.
   A15 Examples of 7°, 1: (20.49) and the terms of (20.8) against the
      solution mod degree > 15; R e^(-rR) = r at r = e^(-1/2),
      R = e^(1/2) (the maximum 1/sqrt(e) itself is in Lean); the remainder
      estimate with the corrected denominator (iv-154-remainder-
      denominator) at delta = 1/5, k = 3 lies in (0.00401, 0.00402)
      (rational bounds for e), so "< 0.0041" (iv-154-remainder-value), not
      the printed "< 0.004", follows from it; with the printed denominator
      it would be 0.0032.
   A16 Example 2: the formula for c_(jmn) and the corrected series for z_1
      (iv-154-example-2) against the inverse, mod degree > 8, (p, q) =
      (2, 2), (2, 3), (3, 2), (3, 4); the printed numerator refuted (-w_1);
      the combination of the two terms for p, q, k, r <= 6.
   A17 Theorem 20.21 (20.52) and (20.53): for random f (m = 2, 3) the
      pseudopolynomial built from (20.52) and (20.53) divides f in
      Q[[z_1]][z_2] (mod z_1^10); the Example: S_1, S_2, S_3 (computed from
      the three small roots in Q(zeta_3)[[u]], u^3 = z^3 - z^5) equal the
      printed series and (20.52) with g^r (iv-156-power-r; g^2 refuted)
      mod t^12; the printed terms of a_1, a_2, a_3.
B  §21 (pp. 157-175).
   B1 Theorem 21.1, (21.9) with the functional M, n = 2, Q = (z_1^2,
      z_2^2 + z_1 z_2), m = (2, 3), 3 random P, mu = 2, 3: equal to the
      traces; the terms j > mu vanish.
   B2 Theorem 21.3, (21.13), and Example 1 (Bezout), k = (2, 3), (2, 2, 2),
      mu <= 3.
   B3 Example 2: the printed sum of squared distances to the 27 points is
      an identity in the 30 symbolic coefficients and A, B, C (18 of the 30
      occur); one trace check.
   B4 Theorem 21.4, (21.16) with the box M: n = 2, k = (2, 3); n = 3,
      k = (2, 2, 2), (3, 2, 2), random triangular systems and R; the terms
      outside M vanish in the box enlarged by 2 (n = 2) resp. 1 (n = 3);
      also for the system of the question on (21.20)
      (deg_(z_3) Delta_1 = 2 > |k| - n - i + 1 = 1).
   B5 Example 3: the sum of xy over the roots of (21.24) by (21.16)
      (symbolic in a, b, c, p, 1/d) and by traces at 4 points; the printed
      sum refuted (it is not 0 for a = b = c = 0); for a = b = c = 0,
      p = 1 the double root (4, 0) and 4 (d < 1) resp. 8 (d = 2) distinct
      real roots, never 9 (see the editorial note).
   B6 Example 4: S_1..S_4 by traces and by the printed formula with the
      functional N (nonzero terms in the box M' of Theorem 21.5);
      S_3, S_4, r(z_3) corrected (iv-21-ex4-power-sums,
      iv-21-ex4-resultant), the printed ones refuted; the elimination
      ideal of (21.29) is (r/z_3^2).
   B7 Example 6: multiplicity 2 at 0, P(z_2) = z_2^2 Q(z_2), the real roots.
   B8 Example 5: P(z_2) (iv-21-ex5-eliminant), Q(z_1) (iv-21-ex5-z1), no
      real roots, Budan-Fourier counts.
   B9 Example 7: Omega(a_1, a_2) (iv-21-ex7-constant), the special values
      (iv-21-ex7-disk, iv-21-ex7-ellipse-values), the roots on [0, oo).
   B10 Theorem 21.6 (Bolotov), (21.31), with the convention for
      beta_j(q) = 0 (iv-21-waring-convention): n = 1 (k = 3, 4) and n = 2
      (k = (2, 2), (2, 3), (3, 2)), l = 1, 2, m <= 3; without the
      convention, or with delta_(pj) for delta_(pj) k_j, refuted.
   B11 Propositions 21.7, 21.8: Im sum a_k z_k is linear in a and
      Im sum a_k (z_k - b_k)^2 has degree 2 in (a, b) (iv-21-quadrics),
      n <= 3.
C  §22 (pp. 175-188).
   C1 1°: (z_1, z_1 + z_2^2): 2; f_j = z_j^(k_j) + higher terms: k_1...k_n
      (iv-175-orders-example-strict; the printed |alpha| >= k_j refuted by
      (z_1 + z_2 + z_1^2, z_1 + z_2 + z_2^2): 3), and 1 for the other
      system with the same monomials.
   C2 Proposition 22.1, 1) and 2), 4 random examples each.
   C3 Theorem 22.4 for n = 2 via the Sylvester resultant, 5 examples.
   C4 Theorem 22.5 (Bezout) in CP^2, 3 systems with roots at infinity.
   C5 Theorem 22.6 (Tsikh and Yuzhakov): random examples, n = 2, 3;
      non-isolated principal parts give mu > k_1...k_n (3 examples).
   C6 Theorem 22.7: n = 2, a = (2, 3) (mu = 9) and n = 3, a = (1, 2, 3)
      (mu = 6); mu_0(z(zeta)) = q^n (prod a)^(n-1), mu_0(f~) and the
      corrected quotient (iv-184-weighted-denominator); the printed
      denominator refuted for n = 3.
   C7 Theorem 22.8 (Kushnirenko): Newton number = multiplicity for generic
      coefficients, n = 2 (5 supports, 2 systems each), n = 3 (2 supports);
      a degenerate system exceeds it; the face contribution of the proof.
   C8 (22.11) and Theorem 22.10 for different supports, n = 2 (5 pairs) and
      n = 3 (2 triples); the diagonal n! v(Gamma_-).
D  §23 (pp. 189-194).
   D1 (23.1) (iv-189-exponential-coefficient).
   D2 Theorem 23.1: a) (23.5) with t_j (iv-190-jacobian-parameter), n = 2,
      degree <= 7; b) (23.7) for beta = (2, 1), degree <= 4.
   D3 Theorem 23.2 (MacMahon), (23.11) with the Jacobian rows
      (iv-191-macmahon-forms, iv-191-macmahon-determinant), n = 3, two
      nonsymmetric matrices, |alpha| <= 5; the printed rows refuted.
   D4 (23.12) for 1 <= m, n, p <= 8 and its generating function, p <= 5.
   D5 (23.13): the integrand with (1 + z_3)^(p+1) (iv-193-numerator-
      exponent) as a rational identity; the radii; iterated residues give
      (1-u)^(-p-1)(1-v)^(-p-1), p <= 4 (the printed exponent gives
      (1-u)^(-p)(1-v)^(-p)).
   D6 Example 2 (Dixon's sum) for m <= 40, R_mn for m, n <= 16, the
      generating function by (23.5) and in closed form, degree <= 12.

What is NOT established: the general theorems of §§20-23 (convergence
statements, Theorems 20.2-20.21, 21.1-21.6, 22.1-22.10, 23.1-23.2) are
checked on the instances and ranges stated above only; the analytic
estimates (Theorems 20.14-20.20 and the remark after Theorem 20.19) are not
checked beyond the algebra of their proofs; the sharpness claim of
Example 1, the topological and analytic-set arguments of §22 (Theorems
22.2, 22.3, Proposition 22.9), the convergence of the series in §23 and
the complexity claim about classical elimination (p. 169) are not checked.
In the proof of Theorem 21.4 the degree count (21.20) for i >= 3 is not
justified (B4 exhibits a system where Delta_1 has a higher degree in z_3);
the statement was checked on the instances of B4 only.
"""

import itertools
import random as pyrandom
import time

from sage.all import *

_sage_binomial = binomial


def factorial(n):
    """Sage Integer factorial (also for Python ints)."""
    return ZZ(n).factorial()


def binomial(a, b):
    """Sage binomial; Python ints are converted to Sage Integers."""
    if isinstance(a, int):
        a = ZZ(a)
    if isinstance(b, int):
        b = ZZ(b)
    return _sage_binomial(a, b)


COUNT = [0]
T0 = time.time()


def check(condition, label):
    assert bool(condition), label
    COUNT[0] += 1


def refuted(condition, label):
    assert not bool(condition), "printed reading holds: " + label
    COUNT[0] += 1


def section(name):
    print("%-4s %6.1f s, %d checks" % (name, time.time() - T0, COUNT[0]),
          flush=True)


def fact(k):
    return ZZ(k).factorial()


def binom(a, b):
    return binomial(ZZ(a), ZZ(b))


def mfact(al):
    return prod([fact(a) for a in al], ZZ(1))


def multi_indices(n, total, lo=0):
    """n-tuples of nonnegative integers with lo <= sum <= total."""
    for t in itertools.product(range(total + 1), repeat=n):
        if lo <= sum(t) <= total:
            yield t


def trunc(f, idx, d):
    """Drop the monomials of total degree > d in the variables idx."""
    P = f.parent()
    return P({e: c for e, c in f.dict().items()
              if sum(e[i] for i in idx) <= d})


def trunc_weight(f, d):
    """Drop the monomials of total degree > d in all variables."""
    P = f.parent()
    return P({e: c for e, c in f.dict().items() if sum(e) <= d})


def mul_w(a, b, d):
    return trunc_weight(a * b, d)


def pow_w(a, k, d):
    out = a.parent()(1)
    for _ in range(k):
        out = mul_w(out, a, d)
    return out


def solve_fixed_point(G, zs, widx, d):
    """Solve z_j = G_j(w, z) (G_j(0, 0) = 0, no linear terms in z) mod
    w-degree > d by iteration; the result is a list of polynomials in w."""
    P = zs[0].parent()
    sol = [P(0)] * len(zs)
    for _ in range(d + 2):
        sub = dict(zip(zs, sol))
        sol = [trunc(G[j].subs(sub), widx, d) for j in range(len(zs))]
    sub = dict(zip(zs, sol))
    assert [trunc(G[j].subs(sub), widx, d) for j in range(len(zs))] == sol
    return sol


def jac(F, zs):
    return matrix([[f.derivative(z) for z in zs] for f in F]).det()


def mono(P, idx, e):
    g = P.gens()
    return prod([g[i] ** k for i, k in zip(idx, e)], P(1))


def coeff(f, e):
    """Coefficient of the monomial with exponent vector e (all variables)."""
    P = f.parent()
    return f.monomial_coefficient(P.monomial(*[int(a) for a in e]))


def rand_poly(rng, P, idx, degs, nterms, allow=None):
    mons = [e for e in itertools.product(range(max(degs) + 1),
                                         repeat=len(idx))
            if sum(e) in degs and (allow is None or allow(e))]
    out = P(0)
    for e in rng.sample(mons, min(nterms, len(mons))):
        out += rng.choice([-3, -2, -1, 1, 2, 3]) * mono(P, idx, e)
    return out


def dz_beta_over_fact(f, zs, beta):
    for z, b in zip(zs, beta):
        for _ in range(b):
            f = f.derivative(z)
    return f / mfact(beta)


rng = pyrandom.Random(20)

# ===========================================================================
# A. §20 (pp. 137-156)
# ===========================================================================

# A1. (20.1) Lagrange and (20.2) Buermann-Lagrange, n = 1, z_0 = 0, generic
# coefficients (identities in Q[f_k, p_k] resp. its fraction field), up to
# zeta^7.
D1 = 7
B = PolynomialRing(QQ, 'f1,f2,f3,f4,p0,p1,p2')
f1, f2, f3, f4, p0, p1, p2 = B.gens()
Sz = PowerSeriesRing(B, 'x', default_prec=D1 + 1)
x = Sz.gen()
St = PowerSeriesRing(B, 'zeta', default_prec=D1 + 1)
zeta = St.gen()
Fz = f1 * x + f2 * x ** 2 + f3 * x ** 3 + f4 * x ** 4
Psi = p0 + p1 * x + p2 * x ** 2
# z = zeta Psi(z) by iteration
zz = St(0).add_bigoh(D1 + 1)
for _ in range(D1 + 1):
    zz = (zeta * Psi.polynomial()(zz)).add_bigoh(D1 + 1)
lhs = Fz.polynomial()(zz)
rhs = St(0)
for k in range(1, D1 + 1):
    # zeta^k/k! d^(k-1)/dz^(k-1) [F' Psi^k] at 0 = zeta^k/k [z^(k-1)](F' Psi^k)
    rhs += zeta ** k / k * (Fz.derivative() * Psi ** k)[k - 1]
check((lhs - rhs).add_bigoh(D1 + 1) == 0, "A1 (20.1) Lagrange")
# (20.2): w = z Psi(z), Psi(0) = p0 != 0; Phi = F; over Frac(B).
K1 = B.fraction_field()
Sz1 = PowerSeriesRing(K1, 'x', default_prec=D1 + 1)
x1 = Sz1.gen()
Sw1 = PowerSeriesRing(K1, 'w', default_prec=D1 + 1)
w1 = Sw1.gen()
Psi1 = p0 + p1 * x1 + p2 * x1 ** 2
Phi1 = f1 * x1 + f2 * x1 ** 2 + f3 * x1 ** 3 + f4 * x1 ** 4
zw = Sw1(0).add_bigoh(D1 + 1)
for _ in range(D1 + 1):
    zw = (w1 / Psi1.polynomial()(zw)).add_bigoh(D1 + 1)
lhs = Phi1.polynomial()(zw)
rhs = Sw1(0)
for k in range(1, D1 + 1):
    rhs += w1 ** k / k * (Phi1.derivative() * Psi1 ** (-k))[k - 1]
check((lhs - rhs).add_bigoh(D1 + 1) == 0, "A1 (20.2) Buermann-Lagrange")
section("A1")

# A2. Theorem 20.2, (20.8): n = 2, m = 1, three choices of h (h = 0,
# h = F(w, 0) and a generic h(w) with h(0) = 0), 4 random systems with
# linear terms in w; the series truncated at |beta| <= 2d reproduces
# Phi(w, phi(w)) mod w^(d+1); for h = 0 the terms with
# 2d < |beta| <= 2d + 2 vanish mod w^(d+1).
d2 = 4
P2 = PolynomialRing(QQ, 'w,z1,z2')
w, z1, z2 = P2.gens()
ZS = [z1, z2]


def series_20_8(F, Phi, h, d, extra=0):
    """Sum of the terms of (20.8) with |beta| <= 2d + extra, each mod
    w^(d+1); returns (sum, list of the terms with |beta| > 2d)."""
    J = jac(F, ZS)
    g = [F[j] - ZS[j] + h[j] for j in range(2)]
    total = P2(0)
    tail = []
    for beta in multi_indices(2, 2 * d + extra):
        lb = sum(beta)
        W = d + lb
        expr = mul_w(trunc_weight(Phi * J, W),
                     mul_w(pow_w(g[0], beta[0], W), pow_w(g[1], beta[1], W),
                           W), W)
        t = dz_beta_over_fact(expr, ZS, beta)
        t = trunc(t.subs({z1: h[0], z2: h[1]}), [0], d)
        t = (-1) ** lb * t
        if lb > 2 * d:
            tail.append(t)
        else:
            total += t
    return total, tail


for trial in range(4):
    g1 = (rng.choice([-2, -1, 1, 2]) * w
          + rand_poly(rng, P2, [0, 1, 2], [2, 3], 5))
    g2 = (rng.choice([-2, -1, 1, 2]) * w
          + rand_poly(rng, P2, [0, 1, 2], [2, 3], 5))
    F = [z1 + g1, z2 + g2]
    Phi = 1 + rand_poly(rng, P2, [0, 1, 2], [1, 2], 4)
    sol = solve_fixed_point([z1 - F[0], z2 - F[1]], ZS, [0], d2)
    truth = trunc(Phi.subs({z1: sol[0], z2: sol[1]}), [0], d2)
    hs = [[P2(0), P2(0)],
          [F[0].subs({z1: 0, z2: 0}), F[1].subs({z1: 0, z2: 0})],
          [2 * w - w ** 2, -w + 3 * w ** 3]]
    for hi, h in enumerate(hs):
        s, tail = series_20_8(F, Phi, h, d2, extra=2 if hi == 0 else 0)
        check(s == truth, "A2 (20.8) trial %d h %d" % (trial, hi))
        if hi == 0:
            check(all(t == 0 for t in tail), "A2 (20.8) tail vanishes")
section("A2")

# A3. Proposition 20.3, (20.11): n = 2, m = 2, h = 0:
# c_alpha = sum_(|beta| <= 2|alpha|) (-1)^|beta| [w^alpha z^beta](Phi g^beta J)
# for |alpha| <= 3, 3 random systems; the coefficients with
# 2|alpha| < |beta| <= 2|alpha| + 2 vanish.
P3 = PolynomialRing(QQ, 'u1,u2,y1,y2')
u1, u2, y1, y2 = P3.gens()
d3 = 3
for trial in range(3):
    F = [y1 + rng.choice([-1, 1, 2]) * u1 + rng.choice([-1, 1]) * u2
         + rand_poly(rng, P3, [0, 1, 2, 3], [2, 3], 5),
         y2 + rng.choice([-1, 2]) * u2
         + rand_poly(rng, P3, [0, 1, 2, 3], [2, 3], 5)]
    Phi = 1 + rand_poly(rng, P3, [0, 1, 2, 3], [1, 2], 4)
    sol = solve_fixed_point([y1 - F[0], y2 - F[1]], [y1, y2], [0, 1], d3)
    truth = trunc(Phi.subs({y1: sol[0], y2: sol[1]}), [0, 1], d3)
    g = [F[0] - y1, F[1] - y2]
    J = jac(F, [y1, y2])
    nonzero = 0
    for alpha in multi_indices(2, d3):
        la = sum(alpha)
        W = la + 2 * la + 2
        c = QQ(0)
        beyond = True
        for beta in multi_indices(2, 2 * la + 2):
            expr = mul_w(trunc_weight(Phi * J, W),
                         mul_w(pow_w(g[0], beta[0], W),
                               pow_w(g[1], beta[1], W), W), W)
            t = coeff(expr, alpha + beta)
            if sum(beta) <= 2 * la:
                c += (-1) ** sum(beta) * t
            else:
                beyond = beyond and t == 0
        tv = coeff(truth, alpha + (0, 0))
        nonzero += tv != 0
        check(c == tv, "A3 (20.11) %s" % (alpha,))
        check(beyond, "A3 (20.11) terms with |beta| > 2|alpha| vanish")
    check(nonzero >= 6, "A3 nonvacuous")
section("A3")


rng = pyrandom.Random(204)

# A4. Proposition 20.4: n = 1, m = 2.  (20.14) with h = 0, h = F(w, 0) and
# a generic h(w), mod w^(d+1), d = 4, 3 random F; (20.15) with
# D^(alpha, k - 1) (iv-141-derivative-order) for |alpha| <= 4; the printed
# D^(alpha, k) refuted on F = z - w, Phi = z (c_1 = 0 instead of 1) and on
# the random F.
P4 = PolynomialRing(QQ, 'v1,v2,x')
v1, v2, x = P4.gens()
d4 = 4


def c_20_15(Phi, g, alpha, printed=False):
    la = sum(alpha)
    c = coeff(Phi, alpha + (0,))
    Pz = Phi.derivative(x)
    W = la + 2 * la + 1
    for k in range(1, 2 * la + 1):
        expr = mul_w(trunc_weight(Pz, W), pow_w(g, k, W), W)
        if printed:
            # (-1)^k/(k! alpha!) D^(alpha, k) = (-1)^k [w^alpha z^k]
            c += (-1) ** k * coeff(expr, alpha + (k,))
        else:
            # (-1)^k/(k! alpha!) D^(alpha, k-1) = (-1)^k/k [w^alpha z^(k-1)]
            c += QQ((-1) ** k) / k * coeff(expr, alpha + (k - 1,))
    return c


for trial in range(3):
    F = (x + rng.choice([-1, 1, 2]) * v1 + rng.choice([-2, 1]) * v2
         + rand_poly(rng, P4, [0, 1, 2], [2, 3], 6))
    Phi = 1 + rand_poly(rng, P4, [0, 1, 2], [1, 2], 4)
    sol = solve_fixed_point([x - F], [x], [0, 1], d4)
    truth = trunc(Phi.subs({x: sol[0]}), [0, 1], d4)
    for hi, h in enumerate([P4(0), F.subs({x: 0}), v1 - 2 * v2 + v1 * v2]):
        g = F - x + h
        s = trunc(Phi.subs({x: h}), [0, 1], d4)
        Pz = Phi.derivative(x)
        for k in range(1, 2 * d4 + 1):
            W = d4 + k - 1
            expr = mul_w(trunc_weight(Pz, W), pow_w(g, k, W), W)
            for _ in range(k - 1):
                expr = expr.derivative(x)
            s += QQ((-1) ** k) / fact(k) * trunc(expr.subs({x: h}), [0, 1],
                                                 d4)
        check(s == truth, "A4 (20.14) trial %d h %d" % (trial, hi))
    g = F - x
    bad = 0
    for alpha in multi_indices(2, d4):
        check(c_20_15(Phi, g, alpha) == coeff(truth, alpha + (0,)),
              "A4 (20.15) %s" % (alpha,))
        bad += c_20_15(Phi, g, alpha, True) != coeff(truth, alpha + (0,))
    check(bad > 0, "A4 printed (20.15) fails somewhere")
F0 = x - v1
check(c_20_15(x, F0 - x, (1, 0)) == 1, "A4 F = z - w: c_1 = 1")
refuted(c_20_15(x, F0 - x, (1, 0), True) == 1,
        "A4 printed D^(alpha, k): c_1 = 0")
section("A4")

# A5. Theorem 20.5, (20.19), and Proposition 20.6, (20.21): n = 2,
# f = z + g, d_0(g) >= 2, 3 random mappings and Phi; the series (20.19)
# truncated at |beta| <= d reproduces Phi(phi(w)) mod deg > d (d = 5), the
# terms with |beta| = d + 1, d + 2 vanish mod deg > d; (20.21) with
# |beta| <= |alpha| gives all Taylor coefficients, |alpha| <= 5.
P5 = PolynomialRing(QQ, 'w1,w2,y1,y2')
w1, w2, y1, y2 = P5.gens()
YS = [y1, y2]
d5 = 5
for trial in range(3):
    g = [rand_poly(rng, P5, [2, 3], [2, 3], 4),
         rand_poly(rng, P5, [2, 3], [2, 3], 4)]
    f = [y1 + g[0], y2 + g[1]]
    Phi = 1 + rand_poly(rng, P5, [2, 3], [1, 2, 3], 5)
    sol = solve_fixed_point([w1 - g[0], w2 - g[1]], YS, [0, 1], d5)
    truth = trunc(Phi.subs({y1: sol[0], y2: sol[1]}), [0, 1], d5)
    J = jac(f, YS)
    s = P5(0)
    for beta in multi_indices(2, d5 + 2):
        lb = sum(beta)
        W = d5 + lb
        expr = mul_w(trunc_weight(Phi * J, W),
                     mul_w(pow_w(g[0], beta[0], W), pow_w(g[1], beta[1], W),
                           W), W)
        t = dz_beta_over_fact(expr, YS, beta).subs({y1: w1, y2: w2})
        t = (-1) ** lb * trunc(t, [0, 1], d5)
        if lb <= d5:
            s += t
        else:
            check(t == 0, "A5 (20.19) term |beta| > d vanishes")
    check(s == truth, "A5 (20.19) trial %d" % trial)
    for alpha in multi_indices(2, d5):
        la = sum(alpha)
        c = QQ(0)
        for beta in multi_indices(2, la):
            W = la + sum(beta)
            expr = mul_w(trunc_weight(Phi * J, W),
                         mul_w(pow_w(g[0], beta[0], W),
                               pow_w(g[1], beta[1], W), W), W)
            ab = (alpha[0] + beta[0], alpha[1] + beta[1])
            c += ((-1) ** sum(beta) * mfact(ab) / (mfact(alpha) * mfact(beta))
                  * coeff(expr, (0, 0) + ab))
        check(c == coeff(truth, alpha + (0, 0)), "A5 (20.21) %s" % (alpha,))
section("A5")


# A6. Theorem 20.7 (Stieltjes, Poincare and Good), (20.19'): w_j = z_j Psi_j,
# Psi_j(0) != 0, n = 1 and n = 2.  With Psi^alpha (iv-142-stieltjes-power)
# the formula gives the Taylor coefficients of Phi(phi(w)), |alpha| <= 5;
# the printed Psi^(alpha + I) is refuted.
def inv_series(p, idx, N):
    """1/p mod degree > N in the variables idx, p(0) != 0."""
    c0 = p.constant_coefficient()
    u = p / c0 - 1
    out = p.parent()(0)
    term = p.parent()(1)
    for i in range(N + 1):
        out += term
        term = trunc(-term * u, idx, N)
    return trunc(out / c0, idx, N)


def ppow(p, k, idx, N):
    out = p.parent()(1)
    for _ in range(k):
        out = trunc(out * p, idx, N)
    return out


d6 = 5
NZ6 = []
for n6, trials in [(1, 2), (2, 3)]:
    for trial in range(trials):
        if n6 == 1:
            Psis = [rng.choice([1, 2, -3]) + rand_poly(rng, P5, [2], [1, 2], 2)
                    + rand_poly(rng, P5, [2], [3], 1)]
            Psis.append(P5(1))
        else:
            Psis = [rng.choice([1, 2, -3])
                    + rand_poly(rng, P5, [2, 3], [1, 2], 3) for _ in range(2)]
        nv = n6
        Ys = YS[:nv]
        Phi = 1 + rand_poly(rng, P5, [2, 3][:nv], [1, 2], 3)
        inv = [inv_series(Psis[j], [2, 3], d6 + 1) for j in range(2)]
        sol = solve_fixed_point([w1 * inv[0], w2 * inv[1]][:nv]
                                + ([] if nv == 2 else []), Ys, [0, 1], d6)
        sub = dict(zip(Ys, sol))
        truth = trunc(Phi.subs(sub), [0, 1], d6)
        Dm = matrix([[(1 if j == k else 0)
                       + YS[j] * inv[j] * Psis[j].derivative(YS[k])
                       for k in range(nv)] for j in range(nv)]).det()
        Dm = trunc(Dm, [2, 3], d6)
        bad = 0
        for alpha in multi_indices(nv, d6):
            al = tuple(alpha) + (0,) * (2 - nv)
            base = trunc(Phi * Dm, [2, 3], d6)
            corr = trunc(base * prod([ppow(inv[j], al[j], [2, 3], d6)
                                      for j in range(nv)], P5(1)),
                         [2, 3], d6)
            prin = trunc(corr * prod([inv[j] for j in range(nv)], P5(1)),
                         [2, 3], d6)
            tv = coeff(truth, al + (0, 0))
            NZ6.append(tv != 0)
            check(coeff(corr, (0, 0) + al) == tv,
                  "A6 (20.19') n=%d %s" % (nv, al))
            bad += coeff(prin, (0, 0) + al) != tv
        refuted(bad == 0, "A6 printed Psi^(alpha+I), n=%d" % nv)
check(sum(NZ6) >= 30, "A6 nonvacuous")
section("A6")

# A7. Proposition 20.8: n = 2, k = (2, 3), Psi_j(0) = 1; with
# zeta_j = w_j^(1/k_j) the series
# z_j = sum_alpha zeta^alpha/alpha! D^alpha[z_j Psi^(-(alpha+I)/k)
#       det(d(z_j Psi_j^(1/k_j))/dz_k)](0)
# has the terms zeta_j for |alpha| <= 1 and satisfies
# z_j^(k_j) Psi_j(z) = zeta_j^(k_j) mod deg > 6, 2 random Psi.


def rpow(p, r, idx, N):
    """p^r for rational r, p(0) = 1, mod degree > N (binomial series)."""
    u = p - 1
    out = p.parent()(0)
    term = p.parent()(1)
    for i in range(N + 1):
        out += binomial(QQ(r), i) * term
        term = trunc(term * u, idx, N)
    return trunc(out, idx, N)


d7 = 6
kk = (2, 3)
for trial in range(2):
    Psis = [1 + rand_poly(rng, P5, [2, 3], [1, 2], 3) for _ in range(2)]
    roots = [rpow(Psis[j], QQ(1) / kk[j], [2, 3], d7 + 1) for j in range(2)]
    Dm = matrix([[(YS[j] * roots[j]).derivative(YS[k]) for k in range(2)]
                 for j in range(2)]).det()
    zser = [P5(0), P5(0)]
    for alpha in multi_indices(2, d7):
        fac = prod([rpow(Psis[j], -QQ(alpha[j] + 1) / kk[j], [2, 3], d7)
                    for j in range(2)], P5(1))
        base = trunc(trunc(Dm, [2, 3], d7) * fac, [2, 3], d7)
        for j in range(2):
            c = coeff(trunc(YS[j] * base, [2, 3], d7), (0, 0) + alpha)
            zser[j] += c * w1 ** alpha[0] * w2 ** alpha[1]
    check(trunc(zser[0], [0, 1], 1) == w1 and trunc(zser[1], [0, 1], 1) == w2,
          "A7 leading terms zeta_j")
    sub = {y1: zser[0], y2: zser[1]}
    for j in range(2):
        lhs = trunc((YS[j] ** kk[j] * Psis[j]).subs(sub), [0, 1], d7)
        check(lhs == [w1, w2][j] ** kk[j], "A7 Proposition 20.8 eq %d" % j)
section("A7")


rng = pyrandom.Random(209)


def enum_systems(items, bounds_ok, maxs):
    """All assignments s: items -> N (s <= maxs) accepted by the pruning
    predicate bounds_ok(partial dict) (monotone)."""
    out = []

    def rec(i, cur):
        if not bounds_ok(cur):
            return
        if i == len(items):
            out.append(dict(cur))
            return
        for s in range(maxs + 1):
            if s:
                cur[items[i]] = s
            elif items[i] in cur:
                del cur[items[i]]
            if s and not bounds_ok(cur):
                del cur[items[i]]
                break
            rec(i + 1, cur)
        cur.pop(items[i], None)

    rec(0, {})
    return out


def yb_coefficients(n, m, A, Bc, alpha, remark_q=None, printed_fact=False):
    """Theorem 20.9 (20.24)-(20.25): A[j] = {(mu, nu): a}, Bc = {(eta, tau):
    b}.  With remark_q the remark after the theorem (Phi = z_q).  With
    printed_fact the remark with 1/s instead of 1/s!."""
    items = [(j, mu, nu) for j in range(n) for (mu, nu) in A[j]]
    la = sum(alpha)

    def ok(cur):
        lam = [0] * m
        c2 = 0
        for (j, mu, nu), s in cur.items():
            for k in range(m):
                lam[k] += mu[k] * s
            c2 += max(sum(nu) - 1, 0) * s
        return all(lam[k] <= alpha[k] for k in range(m)) and c2 <= la

    total = QQ(0)
    for S in enum_systems(items, ok, la + 1):
        rho = [0] * n
        sig = [[0] * n for _ in range(n)]   # sig[j][k] = sigma_k(S_j)
        lam = [0] * m
        coef = QQ(1)
        for (j, mu, nu), s in S.items():
            rho[j] += s
            for k in range(n):
                sig[j][k] += nu[k] * s
            for k in range(m):
                lam[k] += mu[k] * s
            coef *= A[j][(mu, nu)] ** s / (s if printed_fact else fact(s))
        eta = tuple(alpha[k] - lam[k] for k in range(m))
        tau = tuple(rho[k] - sum(sig[j][k] for j in range(n))
                    for k in range(n))
        if min(eta) < 0 or min(tau) < 0:
            continue
        if remark_q is None:
            b = Bc.get((eta, tau), 0)
        else:
            b = 1 if (max(eta) == 0 and tau == tuple(
                1 if k == remark_q else 0 for k in range(n))) else 0
        if b == 0:
            continue
        M = matrix(QQ, n, n)
        for j in range(n):
            for k in range(n):
                if rho[j] == 0:
                    M[j, k] = 1 if j == k else 0
                else:
                    M[j, k] = (rho[j] if j == k else 0) - sig[j][k]
        f = prod([fact(r - 1) if r > 0 else 1 for r in rho], ZZ(1))
        total += (-1) ** sum(rho) * b * M.det() * f * coef
    return total


# A8. Theorem 20.9 (Yuzhakov and Bolotov), (20.24)-(20.25), and the remark
# after it (iv-145-remark-factorial): (n, m) = (1, 1), (1, 2), (2, 1), sparse
# random F_j = z_j + sum' a w^mu z^nu (with linear terms in w) and Phi,
# all Taylor coefficients with |alpha| <= 3 (4 for n = m = 1); the remark
# with 1/s instead of 1/s! is refuted.
def random_A(n, m, nterms):
    A = []
    for j in range(n):
        cand = []
        for e in multi_indices(m + n, 3):
            mu, nu = tuple(e[:m]), tuple(e[m:])
            if (sum(mu) + sum(nu) >= 2) or (sum(mu) == 1 and sum(nu) == 0):
                cand.append((mu, nu))
        lin = [c for c in cand if sum(c[0]) == 1 and sum(c[1]) == 0]
        rest = [c for c in cand if c not in lin]
        pick = [rng.choice(lin)] + rng.sample(rest, nterms - 1)
        A.append({c: rng.choice([-2, -1, 1, 2, 3]) for c in pick})
    return A


for (n, m, dmax, trials) in [(1, 1, 4, 2), (1, 2, 3, 1), (2, 1, 3, 2)]:
    names = ['w%d' % i for i in range(m)] + ['z%d' % i for i in range(n)]
    P = PolynomialRing(QQ, names)
    W_ = P.gens()[:m]
    Z_ = P.gens()[m:]
    for trial in range(trials):
        A = random_A(n, m, 4)
        Bc = {}
        for e in rng.sample(list(multi_indices(m + n, 2)), 4):
            Bc[(tuple(e[:m]), tuple(e[m:]))] = rng.choice([-2, -1, 1, 3])
        F = [Z_[j] + sum(a * mono(P, range(m + n), mu + nu)
                         for (mu, nu), a in A[j].items()) for j in range(n)]
        Phi = sum(b * mono(P, range(m + n), eta + tau)
                  for (eta, tau), b in Bc.items())
        sol = solve_fixed_point([Z_[j] - F[j] for j in range(n)], list(Z_),
                                list(range(m)), dmax)
        truth = trunc(P(Phi).subs(dict(zip(Z_, sol))), list(range(m)), dmax)
        nonzero = 0
        for alpha in multi_indices(m, dmax):
            tv = coeff(truth, tuple(alpha) + (0,) * n)
            nonzero += tv != 0
            check(yb_coefficients(n, m, A, Bc, alpha) == tv,
                  "A8 (20.24) n=%d m=%d %s" % (n, m, alpha))
            for q in range(n):
                tq = coeff(sol[q], tuple(alpha) + (0,) * n)
                nonzero += tq != 0
                check(yb_coefficients(n, m, A, Bc, alpha, remark_q=q) == tq,
                      "A8 remark c_(q alpha)")
        check(nonzero >= 4, "A8 nonvacuous %d" % nonzero)
# The printed remark (1/s_(j mu nu) for 1/s_(j mu nu)!) differs as soon as
# some s >= 3: F = z + w + z^2 (z = -w - w^2 - 2 w^3 - 5 w^4 - ...).
Pr = PolynomialRing(QQ, 'w0,z0')
A0 = [{((1,), (0,)): 1, ((0,), (2,)): 1}]
sol0 = solve_fixed_point([-Pr.gen(0) - Pr.gen(1) ** 2], [Pr.gen(1)], [0], 5)
for al in range(1, 6):
    check(yb_coefficients(1, 1, A0, {}, (al,), remark_q=0)
          == coeff(sol0[0], (al, 0)), "A8 remark, z + w + z^2")
check([coeff(sol0[0], (al, 0)) for al in range(1, 6)] == [-1, -1, -2, -5, -14],
      "A8 z = -w - w^2 - 2w^3 - 5w^4 - 14w^5")
refuted(yb_coefficients(1, 1, A0, {}, (3,), remark_q=0, printed_fact=True)
        == -2, "A8 printed remark 1/s")
section("A8")


# A9. Theorem 20.10 (Cayley, Sylvester and Sack), (20.32): n = 1, 2, sparse
# random w_j = z_j + sum a z^nu (|nu| >= 2) and Phi, |alpha| <= 4 (n = 1:
# 6); Delta(S) with the minus sign (iv-146-delta-sign); the printed plus sign
# is refuted, in particular for w = z + a_2 z^2, Phi = z (c_2 = -a_2).
def css_coefficient(n, A, Bc, alpha, sign=-1):
    items = [(j, nu) for j in range(n) for nu in A[j]]
    la = sum(alpha)

    def ok(cur):
        return sum((sum(nu) - 1) * s for (j, nu), s in cur.items()) <= la

    total = QQ(0)
    for S in enum_systems(items, ok, la + 1):
        rho = [0] * n
        sig = [[0] * n for _ in range(n)]
        coef = QQ(1)
        for (j, nu), s in S.items():
            rho[j] += s
            for k in range(n):
                sig[j][k] += nu[k] * s
            coef *= A[j][nu] ** s / fact(s)
        tau = tuple(alpha[k] + rho[k] - sum(sig[j][k] for j in range(n))
                    for k in range(n))
        if min(tau) < 0 or Bc.get(tau, 0) == 0:
            continue
        M = matrix(QQ, n, n)
        f = QQ(1)
        for j in range(n):
            r = rho[j] + alpha[j]
            f *= (fact(r - 1) if r > 0 else 1) / fact(alpha[j])
            for k in range(n):
                if r == 0:
                    M[j, k] = 1 if j == k else 0
                else:
                    M[j, k] = (r if j == k else 0) + sign * sig[j][k]
        total += (-1) ** sum(rho) * Bc[tau] * M.det() * f * coef
    return total


for (n, dmax, trials) in [(1, 6, 2), (2, 4, 2)]:
    P = PolynomialRing(QQ, ['w%d' % i for i in range(n)]
                       + ['z%d' % i for i in range(n)])
    W_ = P.gens()[:n]
    Z_ = P.gens()[n:]
    for trial in range(trials):
        A = []
        for j in range(n):
            cand = [e for e in multi_indices(n, 3) if sum(e) >= 2]
            A.append({e: rng.choice([-2, -1, 1, 2, 3])
                      for e in rng.sample(cand, min(3, len(cand)))})
        Bc = {e: rng.choice([-2, -1, 1, 2])
              for e in rng.sample(list(multi_indices(n, 2)), 3)}
        g = [sum(a * mono(P, range(n, 2 * n), nu) for nu, a in A[j].items())
             for j in range(n)]
        Phi = sum(b * mono(P, range(n, 2 * n), t) for t, b in Bc.items())
        sol = solve_fixed_point([W_[j] - g[j] for j in range(n)], list(Z_),
                                list(range(n)), dmax)
        truth = trunc(P(Phi).subs(dict(zip(Z_, sol))), list(range(n)), dmax)
        bad = 0
        nonzero = 0
        for alpha in multi_indices(n, dmax):
            tv = coeff(truth, tuple(alpha) + (0,) * n)
            nonzero += tv != 0
            check(css_coefficient(n, A, Bc, alpha) == tv,
                  "A9 (20.32) n=%d %s" % (n, alpha))
            bad += css_coefficient(n, A, Bc, alpha, sign=+1) != tv
        check(nonzero >= 5, "A9 nonvacuous")
        refuted(bad == 0, "A9 printed plus sign")
Ba = PolynomialRing(QQ, 'a2')
a2 = Ba.gen()
check(css_coefficient(1, [{(2,): a2}], {(1,): 1}, (2,)) == -a2,
      "A9 w = z + a_2 z^2: c_2 = -a_2")
refuted(css_coefficient(1, [{(2,): a2}], {(1,): 1}, (2,), sign=+1) == -a2,
        "A9 printed plus sign, w = z + a_2 z^2")
section("A9")

# A10. Proposition 20.11 (Sylvester): with 1/(n! a_1^n)
# (iv-146-sylvester-factorial) the formula gives the coefficients c_n of
# the inverse series for n <= 7, generic a_1, ..., a_7 (identity in
# Q(a_1, ..., a_7)); the printed 1/(n a_1^n) is refuted for n = 3 (twice
# the value), and c_3 = (2 a_2^2 - a_1 a_3)/a_1^5.
NS = 7
Ra = PolynomialRing(QQ, ['a%d' % k for k in range(1, NS + 1)])
av = Ra.gens()
Ka = Ra.fraction_field()
Sw = PowerSeriesRing(Ka, 'w', default_prec=NS + 1)
ww = Sw.gen()
zinv = Sw(0).add_bigoh(NS + 1)
for _ in range(NS + 1):
    zinv = ((ww - sum(av[k - 1] * zinv ** k for k in range(2, NS + 1)))
            / av[0]).add_bigoh(NS + 1)


def sylvester(nn, printed=False):
    s = Ka(0)
    for ks in itertools.product(*[range(nn) for _ in range(2, nn + 1)]):
        if sum((i + 1) * ks[i] for i in range(len(ks))) != nn - 1:
            continue
        num = fact(nn + sum(ks) - 1)
        den = prod([fact(k) for k in ks], ZZ(1))
        s += num / den * prod([(-av[i + 1] / av[0]) ** ks[i]
                               for i in range(len(ks))], Ka(1))
    return s / ((nn if printed else fact(nn)) * av[0] ** nn)


for nn in range(1, NS + 1):
    check(sylvester(nn) == zinv[nn], "A10 Sylvester c_%d" % nn)
check(zinv[3] == (2 * av[1] ** 2 - av[0] * av[2]) / av[0] ** 5, "A10 c_3")
refuted(sylvester(3, True) == zinv[3], "A10 printed 1/(n a_1^n)")
check(sylvester(3, True) == 2 * zinv[3], "A10 printed = twice c_3")
section("A10")


rng = pyrandom.Random(212)

# A11. Theorem 20.12, Example 3 (folium of Descartes), p. 155: the branch
# tangent to z = 0 of w^3 - 3wz + z^3 = 0.  Normalised F = wz - (w^3 + z^3)/3
# (lambda = 1, g = -(w^3 + z^3)/3, dF/dz = w - z^2); the integrals are
# coefficients of Laurent polynomials, so
# c_n = sum_k 3^(-k) [w^(k+n+1) z^k](z (z^3 + w^3)^k (w - z^2)),
# which is (20.38) for Phi = z.  For n <= 30 it equals the coefficient of
# the closed form sum (3r)! w^(3r+2)/(3^(3r+1) r! (2r+1)!), whose first
# terms are w^2/3 + w^5/3^4 + w^8/3^6 + 4 w^11/3^9, and the closed form
# solves the equation mod w^33.
Pf = PolynomialRing(QQ, 'w,z')
wf, zf = Pf.gens()
NF = 30
closed = {}
for r in range(0, (NF - 2) // 3 + 1):
    closed[3 * r + 2] = fact(3 * r) / (3 ** (3 * r + 1) * fact(r)
                                       * fact(2 * r + 1))
for nn in range(1, NF + 1):
    c = QQ(0)
    for k in range(0, nn + 2):
        expr = zf * (zf ** 3 + wf ** 3) ** k * (wf - zf ** 2)
        c += QQ(1) / 3 ** k * coeff(expr, (k + nn + 1, k))
    check(c == closed.get(nn, 0), "A11 folium c_%d" % nn)
check([closed[2], closed[5], closed[8], closed[11]]
      == [QQ(1) / 3, QQ(1) / 3 ** 4, QQ(1) / 3 ** 6, QQ(4) / 3 ** 9],
      "A11 first terms")
Sf = PowerSeriesRing(QQ, 'w', default_prec=NF + 3)
ws = Sf.gen()
zs = sum(c * ws ** e for e, c in closed.items()).add_bigoh(NF + 3)
check((ws ** 3 - 3 * ws * zs + zs ** 3).add_bigoh(NF + 3) == 0,
      "A11 closed form solves the folium")
# The example after Corollary 20.13: z (w_1 + w_2) + w_1^4 = 0 gives
# z = -w_1^4/(w_1 + w_2); lambda = (1, 0), g = z w_2 + w_1^4; the integral
# (20.43) with alpha = (-1, 4) (|alpha| = 3, alpha_1 < 0) is the coefficient
# of w_1^(-1) w_2^4 of the Laurent expansion for |w_2| < |w_1|, -1 != 0, so
# (20.36) fails, as it must.
Pm = PolynomialRing(QQ, 'w1,w2,z')
m1, m2, mz = Pm.gens()
c = QQ(0)
for beta in range(0, 12):
    expr = mz * (mz * m2 + m1 ** 4) ** beta * (m1 + m2)
    c += (-1) ** beta * coeff(expr, (beta + 1 - 1, 4, beta))
check(c == -1, "A11 meromorphic example: (20.36) fails")
check((mz * (m1 + m2) + m1 ** 4).subs({mz: 0}) == m1 ** 4
      and Pm.fraction_field()(-m1 ** 4 / (m1 + m2)) * (m1 + m2) + m1 ** 4 == 0,
      "A11 z = -w_1^4/(w_1 + w_2) (iv-148-meromorphic-sign)")
section("A11")

# A12. Theorem 20.16, (20.47): rho = sup_(0<t<1) min{r^3 t(1-t)/KA,
# r^2 t/A, r^2 (1-t)/K, r}, the supremum computed exactly (the maximum of
# the lower envelope is attained at t = 1/2 or at a crossing of two of the
# four functions; crossings in AA), for r in {1, 2, 3} and A/r, K/r in
# {1/8, 1/4, 3/8, 1/2, 5/8, 3/4, 1, 3/2, 2} (243 cases), equals (20.47) in
# each case whose condition holds.  The printed braces read as a maximum
# give more than (20.47).
tt = polygen(AA, 't')


def rho_exact(r, A, K):
    fs = [r ** 3 * tt * (1 - tt) / (K * A), r ** 2 * tt / A,
          r ** 2 * (1 - tt) / K, tt * 0 + r]
    cands = {AA(1) / 2}
    for i in range(4):
        for j in range(i + 1, 4):
            dpoly = (fs[i] - fs[j]).numerator()
            if dpoly != 0:
                for root, _ in dpoly.roots(AA):
                    cands.add(root)
    best = AA(0)
    for t0 in cands:
        if 0 < t0 < 1:
            best = max(best, min(f(t0) for f in fs))
    return best


grid = [QQ(1) / 8, QQ(1) / 4, QQ(3) / 8, QQ(1) / 2, QQ(5) / 8, QQ(3) / 4,
        QQ(1), QQ(3) / 2, QQ(2)]
ncases = 0
for r in [QQ(1), QQ(2), QQ(3)]:
    for a_ in grid:
        for k_ in grid:
            A, K = a_ * r, k_ * r
            rho = rho_exact(r, A, K)
            if K >= r / 2 and A >= r / 2:
                check(rho == r ** 3 / (4 * A * K), "A12 case 1")
                ncases += 1
            if A <= r / 2 and A + K >= r:
                check(rho == r * (r - A) / K, "A12 case 2")
                ncases += 1
            if K <= r / 2 and A + K >= r:
                check(rho == r * (r - K) / A, "A12 case 3")
                ncases += 1
            if A + K <= r:
                check(rho == r, "A12 case 4")
                ncases += 1
check(ncases >= 243, "A12 every grid point is covered by a case")
# printed braces as max: at t = 1/2 already r^2/(2K) or r exceed rho
r, A, K = QQ(1), QQ(1), QQ(1)
refuted(max(r ** 3 / (4 * K * A), r ** 2 / (2 * A), r ** 2 / (2 * K), r)
        == r ** 3 / (4 * A * K), "A12 sup of the max")
# Theorem 20.17 and the sharper estimate after it, by the same method
# (reconstruction: h = w, the torus |z_j - w_j| = delta', |w_j| <= delta;
# ||g(z)|| <= A ||z||^2/r^2 needs A (delta + delta')^2/r^2 < delta' and
# delta + delta' <= r; with x = sqrt(delta'):
# delta < min{r x/sqrt(A) - x^2, r - x^2}); the supremum over x, computed
# exactly (vertex x = r/(2 sqrt(A)) and crossing x = sqrt(A)), is r^2/4A for
# A > r/2 and r - A for A <= r/2, and min{r^2/4A, r/2} never exceeds it;
# r = 1, sqrt(A) in {1/4, 1/3, 1/2, 2/3, 3/4, 1, 3/2}.
for sA in [QQ(1) / 4, QQ(1) / 3, QQ(1) / 2, QQ(2) / 3, QQ(3) / 4, QQ(1),
           QQ(3) / 2]:
    r, A = QQ(1), sA ** 2
    g1 = lambda xx: r * xx / sA - xx ** 2
    g2 = lambda xx: r - xx ** 2
    cands = [xx for xx in (r / (2 * sA), sA) if xx > 0 and g2(xx) >= 0]
    best = max(min(g1(xx), g2(xx)) for xx in cands)
    sharp = r ** 2 / (4 * A) if A > r / 2 else r - A
    check(best == sharp, "A12 sharper estimate after Theorem 20.17")
    check(min(r ** 2 / (4 * A), r / 2) <= sharp, "A12 Theorem 20.17")
section("A12")

# A13. Theorem 20.15, proof: delta = r sigma, eps = R sigma; the chain
# A sigma^2 = delta eps A/rR <= delta eps/rho < eps holds iff
# delta < rho = min{rR/A, r} iff sigma < min{R/A, 1} (iv-151-sigma-bound),
# checked on a grid of r, R, A (sigma just below the bound); the printed
# sigma < min{r/A, 1} admits r = 4, R = 1, A = 2, sigma = 9/10 with
# A sigma^2 >= eps.
for r in [QQ(1), QQ(2), QQ(4)]:
    for R in [QQ(1) / 2, QQ(1), QQ(3)]:
        for A in [QQ(1) / 3, QQ(1), QQ(5)]:
            rho = min(r * R / A, r)
            for frac in [QQ(1) / 2, QQ(99) / 100]:
                sg = frac * min(R / A, 1)
                dl, ep = r * sg, R * sg
                check(A * sg ** 2 == dl * ep * A / (r * R)
                      and dl * ep * A / (r * R) <= dl * ep / rho
                      and dl * ep / rho < ep, "A13 chain")
r, R, A, sg = QQ(4), QQ(1), QQ(2), QQ(9) / 10
refuted(A * sg ** 2 < R * sg, "A13 printed sigma < min{r/A, 1}")
section("A13")

# A14. Proof of Theorem 20.19 (p. 153): for n, k <= 6, in Q(a):
# sum_(q>k) C(q+n-1, q) a^q = (1-a)^(-n) - sum_(q<=k) ... equals
# a^(k+1) sum_(p=1)^n C(k+n-p, k)(1-a)^(-p); the corrected middle term
# (2 pi i)^(-1) int_(|zeta|=eps) a^(k+1) dzeta/((1-zeta)^n zeta^(k+1)
# (zeta - a)), a < eps < 1, i.e. the residues at 0 and a, gives the same;
# the printed -(2 pi i)^(-1) int a^(k+1) dzeta/((1-zeta)^(n+1) zeta^k)
# with eps < a (residue at 0 only) is -a^(k+1) C(n+k-1, k-1), refuted.
Ra = PolynomialRing(QQ, 'a')
a = Ra.gen()
Ka = Ra.fraction_field()
Sq = PowerSeriesRing(Ka, 'q', default_prec=12)
qz = Sq.gen()
for n in range(1, 7):
    for k in range(0, 7):
        tail = (1 - a) ** (-n) - sum(binom(q + n - 1, q) * a ** q
                                     for q in range(k + 1))
        rhs = a ** (k + 1) * sum(binom(k + n - p, k) * (1 - a) ** (-p)
                                 for p in range(1, n + 1))
        check(Ka(tail) == Ka(rhs), "A14 tail identity n=%d k=%d" % (n, k))
        # residue at 0 of a^(k+1)/((1-q)^n q^(k+1) (q - a)):
        ser = (1 - qz) ** (-n) * (qz - a) ** (-1)
        res0 = a ** (k + 1) * ser[k]
        resa = a ** (k + 1) / ((1 - a) ** n * a ** (k + 1))
        check(Ka(res0 + resa) == Ka(tail), "A14 corrected integral")
        if k >= 1:
            pr = -a ** (k + 1) * ((1 - qz) ** (-(n + 1)))[k - 1]
            check(pr == -a ** (k + 1) * binom(n + k - 1, k - 1),
                  "A14 printed middle term value")
            refuted(Ka(pr) == Ka(tail), "A14 printed middle term")
section("A14")


rng = pyrandom.Random(215)

# A15. Examples of 7°, 1 (p. 154): z_1 = w_1 e^(z_2 w_2),
# z_2 = w_2 e^(z_1 w_1).  (20.49) against the solution by iteration mod
# total degree > 15; the sum of the terms of (20.8) (h = 0) over
# |beta| <= 9, computed in closed form
# Psi_(m,n) = w_1^m w_2^n/(m! n!) [m (n w_1)^(m-1) (m w_2)^n
#            - w_1^2 w_2^2 m ((n+1) w_1)^(m-1) ((m+1) w_2)^n]  (for z_1),
# gives the same series mod degree > 15.  The radius: R e^(-rR) = r at
# r = e^(-1/2), R = e^(1/2) (the maximum itself is in Lean); the remainder
# estimate (20.48) with n = 2, sigma/eps = delta^2 e (iv-154-remainder-
# denominator) at delta = 1/5, k = 3 lies in (0.00401, 0.00402) (e between
# 2.718281 and 2.718282; the bound increases with e), so "< 0.004" does not
# follow from it and "< 0.0041" does (iv-154-remainder-value); with the
# printed denominator 1 + delta^2 eps (eps = 1/delta) it would be 0.0032.
D15 = 15
Pe = PolynomialRing(QQ, 'w1,w2')
e1, e2 = Pe.gens()


def exp_trunc(u, N):
    out = Pe(0)
    term = Pe(1)
    for i in range(N + 1):
        out += term
        term = trunc_weight(term * u, N) / (i + 1)
    return trunc_weight(out, N)


zz = [Pe(0), Pe(0)]
for _ in range(D15 + 2):
    zz = [trunc_weight(e1 * exp_trunc(zz[1] * e2, D15), D15),
          trunc_weight(e2 * exp_trunc(zz[0] * e1, D15), D15)]
pr1 = e1 + sum(QQ(nn ** (mm - 1) * mm ** nn) / (fact(mm) * fact(nn))
               * e1 ** (2 * mm - 1) * e2 ** (2 * nn)
               for mm in range(1, 9) for nn in range(1, 9))
pr2 = e2 + sum(QQ(mm ** (nn - 1) * nn ** mm) / (fact(mm) * fact(nn))
               * e1 ** (2 * mm) * e2 ** (2 * nn - 1)
               for mm in range(1, 9) for nn in range(1, 9))
check(trunc_weight(pr1, D15) == zz[0] and trunc_weight(pr2, D15) == zz[1],
      "A15 (20.49)")
s1 = Pe(0)
for mm in range(0, 10):
    for nn in range(0, 10):
        if mm == 0:
            continue
        t1 = QQ(mm) * (nn * e1) ** (mm - 1) * (mm * e2) ** nn
        t2 = (QQ(mm) * ((nn + 1) * e1) ** (mm - 1) * ((mm + 1) * e2) ** nn
              * e1 ** 2 * e2 ** 2)
        s1 += e1 ** mm * e2 ** nn / (fact(mm) * fact(nn)) * (t1 - t2)
check(trunc_weight(s1, D15) == zz[0], "A15 (20.8) terms for Example 1")
check(bool((exp(QQ(1) / 2) * exp(-exp(-QQ(1) / 2) * exp(QQ(1) / 2))
            - exp(-QQ(1) / 2)).simplify_full() == 0),
      "A15 R e^(-rR) = r at r = e^(-1/2), R = e^(1/2)")
# rational bounds for e: sum_(k<=12) 1/k! < e < sum_(k<=12) 1/k! + 2/13!
e_lo = sum(QQ(1) / fact(k) for k in range(13))
e_hi = e_lo + QQ(2) / fact(13)


def est(dl, k, e_, printed=False):
    x_ = dl ** 2 * e_
    if printed:
        first = (k + 1) / (1 + dl ** 2 * (1 / dl))
    else:
        first = (k + 1) / (1 - x_)
    return (1 / dl) * x_ ** (k + 1) * (first + 1 / (1 - x_) ** 2)


elo, ehi = QQ(2718281) / 10 ** 6, QQ(2718282) / 10 ** 6
check(elo < e_lo and e_hi < ehi, "A15 e bounds")
check(1 / (QQ(607) / 1000) ** 2 < elo and ehi < 1 / (QQ(606) / 1000) ** 2,
      "A15 0.606 < 1/sqrt(e) < 0.607")
dl = QQ(1) / 5
check(dl ** 2 * ehi < 1, "A15 sigma/eps < 1")
lo, hi = est(dl, 3, elo), est(dl, 3, ehi)
check(QQ(401) / 100000 < lo and hi < QQ(402) / 100000,
      "A15 corrected estimate in (0.00401, 0.00402)")
refuted(hi < QQ(4) / 1000, "A15 printed '< 0.004' from the estimate")
check(hi < QQ(41) / 10000, "A15 '< 0.0041'")
check(QQ(32) / 10000 < est(dl, 3, elo, True) < est(dl, 3, ehi, True)
      < QQ(33) / 10000, "A15 printed denominator gives 0.0032")
section("A15")

# A16. Example 2 (p. 154): w_1 = z_1 - z_2^p, w_2 = z_2 - z_1^q.  The
# formula for c_(jmn) ((20.20)-(20.21)) and the corrected series for z_1
# (iv-154-example-2) against the inverse computed by iteration, mod total
# degree > 8, (p, q) = (2, 2), (2, 3), (3, 2), (3, 4); the printed numerator
# (pqrk - 1)(qr + pk - r - k + 1)! is refuted (first term -w_1).  The two
# terms (k, r) and (k-1, r-1) combine: (qr+1)!(pk)! - pqkr (qr)!(pk-1)! =
# (qr)!(pk)! for 1 <= p, q, k, r <= 6 (pk >= 1).
D16 = 8
Pz = PolynomialRing(QQ, 'z1,z2')
q1, q2 = Pz.gens()
for (p, q) in [(2, 2), (2, 3), (3, 2), (3, 4)]:
    sol = [Pe(0), Pe(0)]
    for _ in range(D16 + 3):
        sol = [trunc_weight(e1 + sol[1] ** p, D16),
               trunc_weight(e2 + sol[0] ** q, D16)]
    for j in range(2):
        ser = Pe(0)
        for mm in range(D16 + 1):
            for nn in range(D16 + 1 - mm):
                c = QQ(0)
                for k in range(mm + nn + 1):
                    for r in range(mm + nn + 1 - k):
                        base = ([q1, q2][j] * q2 ** (p * k) * q1 ** (q * r)
                                * (1 - p * q * q1 ** (q - 1) * q2 ** (p - 1)))
                        c += (fact(mm + k) * fact(nn + r)
                              / (fact(k) * fact(r) * fact(mm) * fact(nn))
                              * coeff(base, (mm + k, nn + r)))
                ser += c * e1 ** mm * e2 ** nn
        check(ser == sol[j], "A16 c_(jmn) p=%d q=%d j=%d" % (p, q, j))
    z1c = Pe(0)
    z1p = Pe(0)
    for k in range(0, 2 * D16):
        for r in range(0, 2 * D16):
            if not (q * r + 1 >= k >= 0 and p * k >= r >= 0):
                continue
            e1x, e2x = q * r - k + 1, p * k - r
            if e1x + e2x > D16:
                continue
            den = (fact(k) * fact(r) * fact(q * r - k + 1) * fact(p * k - r))
            z1c += fact(q * r) * fact(p * k) / den * e1 ** e1x * e2 ** e2x
            z1p += ((p * q * r * k - 1) * fact(q * r + p * k - r - k + 1) / den
                    * e1 ** e1x * e2 ** e2x)
    check(z1c == sol[0], "A16 corrected z_1 p=%d q=%d" % (p, q))
    refuted(z1p == sol[0], "A16 printed z_1 p=%d q=%d" % (p, q))
    check(coeff(z1p, (1, 0)) == -1, "A16 printed first term -w_1")
check(all(fact(q * r + 1) * fact(p * k)
          - p * q * k * r * fact(q * r) * fact(p * k - 1)
          == fact(q * r) * fact(p * k)
          for p in range(1, 7) for q in range(1, 7) for k in range(1, 7)
          for r in range(0, 7)), "A16 combination of the two terms")
section("A16")

# A17. Theorem 20.21 (20.52) and the Newton formula (20.53).
# (a) Random f(z_1, z_2) = z_2^m + g, g(0, z_2) = O(z_2^(m+1)), m = 2, 3:
# the power sums S_k (k <= m) from (20.52) (sum from r = 1,
# iv-155-sum-from-one) and the coefficients a_k from (20.53) give a monic
# W = z_2^m + a_1 z_2^(m-1) + ... + a_m dividing f in Q[[z_1]][z_2]
# (remainder 0 mod z_1^10): W is the Weierstrass pseudopolynomial.
# (b) The Example: f = w^5 + w^3 - z^3 + z^5, m = 3: with t = z^3 - z^5 the
# three small roots are w(eps u), u^3 = t, w (1 + w^2)^(1/3) = u (Q(eps),
# eps^3 = 1); their power sums S_1, S_2, S_3 equal the printed series in t
# and (20.52) with g^r (iv-156-power-r) mod t^12; the printed power 2 is
# refuted; a_1, a_2, a_3 from (20.53) have the printed first three terms.
N17 = 10
P17 = PolynomialRing(QQ, 'x1,x2')
x1, x2 = P17.gens()
for m_ in [2, 3]:
    for trial in range(2):
        g = (rand_poly(rng, P17, [0, 1], [2, 3, 4], 5,
                       allow=lambda e: e[0] >= 1)
             + rng.choice([-2, 1, 3]) * x2 ** (m_ + 1)
             + rng.choice([-1, 2]) * x1 * x2 ** (m_ - 1)
             + rng.choice([1, -3]) * x1)
        f = x2 ** m_ + g
        # g^r pruned: a monomial x1^A x2^B of g^r can still contribute to
        # [x2^(m r' - k)] g^(r') (k >= 1, A <= N - 1) only if
        # B - m r <= m (N - 1 - A) - 1; r <= (m + 1)(N - 1).
        S = {k: P17(0) for k in range(1, m_ + 1)}
        gr = P17(1)
        for r in range(1, (m_ + 1) * (N17 - 1) + 1):
            gr = P17({e: c for e, c in (gr * g).dict().items()
                      if e[0] <= N17 - 1
                      and e[1] - m_ * r <= m_ * (N17 - 1 - e[0]) - 1})
            for k in range(1, m_ + 1):
                S[k] += QQ((-1) ** r * k) / r * sum(
                    (c * x1 ** e[0] for e, c in gr.dict().items()
                     if e[1] == m_ * r - k), P17(0))
        acoef = {}
        for k in range(1, m_ + 1):
            acoef[k] = trunc(-(S[k] + sum(acoef[i] * S[k - i]
                                          for i in range(1, k))) / k,
                             [0], N17 - 1)
        Wp = x2 ** m_ + sum(acoef[k] * x2 ** (m_ - k)
                            for k in range(1, m_ + 1))
        # division of f by the monic W in x2 over Q[x1]/(x1^N)
        rem = f
        while rem.degree(x2) >= m_:
            dg = rem.degree(x2)
            lc = sum(c * x1 ** e[0] for e, c in rem.dict().items()
                     if e[1] == dg)
            rem = trunc(rem - lc * x2 ** (dg - m_) * Wp, [0], N17 - 1)
        check(rem == 0, "A17 (20.52)-(20.53) Weierstrass m=%d" % m_)
        check(all(acoef[k].subs({x1: 0}) == 0 for k in acoef),
              "A17 a_k(0) = 0")
# (b) the Example
K3 = CyclotomicField(3)
eps = K3.gen()
NU = 38
Su = PowerSeriesRing(K3, 'u', default_prec=NU)
u = Su.gen()
Wu = u
for _ in range(NU):
    Wu = (u * (1 + Wu ** 2) ** (-QQ(1) / 3)).add_bigoh(NU)
Tt = PowerSeriesRing(QQ, 't', default_prec=12)
t = Tt.gen()


def to_t(ser):
    for i in range(NU - 1):
        if i % 3 and ser[i] != 0:
            raise ValueError
    return Tt([QQ(ser[3 * i]) for i in range(12)]).add_bigoh(12)


Sr = {k: to_t(sum(Wu(eps ** i * u) ** k for i in range(3)))
      for k in (1, 2, 3)}
book = {
    1: sum((-1) ** (q + 1) * fact(5 * q + 1) / (fact(3 * q + 1)
           * fact(2 * q + 1)) * t ** (2 * q + 1) for q in range(6)),
    2: 2 * sum((-1) ** q * fact(5 * q + 3) / (fact(3 * q + 2)
               * fact(2 * q + 2)) * t ** (2 * q + 2) for q in range(6)),
    3: 3 * sum((-1) ** q * fact(5 * q) / (fact(3 * q) * fact(2 * q + 1))
               * t ** (2 * q + 1) for q in range(6)),
}
Pw = PolynomialRing(Tt, 'ww')
ww = Pw.gen()
for k in (1, 2, 3):
    check(Sr[k] == book[k].add_bigoh(12), "A17 printed S_%d" % k)
    for power_r in (True, False):
        s = Tt(0)
        for r in range(1, 30):
            gg = (ww ** 5 - t) ** (r if power_r else 2)
            if 3 * r - k < 0:
                continue
            s += QQ((-1) ** r * k) / r * gg[3 * r - k]
        if power_r:
            check(s.add_bigoh(12) == Sr[k], "A17 (20.52) with g^r, S_%d" % k)
        else:
            refuted(s.add_bigoh(12) == Sr[k], "A17 printed g^2, S_%d" % k)
ak = {}
for k in (1, 2, 3):
    ak[k] = -(Sr[k] + sum(ak[i] * Sr[k - i] for i in range(1, k))) / k
check([ak[1][1], ak[1][3], ak[1][5]] == [1, -5, 66], "A17 a_1")
check([ak[2][2], ak[2][4], ak[2][6]] == [-1, 9, -136], "A17 a_2")
check([ak[3][1], ak[3][3], ak[3][5]] == [-1, 2, -23], "A17 a_3")
check(all(ak[1][i] == 0 for i in (0, 2, 4)) and ak[2][0] == 0,
      "A17 parity of a_k")
section("A17")


rng = pyrandom.Random(21)


def mult_matrix(f, I):
    """Matrix of multiplication by f on R/I (zero-dimensional), in the
    normal basis of a Groebner basis of I."""
    G = I.groebner_basis()
    basis = I.normal_basis()
    R = I.ring()
    idx = {b: i for i, b in enumerate(basis)}
    M = matrix(R.base_ring(), len(basis), len(basis))
    for j, b in enumerate(basis):
        r = (R(f) * b).reduce(G)
        for c, mon in zip(r.coefficients(), r.monomials()):
            M[idx[mon], j] = c
    return M


def trace_sum(R_, F, ring):
    """sum of R_ over the roots of F (with multiplicity), via the trace."""
    I = ring.ideal(F)
    check(I.dimension() == 0, "zero-dimensional")
    return mult_matrix(R_, I).trace(), I.vector_space_dimension()


# ===========================================================================
# B. §21 (pp. 157-175)
# ===========================================================================

# B1. Theorem 21.1 (Aizenberg), (21.9), with the functional M: n = 2,
# Q = (z_1^2, z_2^2 + z_1 z_2) (only common zero 0), m = (2, 3):
# z_1^2 = Q_1, z_2^3 = z_2 Q_1 + (z_2 - z_1) Q_2, so w_1 = u_1 + z_2 u_2,
# w_2 = (z_2 - z_1) u_2 (u_k = zbar_k^(m_k)), Delta_2 = z_2 - z_1;
# 3 random P (deg P_j < 2) and random R of degree mu <= 3 (2 each): the
# right side of (21.9) equals the trace of R in Q[z]/(Q + P) (4 roots).
Pb = PolynomialRing(QQ, 'z1,z2,u1,u2')
b1, b2, c1, c2 = Pb.gens()
Pz2 = PolynomialRing(QQ, 'z1,z2')
mm = (2, 3)
Q = [b1 ** 2, b2 ** 2 + b1 * b2]
a_ = [[Pb(1), b2], [Pb(0), b2 - b1]]          # a_(j k)
check(sum(a_[j][0] * Q[j] for j in range(2)) == b1 ** 2
      and sum(a_[j][1] * Q[j] for j in range(2)) == b2 ** 3,
      "B1 sum_j a_(jk) Q_j = z_k^(m_k)")
wv = [a_[j][0] * c1 + a_[j][1] * c2 for j in range(2)]
D2 = matrix(Pb, a_).det()


def frakM(poly):
    s = QQ(0)
    for e, c in poly.dict().items():
        al = (e[2], e[3])
        if all(e[j] == mm[j] * al[j] + mm[j] - 1 for j in range(2)):
            s += c * mfact(al)
    return s


for trial in range(3):
    P = [rand_poly(rng, Pb, [0, 1], [0, 1], 3) for _ in range(2)]
    F = [Q[j] + P[j] for j in range(2)]
    D1 = jac(F, [b1, b2])
    for mu in (2, 3):
        R_ = rand_poly(rng, Pb, [0, 1], list(range(mu + 1)), 5)
        R_ += rng.choice([-1, 1]) * b1 ** (mu - 1) * b2
        wP = sum(wv[j] * P[j] for j in range(2))
        rhs = frakM(R_ * D1 * D2 * sum(QQ((-1) ** j) / fact(j) * wP ** j
                                       for j in range(mu + 1)))
        to2 = lambda f: Pz2(f.subs({c1: 0, c2: 0}))
        tr, dim = trace_sum(to2(R_), [to2(f) for f in F], Pz2)
        check(dim == 4 and rhs == tr, "B1 (21.9) trial %d mu %d" % (trial, mu))
        # the terms j > mu vanish
        check(all(frakM(R_ * D1 * D2 * wP ** j) == 0
                  for j in range(mu + 1, mu + 3)), "B1 terms j > mu vanish")
section("B1")


# B2. Theorem 21.3, (21.13), and Example 1 (Bezout): random systems
# z_j^(k_j) + P_j, k = (2, 3) and (2, 2, 2), R of degree mu <= 3: the
# functional N (free term) gives the trace; N[Delta_1 z^I/z^k] = k_1...k_n.
def frakN_sum(R_, P, ks, zs, alphas):
    """sum over alpha of (-1)^|alpha|
    N[R Delta_1 z^I/z^k prod(P_j/z_j^k_j)^a_j]
    = coefficient of z^(k(alpha+I) - I) in R Delta_1 prod P_j^(alpha_j)."""
    F = [zs[j] ** ks[j] + P[j] for j in range(len(zs))]
    D1 = jac(F, zs)
    s = QQ(0)
    for al in alphas:
        target = tuple(ks[j] * (al[j] + 1) - 1 for j in range(len(zs)))
        prodp = prod([P[j] ** al[j] for j in range(len(zs))], R_.parent()(1))
        s += (-1) ** sum(al) * coeff(R_ * D1 * prodp, target)
    return s


for ks in [(2, 3), (2, 2, 2)]:
    nv = len(ks)
    Pn = PolynomialRing(QQ, ['z%d' % i for i in range(nv)])
    zs = Pn.gens()
    for trial in range(2):
        P = [rand_poly(rng, Pn, list(range(nv)), list(range(ks[j])), 4)
             for j in range(nv)]
        F = [zs[j] ** ks[j] + P[j] for j in range(nv)]
        D1 = jac(F, zs)
        check(coeff(D1, tuple(k - 1 for k in ks)) == prod(ks),
              "B2 Example 1: coefficient of z^(k-1) in Delta_1")
        check(Pn.ideal(F).vector_space_dimension() == prod(ks),
              "B2 Example 1: N = k_1 ... k_n")
        for mu in (0, 1, 2, 3):
            R_ = (rand_poly(rng, Pn, list(range(nv)), list(range(mu + 1)), 4)
                  + zs[0] ** mu)
            al = list(multi_indices(nv, mu))
            tr, _ = trace_sum(R_, F, Pn)
            check(frakN_sum(R_, P, ks, zs, al) == tr,
                  "B2 (21.13) k=%s mu=%d" % (ks, mu))
            beyond = [a for a in multi_indices(nv, mu + 2) if sum(a) > mu]
            check(frakN_sum(R_, P, ks, zs, beyond) == 0
                  and all(frakN_sum(R_, P, ks, zs, [a]) == 0 for a in beyond),
                  "B2 terms |alpha| > mu vanish")
section("B2")

# B3. Example 2 (p. 163): the sum of the squared distances from (A, B, C)
# to the 27 common points of the three cubic surfaces, with all 30
# coefficients symbolic: (21.13) with R = (A - x_1)^2 + ..., mu = 2, gives
# exactly the printed polynomial (an identity in Q[a, b, c, A, B, C]),
# which involves 18 of the 30 coefficients; for one random rational
# instance the trace in the 27-dimensional quotient agrees.
idxs = [(i, j, k) for i in range(3) for j in range(3) for k in range(3)
        if i + j + k <= 2]
names = (['a%d%d%d' % t for t in idxs] + ['b%d%d%d' % t for t in idxs]
         + ['c%d%d%d' % t for t in idxs] + ['A', 'B', 'C', 'x1', 'x2', 'x3'])
P3s = PolynomialRing(QQ, names)
G = P3s.gens()
cA = {t: G[i] for i, t in enumerate(idxs)}
cB = {t: G[10 + i] for i, t in enumerate(idxs)}
cC = {t: G[20 + i] for i, t in enumerate(idxs)}
AA_, BB_, CC_, X1, X2, X3 = G[30:]
mon = lambda t: X1 ** t[0] * X2 ** t[1] * X3 ** t[2]
Ps = [sum(cA[t] * mon(t) for t in idxs), sum(cB[t] * mon(t) for t in idxs),
      sum(cC[t] * mon(t) for t in idxs)]
Rdist = (AA_ - X1) ** 2 + (BB_ - X2) ** 2 + (CC_ - X3) ** 2
Fs = [X1 ** 3 + Ps[0], X2 ** 3 + Ps[1], X3 ** 3 + Ps[2]]
D1 = jac(Fs, [X1, X2, X3])
total = P3s(0)
for al in multi_indices(3, 2):
    target = tuple(3 * (al[j] + 1) - 1 for j in range(3))
    prodp = prod([Ps[j] ** al[j] for j in range(3)], P3s(1))
    expr = Rdist * D1 * prodp
    # coefficient of x^target, as a polynomial in the other variables
    part = P3s(0)
    for e, c in expr.dict().items():
        if tuple(e[33:36]) == target:
            part += c * prod([G[i] ** e[i] for i in range(33)], P3s(1))
    total += (-1) ** sum(al) * part
a = lambda s: cA[tuple(int(ch) for ch in s)]
b = lambda s: cB[tuple(int(ch) for ch in s)]
c = lambda s: cC[tuple(int(ch) for ch in s)]
printed = (9 * (a('200') ** 2 + b('020') ** 2 + c('002') ** 2)
           - 18 * (a('100') + b('010') + c('001'))
           + 6 * (a('101') * c('002') + a('110') * b('020')
                  + a('200') * b('110') + b('011') * c('002')
                  + a('200') * c('101') + b('020') * c('011'))
           + 12 * (a('002') * c('101') + a('020') * b('110')
                   + a('110') * b('200') + b('002') * c('011')
                   + b('011') * c('020') + a('101') * c('200'))
           + 27 * (AA_ ** 2 + BB_ ** 2 + CC_ ** 2)
           + 18 * (AA_ * a('200') + BB_ * b('020') + CC_ * c('002')))
check(total == printed, "B3 Example 2: printed sum of squared distances")
used = set(i for e in printed.dict() for i in range(30) if e[i] > 0)
check(len(used) == 18, "B3 18 of the 30 coefficients occur")
vals = {g: QQ(rng.randint(-5, 5)) for g in G[:33]}
Pr3 = PolynomialRing(QQ, 'x1,x2,x3')
sub = dict(vals)
sub.update({X1: Pr3.gen(0), X2: Pr3.gen(1), X3: Pr3.gen(2)})
tr, dim = trace_sum(Pr3(Rdist.subs(sub)), [Pr3(f.subs(sub)) for f in Fs], Pr3)
check(dim == 27 and tr == printed.subs(vals), "B3 trace check")
section("B3")


rng = pyrandom.Random(214)


# B4. Theorem 21.4 (Aizenberg and Tsikh), (21.16): triangular systems
# f_i = z_i^(k_i) + sum_(j<i) z_j phi_(ij) + P_i; the terms of (21.19) for
# alpha in the box M add up to the trace of R, and the terms in the box
# enlarged by 2 (n = 2) resp. 1 (n = 3) in every coordinate vanish outside
# M.  n = 2, k = (2, 3);
# n = 3, k = (2, 2, 2), (3, 2, 2), random dense phi and P, random R with
# prescribed degrees m_i and mu; and the system f_1 = z_1^2 + z_2 + ...,
# f_2 = z_2^2 + z_1 z_3 + ..., f_3 = z_3^2 + ... of the question on (21.20)
# (Delta_1 has degree 2 in z_3, more than |k| - n - i + 1 = 1 assumed for
# i = 3), for which the statement still holds.
def box_M(ks, ms, mu):
    n = len(ks)
    am = sum(ms)
    bounds = [mu]
    for j in range(2, n + 1):
        b = prod(ks[:j - 1], 1) * (am + 1)
        for l in range(1, j - 1):
            b -= prod(ks[l:j - 1], 1) * (ms[l - 1] + 1)
        b -= (ms[j - 2] + 1) + 1
        bounds.append(b)
    return bounds


check(box_M((3, 3), (1, 1), 2) == [2, 6], "B4 box for Example 3")
check(box_M((2, 2, 2), (1, 2, 1), 3) == [3, 2 * 5 - 1 - 2,
                                         4 * 5 - 2 * 2 - 3 - 1],
      "B4 box n = 3: alpha_3 <= k_1 k_2(|m|+1) - k_2 m_1 - k_2 - m_2 - 2")


def tsikh_terms(R_, F, ks, zs, alphas):
    s = [F[j] - zs[j] ** ks[j] for j in range(len(zs))]
    D1 = jac(F, zs)
    base = R_ * D1
    out = {}
    pw = [[R_.parent()(1)] for _ in zs]
    for al in alphas:
        for j in range(len(zs)):
            while len(pw[j]) <= al[j]:
                pw[j].append(pw[j][-1] * s[j])
        target = tuple(ks[j] * (al[j] + 1) - 1 for j in range(len(zs)))
        prodp = prod([pw[j][al[j]] for j in range(len(zs))], R_.parent()(1))
        out[al] = (-1) ** sum(al) * coeff(base * prodp, target)
    return out


def triangular(rng, Pn, ks, special=False):
    zs = Pn.gens()
    n = len(ks)
    F = []
    for i in range(n):
        f = zs[i] ** ks[i]
        for j in range(i):
            f += zs[j] * rand_poly(rng, Pn, list(range(n)), [ks[i] - 1], 2)
        f += rand_poly(rng, Pn, list(range(n)), list(range(ks[i])), 3)
        F.append(f)
    if special:
        F = [zs[0] ** 2 + zs[1] + rand_poly(rng, Pn, [0, 1, 2], [0, 1], 2),
             zs[1] ** 2 + zs[0] * zs[2] + rand_poly(rng, Pn, [0, 1, 2],
                                                     [0, 1], 2),
             zs[2] ** 2 + rand_poly(rng, Pn, [0, 1, 2], [0, 1], 2)]
    return F


NZ = []
for ks, special in [((2, 3), False), ((2, 2, 2), False), ((3, 2, 2), False),
                    ((2, 2, 2), True)]:
    n = len(ks)
    Pn = PolynomialRing(QQ, ['z%d' % i for i in range(n)])
    zs = Pn.gens()
    for trial in range(2):
        F = triangular(rng, Pn, ks, special)
        if special:
            D1 = jac(F, zs)
            check(D1.degree(zs[2]) == 2, "B4 special: deg_(z_3) Delta_1 = 2")
        for ms in ([(1, 1), (2, 0)] if n == 2 else [(1, 1, 0), (0, 1, 1)]):
            R_ = Pn(rng.choice([1, -2]))
            for j in range(n):
                if ms[j]:
                    R_ *= zs[j] ** ms[j] + rng.choice([-1, 1, 2])
            mu = R_.degree()
            bnds = box_M(ks, ms, mu)
            big = [b + (2 if n == 2 else 1) for b in bnds]
            alphas = list(itertools.product(*[range(b + 1) for b in big]))
            terms = tsikh_terms(R_, F, ks, zs, alphas)
            inM = [a for a in alphas if all(a[j] <= bnds[j] for j in range(n))]
            tr, dim = trace_sum(R_, F, Pn)
            check(dim == prod(ks), "B4 N = k_1 ... k_n")
            check(sum(terms[a] for a in inM) == tr,
                  "B4 (21.16) k=%s m=%s" % (ks, ms))
            check(all(terms[a] == 0 for a in alphas if a not in inM),
                  "B4 terms outside M vanish k=%s" % (ks,))
            NZ.append(sum(1 for a in inM if terms[a] != 0))
check(sum(NZ) >= 40, "B4 nonvacuous")
section("B4")


rng = pyrandom.Random(2124)

# B5. Example 3 (p. 166), system (21.24):
# f_1 = x^3 + (-15 p x^2 - 27 p y^2 + 24 p^2 x + 16 p^3)/2 (first equation
# divided by 2), f_2 = y^3 + x (a x^2 + b x y + c y^2)/d - y/d (second
# divided by d), k = (3, 3), R = x y (m = (1, 1), mu = 2), box
# M = [0, 2] x [0, 6].  (21.16) computed symbolically in
# Q[a, b, c, p, e], e = 1/d, gives
# p^2 [-(1215/2) a/d - (129/4) c/d + (3645/4) ab/d^2 + (1215/2) bc/d^2
#      - (3645/4)(b^2 c + a c^2)/d^3 - (405/2) c^3/d^3 + (3645/4) b c^3/d^4
#      - (729/4) c^5/d^5];
# the traces of x y in Q[x, y]/(21.24) for 4 random rational parameter
# points agree with it; the printed sum is refuted (it is not 0 for
# a = b = c = 0, where (x, y) -> (x, -y) permutes the roots).  For
# a = b = c = 0, p = 1: (4, 0) is a double root for every d != 0 (local
# multiplicity 2 at d = 4/5, 9/10, 2) and the roots lie on y = 0,
# y = +-d^(-1/2); 2x^3 - 15x^2 + 24x + 16 - 27/d has 1 real root for
# d = 4/5, 9/10 and 3 for d = 2, so there are 4 resp. 8 distinct real
# roots, never 9.
Pp = PolynomialRing(QQ, 'a,b,c,p,e,x,y')
a, b, c, p, e, x, y = Pp.gens()
f1 = x ** 3 + (-15 * p * x ** 2 - 27 * p * y ** 2 + 24 * p ** 2 * x
               + 16 * p ** 3) / 2
f2 = y ** 3 + x * (a * x ** 2 + b * x * y + c * y ** 2) * e - y * e
check(2 * f1 == 2 * (2 * p + x) ** 3 - 27 * p * (x ** 2 + y ** 2),
      "B5 f_1 is the first equation")
F = [f1, f2]
s = [f1 - x ** 3, f2 - y ** 3]
D1 = jac(F, [x, y])
Rxy = x * y
total = Pp(0)
nz = 0
for al in itertools.product(range(3 + 2), range(7 + 2)):
    target = (3 * (al[0] + 1) - 1, 3 * (al[1] + 1) - 1)
    expr = Rxy * D1 * s[0] ** al[0] * s[1] ** al[1]
    part = Pp({ex: cf for ex, cf in expr.dict().items()
               if (ex[5], ex[6]) == target})
    part = part.subs({x: 1, y: 1})
    if al[0] <= 2 and al[1] <= 6:
        total += (-1) ** sum(al) * part
        nz += part != 0
    else:
        check(part == 0, "B5 terms outside M vanish")
reader = p ** 2 * (-QQ(1215) / 2 * a * e - QQ(129) / 4 * c * e
                   + QQ(3645) / 4 * a * b * e ** 2
                   + QQ(1215) / 2 * b * c * e ** 2
                   - QQ(3645) / 4 * (b ** 2 * c + a * c ** 2) * e ** 3
                   - QQ(405) / 2 * c ** 3 * e ** 3
                   + QQ(3645) / 4 * b * c ** 3 * e ** 4
                   - QQ(729) / 4 * c ** 5 * e ** 5)
check(total == reader, "B5 sum xy by (21.16)")
printed = (-c + p / 4 * (22 + 121 * p)
           - p * e / 4 * (54 * a + 75 * b + 76 * c + 1329 * p * a
                          + 594 * p * b + 715 * p * c)
           + p * e ** 2 / 4 * (54 * b ** 2 + 76 * c ** 2 + 108 * b * c
                               + 264 * p * b * c + 729 * p * b ** 2
                               + 1458 * p * a * b)
           - p * e ** 3 / 4 * (54 * c ** 3 + 162 * b * c ** 2
                               + 1323 * p * c ** 3 + 2187 * p * b * c ** 2
                               + 2187 * p * a * c + 2187 * p * b ** 2 * c)
           + p * e ** 4 / 4 * (54 * c ** 4 - 729 * p * c ** 4
                               + 729 * p * b * c ** 3)
           - p * e ** 5 / 4 * 729 * p * c ** 5)
refuted(total == printed, "B5 printed sum")
check(total.subs({a: 0, b: 0, c: 0}) == 0
      and printed.subs({a: 0, b: 0, c: 0}) == p / 4 * (22 + 121 * p),
      "B5 a = b = c = 0: sum is 0, printed p(22 + 121p)/4")
check(coeff(total, (0, 0, 5, 2, 5, 0, 0)) == coeff(printed,
                                                    (0, 0, 5, 2, 5, 0, 0)),
      "B5 the c^5 terms agree")
P2 = PolynomialRing(QQ, 'x,y')
X, Y = P2.gens()
for trial in range(4):
    vals = {a: QQ(rng.randint(-4, 4)), b: QQ(rng.randint(-4, 4)),
            c: QQ(rng.randint(1, 4)), p: QQ(rng.choice([1, 2, -3])) / 2,
            e: QQ(1) / rng.choice([2, 3, -5])}
    sub = dict(vals)
    sub.update({x: X, y: Y})
    tr, dim = trace_sum(X * Y, [P2(f1.subs(sub)), P2(f2.subs(sub))], P2)
    check(dim == 9 and tr == total.subs(vals), "B5 trace check")
    refuted(tr == printed.subs(vals), "B5 printed at a random point")
# a = b = c = 0, p = 1
Pl = PolynomialRing(QQ, 'x,y', order='negdegrevlex')
xl, yl = Pl.gens()
for dd in [QQ(4) / 5, QQ(9) / 10, QQ(2)]:
    g1 = 2 * (2 + (xl + 4)) ** 3 - 27 * ((xl + 4) ** 2 + yl ** 2)
    g2 = yl - dd * yl ** 3
    check(Pl.ideal([g1, g2]).vector_space_dimension() == 2,
          "B5 (4, 0) is a double root, d = %s" % dd)
    h = polygen(QQ, 'x')
    hx = 2 * h ** 3 - 15 * h ** 2 + 24 * h + 16
    check(hx == (h - 4) ** 2 * (2 * h + 1), "B5 y = 0: roots 4 (double), -1/2")
    nreal = (hx - 27 / dd).number_of_real_roots()
    check(nreal == (1 if dd < 1 else 3), "B5 real roots on y = +-1/sqrt(d)")
    check(len((hx - 27 / dd).roots(AA)) == nreal
          and (hx - 27 / dd).is_squarefree(), "B5 distinct")
    distinct = 2 + 2 * nreal
    check(distinct == (4 if dd < 1 else 8), "B5 distinct real roots")
section("B5")


rng = pyrandom.Random(2147)


def budan_fourier(P, x0):
    """Number of sign changes in P, P', ..., P^(deg) at x0 (x0 = +-oo
    allowed), and whether a zero occurs in the sequence."""
    seq = []
    Q = P
    while Q != 0:
        if x0 == Infinity:
            seq.append(sign(Q.leading_coefficient()))
        elif x0 == -Infinity:
            seq.append(sign(Q.leading_coefficient()) * (-1) ** Q.degree())
        else:
            seq.append(sign(Q(x0)))
        Q = Q.derivative()
    nz = [s for s in seq if s != 0]
    return sum(1 for i in range(len(nz) - 1) if nz[i] != nz[i + 1]), 0 in seq


# B6. Example 4 (p. 169): for fixed z_3 the roots of f_1 = f_2 = 0 are
# z_1 = z_3 + z_2^3, z_2^4 - z_2^3 - 2 z_3 = 0; S_q = trace of f_3^q in
# Q[z_3][z_2]/(z_2^4 - z_2^3 - 2 z_3) (companion matrix).  The same S_q
# from the printed formula (weights (1, 4), functional N) with alpha in a
# box [0, 12] x [0, 12] (terms vanish outside [0, 2q] x [0, 3q]).  S_1, S_2
# as printed; S_3, S_4 corrected (iv-21-ex4-power-sums), the printed ones
# refuted; r(z_3) = b_4 from (21.5) is the corrected polynomial
# (iv-21-ex4-resultant) = z_3^3 (z_3 - 12)(z_3^4 + 6 z_3^3 + 8 z_3^2 - 10 z_3
# + 3); (21.5) applied to the printed sums does not give the printed r; the
# elimination ideal of (21.29) in Q[z_3] is generated by r/z_3^2.
Rz = PolynomialRing(QQ, 'z3')
z3 = Rz.gen()
Rz2 = PolynomialRing(Rz, 'z2')
z2 = Rz2.gen()
mpol = z2 ** 4 - z2 ** 3 - 2 * z3
C = companion_matrix(mpol, format='right')
f3 = lambda Z1, Z2: Z1 ** 2 - z3 - Z2 ** 2
Mz2 = C
Mz1 = z3 * identity_matrix(Rz, 4) + C ** 3
M3 = f3(Mz1, Mz2)
S = {q: (M3 ** q).trace() for q in range(1, 5)}
book = {1: 4 * z3 ** 2 + 10 * z3,
        2: 4 * z3 ** 4 + 244 * z3 ** 3 + 100 * z3 ** 2,
        3: 4 * z3 ** 6 + 1374 * z3 ** 5 + 4140 * z3 ** 4 + 826 * z3 ** 3
        - 12 * z3 ** 2,
        4: 4 * z3 ** 8 + 4584 * z3 ** 7 + 50904 * z3 ** 6 + 54696 * z3 ** 5
        + 7124 * z3 ** 4 - 16 * z3 ** 3}
printed34 = {3: 4 * z3 ** 6 + 1410 * z3 ** 5 + 4068 * z3 ** 4 + 922 * z3 ** 3
             - 12 * z3 ** 2 - 9 * z3,
             4: 4 * z3 ** 8 + 4440 * z3 ** 7 + 51012 * z3 ** 6
             + 45520 * z3 ** 5 + 7744 * z3 ** 4 + 7472 * z3 ** 3
             - 480 * z3 ** 2}
for q in range(1, 5):
    check(S[q] == book[q], "B6 S_%d" % q)
for q in (3, 4):
    refuted(S[q] == printed34[q], "B6 printed S_%d" % q)
# the printed formula with the functional N
P3v = PolynomialRing(Rz, 'z1,z2')
u1, u2 = P3v.gens()
D1 = jac([u1 - z3 - u2 ** 3, u2 ** 4 - z3 - u1], [u1, u2])
for q in range(1, 5):
    base = (u1 ** 2 - z3 - u2 ** 2) ** q * D1
    # Theorem 21.5 with a = (1, 4), l = (4, 1): mu' = 8q, m' = (8q, 2q),
    # M' = [0, 8q] x [0, 4(10q + 1) - 8q - 2]
    Mb = (8 * q, 4 * (10 * q + 1) - 8 * q - 2)
    tot = Rz(0)
    pw1 = [P3v(1)]
    pw2 = [P3v(1)]
    nz = 0
    outside = 0
    for a1 in range(10 * q + 2):
        while len(pw1) <= a1:
            pw1.append(pw1[-1] * (z3 + u2 ** 3))
        for a2 in range(8 * q + 2):
            while len(pw2) <= a2:
                pw2.append(pw2[-1] * (z3 + u1))
            t = coeff(base * pw1[a1] * pw2[a2], (a1, 4 * a2 + 3))
            if t != 0:
                nz += 1
                outside += not (a1 <= Mb[0] and a2 <= Mb[1])
            tot += t
    check(outside == 0, "B6 nonzero terms lie in M'")
    check(nz >= 2 and tot == S[q], "B6 S_%d by the functional N" % q)


def newton_b(Ss, N):
    bs = {}
    for j in range(1, N + 1):
        bs[j] = -(Ss[j] + sum(Ss[j - i] * bs[i] for i in range(1, j))) / j
    return bs


r = newton_b(S, 4)[4]
r_book = (z3 ** 8 - 6 * z3 ** 7 - 64 * z3 ** 6 - 106 * z3 ** 5
          + 123 * z3 ** 4 - 36 * z3 ** 3)
check(r == r_book, "B6 r(z_3)")
check(r == z3 ** 3 * (z3 - 12) * (z3 ** 4 + 6 * z3 ** 3 + 8 * z3 ** 2
                                  - 10 * z3 + 3), "B6 factorization of r")
check(r == (Mz1 - z3 - Mz2 ** 2).det() * 0 + M3.det(), "B6 r = norm of f_3")
r_printed = (z3 ** 8 - 6 * z3 ** 7 - 67 * z3 ** 6 - 4272 * z3 ** 5
             + 293 * z3 ** 4 - 1920 * z3 ** 3 + 90 * z3 ** 2)
refuted(r == r_printed, "B6 printed r")
Sp = dict(S)
Sp.update(printed34)
refuted(newton_b(Sp, 4)[4] == r_printed, "B6 printed r from printed sums")
P3 = PolynomialRing(QQ, 'z1,z2,z3', order='lex')
Z1, Z2, Z3 = P3.gens()
sys29 = [Z1 - Z3 - Z2 ** 3, Z2 ** 4 - Z3 - Z1, Z1 ** 2 - Z3 - Z2 ** 2]
elim = P3.ideal(sys29).elimination_ideal([Z1, Z2]).gens()
check(len(elim) == 1 and P3.ideal(elim) == P3.ideal([P3((r // z3 ** 2)(Z3))]),
      "B6 elimination ideal generated by r/z_3^2")
section("B6")

# B7. Example 6 (p. 173): the local algebra of (21.29) at 0 has dimension
# 2 (iv-21-ex6-system); the characteristic polynomial of z_2 on
# Q[z]/(21.29) (dimension 8) is z_2^2 Q(z_2), Q = z_2^6 + 2 z_2^5 + z_2^4
# - 2 z_2^2 + 2 z_2 - 4; Q(1) = 0, Q'(1) != 0; Budan-Fourier at -oo and
# -1: one root in (-oo, -1], no zero in the sign sequences; Q has exactly
# 2 real roots (Sturm), none in (-1, 0) or (0, 1) or (1, oo); since
# z_3 = (z_2^4 - z_2^3)/2, z_1 = z_3 + z_2^3 every real z_2 gives a real
# root: 4 real roots counting multiplicity.  The real roots of r(z_3) are
# 0 (triple: (0,0,0) twice and (1,1,0)) and 12.
Pl = PolynomialRing(QQ, 'z1,z2,z3', order='negdegrevlex')
check(Pl.ideal([Pl(f) for f in sys29]).vector_space_dimension() == 2,
      "B7 (0, 0, 0) has multiplicity 2")
Pd = PolynomialRing(QQ, 'z1,z2,z3')
I29 = Pd.ideal([Pd(f) for f in sys29])
check(I29.vector_space_dimension() == 8, "B7 8 roots")
h = polygen(QQ, 'h')
charp = mult_matrix(Pd.gen(1), I29).charpoly('h')
Qp = h ** 6 + 2 * h ** 5 + h ** 4 - 2 * h ** 2 + 2 * h - 4
check(charp == h ** 2 * Qp, "B7 P(z_2) = z_2^2 Q(z_2)")
check(Qp(1) == 0 and Qp.derivative()(1) != 0, "B7 z_2 = 1 simple root")
vm, zm = budan_fourier(Qp, -Infinity)
v1, z1_ = budan_fourier(Qp, -1)
check(vm - v1 == 1 and not zm and not z1_, "B7 Budan-Fourier on (-oo, -1]")
check(Qp.number_of_real_roots() == 2, "B7 Q has 2 real roots")
check(Qp(-1) != 0 and len([rt for rt, _ in Qp.roots(AA)
                           if -1 < rt < 1]) == 0, "B7 no roots in (-1, 1)")
check(sorted(rt for rt, _ in r.roots(AA)) == [0, 12]
      and r.roots(AA)[0][1] + r.roots(AA)[1][1] == 4, "B7 real roots of r")
section("B7")

# B8. Example 5 (p. 172), system (21.37): Q[z]/(21.37) has dimension 18;
# the characteristic polynomial of z_2 is the corrected P (iv-21-ex5-
# eliminant), the printed one refuted; P has no real roots (Sturm);
# Budan-Fourier: V(-oo) = V(-1) = 18, V(1) = V(oo) = 0, no zeros in the
# sequences at +-1; the characteristic polynomial of z_1 is
# (z_1^3 + z_1 - 3)^6 (iv-21-ex5-z1, printed z_1^3 - z_1 + 1 refuted), with
# one real root.
I37 = Pd.ideal([Pd.gen(0) ** 3 - Pd.gen(1) + Pd.gen(2) ** 2 - 1,
                Pd.gen(1) ** 3 + Pd.gen(0) - Pd.gen(2) + 1,
                Pd.gen(2) ** 2 - Pd.gen(0) - Pd.gen(1) + 2])
check(I37.vector_space_dimension() == 18, "B8 18 roots")
P5 = (h ** 18 + 6 * h ** 15 - 3 * h ** 13 + 23 * h ** 12 - 12 * h ** 10
      + 54 * h ** 9 + 3 * h ** 8 - 30 * h ** 7 + 56 * h ** 6 + 6 * h ** 5
      - 14 * h ** 4 - 3 * h ** 3 + 7 * h ** 2 - 8 * h + 3)
P5p = (h ** 18 + 6 * h ** 15 - 3 * h ** 13 + 21 * h ** 12 - 12 * h ** 10
       + 44 * h ** 9 + 3 * h ** 8 - 30 * h ** 7 + 63 * h ** 6 + 6 * h ** 5
       - 36 * h ** 4 + 53 * h ** 3 + 9 * h ** 2 - 27 * h + 27)
cz2 = mult_matrix(Pd.gen(1), I37).charpoly('h')
check(cz2 == P5, "B8 P(z_2)")
refuted(cz2 == P5p, "B8 printed P(z_2)")
check(P5.number_of_real_roots() == 0, "B8 no real roots")
bf = [budan_fourier(P5, x0) for x0 in (-Infinity, -1, 1, Infinity)]
check([v for v, _ in bf] == [18, 18, 0, 0] and not bf[1][1]
      and not bf[2][1], "B8 Budan-Fourier counts")
cz1 = mult_matrix(Pd.gen(0), I37).charpoly('h')
check(cz1 == (h ** 3 + h - 3) ** 6, "B8 Q(z_1)^6")
refuted(cz1.radical() == h ** 3 - h + 1, "B8 printed Q(z_1)")
check((h ** 3 + h - 3).number_of_real_roots() == 1, "B8 Q has a real root")
section("B8")

# B9. Example 7 (p. 174), system (21.39): Q[z]/(21.39) has dimension 9;
# Omega = characteristic polynomial of a_1 z_1^2 + a_2 z_2^2 over
# Q[a_1, a_2] is the printed polynomial with the constant-term coefficient
# a_1^5 a_2^4 (iv-21-ex7-constant), the printed 12 a_1^5 a_2^4 refuted; the
# special values (a = (1, 1), (1, 2)) corrected (iv-21-ex7-disk,
# iv-21-ex7-ellipse-values), printed refuted; each has exactly one root in
# [0, oo), in (4, 5) resp. (7, 8); eliminating z_2 gives
# z_1^9 - 3z_1^6 - z_1^4 + z_1^3 - z_1^2 - 1 with one real root, so the
# system has one real root.
P2e = PolynomialRing(QQ, "z1,z2")
I39 = P2e.ideal([P2e.gen(0) ** 3 - P2e.gen(1) ** 2 - 1,
                 P2e.gen(1) ** 3 - P2e.gen(0) ** 2 - P2e.gen(0)])
check(I39.vector_space_dimension() == 9, "B9 9 roots")
Ra = PolynomialRing(QQ, 'a1,a2')
A1, A2 = Ra.gens()
M1 = mult_matrix(P2e.gen(0) ** 2, I39).change_ring(Ra)
M2 = mult_matrix(P2e.gen(1) ** 2, I39).change_ring(Ra)
Rh = PolynomialRing(Ra, 'h')
H = Rh.gen()
Om = (A1 * M1 + A2 * M2).charpoly('h')
Om = Rh(Om)
book7 = (H ** 9 - (5 * A1 * A2 + 6 * A2 ** 2) * H ** 7
         - (7 * A1 ** 3 + 7 * A1 ** 2 * A2 + 14 * A1 * A2 ** 2
            + 6 * A2 ** 3) * H ** 6
         - (6 * A1 ** 4 + 42 * A1 ** 3 * A2 + 19 * A1 ** 2 * A2 ** 2
            + A1 * A2 ** 3 - 9 * A2 ** 4) * H ** 5
         - (7 * A1 ** 5 + 29 * A1 ** 4 * A2 + 91 * A1 ** 3 * A2 ** 2
            + 6 * A1 ** 2 * A2 ** 3 - 27 * A1 * A2 ** 4
            - 17 * A2 ** 5) * H ** 4
         - (7 * A1 ** 6 + 29 * A1 ** 5 * A2 + 39 * A1 ** 4 * A2 ** 2
            + 88 * A1 ** 3 * A2 ** 3 - 4 * A1 ** 2 * A2 ** 4
            - 30 * A1 * A2 ** 5 - 3 * A2 ** 6) * H ** 3
         - (3 * A1 ** 7 + 24 * A1 ** 6 * A2 + 30 * A1 ** 5 * A2 ** 2
            + 12 * A1 ** 4 * A2 ** 3 + 60 * A1 ** 3 * A2 ** 4
            + 13 * A1 ** 2 * A2 ** 5 - 17 * A1 * A2 ** 6
            + 13 * A2 ** 7) * H ** 2
         - (2 * A1 ** 8 + 6 * A1 ** 7 * A2 + 18 * A1 ** 6 * A2 ** 2
            + 7 * A1 ** 5 * A2 ** 3 - 7 * A1 ** 4 * A2 ** 4
            + 36 * A1 ** 3 * A2 ** 5 + 11 * A1 ** 2 * A2 ** 6
            - 10 * A1 * A2 ** 7 + 12 * A2 ** 8) * H
         - A1 ** 9 - 2 * A1 ** 8 * A2 - 3 * A1 ** 7 * A2 ** 2
         - 4 * A1 ** 6 * A2 ** 3 + A1 ** 5 * A2 ** 4 + 2 * A1 ** 4 * A2 ** 5
         - 9 * A1 ** 3 * A2 ** 6 - A1 ** 2 * A2 ** 7 + 4 * A1 * A2 ** 8
         - 4 * A2 ** 9)
check(Om == book7, "B9 Omega(a_1, a_2)")
refuted(Om == book7 + 11 * A1 ** 5 * A2 ** 4, "B9 printed 12 a_1^5 a_2^4")
spec = {(1, 1): (h ** 9 - 11 * h ** 7 - 34 * h ** 6 - 59 * h ** 5 - 89 * h ** 4
                 - 126 * h ** 3 - 138 * h ** 2 - 75 * h - 17,
                 h ** 9 - 11 * h ** 7 - 34 * h ** 6 - 59 * h ** 5 - 39 * h ** 4
                 - 126 * h ** 3 - 138 * h ** 2 - 75 * h - 6, (4, 5)),
        (1, 2): (h ** 9 - 34 * h ** 7 - 125 * h ** 6 - 30 * h ** 5
                 + 499 * h ** 4 + 291 * h ** 3 - 2219 * h ** 2 - 3678 * h
                 - 1697,
                 h ** 9 - 34 * h ** 7 - 125 * h ** 6 - 22 * h ** 5
                 + 119 * h ** 4 + 291 * h ** 3 - 2179 * h ** 2 - 3678 * h
                 - 1421, (7, 8))}
for (v1_, v2_), (corr, prin, (lo, hi)) in spec.items():
    sp = h.parent()([cf.subs({A1: v1_, A2: v2_}) for cf in Om.list()])
    check(sp == corr, "B9 Omega at a = (%d, %d)" % (v1_, v2_))
    refuted(sp == prin, "B9 printed Omega at a = (%d, %d)" % (v1_, v2_))
    nonneg = [rt for rt, _ in sp.roots(AA) if rt >= 0]
    check(len(nonneg) == 1 and lo < nonneg[0] < hi and sp(lo) < 0 < sp(hi),
          "B9 one root in [0, oo), in (%d, %d)" % (lo, hi))
cz1 = mult_matrix(P2e.gen(0), I39).charpoly('h')
check(cz1 == h ** 9 - 3 * h ** 6 - h ** 4 + h ** 3 - h ** 2 - 1,
      "B9 eliminating z_2")
check(cz1.number_of_real_roots() == 1, "B9 one real root")
section("B9")


rng = pyrandom.Random(2160)


# B10. Theorem 21.6 (Bolotov), (21.31), for the system (21.30)
# z_j^(k_j) - sum^j a_(j alpha) z^alpha = 0: power sums S_l^(m) against the
# traces.  n = 1 (Waring), k = 3, 4; n = 2, k = (2, 2), (2, 3), (3, 2), sparse
# random coefficients (the monomials z_1^2, z_1 z_2 of degree k_2 included),
# l = 1, 2, m <= 3.  With the convention: if beta_j(q) = 0, then
# (beta_j(q) - 1)! is 1 and the column delta_(pj) k_j beta_j(q) - gamma_p(q_j)
# is delta_(pj) k_j (iv-21-waring-convention), the formula is right; without
# it (the terms with some beta_j(q) = 0 omitted, as the printed formula
# leaves them undefined) or with delta_(pj) in place of delta_(pj) k_j it is
# refuted.
def allowed(j, ks, n):
    out = []
    for al in multi_indices(n, ks[j]):
        if sum(al) < ks[j]:
            out.append(al)
        elif any(al[i] >= 1 for i in range(j)):
            out.append(al)
    return out


def bolotov(ks, Acoef, l, m, conv):
    n = len(ks)
    items = [(j, al) for j in range(n) for al in Acoef[j]]
    total = QQ(0)
    L = 2 * m * prod(ks) + 2
    # bound: the conditions force finitely many q; enumerate with pruning on
    # sum_j sum_alpha lambda (|alpha| - k_j) = -m
    out = []

    def rec(i, cur, excess):
        if excess < -m:
            return
        if i == len(items):
            if excess == -m:
                out.append(dict(cur))
            return
        j, al = items[i]
        d = sum(al) - ks[j]
        for s in range(0, L + 1):
            if excess + s * d < -m:
                break
            if s:
                cur[items[i]] = s
            rec(i + 1, cur, excess + s * d)
        cur.pop(items[i], None)

    rec(0, {}, 0)
    for qd in out:
        beta = [0] * n
        gam = [[0] * n for _ in range(n)]     # gam[j][p] = gamma_p(q_j)
        coefq = QQ(1)
        for (j, al), s in qd.items():
            beta[j] += s
            for p in range(n):
                gam[j][p] += al[p] * s
            coefq *= Acoef[j][al] ** s / fact(s)
        okc = all(sum(gam[j][p] for j in range(n)) - ks[p] * beta[p]
                  + (m if p == l else 0) == 0 for p in range(n))
        if not okc:
            continue
        if conv == 'omit' and min(beta) == 0:
            continue
        M = matrix(QQ, n, n)
        f = QQ(1)
        for j in range(n):
            if beta[j] == 0:
                for p in range(n):
                    M[p, j] = (ks[j] if conv == 'k' else 1) if p == j else 0
            else:
                f *= fact(beta[j] - 1)
                for p in range(n):
                    M[p, j] = (ks[j] * beta[j] if p == j else 0) - gam[j][p]
        total += f * coefq * M.det()
    return total


for ks in [(3,), (4,), (2, 2), (2, 3), (3, 2)]:
    n = len(ks)
    Pn = PolynomialRing(QQ, n, ['z%d' % i for i in range(n)])
    zs = Pn.gens()
    for trial in range(2):
        Acoef = []
        for j in range(n):
            cand = allowed(j, ks, n)
            hi = [al for al in cand if sum(al) == ks[j]]
            lo = [al for al in cand if sum(al) < ks[j]]
            pick = rng.sample(lo, min(2, len(lo))) + hi[:1]
            Acoef.append({al: QQ(rng.choice([-2, -1, 1, 2, 3]))
                          for al in pick})
        F = [zs[j] ** ks[j] - sum(cf * mono(Pn, range(n), al)
                                  for al, cf in Acoef[j].items())
             for j in range(n)]
        bad_omit = bad_one = 0
        for l in range(n):
            for m in range(1, 4):
                tr, dim = trace_sum(zs[l] ** m, F, Pn)
                check(dim == prod(ks), "B10 N = k_1 ... k_n")
                check(bolotov(ks, Acoef, l, m, 'k') == tr,
                      "B10 (21.31) k=%s l=%d m=%d" % (ks, l, m))
                if n > 1:
                    bad_omit += bolotov(ks, Acoef, l, m, 'omit') != tr
                    bad_one += bolotov(ks, Acoef, l, m, 'one') != tr
        if n > 1:
            refuted(bad_omit == 0, "B10 terms with beta_j = 0 omitted")
            refuted(bad_one == 0, "B10 delta_(pj) instead of delta_(pj) k_j")
section("B10")

# B11. Propositions 21.7 and 21.8: for z = x + iy, Im sum a_k z_k =
# sum a_k y_k (a hyperplane in a) and Im sum a_k (z_k - b_k)^2 =
# 2 sum a_k (x_k - b_k) y_k, of degree 2 in (a, b): the "singular" set
# consists of second-order (not third-order) hypersurfaces in R^(2n)
# (iv-21-quadrics), n = 1, 2, 3.
for n in (1, 2, 3):
    Pq = PolynomialRing(QQ, ['a%d' % k for k in range(n)]
                        + ['b%d' % k for k in range(n)]
                        + ['x%d' % k for k in range(n)]
                        + ['y%d' % k for k in range(n)])
    G = Pq.gens()
    av, bv, xv, yv = G[:n], G[n:2 * n], G[2 * n:3 * n], G[3 * n:]
    Gi = Pq['I']
    I_ = Gi.gen()
    expr = sum(av[k] * (xv[k] + I_ * yv[k] - bv[k]) ** 2 for k in range(n))
    expr = expr.mod(I_ ** 2 + 1)
    im = expr[1]
    check(im == 2 * sum(av[k] * (xv[k] - bv[k]) * yv[k] for k in range(n)),
          "B11 Im of the quadratic form")
    degab = max(sum(e[:2 * n]) for e in im.dict())
    check(degab == 2, "B11 degree 2 in (a, b), n = %d" % n)
    lin = sum(av[k] * (xv[k] + I_ * yv[k]) for k in range(n))[1]
    check(max(sum(e[:2 * n]) for e in lin.dict()) == 1, "B11 hyperplane")
section("B11")


rng = pyrandom.Random(22)


def local_mult(F, nvars):
    """Multiplicity of the isolated zero 0 of F (polynomials over QQ) as the
    dimension of the local algebra (Singular, local degree ordering);
    Tsikh, Multidimensional Residues, 1992, §19, 4, Theorem: geometric
    multiplicity = dim of the local algebra."""
    Pl = PolynomialRing(QQ, nvars, ['y%d' % i for i in range(nvars)],
                        order='negdegrevlex')
    G = Pl.gens()
    Fl = [Pl(f(*G)) for f in F]
    return Pl.ideal(Fl).vector_space_dimension()


def isolated_at_0(F, nvars):
    """0 is an isolated zero of the homogeneous system F."""
    P = PolynomialRing(QQ, nvars, ['y%d' % i for i in range(nvars)])
    G = P.gens()
    return P.ideal([P(f(*G)) for f in F]).dimension() == 0


# ===========================================================================
# C. §22 (pp. 175-188)
# ===========================================================================
P2 = PolynomialRing(QQ, 'x,y')
x, y = P2.gens()
P3 = PolynomialRing(QQ, 'x,y,z')
X, Y, Z = P3.gens()

# C1. 1°: mu_0(z_1, z_1 + z_2^2) = 2; f_j = z_j^(k_j) + sum_(|alpha| > k_j)
# gives mu_0 = k_1 ... k_n (random, n = 2, 3; iv-175-orders-example-
# strict); (z_1 + z_2 + z_1^2, z_1 + z_2 + z_2^2) has the printed form with
# |alpha| >= k_j, k = (1, 1), and mu_0 = 3 (printed reading refuted);
# (z_1 + z_2 + z_1^2, z_1 - z_2 + z_2^2): mu_0 = 1.
check(local_mult([x, x + y ** 2], 2) == 2, "C1 (z_1, z_1 + z_2^2)")
for ks in [(2, 3), (3, 3), (2, 2, 3)]:
    n = len(ks)
    P = P2 if n == 2 else P3
    for trial in range(2):
        F = [P.gen(j) ** ks[j] + rand_poly(rng, P, list(range(n)),
                                           list(range(ks[j] + 1, ks[j] + 3)),
                                           4) for j in range(n)]
        check(local_mult(F, n) == prod(ks), "C1 mu = k_1 ... k_n %s" % (ks,))
g1 = [x + y + x ** 2, x + y + y ** 2]
check(local_mult(g1, 2) == 3, "C1 (z1 + z2 + z1^2, z1 + z2 + z2^2): 3")
refuted(local_mult(g1, 2) == 1, "C1 printed |alpha| >= k_j")
check(local_mult([x + y + x ** 2, x - y + y ** 2], 2) == 1,
      "C1 (z1 + z2 + z1^2, z1 - z2 + z2^2): 1")
section("C1")

# C2. Proposition 22.1, 1) and 2), on random examples in C^2:
# mu_0(f o g) = mu_0(f) mu_0(g) (g(0) = 0, f(0) = 0, isolated zeros) and
# mu_0(f_1 g_1, f_2) = mu_0(f_1, f_2) + mu_0(g_1, f_2).
for trial in range(4):
    f = [x ** 2 + rand_poly(rng, P2, [0, 1], [3], 2),
         y ** 3 + x * y + rand_poly(rng, P2, [0, 1], [4], 2)]
    g = [x + y ** 2 + rand_poly(rng, P2, [0, 1], [2, 3], 2),
         y ** 2 + x ** 3 + rand_poly(rng, P2, [0, 1], [3], 1)]
    fg = [fi(g[0], g[1]) for fi in f]
    check(local_mult(fg, 2) == local_mult(f, 2) * local_mult(g, 2),
          "C2 1) composition")
    f1 = x ** 2 + rand_poly(rng, P2, [0, 1], [1, 2, 3], 2) + y ** 3
    gg = y + x ** 2 + rand_poly(rng, P2, [0, 1], [2, 3], 2)
    f2 = x ** 3 + y ** 2 + rand_poly(rng, P2, [0, 1], [2, 3], 2)
    lhs = local_mult([f1 * gg, f2], 2)
    check(lhs == local_mult([f1, f2], 2) + local_mult([gg, f2], 2),
          "C2 2) additivity")
section("C2")

# C3. Theorem 22.4 (Tsikh) for n = 2 and the remark after it: with
# f_1 = z_1^k + z_2 (...) (so 0 is the only zero of f_1(., 0)), the order
# at z_2 = 0 of the Sylvester resultant Res_(z_1)(f_1, f_2) equals mu_0(f),
# 5 random systems.
Ry = PolynomialRing(QQ, 'y')
for trial in range(5):
    k = rng.choice([2, 3])
    f1 = x ** k + y * rand_poly(rng, P2, [0, 1], [0, 1, 2], 3) + y ** 2
    f2 = (rand_poly(rng, P2, [0, 1], [1, 2, 3], 4)
          + rng.choice([-1, 1]) * x ** 4 + y ** 3)
    res = Ry(f1.resultant(f2, x).subs({x: 0}).polynomial(y))
    ordr = min(e for e in res.exponents()) if res != 0 else None
    check(ordr == local_mult([f1, f2], 2), "C3 Theorem 22.4")
section("C3")

# C4. Theorem 22.5 (Bezout) in CP^2: affine roots (chart zeta_0 = 1,
# dimension of the quotient) plus the local multiplicities at the roots at
# infinity (rational points here) = product of the degrees, 3 systems.
Ph = PolynomialRing(QQ, 'h0,h1,h2')
h0, h1, h2 = Ph.gens()
systems = [[h1 * h2 - h0 ** 2, h2 ** 2 - h0 * h1],
           [h1 ** 2 - h0 * h2, h2 ** 3 - h0 * h1 ** 2 + h0 ** 2 * h2],
           [h1 * h2 * (h1 - h2) - h0 ** 3, h1 ** 2 - h2 ** 2 + h0 * h1]]
for S_ in systems:
    aff = P2.ideal([P2(f(1, x, y)) for f in S_])
    total = aff.vector_space_dimension()
    # roots at infinity: h0 = 0, (h1 : h2) in P^1
    Pt = PolynomialRing(QQ, 't')
    tt = Pt.gen()
    inf_pts = []
    G2 = gcd([Pt(f(0, tt, 1)) for f in S_])
    for rt, _ in G2.roots(QQ):
        inf_pts.append(('h2', rt))          # (0 : rt : 1)
    if all(f(0, 1, 0) == 0 for f in S_):
        inf_pts.append(('h1', 0))            # (0 : 1 : 0)
    for chart, rt in inf_pts:
        if chart == 'h2':
            F = [P2(f(x, y + rt, 1)) for f in S_]
        else:
            F = [P2(f(x, 1, y)) for f in S_]
        total += local_mult(F, 2)
    degs = prod([f.degree() for f in S_])
    check(total == degs, "C4 Bezout %s" % S_)
section("C4")

# C5. Theorem 22.6 (Tsikh and Yuzhakov): random f with homogeneous
# principal parts P_j of degrees k_j having an isolated zero at 0:
# mu_0 = k_1 ... k_n (n = 2, 3); with P having a common line of zeros
# mu_0 > k_1 ... k_n (always >=).
for ks in [(2, 2), (2, 3), (2, 2, 2)]:
    n = len(ks)
    P = P2 if n == 2 else P3
    for trial in range(2):
        Pp = [rand_poly(rng, P, list(range(n)), [ks[j]], 3) + P.gen(j) ** ks[j]
              for j in range(n)]
        if not isolated_at_0(Pp, n):
            continue
        F = [Pp[j] + rand_poly(rng, P, list(range(n)), [ks[j] + 1, ks[j] + 2],
                               3) for j in range(n)]
        check(local_mult(F, n) == prod(ks), "C5 isolated principal part")
deg_cases = [[x * (x + y) + y ** 3, x * y + x ** 3],
             [x ** 2 + y ** 4, x * y + y ** 3 + x ** 3],
             [X * Y + Z ** 3, X * Z + Y ** 3, X ** 2 + Y * Z ** 2]]
for F in deg_cases:
    n = len(F)
    P = F[0].parent()
    lows = []
    for f in F:
        dmin = min(sum(e) for e in f.exponents())
        lows.append(P({e: c for e, c in f.dict().items() if sum(e) == dmin}))
    kp = prod([l.degree() for l in lows])
    mu = local_mult(F, n)
    check(not isolated_at_0(lows, n) and mu > kp, "C5 non-isolated: mu > prod")
section("C5")

# C6. Theorem 22.7: weighted principal parts.  n = 2, a = (2, 3):
# P_1 = z_1^2 + z_2^3 (d_1 = 1), P_2 = z_1^3 + 2 z_1 z_2^3 (d_2 = 3/2), with
# random terms of higher weighted degree: mu_0 = a_1 d_1 a_2 d_2 = 9;
# n = 3, a = (1, 2, 3): P_1 = z_1 + z_2^2 + z_3^3, P_2 = z_2^2 - z_3^3,
# P_3 = 3 z_1 + z_2^2 + z_3^3 (d_j = 1): mu_0 = 6.  For the substitution
# z_j = zeta_j^(s_j), s_j = q prod_(k != j) a_k: mu_0(z(zeta)) = s_1...s_n
# = q^n (prod a)^(n-1) (6 and 36), mu_0(f~) = q^n prod d_j (prod a)^n
# (54 and 216), and the quotient with the corrected denominator gives
# mu_0(f) (iv-184-weighted-denominator); the printed denominator
# q^n prod a_j gives 36 instead of 6 for n = 3.  A non-isolated weighted
# principal part gives mu_0 > prod a_j d_j.
def weighted_deg(e, a):
    return sum(QQ(e[k]) / a[k] for k in range(len(a)))


for (P, a, Pw, ds) in [
        (P2, (2, 3), [x ** 2 + y ** 3, x ** 3 + 2 * x * y ** 3],
         (QQ(1), QQ(3) / 2)),
        (P3, (1, 2, 3), [X + Y ** 2 + Z ** 3, Y ** 2 - Z ** 3,
                         3 * X + Y ** 2 + Z ** 3], (QQ(1), QQ(1), QQ(1)))]:
    n = len(a)
    for j in range(n):
        check(all(weighted_deg(e, a) == ds[j] for e in Pw[j].exponents()),
              "C6 weighted homogeneous")
    check(isolated_at_0(Pw, n), "C6 isolated weighted principal part")
    F = []
    for j in range(n):
        th = P(0)
        for e in multi_indices(n, 7):
            if weighted_deg(e, a) > ds[j] and rng.random() < 0.15:
                th += rng.choice([-1, 1, 2]) * mono(P, range(n), e)
        F.append(Pw[j] + th)
    mu = local_mult(F, n)
    target = prod([a[j] * ds[j] for j in range(n)])
    check(mu == target, "C6 mu_0 = prod a_j d_j, n = %d" % n)
    q = 1
    s = [q * prod([a[k] for k in range(n) if k != j]) for j in range(n)]
    sub = {P.gen(j): P.gen(j) ** s[j] for j in range(n)}
    mz = local_mult([P.gen(j) ** s[j] for j in range(n)], n)
    check(mz == prod(s) == q ** n * prod(a) ** (n - 1), "C6 mu_0(z(zeta))")
    mft = local_mult([f.subs(sub) for f in F], n)
    check(mft == q ** n * prod(ds) * prod(a) ** n, "C6 mu_0(f~)")
    check(mft / (q ** n * prod(a) ** (n - 1)) == mu, "C6 corrected quotient")
    if n == 3:
        refuted(mft / (q ** n * prod(a)) == mu, "C6 printed denominator")
    if n == 2:
        Fd = [x ** 2 + y ** 3, x ** 3 + x * y ** 3 + y ** 5]
        check(not isolated_at_0([x ** 2 + y ** 3, x ** 3 + x * y ** 3], 2)
              and local_mult(Fd, 2) > 9, "C6 non-isolated weighted part")
section("C6")


rng = pyrandom.Random(228)


def covolume(S, n):
    """v(Gamma_-(S)) for a convenient S subset N^n \\ 0 (points on every
    axis): the volume of R_+^n minus Gamma_+(S), computed in a box."""
    Mx = max(max(s) for s in S) + 1
    gp = Polyhedron(vertices=[list(s) for s in S],
                    rays=[[1 if i == j else 0 for i in range(n)]
                          for j in range(n)], base_ring=QQ)
    box = Polyhedron(vertices=[list(v) for v in itertools.product(
        [0, Mx], repeat=n)], base_ring=QQ)
    return QQ(Mx) ** n - (gp & box).volume()


def minkowski(*Ss):
    out = {tuple([0] * len(Ss[0][0]))}
    for S in Ss:
        out = {tuple(a + b for a, b in zip(p, s)) for p in out for s in S}
    return sorted(out)


def mixed_mu(Ss):
    """(22.11): mu(S) = (-1)^n sum_k (-1)^k sum_(|I| = k) v(Gamma_-(S_I))."""
    n = len(Ss)
    tot = QQ(0)
    for k in range(1, n + 1):
        for I in itertools.combinations(range(n), k):
            tot += (-1) ** k * covolume(minkowski(*[Ss[i] for i in I]), n)
    return (-1) ** n * tot


def generic_system(P, Ss):
    return [sum(QQ(rng.choice([-1, 1]) * rng.randint(1, 97))
                * mono(P, range(P.ngens()), s) for s in S) for S in Ss]


P2 = PolynomialRing(QQ, 'x,y')
x, y = P2.gens()
P3 = PolynomialRing(QQ, 'x,y,z')

# C7. Theorem 22.8 (Kushnirenko): for convenient supports with generic
# coefficients mu_0 = Newton number n! v(Gamma_-) (n = 2: 5 supports, n = 3:
# 2 supports); for degenerate coefficients (the principal part on a face
# vanishes at a point of the torus) mu_0 > Newton number.  The face
# contribution of the proof for n = 2:
# (beta_1 - alpha_1)(lambda alpha_1 + alpha_2) = alpha_2 beta_1 - alpha_1
# beta_2 = twice the area of the triangle (0, alpha, beta) (symbolic).
supports2 = [[(4, 0), (1, 1), (0, 3)], [(5, 0), (2, 1), (0, 2)],
             [(6, 0), (3, 1), (1, 2), (0, 5)], [(3, 0), (0, 3), (1, 1)],
             [(7, 0), (2, 2), (0, 4), (4, 1)]]
for S in supports2:
    nn = 2 * covolume(S, 2)
    for trial in range(2):
        F = generic_system(P2, [S, S])
        check(local_mult(F, 2) == nn, "C7 Kushnirenko n = 2, S = %s" % (S,))
supports3 = [[(3, 0, 0), (0, 2, 0), (0, 0, 2), (1, 1, 1)],
             [(4, 0, 0), (0, 3, 0), (0, 0, 2), (1, 1, 0), (0, 1, 1)]]
for S in supports3:
    nn = 6 * covolume(S, 3)
    F = generic_system(P3, [S, S, S])
    check(local_mult(F, 3) == nn, "C7 Kushnirenko n = 3, S = %s" % (S,))
# degenerate: f_1 = (x - y)^2 + ..., f_2 = (x - y)(x + y) + ... share the
# zero (1, 1) of their principal parts on the face of x^2, xy, y^2
Fdeg = [(x - y) ** 2 + x ** 3, (x - y) * (x + 2 * y) + y ** 3]
nn = 2 * covolume([(2, 0), (1, 1), (0, 2)], 2)
check(nn == 4 and local_mult(Fdeg, 2) > nn,
      "C7 degenerate: mu > Newton number")
a1, a2, b1, b2 = PolynomialRing(QQ, 'a1,a2,b1,b2').gens()
lam = (a2 - b2) / (b1 - a1)
check((b1 - a1) * (lam * a1 + a2) == a2 * b1 - a1 * b2,
      "C7 face contribution = twice the triangle area")
section("C7")

# C8. (22.11) and Theorem 22.10: different convenient supports with generic
# coefficients, mu_0 = mixed formula (22.11), n = 2 (5 pairs) and n = 3
# (2 triples); for n = 2 also mu(S) = v(S_1 + S_2) - v(S_1) - v(S_2).
pairs = [([(2, 0), (0, 3)], [(3, 0), (1, 1), (0, 4)]),
         ([(4, 0), (1, 1), (0, 3)], [(2, 0), (0, 5)]),
         ([(3, 0), (1, 2), (0, 4)], [(5, 0), (2, 1), (0, 2)]),
         ([(1, 0), (0, 4)], [(6, 0), (2, 2), (0, 3)]),
         ([(2, 0), (1, 1), (0, 2)], [(3, 0), (0, 3)])]
for S1, S2 in pairs:
    mu = mixed_mu([S1, S2])
    check(mu == covolume(minkowski(S1, S2), 2) - covolume(S1, 2)
          - covolume(S2, 2), "C8 n = 2 form of (22.11)")
    F = generic_system(P2, [S1, S2])
    check(local_mult(F, 2) == mu, "C8 (22.11) n = 2 %s %s" % (S1, S2))
triples = [([(2, 0, 0), (0, 2, 0), (0, 0, 3)], [(3, 0, 0), (0, 1, 0),
                                                (0, 0, 2)],
            [(1, 0, 0), (0, 3, 0), (0, 0, 2), (0, 1, 1)]),
           ([(2, 0, 0), (0, 3, 0), (0, 0, 2), (1, 1, 0)],
            [(4, 0, 0), (0, 2, 0), (0, 0, 2)],
            [(3, 0, 0), (0, 2, 0), (0, 0, 3), (1, 0, 1)])]
for Ss in triples:
    mu = mixed_mu(list(Ss))
    F = generic_system(P3, list(Ss))
    check(local_mult(F, 3) == mu, "C8 (22.11) n = 3")
    # diagonal: mu(S, ..., S) = n! v(Gamma_-(S))
    check(mixed_mu([Ss[0]] * 3) == 6 * covolume(Ss[0], 3), "C8 diagonal")
section("C8")


rng = pyrandom.Random(23)

# ===========================================================================
# D. §23 (pp. 189-194)
# ===========================================================================

# D1. (23.1): in Q[a][[z]], (1 + z)^a = exp(a log(1 + z)) has the
# coefficients a(a-1)...(a-m+1)/m!, and e^(az) the coefficients a^n/n!
# (m, n <= 8); so Res_0 e^(az) z^(-n-1) = a^n/n! and the integral needs the
# factor 1/(2 pi i) (iv-189-exponential-coefficient).
Ra = PolynomialRing(QQ, 'a')
a = Ra.gen()
Sz = PowerSeriesRing(Ra, 'z', default_prec=10)
z = Sz.gen()
lg = sum(QQ((-1) ** (i + 1)) / i * z ** i for i in range(1, 10))
ex = sum((a * lg) ** i / fact(i) for i in range(10)).add_bigoh(10)
check(all(ex[m] == prod([a - i for i in range(m)], Ra(1)) / fact(m)
          for m in range(9)), "D1 (1 + z)^a")
ez = sum((a * z) ** i / fact(i) for i in range(10)).add_bigoh(10)
check(all(ez[n] == a ** n / fact(n) for n in range(9)), "D1 e^(az)")
section("D1")


def series_inverse(u, idx, N):
    """1/u mod degree > N in the variables idx, u(0) = constant != 0."""
    c0 = u.constant_coefficient()
    v = 1 - u / c0
    out = u.parent()(0)
    term = u.parent()(1)
    for i in range(N + 1):
        out += term
        term = trunc(term * v, idx, N)
    return trunc(out / c0, idx, N)


# D2. Theorem 23.1 (Egorychev and Yuzhakov).  a) n = 2, beta = (1, 1):
# c_alpha = [z^alpha](phi f^alpha) (23.2), and (23.5)
# F(t) = phi/det(delta_jk - t_j df_j/dz_k) at z = z(t), z_j = t_j f_j(z)
# (iv-190-jacobian-parameter), agree mod degree > 7 (3 random phi, f).
# b) beta = (2, 1), f_j(0) != 0: c_alpha = [z_1^(2 alpha_1 + 1)
# z_2^(alpha_2)](phi f_1^(2 alpha_1) f_2^(alpha_2)) and (23.7), the sum over
# the two zeros z_1 = +-sqrt(t_1) f_1(z), z_2 = t_2 f_2(z) of
# phi/(dw/dz), w_1 = z_1^2 - t_1 f_1^2, w_2 = z_2 - t_2 f_2 (computed with
# s = sqrt(t_1)), agree for the coefficients of t_1^a t_2^b, a + b <= 4
# (2 random phi, f).
D2 = 7
P = PolynomialRing(QQ, 't1,t2,z1,z2')
t1, t2, z1, z2 = P.gens()
for trial in range(3):
    phi = 1 + rand_poly(rng, P, [2, 3], [1, 2], 3)
    f = [rng.choice([1, 2, -1]) + rand_poly(rng, P, [2, 3], [1, 2], 3)
         for _ in range(2)]
    Ft = P(0)
    for al in multi_indices(2, D2):
        c = coeff(phi * f[0] ** al[0] * f[1] ** al[1], (0, 0) + al)
        Ft += c * t1 ** al[0] * t2 ** al[1]
    zt = solve_fixed_point([t1 * f[0], t2 * f[1]], [z1, z2], [0, 1], D2)
    J = matrix([[(1 if j == k else 0) - [t1, t2][j]
                 * f[j].derivative([z1, z2][k]) for k in range(2)]
                for j in range(2)]).det()
    sub = {z1: zt[0], z2: zt[1]}
    Jt = trunc(J.subs(sub), [0, 1], D2)
    rhs = trunc(phi.subs(sub) * series_inverse(Jt, [0, 1], D2), [0, 1], D2)
    check(rhs == Ft, "D2 (23.5) trial %d" % trial)
D2b = 4
N = 3 * D2b + 2
Pb = PolynomialRing(QQ, 's,t2,z1,z2')
s, tb, y1, y2 = Pb.gens()
for trial in range(2):
    phi = 1 + rand_poly(rng, Pb, [2, 3], [1, 2], 2)
    f = [rng.choice([1, 2, -1]) + rand_poly(rng, Pb, [2, 3], [1], 2)
         for _ in range(2)]
    Ft = {}
    for al in multi_indices(2, D2b):
        Ft[al] = coeff(phi * f[0] ** (2 * al[0]) * f[1] ** al[1],
                       (0, 0, 2 * al[0] + 1, al[1]))
    total = Pb(0)
    for sg in (1, -1):
        zt = solve_fixed_point([sg * s * f[0], tb * f[1]], [y1, y2], [0, 1], N)
        J = matrix([[(y1 ** 2 - s ** 2 * f[0] ** 2).derivative(v)
                     for v in (y1, y2)],
                    [(y2 - tb * f[1]).derivative(v) for v in (y1, y2)]]).det()
        sub = {y1: zt[0], y2: zt[1]}
        Jt = trunc(J.subs(sub), [0, 1], N)
        check(all(e[0] >= 1 for e in Jt.exponents()), "D2 s divides dw/dz")
        q_ = Pb({(e[0] - 1, e[1], e[2], e[3]): cf
                 for e, cf in Jt.dict().items()})          # (dw/dz)/s
        total += trunc(phi.subs(sub) * series_inverse(q_, [0, 1], N - 1),
                       [0, 1], N - 1)
    # F = total/s: only odd powers of s occur in total
    check(all(e[0] % 2 == 1 for e in total.exponents()), "D2 odd in s")
    for al in multi_indices(2, D2b):
        check(coeff(total, (2 * al[0] + 1, al[1], 0, 0)) == Ft[al],
              "D2 (23.7) case b) %s" % (al,))
section("D2")

# D3. Theorem 23.2 (MacMahon), (23.11): X_j = sum_k a_(kj) x_k
# (iv-191-macmahon-forms); the Jacobian of w_j = x_j - t_j X_j has the
# entries delta_(jk) - t_j a_(kj); with these rows (iv-191-macmahon-
# determinant) the coefficient of t^alpha in 1/det equals the coefficient
# of x^alpha in X^alpha for all |alpha| <= 5, n = 3, two nonsymmetric
# integer matrices; the printed rows (-a_(1k) t_1 in the first row, the
# last entry -a_(2n) t_2 in the second) are refuted.
n = 3
Pm = PolynomialRing(QQ, ['x%d' % i for i in range(n)]
                    + ['t%d' % i for i in range(n)])
xs = Pm.gens()[:n]
ts = Pm.gens()[n:]
for trial in range(2):
    A = matrix(QQ, n, n, [rng.randint(-3, 4) for _ in range(n * n)])
    while A == A.transpose():
        A = matrix(QQ, n, n, [rng.randint(-3, 4) for _ in range(n * n)])
    Xs = [sum(A[k, j] * xs[k] for k in range(n)) for j in range(n)]
    w = [xs[j] - ts[j] * Xs[j] for j in range(n)]
    Jw = matrix([[w[j].derivative(xs[k]) for k in range(n)]
                 for j in range(n)])
    Mc = matrix(Pm, n, n, lambda j, k: (1 if j == k else 0) - A[k, j] * ts[j])
    check(Jw == Mc, "D3 Jacobian rows delta_jk - t_j a_kj")
    Mp = matrix(Pm, n, n)
    for j in range(n):
        for k in range(n):
            if j == k:
                Mp[j, k] = 1 - A[j, j] * ts[j]
            elif j == 0:
                Mp[j, k] = -A[0, k] * ts[0]          # printed first row
            elif j == 1 and k == n - 1:
                Mp[j, k] = -A[1, n - 1] * ts[1]      # printed -a_(2n) t_2
            else:
                Mp[j, k] = -A[k, j] * ts[j]
    D5 = 5
    inv_c = series_inverse(Mc.det(), list(range(n, 2 * n)), D5)
    inv_p = series_inverse(Mp.det(), list(range(n, 2 * n)), D5)
    bad = 0
    for al in multi_indices(n, D5):
        b_al = coeff(prod([Xs[j] ** al[j] for j in range(n)], Pm(1)),
                     tuple(al) + (0,) * n)
        check(coeff(inv_c, (0,) * n + tuple(al)) == b_al,
              "D3 MacMahon %s" % (al,))
        bad += coeff(inv_p, (0,) * n + tuple(al)) != b_al
    refuted(bad == 0, "D3 printed rows")
section("D3")


rng = pyrandom.Random(232)

# D4. Example 1: (23.12) for 1 <= m, n, p <= 8, and the generating function
# sum A_mn u^m v^n = (1 - u)^(-p-1) (1 - v)^(-p-1) mod degree > 10,
# p = 1..5 (the sum with m or n = 0 included).
for m in range(1, 9):
    for n in range(1, 9):
        for p in range(1, 9):
            N = min(m, n, p)
            lhs = sum(binom(m, k) * binom(n, k) * binom(m + n + p - k, m + n)
                      for k in range(N + 1))
            check(lhs == binom(m + p, m) * binom(n + p, n),
                  "D4 (23.12) %d %d %d" % (m, n, p))
Puv = PowerSeriesRing(QQ, 'u,v', default_prec=11)
u, v = Puv.gens()
for p in range(1, 6):
    Fuv = sum(sum(binom(m, k) * binom(n, k) * binom(m + n + p - k, m + n)
                  for k in range(min(m, n) + 1)) * u ** m * v ** n
              for m in range(11) for n in range(11 - m))
    target = ((1 - u) ** (-(p + 1)) * (1 - v) ** (-(p + 1))).add_bigoh(11)
    check(Fuv.add_bigoh(11) == target, "D4 F(u, v), p = %d" % p)
section("D4")

# D5. (23.13): summing the three geometric progressions gives the integrand
# z_3 (1 + z_3)^(p+1)/([z_3 - u(1+z_1)(1+z_3)][z_3 - v(1+z_2)(1+z_3)]
# [z_1 z_2 (1+z_3) - 1]) (iv-193-numerator-exponent; a rational identity);
# on Gamma (rho = (2, 2, 1/2)) with |u|, |v| < 1/9 the ratios are at most
# 9|u|, 9|v| and 1/2; the iterated residues at z_1 = 1/(z_2 (1 + z_3)),
# z_2 = u/(z_3 - u(1 + z_3)), z_3 = s/(1 - s), s = 1 - (1-u)(1-v) give
# (1-u)^(-p-1)(1-v)^(-p-1) for p = 1..4; with the printed exponent p the
# same residues give (1-u)^(-p)(1-v)^(-p).
Kf = PolynomialRing(QQ, 'u,v,z1,z2,z3').fraction_field()
uu, vv, w1, w2, w3 = Kf.gens()
X_ = uu * (1 + w1) * (1 + w3) / w3
Y_ = vv * (1 + w2) * (1 + w3) / w3
Z_ = 1 / (w1 * w2 * (1 + w3))
for p in range(1, 5):
    lhs = (1 / (1 - X_)) * (1 / (1 - Y_)) * (1 / (1 - Z_)) * (1 + w3) ** p \
        / (w1 * w2 * w3)
    rhs = (w3 * (1 + w3) ** (p + 1)
           / ((w3 - uu * (1 + w1) * (1 + w3)) * (w3 - vv * (1 + w2) * (1 + w3))
              * (w1 * w2 * (1 + w3) - 1)))
    check(lhs == rhs, "D5 integrand, p = %d" % p)
check(QQ(1) / 9 * 3 * QQ(3) / 2 / QQ(1) * 2 == 1
      and 1 / (2 * 2 * QQ(1) / 2) == QQ(1) / 2, "D5 radii: 9|u|, 1/2")


def simple_residue(G, var, pole):
    """Residue of G at the simple pole var = pole: lim (var - pole) G."""
    num, den = G.numerator(), G.denominator()
    R = num.parent()
    h = (var - pole)
    q = Kf(den) / Kf(h)
    # den = h * q with q regular at the pole
    return Kf(num).subs({var: pole}) / Kf(q).subs({var: pole})


for p in range(1, 5):
    for expo, target_e in [(p + 1, p + 1), (p, p)]:
        G = (w3 * (1 + w3) ** expo
             / ((w3 - uu * (1 + w1) * (1 + w3)) * (w3 - vv * (1 + w2)
                                                   * (1 + w3))
                * (w1 * w2 * (1 + w3) - 1)))
        # the poles in z_1: 1/(z_2(1+z_3)) (modulus <= 1 < 2, inside) and
        # z_3/(u(1+z_3)) - 1 (modulus > 2 for |u| < 1/9); after the first
        # residue the poles in z_2 are u/(z_3 - u(1+z_3)) (modulus < 1/3,
        # inside) and z_3/(v(1+z_3)) - 1 (outside); after the second one
        # there is a single pole in z_3.
        r1 = simple_residue(G, w1, 1 / (w2 * (1 + w3)))
        r2 = simple_residue(r1, w2, uu / (w3 - uu * (1 + w3)))
        PR = Kf.ring()
        check(G.denominator().degree(PR.gen(2)) == 2
              and r1.denominator().degree(PR.gen(3)) == 2
              and r2.denominator().degree(PR.gen(4)) == 1, "D5 pole structure")
        sv = 1 - (1 - uu) * (1 - vv)
        r3 = simple_residue(r2, w3, sv / (1 - sv))
        good = r3 == 1 / ((1 - uu) ** target_e * (1 - vv) ** target_e)
        if expo == p + 1:
            check(good, "D5 iterated residues, p = %d" % p)
        else:
            check(good, "D5 printed exponent gives (1-u)^(-p)(1-v)^(-p)")
            refuted(r3 == 1 / ((1 - uu) ** (p + 1) * (1 - vv) ** (p + 1)),
                    "D5 printed exponent")
section("D5")

# D6. Example 2 (Dixon): S_m = sum (-1)^k C(m, k)^3 is 0 for odd m and
# (-1)^p (3p)!/(p!)^3 for m = 2p (m <= 40); R_mn = [z_1^m z_2^n]
# (1+z_1)^m (1+z_2)^m (1 - z_1 z_2)^n equals the printed R_mn
# (m, n <= 16), R_mm = S_m; the generating function sum R_mn t_1^m t_2^n is
# [(1 - t_1)^2 + 4 t_1 t_2^2]^(-1/2) and is given by (23.5) with
# f_1 = (1 + z_1)(1 + z_2), f_2 = 1 - z_1 z_2 (mod degree > 12).
for m in range(41):
    Sm = sum((-1) ** k * binom(m, k) ** 3 for k in range(m + 1))
    if m % 2:
        check(Sm == 0, "D6 Dixon odd")
    else:
        pp = m // 2
        check(Sm == (-1) ** pp * fact(3 * pp) / fact(pp) ** 3, "D6 Dixon")
Pz = PolynomialRing(QQ, 'z1,z2')
q1, q2 = Pz.gens()
for m in range(17):
    for n in range(17):
        R = coeff((1 + q1) ** m * (1 + q2) ** m * (1 - q1 * q2) ** n, (m, n))
        if n % 2:
            check(R == 0, "D6 R_mn, n odd")
        else:
            pp = n // 2
            pr = ((-1) ** pp * fact(m + pp) / (fact(pp) ** 2 * fact(m - pp))
                  if pp <= m else 0)
            check(R == pr, "D6 R_mn, n = 2p")
        if m == n:
            check(R == sum((-1) ** k * binom(m, k) ** 3
                           for k in range(m + 1)), "D6 R_mm = S_m")
D6 = 12
Pt = PolynomialRing(QQ, 't1,t2,z1,z2')
T1, T2, Z1, Z2 = Pt.gens()
f = [(1 + Z1) * (1 + Z2), 1 - Z1 * Z2]
zt = solve_fixed_point([T1 * f[0], T2 * f[1]], [Z1, Z2], [0, 1], D6)
J = matrix([[(1 if j == k else 0) - [T1, T2][j] * f[j].derivative([Z1, Z2][k])
             for k in range(2)] for j in range(2)]).det()
Jt = trunc(J.subs({Z1: zt[0], Z2: zt[1]}), [0, 1], D6)
Fg = trunc(series_inverse(Jt, [0, 1], D6), [0, 1], D6)
Rser = sum(coeff((1 + q1) ** m * (1 + q2) ** m * (1 - q1 * q2) ** n, (m, n))
           * T1 ** m * T2 ** n
           for m in range(D6 + 1) for n in range(D6 + 1 - m))
check(Fg == Rser, "D6 F(t) by (23.5)")
Pst = PowerSeriesRing(QQ, 't1,t2', default_prec=D6 + 1)
s1, s2 = Pst.gens()
base = (1 - s1) ** 2 + 4 * s1 * s2 ** 2
gen = sum(binomial(-QQ(1) / 2, i) * (base - 1) ** i for i in range(D6 + 1))
gen = gen.add_bigoh(D6 + 1)
Rps = sum(cf * s1 ** ex[0] * s2 ** ex[1] for ex, cf in Rser.dict().items())
check(gen == Rps.add_bigoh(D6 + 1), "D6 [(1 - t_1)^2 + 4 t_1 t_2^2]^(-1/2)")
section("D6")


print("ok ch4: %d checks" % COUNT[0])
