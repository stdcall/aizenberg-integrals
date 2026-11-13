"""Exact checks of Chapter V, "Some Applications in Multidimensional
Complex Analysis", §§24-27 (printed
pp. 195-248), and of the statement and formula references of the Brief
Historical Notes on these sections (pp. 254-257).

Run: sage -python checks/sage/ch5.py (plain asserts; do not use -O).  The
last line of the output is "ok ch5: N checks" (last run with SageMath 10.9,
2026-11-13, about one minute).

Book: L. A. Aizenberg and A. P. Yuzhakov, Integral Representations and
Residues in Multidimensional Complex Analysis, AMS Translations of
Mathematical Monographs 58, 1983.  Pages are the printed pages, numbers of
statements and formulas those of the book, labels those of
content/05-24-... to content/05-27-...; the ids in parentheses are entries
of corrections.json.  Expected values are the book's formulas, written below
as literals (with the corrections where marked); the Typst sources are not
parsed.  Where the book is wrong, the printed reading is kept as a refuted
check (`refuted`: the printed reading must fail) beside the corrected one.

Exact arithmetic only: Q, Q(i), the cyclotomic field Q(zeta_12),
polynomial rings and their fraction fields (z and zbar as independent
variables, Wirtinger derivatives as formal partial derivatives), Laurent
and power series with exact coefficients, 1/pi as an indeterminate over
Q(zeta_12) (pi is transcendental, so an identity must hold coefficientwise),
exact symbolic antiderivatives, integrals and limits in Sage's symbolic ring
(no numerical evaluation).  Sage's factorial and binomial return Python
ints for Python int arguments; they are redefined to return Integers.

Model of the exterior algebra.  A form is a dict {(A, B): coefficient}; A
and B are increasing tuples of generators of two kinds; generators of one
kind anticommute, of different kinds commute (the double forms of the
Preliminaries, 1 deg: the differentials of z commute with those of zeta).
D_(nu_1, ..., nu_m)(theta^1, ..., theta^m) is the determinant with theta^1
in the first nu_1 columns, ..., expanded with the factors of each term in
the order of the columns (Preliminaries, 2 deg).

What is checked:

A  §24 (pp. 195-205).  A1: the dimension of the space of spherical
   harmonics of degree k on the sphere of R^(2n), computed as the kernel of
   the Laplacian, equals the corrected sigma_k = 2(n+k-1)(2n+k-3)!/(k!
   (2n-2)!) (v-197-spherical-dimension) for n <= 3, k <= 6 (n = 1: k >= 1),
   and the binomial formula for n <= 10, k <= 30; the printed
   2(n+k-1)!(2n+k-3)!/... differs for all n <= 5, 2 <= k <= 7 (18 instead
   of 9 for n = k = 2).  A2: Lemma 24.6 (lem:one-dimensional-extension):
   d zeta = -v_1^(-n-1) dv, Delta_1 = v_1^(-n), Delta_k = 0 (k != 1) with
   the corrected row (v-198-jacobian-sign), n <= 5; the printed row gives
   some Delta_k != 0; sum (-1)^(k-1) zeta_k d zeta_[k] = sum Delta_k dv_[k];
   omega(zeta, zetabar) = (n-1)!/(2 pi i)^n (-1)^n dv_1/v_1 ^ dvbar_[1] ^
   dv_[1]/(1 + |v'|^2)^n, n = 2, 3 (the display on p. 198 omits the
   constant (n-1)!/(2 pi i)^n, which is absorbed in lambda(v') and c_n).
   A3: Theorem 24.2 (eq:mb-kernel-exact): omega(zeta - z, zetabar - zbar) =
   d_zeta Omega(zeta, z) with the printed Omega (argument zeta,
   v-196-omega-argument), n = 2, ..., 5; without (-1)^k it fails (n >= 3).
   A4: the Weil series (24.5) (eq:weil-expansion): (i) N = n = 2, chi_j =
   z_j^2 on the bidisc: the coefficients depend on z and the series
   reproduces every monomial of degree <= 5; (ii) N = 3 > n = 2, the
   polyhedron of Example 2 of §27 (|z_1|, |z_2|, |z_1 + z_2| < 1): the
   coefficients are integrals over arcs of tori (1/3 or algebraic numbers
   times 1/pi), the faces oriented by (arg chi_j1, arg chi_j2) (§9); the
   series reproduces every monomial of degree <= 5, and differs from the
   trivial expansion (non-uniqueness, (27.2)-(27.3)); (24.6), (24.10):
   with sum |a_m|^2 = 1 the plane a z + b = 0 is at the distance |b| from
   0 (v-204-fraction-constant), three samples.  A5: Theorem 24.8
   (th:aizenberg-dautov), the n-circular family, on the sphere of C^2 with
   the normalized surface measure: z^J zbar^JJ is orthogonal to all
   holomorphic monomials iff J is not <= JJ, and the printed factor
   (a_(J+JJ+l_k)^2 - a_(J+JJ)^2 |z_k|^2), with a_K^2 = int |z^K|^2 d mu, as
   well as the factor of (12.20) with alpha_K = 1/a_K, gives orthogonal
   polynomials; J, JJ in {0, 1, 2}^2, holomorphic monomials z^K with
   K in {0, ..., 5}^2.
B  §25 (pp. 205-218).  B1: (25.2) for the ball (sigma = 1, an identity) and
   for an ellipsoid (sigma = 1/2), Phi~ = 1 - <zetabar, z> for the ball,
   Im Phi~ = Im Phi.  B2: (25.3)-(25.5) hold on Dbar x Dbar, not on Omega'
   (m5-206-domain-dbar): for the ball, zeta = (3/2, 0), z = (2/3, 0) give
   Phi~ = 0, |zeta - z|^2 = 25/36, |Phi| = 5/4; on 12070 pairs of the 425
   points of the closed ball of C^2 with coordinates in Z[i]/3: (25.3)
   (sigma = 1), (25.4) and B/5 <= |Phi~| <= B for the
   bracket B of (25.5) (both directions; the proofs use the lower one,
   m5-206-support-lower-bound).  B3: (25.7) with -rho(zeta)
   (v-207-alpha-numerator; printed rho(z) refuted), n <= 6; the formula
   for dbar alpha_k by the chain rule, n, k <= 4.  B4: (25.10)
   (eq:determinant-difference): the three equalities, including the signs
   (-1)^(n-q) and (-1)^n and the multiplicities 1, 1, q, r, n-q-r-2
   (v-207-determinant-subscript, -parenthesis), with generic symbols for t,
   u, dbar_z t, dbar_zeta t, dbar_zeta u, n = 2, 3, 4, all q.  B5: the
   next display, D(t, u, dbar_z t, dbar_zeta t, dbar_zeta u) = (-1)^q
   |zeta-z|^(-2(q+r+1)) Phi^(-(n-q-r-1)) D(zetabar - zbar, P, ...), for
   explicit rho, n = 2, 3, all q, r.  B6: the remark after (25.12): f ^
   dbar alpha_k ^ W_(p,s) has type (n, n+1) in zeta iff s = q - 1
   (m5-208-remark-q-minus-one).  B7: Lemma 25.7 (lem:model-integral): the
   spherical Jacobians of R^4, R^6 and the weights after s_i = cos phi_i
   (the restored J_(alpha,k,l), v-209-lemma-25-7-definition), the change
   s_1 = su, s_2 = s(1 - |u|) (Jacobian s), the inner integrals of a) and
   b) by antiderivatives (v-210-exponent-sign, v-211-exponent-sign; the
   printed exponents refuted on samples), the final integrals: p > 1
   gives eps^((1-p)/2) (limits for 5 values), p = 1 a logarithm, so the
   printed ">=" in b) fails (v-210-strict-inequality).  B8: exponent
   bookkeeping of all applications of Lemma 25.7: Theorem 25.9, Lemma 26.6
   (with a^(i_3), v-26-h-first-power; the printed a^(i_2) refuted;
   m <= 4, k <= m + 6, s <= 3), Theorem 26.7 (tau in (1/2, 1]).  B9:
   Lemma 25.8, Lambda(t) for t^(-tau) and -ln t; the printed hypothesis
   "=" fails for a constant F (m5-211-lemma-25-8-inequality).  B10: §25,
   4 deg: rho(z) - rho(zeta) = Re F + L_zeta(z - zeta) for the ball and an
   ellipsoid, so Re F < 0 (m5-215-re-f-negative); the printed Re F > 0
   fails for the ball.
C  §26 (pp. 219-241).  C1: (26.4) (eq:generalized-extension): d(beta ^ f)
   = (-1)^(p+n-1) beta ^ dbar f for dbar-closed beta of type (p, n-1), and
   d rho ^ beta_2 ^ f = 0 (type (n+1, n-2)), n = 2, 3, all p.  C2: Lemma
   26.4: alpha_1 = alpha_0 - rho kappa_0, alpha_2 = alpha_1 + rho^2
   kappa_1/2 (v-26-alpha-one-sign, v-26-alpha-two-sign; printed signs
   refuted), and the device applied 4 times, with explicit polynomial
   alpha_0 and rho, (n, p) = (2, 0), (2, 1), (3, 0), (3, 1).  C3: Lemma
   26.3, the segment y + t(x - y) (v-26-segment; printed path refuted).
   C4: alpha*_k(zeta, z) = alpha_k(z, zeta) (m5-224-alpha-star): alpha_k
   (zeta, z) is holomorphic in z (so with the printed definition dbar_z
   alpha* = 0), alpha_k(z, zeta) is holomorphic in zeta, = 1 on the
   diagonal, and equals (rho(z)/Phi~*)^k [sum (Phi*/Phi~*)^j]^k, the
   factors of (26.7)-(26.8); u* is holomorphic in zeta.  C5: (26.18)
   (eq:omega-difference) line by line, n = 2 (f = id and a nonlinear f),
   n = 3, generic polynomial a_kl; the last equality needs (-1)^(k+l)
   (m5-235-sign-k-plus-l; printed refuted); Omega(u0, ..., u0, f) =
   omega(f, fbar) with n arguments (v-26-omega-arguments).  C6: proof of
   Theorem 26.14, W_(n,n-1)(u*, zeta, z) from the definition of §25/§7,
   n = 2, 3, and (26.26) (m5-239-w-n-n-1; printed lines refuted).
D  §27 (pp. 241-248).  D1: Example 1 (27.1), three rational functions,
   with c_jk = res (zeta - a_j)^(k-1) f (v-241-laurent-coefficient; printed
   zeta^(k-1) refuted).  D2: Example 2, the 3(d+1) monomials span d+1
   dimensions, d <= 7.  D3: Example 3: the Hefer expansions
   (v-244-hefer-second), the two representations of Omega
   (v-244-determinant-first-form, -second-form; printed ones exceed Omega
   by 2 z_2 zeta_1 zeta_2 and 2 z_1 zeta_2^2), the local algebra at 0
   (dimension 6, only common zero), residues by the transformation law,
   det ||lambda_kj|| = 1 for the first representation, 0 for the printed
   one and for the second one; the expansion (27.4)-(27.5) reproduces all
   monomials of degree <= 7 for both representations.  D4: 3 deg: Q_n =
   sum z_n^(k-1) g_k with the normal form (27.8') A_(m-1), ..., A_0
   (v-245-polynomial-coefficients; printed indexing refuted), m <= 7; for
   P = z_2^m + ... (m = 2, 3, A_p polynomials in z_1): (2 pi i)^-1
   int zeta_n^k d zeta_n/P = 0, 1 (so it is -res at infinity,
   m5-247-residue-infinity), lambda_jk triangular with det 1, and the
   expansion (27.12)-(27.13) reproduces 11 functions (polynomials and
   functions with P in the denominator); the printed sign of b_k alpha
   gives -1/P for 1/P (v-246-coefficient-sign).  D5: Theorem 27.4 on the
   coordinate cross L_1 = z_1, L_2 = z_2: with beta_1, ..., beta_r <= -1
   every Laurent monomial z^(a, b), |a|, |b| <= 3, is represented once
   (m5-248-beta-range); with the printed ranges f = 1 is represented 4
   times.

The Lean file checks/lean/AizenbergIntegrals/Ch5.lean proves (25.3)-(25.5)
from (25.2) on Dbar x Dbar (both directions of (25.5)), the angle
inequality of Lemma 25.7, and the inequalities for moduli of continuity
used in Lemmas 26.3 and 26.6.

What is NOT established: the analytic theorems (Theorems 24.1-24.17 in
general, Oka's theorems, the dbar-problem with estimates, Theorems 25.14-
25.17, 26.1-26.16, 27.3-27.4 in general); the estimates of Lemma 25.7 are
checked through the explicit steps of its proof, not by evaluating J in
R^(2n); Lemma 25.8 itself is not proved; the partial-fraction and
linear-convexity results of §24 (Theorems 24.11-24.17) are not checked;
the Weil series are checked only for the polyhedra and monomials above,
Theorem 27.4 only on the coordinate cross.  None of the checks establishes
that the text matches the printed book.
"""

import itertools
import time

from sage.all import *


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
    assert not bool(condition), "printed reading holds: " + label
    COUNT[0] += 1


def section(name):
    print(
        "%-5s %6.1f s, %d checks" % (name, time.time() - T0, COUNT[0]),
        flush=True,
    )


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
    """Double forms {(A, B): c}: generators of one kind anticommute, of
    different kinds commute (Preliminaries, 1 deg)."""
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
        if not r:
            return {}
    return r


def wpow(f, k):
    r = dict(ONE)
    for _ in range(k):
        r = wedge(r, f)
    return r


def g1(i, c=1):
    return {((i,), ()): c}


def g2(i, c=1):
    return {((), (i,)): c}


def fun(c):
    return fclean({((), ()): c})


def oper(f, table):
    """sum over (var, kind, gen) of d coefficient/d var times the generator,
    put in front of the part of its kind."""
    out = {}
    for (A, B), c in f.items():
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


def one_form(c_list, gens, kind=1):
    out = {}
    for c, gi in zip(c_list, gens):
        if c != 0:
            k = ((gi,), ()) if kind == 1 else ((), (gi,))
            out[k] = out.get(k, 0) + c
    return fclean(out)


def feq(f, g):
    return fsub(f, g) == {}


def subs_form(f, sub):
    return fclean({k: c.subs(sub) for k, c in f.items()})


def pullback(f, gen_images, sub):
    """f a single form (B = ()); gen_images[i] the 1-form image of
    generator i; coefficients substituted by sub."""
    out = {}
    for (A, B), c in f.items():
        term = fun(c.subs(sub))
        for gi in A:
            term = wedge(term, gen_images[gi])
            if not term:
                break
        out = fadd(out, term)
    return out


# ---------------- A1 sigma_k
def dim_harmonic(m, k):
    if k < 2:
        return binomial(k + m - 1, m - 1)
    R = PolynomialRing(QQ, "x", m)
    xs = R.gens()
    mons = [R.monomial(*e) for e in WeightedIntegerVectors(k, [1] * m)]
    tgt = [R.monomial(*e) for e in WeightedIntegerVectors(k - 2, [1] * m)]
    idx = {t: i for i, t in enumerate(tgt)}
    M = matrix(QQ, len(mons), len(tgt))
    for i, mm in enumerate(mons):
        L = sum(mm.derivative(x, 2) for x in xs)
        for c, t in zip(L.coefficients(), L.monomials()):
            M[i, idx[t]] = c
    return len(mons) - M.rank()


def sigma_corrected(n, k):
    return (
        2
        * (n + k - 1)
        * factorial(2 * n + k - 3)
        / (factorial(k) * factorial(2 * n - 2))
    )


def sigma_printed(n, k):
    return (
        2
        * factorial(n + k - 1)
        * factorial(2 * n + k - 3)
        / (factorial(k) * factorial(2 * n - 2))
    )


for n in [1, 2, 3]:
    for k in range(0, 7 if n < 3 else 6):
        if n == 1 and k == 0:
            continue
        d = dim_harmonic(2 * n, k)
        check(d == sigma_corrected(n, k), "A1 sigma n=%d k=%d" % (n, k))
check(sigma_corrected(2, 2) == 9 and dim_harmonic(4, 2) == 9, "A1 n=2,k=2: 9")
refuted(
    sigma_printed(2, 2) == dim_harmonic(4, 2),
    "A1 printed sigma_2 for n=2 (18)",
)
check(sigma_printed(2, 2) == 18, "A1 printed value 18")
for n in range(2, 11):
    for k in range(0, 31):
        m = 2 * n
        check(
            sigma_corrected(n, k)
            == binomial(k + m - 1, m - 1)
            - (binomial(k + m - 3, m - 1) if k >= 2 else 0),
            "A1 binomial formula n=%d k=%d" % (n, k),
        )
bad = [
    (n, k)
    for n in range(2, 6)
    for k in range(2, 8)
    if sigma_printed(n, k) == sigma_corrected(n, k)
]
check(
    bad == [], "A1 printed sigma_k differs for every n<=5, 2<=k<=7 (%s)" % bad
)
section("A1")

# ---------------- A2 Lemma 24.6
for n in range(2, 6):
    R = PolynomialRing(
        QQ, ["v%d" % j for j in range(n)] + ["w%d" % j for j in range(n)]
    )
    F = R.fraction_field()
    v = [F(R.gen(j)) for j in range(n)]
    w = [F(R.gen(n + j)) for j in range(n)]
    zeta = [1 / v[0]] + [v[j] / v[0] for j in range(1, n)]
    zetab = [1 / w[0]] + [w[j] / w[0] for j in range(1, n)]
    J = matrix(F, n, n, lambda j, m: zeta[j].derivative(R.gen(m)))
    check(J.det() == -1 / v[0] ** (n + 1), "A2 Jacobian n=%d" % n)
    rows = [vector(F, zeta)] + [
        vector(F, [zeta[j].derivative(R.gen(m)) for j in range(n)])
        for m in range(n)
    ]
    for k in range(n):
        M = matrix(F, [rows[0]] + [rows[1 + m] for m in range(n) if m != k])
        expect = 1 / v[0] ** n if k == 0 else 0
        check(M.det() == expect, "A2 Delta_%d n=%d" % (k + 1, n))
    # printed second row: last entry +v_n/v_1^2
    prow = [-zeta[j] / v[0] if j < n - 1 else zeta[j] / v[0] for j in range(n)]
    prows = [rows[0], vector(F, prow)] + rows[2:]
    pbad = [
        k
        for k in range(1, n)
        if matrix(
            F, [prows[0]] + [prows[1 + m] for m in range(n) if m != k]
        ).det()
        != 0
    ]
    refuted(pbad == [], "A2 printed row: Delta_k = 0 for k != 1, n=%d" % n)
    check(
        rows[1] == vector(F, [-z / v[0] for z in zeta]),
        "A2 zeta'_{v_1} = -zeta/v_1, n=%d" % n,
    )
    # holomorphic identity sum (-1)^(k-1) zeta_k d zeta_[k] = sum Delta_k
    # dv_[k]
    img = {}
    for j in range(n):
        img[j] = one_form(
            [zeta[j].derivative(R.gen(m)) for m in range(n)], list(range(n))
        )
        img[n + j] = one_form(
            [zetab[j].derivative(R.gen(n + m)) for m in range(n)],
            [n + m for m in range(n)],
        )
    lhs = {}
    for k in range(n):
        t = fun((-1) ** k * zeta[k])
        for j in range(n):
            if j != k:
                t = wedge(t, img[j])
        lhs = fadd(lhs, t)
    rhs = {}
    for k in range(n):
        M = matrix(F, [rows[0]] + [rows[1 + m] for m in range(n) if m != k])
        t = fun(M.det())
        for j in range(n):
            if j != k:
                t = wedge(t, g1(j))
        rhs = fadd(rhs, t)
    check(
        feq(lhs, rhs),
        "A2 sum (-1)^(k-1) zeta_k dzeta_[k] = sum Delta_k dv_[k], n=%d" % n,
    )
    dz = wedges(*[img[j] for j in range(n)])
    check(
        feq(
            dz,
            fscale(-1 / v[0] ** (n + 1), wedges(*[g1(j) for j in range(n)])),
        ),
        "A2 dzeta = -dv/v_1^(n+1), n=%d" % n,
    )
    if n <= 3:
        norm2 = sum(zeta[j] * zetab[j] for j in range(n))
        om = {}
        for k in range(n):
            t = fun((-1) ** k * zetab[k] / norm2**n)
            for j in range(n):
                if j != k:
                    t = wedge(t, img[n + j])
            om = fadd(om, wedge(t, dz))
        target = fun(
            (-1) ** n
            / (v[0] * (1 + sum(v[j] * w[j] for j in range(1, n))) ** n)
        )
        target = wedges(
            target,
            g1(0),
            *[g1(n + j) for j in range(1, n)],
            *[g1(j) for j in range(1, n)],
        )
        check(
            feq(om, target),
            "A2 omega(zeta, zetabar) without (n-1)!/(2 pi i)^n, n=%d" % n,
        )
section("A2")

# ---------------- A3 omega = d Omega (Theorem 24.2)
for n in range(2, 6):
    R = PolynomialRing(
        QQ, ["x%d" % j for j in range(n)] + ["y%d" % j for j in range(n)]
    )
    F = R.fraction_field()
    x = [F(R.gen(j)) for j in range(n)]
    y = [F(R.gen(n + j)) for j in range(n)]
    N2 = sum(x[j] * y[j] for j in range(n))
    dzeta = wedges(*[g1(j) for j in range(n)])
    om = {}
    for k in range(n):
        t = fun(factorial(n - 1) * (-1) ** k * y[k] / N2**n)
        t = wedges(t, *[g1(n + j) for j in range(n) if j != k], dzeta)
        om = fadd(om, t)
    Om = {}
    for k in range(1, n):
        t = fun(
            factorial(n - 2) * (-1) ** (k + 1) * y[k] / (N2 ** (n - 1) * x[0])
        )
        t = wedges(t, *[g1(n + j) for j in range(n) if j not in (0, k)], dzeta)
        Om = fadd(Om, t)
    table = [(R.gen(j), 1, j) for j in range(n)] + [
        (R.gen(n + j), 1, n + j) for j in range(n)
    ]
    check(feq(oper(Om, table), om), "A3 omega = d Omega, n=%d" % n)
    # sign of (-1)^k matters
    Om2 = {}
    for k in range(1, n):
        t = fun(factorial(n - 2) * y[k] / (N2 ** (n - 1) * x[0]))
        t = wedges(t, *[g1(n + j) for j in range(n) if j not in (0, k)], dzeta)
        Om2 = fadd(Om2, t)
    if n >= 3:
        check(
            not feq(oper(Om2, table), om), "A3 without (-1)^k fails, n=%d" % n
        )
section("A3")


# (i) N = n = 2, chi_j = z_j^2 on the unit bidisc: Omega = (zeta_1 +
# z_1)(zeta_2 + z_2)
R = PolynomialRing(QQ, ["z1", "z2", "s1", "s2"])
z1, z2, s1, s2 = R.gens()
chi_z = [z1**2, z2**2]
chi_s = [s1**2, s2**2]
P = matrix(R, [[s1 + z1, 0], [0, s2 + z2]])
check(
    chi_s[0] - chi_z[0] == P[0, 0] * (s1 - z1)
    and chi_s[1] - chi_z[1] == P[1, 1] * (s2 - z2),
    "A4 Hefer chi = z^2",
)
Om = P.det()


def torus_coeff(G, e1, e2):
    """(2 pi i)^-2 int_{|s|=1} G ds/(s1^e1 s2^e2): the coefficient of
    s1^(e1-1) s2^(e2-1)."""
    out = 0
    for c, m in zip(G.coefficients(), G.monomials()):
        d = m.degrees()
        if d[2] == e1 - 1 and d[3] == e2 - 1:
            out += c * z1 ** d[0] * z2 ** d[1]
    return out


zdep = 0
for a in range(0, 6):
    for b in range(0, 6 - a):
        f_s = s1**a * s2**b
        tot = 0
        for k1 in range(0, 4):
            for k2 in range(0, 4):
                c = torus_coeff(f_s * Om, 2 * k1 + 2, 2 * k2 + 2)
                if c != 0 and c.degree() > 0:
                    zdep += 1
                tot += c * chi_z[0] ** k1 * chi_z[1] ** k2
        check(
            tot == z1**a * z2**b,
            "A4 Weil series chi = z^2 for z^(%d,%d)" % (a, b),
        )
check(zdep > 0, "A4 coefficients depend on z")

# (ii) N = 3 > n = 2: the polyhedron of Example 2 of §27,
# chi = (z1, z2, z1 + z2).  Faces gamma_J, J = 12, 13, 23, oriented by
# (arg chi_j1, arg chi_j2); in the coordinates w = chi_J the face is
# {|w1| = |w2| = 1, phi = theta2 - theta1 in an arc}; Omega_J dzeta = dw1 ^
# dw2.
K = CyclotomicField(12)
zeta12 = K.gen()
I = zeta12**3
om3 = zeta12**4  # e^(2 pi i/3)
z6 = zeta12**2  # e^(i pi/3)
check(
    I**2 == -1 and om3**3 == 1 and om3 != 1 and z6**6 == 1, "A4 roots of unity"
)
S = PolynomialRing(K, "u")  # u = 1/pi (transcendental)
u = S.gen()
RZ = PolynomialRing(S, ["z1", "z2"])
Z1, Z2 = RZ.gens()
RW = PolynomialRing(QQ, ["w1", "w2"])
W1, W2 = RW.gens()


def arc_integral(J, b):
    """(1/2pi) int_arc e^(i b phi) d phi, as an element of K[u]."""
    if b == 0:
        return S(1) / 3
    if J == (0, 1):  # phi in [2pi/3, 4pi/3]
        return (om3 ** (2 * b) - om3**b) / (2 * I * b) * u
    return (z6**b - z6 ** (-b)) / (2 * I * b) * u  # phi in [-pi/3, pi/3]


# face data: f in w-coordinates, chi_J(z) in z, Omega_J (zeta, z) and the
# check Omega_J d zeta = d w1 ^ d w2
faces = {
    (0, 1): (lambda a, b: W1**a * W2**b, (Z1, Z2), 1),
    (0, 2): (lambda a, b: W1**a * (W2 - W1) ** b, (Z1, Z1 + Z2), 1),
    (1, 2): (lambda a, b: (W2 - W1) ** a * W1**b, (Z2, Z1 + Z2), -1),
}
# Hefer determinants: rows of chi_j(zeta) - chi_j(z) in (zeta - z)
hef = {0: (1, 0), 1: (0, 1), 2: (1, 1)}
for J, (_, _, Om_J) in faces.items():
    check(
        matrix(QQ, [hef[J[0]], hef[J[1]]]).det() == Om_J,
        "A4 Omega_J for J=%s" % (J,),
    )
    # d zeta in w: zeta = A^(-1) w, d zeta = det(A)^(-1) dw; Omega_J d zeta =
    # dw
    A = matrix(QQ, [hef[J[0]], hef[J[1]]])
    check(Om_J / A.det() == 1, "A4 Omega_J dzeta = dw for J=%s" % (J,))


def weil_series(a, b):
    tot = RZ(0)
    for J, (fw, chiz, _) in faces.items():
        F = fw(a, b)
        d = a + b
        for al1 in range(d + 1):
            al2 = d - al1
            c = S(0)
            for co, mo in zip(F.coefficients(), F.monomials()):
                p, q = mo.degrees()
                if (p - al1) + (q - al2) != 0:
                    continue
                c += co * arc_integral(J, q - al2)
            tot += c * chiz[0] ** al1 * chiz[1] ** al2
    return tot


nonconst = 0
for a in range(0, 6):
    for b in range(0, 6 - a):
        ser = weil_series(a, b)
        check(
            ser == Z1**a * Z2**b,
            "A4 Weil series, Example 2 of §27, z^(%d,%d)" % (a, b),
        )
# the coefficients themselves involve 1/pi: the expansion of z1 differs from
# the trivial one (non-uniqueness)
F = faces[(0, 1)][0](1, 0)
c01 = sum(
    co * arc_integral((0, 1), mo.degrees()[1] - 1)
    for co, mo in zip(F.coefficients(), F.monomials())
    if mo.degrees()[0] + mo.degrees()[1] == 1
)
check(c01.degree() == 1, "A4 a coefficient with 1/pi (Example 2)")
# (24.6), (24.10): with sum |a_m|^2 = 1 the plane a z + b = 0 lies at the
# distance |b| from 0 (attained at z0 = -b abar; |a z| <= |a| |z| otherwise),
# so with one free term b_n for all p the poles of (24.10) would lie at one
# distance from 0 (v-204-fraction-constant)
KQ = QuadraticField(-1, "j")
jj = KQ.gen()
for a_, b_ in [
    ((KQ(3) / 5, 4 * jj / 5), 2 + jj),
    ((KQ(5) / 13, 12 * jj / 13), KQ(-3)),
    ((jj * 8 / 17, KQ(15) / 17), 1 - 2 * jj),
]:
    check(sum(c * c.conjugate() for c in a_) == 1, "A4 normalization")
    z0 = [-b_ * c.conjugate() for c in a_]
    check(
        sum(a_[m] * z0[m] for m in range(2)) + b_ == 0
        and sum(c * c.conjugate() for c in z0) == b_ * b_.conjugate(),
        "A4 distance of a z + b = 0 from 0 is |b|",
    )
section("A4")


# ---------------- A5 Theorem 24.8, the n-circular family (sphere in C^2)
# mu = normalized surface measure on S(B) = sphere: int z^A zbar^B = delta_AB
# A!/(|A|+1)!
def sph(A, B):
    if A != B:
        return 0
    return factorial(A[0]) * factorial(A[1]) / factorial(A[0] + A[1] + 1)


asq = lambda K: sph(K, K)  # a_K^2 = int |z^K|^2 d mu
Rp = PolynomialRing(QQ, "p1,p2,q1,q2")  # z1, z2, zbar1, zbar2
p1, p2, q1, q2 = Rp.gens()


def integ(P):
    out = 0
    for c, m in zip(P.coefficients(), P.monomials()):
        d = m.degrees()
        out += c * sph((d[0], d[1]), (d[2], d[3]))
    return out


add = lambda A, B: (A[0] + B[0], A[1] + B[1])
idx = [(a, b) for a in range(0, 3) for b in range(0, 3)]
for J in idx:
    for JJ in idx:
        mono1 = p1 ** J[0] * p2 ** J[1] * q1 ** JJ[0] * q2 ** JJ[1]
        leq = J[0] <= JJ[0] and J[1] <= JJ[1]
        vals = [
            integ(p1 ** K[0] * p2 ** K[1] * mono1)
            for K in [(a, b) for a in range(6) for b in range(6)]
        ]
        check(
            all(v == 0 for v in vals) == (not leq),
            "A5 z^J zbar^JJ orthogonal to A_C iff not J <= JJ",
        )
        M = add(J, JJ)
        for kk in range(2):
            lk = (1, 0) if kk == 0 else (0, 1)
            zk2 = p1 * q1 if kk == 0 else p2 * q2
            Q = (
                p1 ** J[0]
                * p2 ** J[1]
                * q1 ** M[0]
                * q2 ** M[1]
                * (asq(add(M, lk)) - asq(M) * zk2)
            )
            check(
                all(
                    integ(p1 ** K[0] * p2 ** K[1] * Q) == 0
                    for K in [(a, b) for a in range(6) for b in range(6)]
                ),
                "A5 printed factor (a_(J+JJ+l_k)^2 - a_(J+JJ)^2 |z_k|^2)",
            )
            Q2 = (
                p1 ** J[0]
                * p2 ** J[1]
                * q1 ** M[0]
                * q2 ** M[1]
                * (1 / asq(M) - zk2 / asq(add(M, lk)))
            )
            check(
                all(
                    integ(p1 ** K[0] * p2 ** K[1] * Q2) == 0
                    for K in [(a, b) for a in range(6) for b in range(6)]
                ),
                "A5 the factor of (12.20) with alpha_K = 1/a_K orthogonal",
            )
section("A5")


def det_forms(cols):
    """Determinant with the given columns (lists of double forms), each
    term written with its factors in the order of the columns
    (Preliminaries: D_(nu_1, ..., nu_m) has theta^1 in the first nu_1
    columns, ...)."""
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


def Dcols(*blocks):
    """D_(nu_1, ..., nu_m)(theta^1, ..., theta^m): blocks = [(nu, theta)]."""
    cols = []
    for nu, th in blocks:
        cols += [th] * nu
    return det_forms(cols)


# ---------------- B1 (25.2) for the ball and an ellipsoid (exact Taylor)
for n in range(1, 4):
    R = PolynomialRing(
        QQ,
        ["x%d" % j for j in range(n)]
        + ["y%d" % j for j in range(n)]
        + ["u%d" % j for j in range(n)]
        + ["v%d" % j for j in range(n)],
    )
    g = R.gens()
    x, y, uu, vv = g[:n], g[n : 2 * n], g[2 * n : 3 * n], g[3 * n :]
    rho_z = sum(x[j] * y[j] for j in range(n)) - 1  # rho(zeta)
    rho_w = sum(uu[j] * vv[j] for j in range(n)) - 1  # rho(z)
    P = [rho_z.derivative(x[j]) for j in range(n)]
    Phi = sum(P[j] * (x[j] - uu[j]) for j in range(n))
    Phib = sum(rho_z.derivative(y[j]) * (y[j] - vv[j]) for j in range(n))
    d2 = sum((x[j] - uu[j]) * (y[j] - vv[j]) for j in range(n))
    check(
        Phi + Phib == rho_z - rho_w + d2,
        "B1 ball: 2 Re Phi = rho(zeta) - rho(z) + |zeta - z|^2, n=%d" % n,
    )
    Phit, Phitb = Phi - rho_z, Phib - rho_z
    check(
        Phit + Phitb == -rho_z - rho_w + d2,
        "B1 ball: 2 Re Phi~ = -rho(zeta) - rho(z) + |zeta - z|^2, n=%d" % n,
    )
    check(
        Phit == 1 - sum(y[j] * uu[j] for j in range(n)),
        "B1 ball: Phi~ = 1 - <zetabar, z>, n=%d" % n,
    )
    check(Phit - Phitb == Phi - Phib, "B1 Im Phi~ = Im Phi, n=%d" % n)
# ellipsoid rho = |z1|^2 + 2|z2|^2 + Re(z1^2)/2 - 1 (n = 2): 2 Re Phi -
# rho(zeta) + rho(z) = Q(zeta - z)
R = PolynomialRing(QQ, "x0,x1,y0,y1,u0,u1,v0,v1")
x0, x1, y0, y1, u0, u1, v0, v1 = R.gens()
rr = lambda a0, a1, b0, b1: a0 * b0 + 2 * a1 * b1 + (a0**2 + b0**2) / 4 - 1
rz, rw = rr(x0, x1, y0, y1), rr(u0, u1, v0, v1)
Phi = rz.derivative(x0) * (x0 - u0) + rz.derivative(x1) * (x1 - u1)
Phib = rz.derivative(y0) * (y0 - v0) + rz.derivative(y1) * (y1 - v1)
Q = rr(x0 - u0, x1 - u1, y0 - v0, y1 - v1) + 1
check(
    Phi + Phib == rz - rw + Q,
    "B1 ellipsoid: 2 Re Phi = rho(zeta) - rho(z) + Q(zeta - z)",
)
# Q >= |h|^2/2 : Q - |h|^2/2 = |h1|^2/2 + 3/2|h2|^2 + Re(h1^2)/2 = (Re h1)^2 +
# 3/2 |h2|^2 >= 0
a, b, c, d = PolynomialRing(QQ, "a,b,c,d").gens()  # h1 = a + i b, h2 = c + i d
Qr = (a**2 + b**2) + 2 * (c**2 + d**2) + (a**2 - b**2) / 2
check(
    Qr - (a**2 + b**2 + c**2 + d**2) / 2 == a**2 + QQ(3) / 2 * (c**2 + d**2),
    "B1 ellipsoid: sigma = 1/2",
)
section("B1")

# ---------------- B2 the domain of (25.3)-(25.5): D-bar, not Omega'
KI = QuadraticField(-1, "i")
iI = KI.gen()


def ball_data(zeta, z):
    n = len(zeta)
    rz = sum(c * c.conjugate() for c in zeta) - 1
    rw = sum(c * c.conjugate() for c in z) - 1
    Phi = sum(zeta[j].conjugate() * (zeta[j] - z[j]) for j in range(n))
    Phit = Phi - rz
    d2 = sum((zeta[j] - z[j]) * (zeta[j] - z[j]).conjugate() for j in range(n))
    return QQ(rz), QQ(rw), Phi, Phit, QQ(d2)


rz, rw, Phi, Phit, d2 = ball_data([KI(3) / 2, KI(0)], [KI(2) / 3, KI(0)])
check(
    rz > 0 and rz + 1 < 4 and rw < 0,
    "B2 zeta in Omega' = B(0, 2) minus D-bar, z in D",
)
refuted(
    d2**2 <= 4 * QQ(Phit.norm()), "B2 printed (25.3) on Omega' (sigma = 1)"
)
check(
    Phit == 0 and d2 == QQ(25) / 36,
    "B2 Phi~(zeta, z) = 0, |zeta - z|^2 = 25/36",
)
refuted(
    Phi.norm() <= Phit.norm(),
    "B2 printed (25.4) on Omega': |Phi| = 5/4 > 0 = |Phi~|",
)
# grid in D-bar x D-bar (ball in C^2): (25.3) with sigma = 1, (25.4),
# and B/5 <= |Phi~| <= B for the bracket B of (25.5)
grid = [
    KI(a) / 3 + iI * KI(b) / 3
    for a in range(-3, 4)
    for b in range(-3, 4)
    if a * a + b * b <= 9
]
pts = [
    (p, q)
    for p in grid
    for q in grid
    if (p * p.conjugate() + q * q.conjugate()) <= 1
]
cnt = 0
for i1 in range(0, len(pts), 3):
    for i2 in range(1, len(pts), 5):
        zeta, z = list(pts[i1]), list(pts[i2])
        rz, rw, Phi, Phit, d2 = ball_data(zeta, z)
        N2 = QQ(Phit.norm())
        imPhi = QQ((Phi - Phi.conjugate()) / (2 * iI))
        B = abs(rz - rw) + abs(imPhi) - rz - rw + d2
        assert d2**2 <= 4 * N2  # (25.3) with sigma = 1
        assert QQ(Phi.norm()) <= N2  # (25.4)
        assert N2 <= B**2  # printed (25.5), sigma_1 = 1
        assert 25 * N2 >= B**2  # (25.5) reversed, sigma_1 = 1/5
        cnt += 1
check(cnt > 1000, "B2 grid of %d pairs in the closed ball (C^2)" % cnt)
COUNT[0] += cnt - 1
section("B2")

# ---------------- B3 alpha_k (25.7) and its derivative
F = PolynomialRing(QQ, "Ph,r,rz").fraction_field()
Ph, r, rzz = F.gens()
Pt = Ph - r
for n in range(1, 7):
    x_ = Ph / Pt
    check(
        1 - x_ ** (2 * n) == (-r / Pt) * sum(x_**j for j in range(2 * n)),
        "B3 (25.7) n=%d" % n,
    )
    refuted(
        1 - x_ ** (2 * n) == (-rzz / Pt) * sum(x_**j for j in range(2 * n)),
        "B3 printed rho(z) in (25.7), n=%d" % n,
    )
for n in range(1, 5):
    for k in range(1, 5):
        x_ = Ph / Pt
        al = lambda kk: (1 - x_ ** (2 * n)) ** kk
        # chain rule: d alpha_k = (d alpha_k/d rho) d rho + (d alpha_k/d Phi) d
        # Phi
        dr = -k * 2 * n * al(k - 1) * x_ ** (2 * n - 1) * (x_ / Pt)
        dP = -k * 2 * n * al(k - 1) * x_ ** (2 * n - 1) * (-r / Pt**2)
        check(
            al(k).derivative(r) == dr and al(k).derivative(Ph) == dP,
            "B3 dbar alpha_k formula n=%d k=%d" % (n, k),
        )
section("B3")


# ---------------- B4 (25.10) in the algebra of double forms
for n in range(2, 5):
    names = (
        ["t%d" % j for j in range(n)]
        + ["u%d" % j for j in range(n)]
        + ["lam"]
        + ["A%d_%d" % (j, m) for j in range(n) for m in range(n)]
        + ["B%d_%d" % (j, m) for j in range(n) for m in range(n)]
        + ["C%d_%d" % (j, m) for j in range(n) for m in range(n)]
    )
    R = PolynomialRing(QQ, names)
    g = R.gens()
    T = g[:n]
    U = g[n : 2 * n]
    lam = g[2 * n]
    A = [[g[2 * n + 1 + j * n + m] for m in range(n)] for j in range(n)]
    B = [
        [g[2 * n + 1 + n * n + j * n + m] for m in range(n)] for j in range(n)
    ]
    C = [
        [g[2 * n + 1 + 2 * n * n + j * n + m] for m in range(n)]
        for j in range(n)
    ]
    dl = g1(n)  # d lambda (zeta kind)
    t_ = [fun(T[j]) for j in range(n)]
    u_ = [fun(U[j]) for j in range(n)]
    eta = [fun((1 - lam) * T[j] + lam * U[j]) for j in range(n)]
    dzt = [
        fadd(*[g2(m, A[j][m]) for m in range(n)]) for j in range(n)
    ]  # dbar_z t
    dst = [
        fadd(*[g1(m, B[j][m]) for m in range(n)]) for j in range(n)
    ]  # dbar_zeta t
    dsu = [
        fadd(*[g1(m, C[j][m]) for m in range(n)]) for j in range(n)
    ]  # dbar_zeta u
    dz_eta = [fscale(1 - lam, dzt[j]) for j in range(n)]
    ds_eta = [
        fadd(fscale(1 - lam, dst[j]), fscale(lam, dsu[j])) for j in range(n)
    ]
    dl_eta = [fscale(U[j] - T[j], dl) for j in range(n)]
    umt = [fun(U[j] - T[j]) for j in range(n)]
    for q in range(0, n - 1):
        s0 = Dcols(
            (1, eta),
            (q, dz_eta),
            (n - q - 1, [fadd(ds_eta[j], dl_eta[j]) for j in range(n)]),
        )
        s0 = fsub(s0, Dcols((1, eta), (q, dz_eta), (n - q - 1, ds_eta)))
        s1 = fscale(
            n - q - 1,
            Dcols((1, t_), (q, dz_eta), (1, dl_eta), (n - q - 2, ds_eta)),
        )
        s2 = fscale(
            (-1) ** (n - q) * (n - q - 1),
            wedge(
                Dcols((1, t_), (q, dz_eta), (1, umt), (n - q - 2, ds_eta)), dl
            ),
        )
        s3 = {}
        for r in range(0, n - q - 1):
            term = Dcols(
                (1, t_), (1, u_), (q, dzt), (r, dst), (n - q - r - 2, dsu)
            )
            term = wedge(
                term, fscale(lam ** (n - q - r - 2) * (1 - lam) ** (q + r), dl)
            )
            s3 = fadd(
                s3,
                fscale((-1) ** n * (n - q - 1) * binomial(n - q - 2, r), term),
            )
        check(
            s0 != {} and feq(s0, s1),
            "B4 (25.10) first equality n=%d q=%d" % (n, q),
        )
        check(feq(s1, s2), "B4 (25.10) second equality n=%d q=%d" % (n, q))
        check(feq(s2, s3), "B4 (25.10) third equality n=%d q=%d" % (n, q))
section("B4")

# ---------------- B5 the determinant after (25.10) with t, u = P/Phi
for n in [2, 3]:
    R = PolynomialRing(
        QQ,
        ["x%d" % j for j in range(n)]
        + ["y%d" % j for j in range(n)]
        + ["a%d" % j for j in range(n)]
        + ["b%d" % j for j in range(n)],
    )
    Fr = R.fraction_field()
    g = [Fr(v) for v in R.gens()]
    x, y, a, b = g[:n], g[n : 2 * n], g[2 * n : 3 * n], g[3 * n :]
    if n == 2:
        rho = (
            x[0] * y[0]
            + 2 * x[1] * y[1]
            + (x[0] * x[1] + y[0] * y[1]) / 2
            + x[0] ** 2 * y[0] ** 2 / 3
        )
    else:
        rho = (
            x[0] * y[0]
            + 2 * x[1] * y[1]
            + 3 * x[2] * y[2]
            + (x[0] * x[1] + y[0] * y[1]) / 2
            + x[2] ** 2 * y[0]
            + y[2] ** 2 * x[0]
        )
    P = [rho.derivative(R.gen(j)) for j in range(n)]
    Phi = sum(P[j] * (x[j] - a[j]) for j in range(n))
    N = sum((x[j] - a[j]) * (y[j] - b[j]) for j in range(n))
    tt = [(y[j] - b[j]) / N for j in range(n)]
    uu = [P[j] / Phi for j in range(n)]
    dbz = lambda c: fadd(
        *[g2(m, c.derivative(R.gen(3 * n + m))) for m in range(n)]
    )
    dbs = lambda c: fadd(
        *[g1(m, c.derivative(R.gen(n + m))) for m in range(n)]
    )
    tcol = [fun(c) for c in tt]
    ucol = [fun(c) for c in uu]
    for q in range(0, n - 1):
        for r in range(0, n - q - 1):
            lhs = Dcols(
                (1, tcol),
                (1, ucol),
                (q, [dbz(c) for c in tt]),
                (r, [dbs(c) for c in tt]),
                (n - q - r - 2, [dbs(c) for c in uu]),
            )
            rhs = Dcols(
                (1, [fun(y[j] - b[j]) for j in range(n)]),
                (1, [fun(c) for c in P]),
                (q, [g2(j) for j in range(n)]),
                (r, [g1(j) for j in range(n)]),
                (n - q - r - 2, [dbs(c) for c in P]),
            )
            rhs = fscale(
                (-1) ** q / (N ** (q + r + 1) * Phi ** (n - q - r - 1)), rhs
            )
            check(
                lhs != {} and feq(lhs, rhs),
                "B5 D(t, u, ...) = (-1)^q ... D(zetabar - zbar, P, ...) "
                "n=%d q=%d r=%d" % (n, q, r),
            )
section("B5")

# ---------------- B6 remark after (25.12): types in zeta
for n in range(1, 8):
    for p in range(0, n + 1):
        for q in range(1, n + 1):
            for s in [q - 1, q]:
                # f (p, q), dbar alpha (0, 1), W_(p, s) of type (n - p, n - s -
                # 1) in zeta
                typ = (p + n - p, q + 1 + n - s - 1)
                if s == q - 1:
                    check(
                        typ == (n, n + 1),
                        "B6 f ^ dbar alpha ^ W_(p, q-1) has type (n, n+1)",
                    )
                else:
                    refuted(
                        typ == (n, n + 1),
                        "B6 printed W_(p, q): type (n, n) does not vanish",
                    )
section("B6")


def sr_zero(e):
    e = SR(e)
    return bool(e.simplify_full() == 0) or bool(
        e.simplify_trig().simplify_full() == 0
    )


# ---------------- B7 Lemma 25.7
# (a) spherical coordinates in R^4 and R^6: Jacobian r^(m-1) prod sin^(m-1-i)
# phi_i
for m in [4, 6]:
    r = SR.var("r")
    ph = [SR.var("f%d" % i) for i in range(1, m)]
    coords = []
    for i in range(m):
        e = r
        for j in range(min(i, m - 1)):
            e = e * sin(ph[j])
        if i < m - 1:
            e = e * cos(ph[i])
        coords.append(e)
    vs = [r] + ph
    Jm = matrix(SR, m, m, lambda i, j: coords[i].diff(vs[j]))
    expect = r ** (m - 1) * prod(
        sin(ph[i]) ** (m - 2 - i) for i in range(m - 1)
    )
    check(sr_zero(Jm.det() - expect), "B7 spherical Jacobian R^%d" % m)
    check(sr_zero(sum(c**2 for c in coords) - r**2), "B7 |t| = r in R^%d" % m)
    # after s_i = cos phi_i (i = 1, 2): weight (1 - s1^2)^((m-3)/2) (1 -
    # s2^2)^((m-4)/2) <= 1
    # after s_i = cos phi_i the weight is sin^(m-3) phi_1 sin^(m-4) phi_2 ...
    # <= 1 (m = 2n >= 4)
    check(m - 3 >= 0 and m - 4 >= 0, "B7 weights bounded, m=%d" % m)
    # |t1| + |t2| = r (|s1| + |s2| sqrt(1 - s1^2))
    check(
        sr_zero(coords[1] - r * sin(ph[0]) * cos(ph[1])),
        "B7 t2 = r sqrt(1-s1^2) s2",
    )
# (b) s1 = s u, s2 = s (1 - |u|): |Jacobian| = s, |s1| + s2 = s
Rs = PolynomialRing(QQ, "s,uu")
s_, u_ = Rs.gens()
for sg in [1, -1]:  # u > 0, u < 0
    s1 = s_ * u_
    s2 = s_ * (1 - sg * u_)
    Jd = matrix(
        Rs,
        [
            [s1.derivative(s_), s1.derivative(u_)],
            [s2.derivative(s_), s2.derivative(u_)],
        ],
    ).det()
    check(Jd in (s_, -s_), "B7 Jacobian s, sign %d" % sg)
    check(sg * s1 + s2 == s_, "B7 |s1| + s2 = s, sign %d" % sg)
# (c) inner integrals of a)
v, uu, al, k, e, K, p = SR.var("v uu al k e K p")
assume(e > 0)
assume(e < 1)
assume(v > 0)
Fu = (v * uu + 1) ** (al + 1) / ((al + 1) * v)
check(sr_zero(Fu.diff(uu) - (v * uu + 1) ** al), "B7 antiderivative in u")
check(
    sr_zero(Fu.subs(uu=1) - (v + 1) ** (al + 1) / ((al + 1) * v)),
    "B7 int_(-1/v)^1 (vu+1)^al du",
)
check(
    sr_zero(
        Fu.subs(uu=1)
        - Fu.subs(uu=-1)
        - ((1 + v) ** (al + 1) - (1 - v) ** (al + 1)) / ((al + 1) * v)
    ),
    "B7 int_(-1)^1 (vu+1)^al du",
)
corr = 1 / ((al + 1) * v * (v + 1) ** (k - al - 1))
check(
    sr_zero(Fu.subs(uu=1) / (v + 1) ** k - corr),
    "B7 a): (v+1)^(-k) int = 1/(v (v+1)^(k-al-1))",
)
for a0, k0, v0 in [(0, 2, 1), (QQ(1) / 2, 3, 2), (2, 4, 3)]:
    true_val = (QQ(v0) + 1) ** (a0 + 1) / ((a0 + 1) * v0 * (QQ(v0) + 1) ** k0)
    check(
        true_val == 1 / ((a0 + 1) * v0 * (QQ(v0) + 1) ** (k0 - a0 - 1)),
        "B7 a) value at %s" % ((a0, k0, v0),),
    )
    refuted(
        true_val == 1 / ((a0 + 1) * v0 * (QQ(v0) + 1) ** (k0 - a0 + 1)),
        "B7 printed exponent k - al + 1 at %s" % ((a0, k0, v0),),
    )
# a) second term: K = k - al - 1 = 0 gives ln(4/eps); K > 0 converges
check(
    sr_zero(integral(1 / v, v, 1, 4 / e) - log(4 / e))
    and limit(log(4 / e), e=0, dir="+") == Infinity,
    "B7 a) k - al = 1: ln(4/eps), unbounded",
)
for K0 in [QQ(1) / 2, 1, 2, 3]:
    val = integral(1 / (v * (v + 1) ** K0), v, 1, Infinity)
    check(
        val in SR and not val.has(Infinity) and bool(val > 0),
        "B7 a) int_1^oo dv/(v (v+1)^%s) finite" % K0,
    )
for a0 in [0, QQ(1) / 2, 1, 3]:
    lim0 = limit(((1 + v) ** (1 + a0) - (1 - v) ** (1 + a0)) / v, v=0)
    check(lim0 == 2 * (1 + a0), "B7 a) first term bounded near 0, al=%s" % a0)
# b) inner integrals
rr, ss, eps, c = SR.var("rr ss eps c")
Gu = (rr * ss * uu + eps) ** (al + 1) / (al + 1)
check(
    sr_zero(Gu.diff(uu) - (rr * ss * uu + eps) ** al * rr * ss),
    "B7 b) antiderivative in u",
)
check(
    sr_zero(Gu.subs(uu=1) - (rr * ss + eps) ** (al + 1) / (al + 1)),
    "B7 b) value (rs+eps)^(al+1)/(al+1)",
)
Hs = -((rr * ss + c) ** (1 - K)) / (K - 1)
check(
    sr_zero(Hs.diff(ss) - rr / (rr * ss + c) ** K), "B7 b) antiderivative in s"
)
check(
    sr_zero(
        Hs.subs(ss=2)
        - Hs.subs(ss=0)
        - (c ** (1 - K) - (2 * rr + c) ** (1 - K)) / (K - 1)
    ),
    "B7 b) int_0^2 r ds/(rs+c)^K",
)
# exponent bookkeeping of b): K = k - al - 1, c = eps + r^2
for k0 in range(3, 9):
    for a0 in [0, QQ(1) / 2, 1, QQ(3) / 2, 2]:
        for m0 in range(0, 4):
            if k0 - a0 - m0 < QQ(5) / 2:
                continue
            K0 = k0 - a0 - 1
            check(1 - K0 == -(k0 - a0 - 2), "B7 b) exponent k - al - 2")
            pexp = 2 * (k0 - a0 - m0 - 2)
            check(
                (1 - pexp) / 2 == -k0 + a0 + m0 + QQ(5) / 2,
                "B7 b) final exponent",
            )
            if a0 != 0:
                refuted(
                    k0 + a0 - 2 - m0 == k0 - a0 - m0 - 2,
                    "B7 printed k + al - 2 against 2(k - al - m - 2)",
                )
# final integral: p > 1 gives O(eps^((1-p)/2)); p = 1 gives a logarithm
for p0 in [QQ(3) / 2, 2, QQ(5) / 2, 3, 5]:
    I0 = integral(1 / (rr + e) ** p0, rr, 0, 2)
    check(
        limit(I0 * e ** (p0 - 1), e=0, dir="+") == 1 / (p0 - 1),
        "B7 b) int_0^2 dr/(r+sqrt eps)^%s" % p0,
    )
I1 = integral(1 / (rr + e), rr, 0, 2)
check(
    limit(I1 / (-log(e)), e=0, dir="+") == 1,
    "B7 b) k - al - m = 5/2: logarithm",
)
refuted(
    limit(I1, e=0, dir="+") < Infinity,
    "B7 printed >= in b): at k - al - m = 5/2 the bound O(1) fails",
)
section("B7")

# ---------------- B8 applications of Lemma 25.7 (exponent bookkeeping)


def Ja(a0, k0):
    """exponent of eps in J_(al, k, 2n-1), or 'log'."""
    assert a0 > -1 and k0 - a0 >= 1
    return "log" if k0 - a0 == 1 else 1 - k0 + a0


def Jb(a0, k0, m0):
    assert a0 > -1 and m0 >= 0 and k0 - a0 - m0 >= QQ(5) / 2
    return "log" if k0 - a0 - m0 == QQ(5) / 2 else -k0 + a0 + m0 + QQ(5) / 2


h = QQ(1) / 2
check(Ja(0, 1) == "log", "B8 Theorem 25.9: J_(0,1,2n-1) = O(ln eps)")
check(
    Jb(0, 3, 0) == -h and Ja(0, QQ(3) / 2) == -h,
    "B8 Theorem 25.9: |grad F_1| = O(|rho|^(-1/2))",
)
check(1 - h == h, "B8 Lemma 25.8 with lambda = t^(-1/2): Holder 1/2")
for n in range(2, 8):
    for rp in range(1, n):  # r' = q + r + 1
        # |grad F_1|: |zeta-z|^(1-2r') |Phi~|^-(n-r'+2) <= C |zeta-z|^-(2n-3)
        # |Phi~|^-3 using (25.3)
        check(
            n - rp - 1 >= 0 and (2 * rp - 1) + 2 * (n - rp - 1) == 2 * n - 3,
            "B8 grad F_1 first term n=%d r=%d" % (n, rp),
        )
        check(
            n - rp + 1 - h >= 0
            and 2 * rp + 2 * (n - rp + 1 - QQ(3) / 2) == 2 * n - 1,
            "B8 grad F_1 second term",
        )
        # (25.8) with r' = q + r + 1 is F_1: n - r' + 1 = n - q - r
        for q in range(0, rp):
            rr0 = rp - q - 1
            check(n - rp + 1 == n - q - rr0, "B8 F_1 relabelling")
# Lemma 26.6
for m0 in range(1, 5):
    for k0 in range(m0 + 3, m0 + 7):
        for s0 in range(0, 4):
            for i1 in range(0, s0 + 1):
                i2 = s0 - i1
                e1 = Jb(m0, k0 + 1 + i2, 0)
                e2 = Jb(m0 - 1, k0 + 1 + i2, 0)
                tgt = -(s0 + k0 - m0 - h)
                check(
                    -(i1 + 1) + e1 == tgt
                    and -(i1 + 1) + 1 + e2 == tgt
                    and -(i1 + 1) >= tgt,
                    "B8 Lemma 26.6, H'' (m >= 1)",
                )
                check(
                    m0 - 1 - i1 + Jb(0, k0 + 1 + i2, 0) == tgt,
                    "B8 Lemma 26.6, H'",
                )
                # after the inverse substitution: a^(m-1-i1-i2) a^(-i3) J_(0,
                # k+1+i4)
                for j1 in range(0, s0 + 1):
                    for j2 in range(0, s0 + 1 - j1):
                        for j3 in range(0, s0 + 1 - j1 - j2):
                            j4 = s0 - j1 - j2 - j3
                            check(
                                m0 - 1 - j1 - j2 - j3 + Jb(0, k0 + 1 + j4, 0)
                                == tgt,
                                "B8 Lemma 26.6 a^(i_3)",
                            )
                            if j2 != j3:
                                refuted(
                                    m0
                                    - 1
                                    - j1
                                    - j2
                                    - j2
                                    + Jb(0, k0 + 1 + j4, 0)
                                    == tgt,
                                    "B8 printed a^(i_2) in Lemma 26.6",
                                )
                # (26.3'): D(H_3/|rho|^(k-1)) = O(theta/|rho|^(s+k-m)) means
                # H_3 |rho|^(1-k) in C~^((m-k))
                check(
                    s0 - (m0 - k0) == s0 + k0 - m0,
                    "B8 Lemma 26.6, class m - k",
                )
for k0 in range(3, 8):
    for tau in [QQ(1) / 10, QQ(1) / 2, QQ(3) / 4, 1]:
        for s0 in range(0, 4):
            for i1 in range(0, s0 + 1):
                i2 = s0 - i1
                check(
                    -i1 + Jb(tau - 1, k0 + 1 + i2, 0) == tau - (s0 + k0 - h),
                    "B8 Lemma 26.6, m = 0",
                )
for tau in [QQ(51) / 100, QQ(3) / 5, QQ(3) / 4, QQ(99) / 100]:
    ex = [Ja(tau - 1, 1), Ja(tau - 1, QQ(3) / 2), Jb(tau - 1, 3, 0)]
    check(
        ex == [tau - 1, tau - QQ(3) / 2, tau - QQ(3) / 2]
        and min(ex) == -1 + (tau - h),
        "B8 Theorem 26.7",
    )
    lam_exp = QQ(3) / 2 - tau
    check(
        0 <= lam_exp < 1 and 1 - lam_exp == tau - h,
        "B8 Theorem 26.7: Lemma 25.8, Holder tau - 1/2",
    )
check(
    Ja(0, 1) == "log" and Ja(0, QQ(3) / 2) == -h,
    "B8 Theorem 26.7, tau = 1: the first term is O(ln), dominated",
)
section("B8")

# ---------------- B9 Lemma 25.8: the particular cases
t_, tau_ = SR.var("t_ tau_")
check(
    sr_zero((t_ ** (1 - tau_) / (1 - tau_)).diff(t_) - t_ ** (-tau_)),
    "B9 Lambda for t^(-tau)",
)
Lam = t_ - t_ * log(t_)
check(
    sr_zero(Lam.diff(t_) + log(t_)) and limit(Lam, t_=0, dir="+") == 0,
    "B9 Lambda for -ln t: t - t ln t",
)
check(
    limit((Lam + t_ * (-log(t_))) / (t_ * (-log(t_))), t_=0, dir="+") == 2,
    "B9 -ln t: O(|x - y| |ln|x - y||)",
)
# the printed hypothesis "=" fails for a constant F (D = (-1, 1),
# rho = x^2 - 1, lambda(t) = t^(-1/2), x = 1/2, y = 0): 0 != 1/2 lambda(3/4)
xx_, yy_ = QQ(1) / 2, QQ(0)
lam_val = (1 - xx_**2) ** (-QQ(1) / 2)
refuted(0 == abs(xx_ - yy_) * lam_val, "B9 printed '=' in Lemma 25.8")
check(0 <= abs(xx_ - yy_) * lam_val, "B9 '<=' holds for a constant F")
section("B9")


# ---------------- B10 25, 4 deg: Re F(zeta, z) < 0 (the printed > 0 refuted)
R = PolynomialRing(QQ, "x0,x1,y0,y1,u0,u1,v0,v1")
x0, x1, y0, y1, u0, u1, v0, v1 = R.gens()
for rr in [
    lambda a0, a1, b0, b1: a0 * b0 + a1 * b1 - 1,
    lambda a0, a1, b0, b1: a0 * b0 + 2 * a1 * b1 + (a0**2 + b0**2) / 4 - 1,
]:
    rz, rw = rr(x0, x1, y0, y1), rr(u0, u1, v0, v1)
    hz, hzb = [u0 - x0, u1 - x1], [v0 - y0, v1 - y1]
    X, Y = [x0, x1], [y0, y1]
    F = 2 * sum(rz.derivative(X[j]) * hz[j] for j in range(2)) + sum(
        rz.derivative(X[j]).derivative(X[k]) * hz[j] * hz[k]
        for j in range(2)
        for k in range(2)
    )
    Fb = 2 * sum(rz.derivative(Y[j]) * hzb[j] for j in range(2)) + sum(
        rz.derivative(Y[j]).derivative(Y[k]) * hzb[j] * hzb[k]
        for j in range(2)
        for k in range(2)
    )
    Lev = sum(
        rz.derivative(X[j]).derivative(Y[k]) * hz[j] * hzb[k]
        for j in range(2)
        for k in range(2)
    )
    check(
        rw - rz == (F + Fb) / 2 + Lev,
        "B10 rho(z) - rho(zeta) = Re F + L_zeta(z - zeta)",
    )
    check(
        Lev
        in [
            hz[0] * hzb[0] + hz[1] * hzb[1],
            hz[0] * hzb[0] + 2 * hz[1] * hzb[1],
        ],
        "B10 Levi form positive definite",
    )
# the ball, zeta = (1, 0) in bD, z = 0 in D: F = -2
rz = x0 * y0 + x1 * y1 - 1
Fball = 2 * (y0 * (u0 - x0) + y1 * (u1 - x1))
Fv = Fball.subs({x0: 1, x1: 0, y0: 1, y1: 0, u0: 0, u1: 0, v0: 0, v1: 0})
check(Fv == -2, "B10 ball: F((1, 0), 0) = -2 < 0")
refuted(Fv > 0, "B10 printed Re F > 0")
section("B10")


def cplx_space(n):
    """z_j = x_j, zbar_j = y_j independent; generators d z_j = j,
    d zbar_j = n + j (single forms, first kind)."""
    R = PolynomialRing(
        QQ, ["x%d" % j for j in range(n)] + ["y%d" % j for j in range(n)]
    )
    F = R.fraction_field()
    return R, F


def dbar(f, R, n):
    return oper(f, [(R.gen(n + j), 1, n + j) for j in range(n)])


def dhol(f, R, n):
    return oper(f, [(R.gen(j), 1, j) for j in range(n)])


def dfull(f, R, n):
    return fadd(dbar(f, R, n), dhol(f, R, n))


def generic_form(R, F, n, p, q, seed):
    """a (p, q)-form with polynomial coefficients depending on seed."""
    out = {}
    x = [F(R.gen(j)) for j in range(n)]
    y = [F(R.gen(n + j)) for j in range(n)]
    c = 0
    for I in itertools.combinations(range(n), p):
        for J in itertools.combinations(range(n), q):
            c += 1
            coef = (
                sum(
                    (seed + c + j) * x[j] * y[(j + c) % n]
                    + (c * j + 1) * y[j] ** 2
                    + (seed - j) * x[j] ** 2 * y[j]
                    for j in range(n)
                )
                + c
            )
            key = tuple(sorted(I + tuple(n + j for j in J)))
            s, _ = sort_sign(I + tuple(n + j for j in J))
            out[(key, ())] = out.get((key, ()), 0) + s * coef
    return fclean(out)


# ---------------- C1 (26.4): d(beta ^ f) = (-1)^(p+n-1) beta ^ dbar f, types
for n in [2, 3]:
    R, F = cplx_space(n)
    x = [F(R.gen(j)) for j in range(n)]
    y = [F(R.gen(n + j)) for j in range(n)]
    for p in range(0, n + 1):
        gam = generic_form(R, F, n, p, n - 2, 3 + p)
        beta = dbar(gam, R, n)  # dbar-closed, type (p, n-1)
        f = generic_form(R, F, n, n - p, 0, 5 + p)
        lhs = dfull(wedge(beta, f), R, n)
        rhs = fscale((-1) ** (p + n - 1), wedge(beta, dbar(f, R, n)))
        check(
            beta != {} and lhs != {} and feq(lhs, rhs),
            "C1 d(beta ^ f) = (-1)^(p+n-1) beta ^ dbar f, n=%d p=%d" % (n, p),
        )
        rho = (
            sum(x[j] * y[j] for j in range(n))
            + x[0] ** 2 * y[1]
            + y[0] ** 2 * x[1]
            - 1
        )
        b2 = generic_form(R, F, n, p, n - 2, 7 + p)
        check(
            wedges(dhol(fun(rho), R, n), b2, f) == {},
            "C1 d rho ^ beta_2 ^ f of type (n+1, n-2) vanishes, n=%d p=%d"
            % (n, p),
        )
section("C1")

# ---------------- C2 Lemma 26.4: alpha_1 = alpha_0 - rho kappa_0, alpha_2 =
# alpha_1 + rho^2 kappa_1 / 2


def solve_drho(mu, rho, R, F, n, p):
    """nu of type (p, n-1) with dbar rho ^ nu = mu for a (p, n)-form mu."""
    r1 = rho.derivative(R.gen(n))
    out = {}
    for (A, B), c in mu.items():
        I = tuple(a for a in A if a < n)
        key = tuple(sorted(I + tuple(n + j for j in range(1, n))))
        s, _ = sort_sign(I + tuple(n + j for j in range(1, n)))
        s2, _ = sort_sign(I + tuple(n + j for j in range(n)))
        out[(key, ())] = (
            out.get((key, ()), 0) + s * s2 * (-1) ** len(I) * c / r1
        )
    nu = fclean(out)
    assert feq(wedge(dbar(fun(rho), R, n), nu), mu)
    return nu


for n, p in [(2, 0), (2, 1), (3, 0), (3, 1)]:
    R, F = cplx_space(n)
    x = [F(R.gen(j)) for j in range(n)]
    y = [F(R.gen(n + j)) for j in range(n)]
    rho = sum(x[j] * y[j] for j in range(n)) + (x[0] ** 2 + y[0] ** 2) / 4 - 1
    al0 = generic_form(R, F, n, p, n - 1, 11)
    kap = [solve_drho(dbar(al0, R, n), rho, R, F, n, p)]
    for j in range(1, 4):
        kap.append(solve_drho(dbar(kap[-1], R, n), rho, R, F, n, p))
    al1 = fsub(al0, fscale(rho, kap[0]))
    check(
        feq(dbar(al1, R, n), fscale(-rho, dbar(kap[0], R, n))),
        "C2 dbar alpha_1 = -rho dbar kappa_0, n=%d p=%d" % (n, p),
    )
    al1p = fadd(al0, fscale(rho, kap[0]))
    refuted(
        feq(dbar(al1p, R, n), fscale(-rho, dbar(kap[0], R, n))),
        "C2 printed alpha_0 + rho kappa_0",
    )
    al2 = fadd(al1, fscale(rho**2 / 2, kap[1]))
    check(
        feq(dbar(al2, R, n), fscale(rho**2 / 2, dbar(kap[1], R, n))),
        "C2 dbar alpha_2 = rho^2/2 dbar kappa_1, n=%d p=%d" % (n, p),
    )
    al2p = fsub(al1, fscale(rho**2 / 2, kap[1]))
    refuted(
        feq(dbar(al2p, R, n), fscale(rho**2 / 2, dbar(kap[1], R, n))),
        "C2 printed alpha_1 - rho^2 kappa_1 / 2",
    )
    # the device applied m times: alpha_j = alpha_(j-1) + (-1)^j rho^j/j!
    # kappa_(j-1)
    al = al0
    for j in range(1, 5):
        al = fadd(al, fscale((-1) ** j * rho**j / factorial(j), kap[j - 1]))
        check(
            feq(
                dbar(al, R, n),
                fscale(
                    (-1) ** j * rho**j / factorial(j), dbar(kap[j - 1], R, n)
                ),
            ),
            "C2 step %d, n=%d p=%d" % (j, n, p),
        )
section("C2")

# ---------------- C3 Lemma 26.3: the segment y + t(x - y)
Rg = PolynomialRing(QQ, "a1,a2,tt")
a1, a2, tt = Rg.gens()
gfun = lambda X1, X2: X1**3 - 2 * X1 * X2 + X2**2 + 5 * X1
for xx, yy in [((1, 2), (0, 0)), ((QQ(1) / 2, -1), (3, QQ(1) / 3))]:
    X = vector(QQ, xx)
    Y = vector(QQ, yy)
    grad = lambda P0: vector(
        [gfun(a1, a2).derivative(a1), gfun(a1, a2).derivative(a2)]
    ).subs(a1=P0[0], a2=P0[1])
    ok = lambda base: (grad(base + tt * (X - Y)) * (X - Y)).integral(tt)
    I_corr = ok(Y)
    val = I_corr.subs(tt=1) - I_corr.subs(tt=0)
    check(
        val == gfun(*X) - gfun(*Y),
        "C3 int_0^1 (grad(rho h)(y + t(x - y)), x - y) dt = "
        "(rho h)(x) - (rho h)(y)",
    )
    I_pr = ok(X)
    refuted(
        I_pr.subs(tt=1) - I_pr.subs(tt=0) == gfun(*X) - gfun(*Y),
        "C3 printed path x + t(x - y)",
    )
section("C3")

# ---------------- C4 alpha*_k(zeta, z) = alpha_k(z, zeta)
n = 2
R = PolynomialRing(QQ, ["x0", "x1", "y0", "y1", "a0", "a1", "b0", "b1"])
F = R.fraction_field()
X0, X1, Y0, Y1, A0, A1, B0, B1 = [F(v) for v in R.gens()]
rho = lambda p0, p1, q0, q1: (
    p0 * q0 + 2 * p1 * q1 + (p0**2 + q0**2) / 4 + p0 * q1 + p1 * q0 - 1
)
rhoz = rho(X0, X1, Y0, Y1)  # rho(zeta), zeta = (x, y)
rhow = rho(A0, A1, B0, B1)  # rho(z), z = (a, b)
Pz = [rhoz.derivative(R.gen(0)), rhoz.derivative(R.gen(1))]
Pw = [rhow.derivative(R.gen(4)), rhow.derivative(R.gen(5))]
Phi_zw = Pz[0] * (X0 - A0) + Pz[1] * (X1 - A1)  # Phi(zeta, z)
Phi_wz = Pw[0] * (A0 - X0) + Pw[1] * (A1 - X1)  # Phi(z, zeta)
zbar_vars, zetabar_vars = [R.gen(6), R.gen(7)], [R.gen(2), R.gen(3)]
# alpha_k(zeta, z) is a function of Phi(zeta, z) and rho(zeta), alpha_k(z,
# zeta) of Phi(z, zeta) and rho(z)
check(
    all(c.derivative(v) == 0 for c in [Phi_zw, rhoz] for v in zbar_vars),
    "C4 Phi(zeta, z), rho(zeta) holomorphic in z: with the printed "
    "alpha* = alpha_k(zeta, z), dbar_z alpha* = 0",
)
check(
    all(c.derivative(v) == 0 for c in [Phi_wz] for v in zetabar_vars),
    "C4 Phi(z, zeta) holomorphic in zeta",
)
check(
    any(c.derivative(v) != 0 for c in [Phi_wz, rhow] for v in zbar_vars),
    "C4 Phi(z, zeta), rho(z) depend on zbar",
)
check(
    Phi_wz.subs(
        {
            R.gen(0): R.gen(4),
            R.gen(1): R.gen(5),
            R.gen(2): R.gen(6),
            R.gen(3): R.gen(7),
        }
    )
    == 0,
    "C4 Phi(z, z) = 0, so alpha_k(z, z) = 1",
)
Fa = PolynomialRing(QQ, "Phs,rw").fraction_field()
Phs, rw_ = Fa.gens()  # Phs = Phi* = -Phi(z, zeta), rw_ = rho(z)
for k in range(1, 6):
    Phi_ = -Phs
    Pt_ = Phi_ - rw_
    al = (1 - (Phi_ / Pt_) ** (2 * n)) ** k
    check(
        al
        == (rw_ / (-Pt_)) ** k
        * sum((Phs / (-Pt_)) ** j for j in range(2 * n)) ** k,
        "C4 alpha_k(z, zeta) = (rho(z)/Phi~*)^k [sum (Phi*/Phi~*)^j]^k, k=%d"
        % k,
    )
# u*(zeta, z) = P(z)/<P(z), zeta - z> is holomorphic in zeta
us = [Pw[j] / (-Phi_wz) for j in range(2)]
check(
    all(c.derivative(v) == 0 for c in us for v in [R.gen(2), R.gen(3)]),
    "C4 u* holomorphic in zeta",
)
section("C4")


def pair(vec, forms):
    """<vec, forms> = sum vec_j ^ forms_j (vec: list of forms)."""
    return fadd(*[wedge(vec[j], forms[j]) for j in range(len(vec))])


# ---------------- C5 (26.17)-(26.18)
for n, fchoice in [(2, "id"), (2, "nl"), (3, "id")]:
    R, F = cplx_space(n)
    x = [F(R.gen(j)) for j in range(n)]
    y = [F(R.gen(n + j)) for j in range(n)]
    if fchoice == "id":
        f = list(x)
        fb = list(y)
    else:
        f = [x[0] + x[1] ** 2, x[1] + x[0] * x[1] / 2]
        fb = [y[0] + y[1] ** 2, y[1] + y[0] * y[1] / 2]
    df = [dhol(fun(c), R, n) for c in f]
    N2 = sum(f[j] * fb[j] for j in range(n))
    u = [fb[j] / N2 for j in range(n)]
    check(sum(u[j] * f[j] for j in range(n)) == 1, "C5 <u0, f> = 1")
    pairs = list(itertools.combinations(range(n), 2))
    a = {}
    for idx, (k, l) in enumerate(pairs):
        a[(k, l)] = (
            (idx + 2) * x[0] * y[1]
            + (idx - 1) * y[0] ** 2
            + y[n - 1] * x[n - 1]
            + idx
        )
    eta_df = {
        (k, l): fadd(fscale(f[l], df[k]), fscale(-f[k], df[l]))
        for (k, l) in pairs
    }
    w = [
        u[j]
        + sum(
            a[(k, l)] * (f[l] if j == k else (-f[k] if j == l else 0))
            for (k, l) in pairs
        )
        for j in range(n)
    ]
    check(sum(w[j] * f[j] for j in range(n)) == 1, "C5 <w, f> = 1")
    sgn = (-1) ** (n * (n - 1) // 2)

    def ud(vecfun):
        return pair([fun(c) for c in vecfun], df)

    def Omega(args):
        out = fscale(sgn, ud(args[0]))
        for ar in args[1:]:
            out = wedge(out, dfull(ud(ar), R, n))
        return out

    L0 = fsub(Omega([u, w] + [u] * (n - 2)), Omega([u] * n))
    wu = [w[j] - u[j] for j in range(n)]
    L1 = fscale(
        sgn,
        wedges(ud(u), dfull(ud(wu), R, n), wpow(dfull(ud(u), R, n), n - 2)),
    )
    dbu_df = pair([dbar(fun(c), R, n) for c in u], df)
    du_df = pair([dfull(fun(c), R, n) for c in u], df)
    L2 = fscale(
        sgn,
        fadd(
            *[
                wedges(
                    ud(u),
                    dbar(fun(a[kl]), R, n),
                    eta_df[kl],
                    wpow(dbu_df, n - 2),
                )
                for kl in pairs
            ]
        ),
    )
    L3 = fscale(
        sgn,
        fadd(
            *[
                wedges(
                    fscale(1 / f[kl[0]], df[kl[0]]),
                    dbar(fun(a[kl]), R, n),
                    eta_df[kl],
                    wpow(du_df, n - 2),
                )
                for kl in pairs
            ]
        ),
    )
    L4 = {}
    for k, l in pairs:
        rest = wedges(
            *[
                wedge(dfull(fun(u[m]), R, n), df[m])
                for m in range(n)
                if m not in (k, l)
            ]
        )
        L4 = fadd(
            L4,
            fscale(
                sgn * factorial(n - 2),
                wedges(dbar(fun(a[(k, l)]), R, n), df[k], df[l], rest),
            ),
        )
    dfall = wedges(*df)

    def L5(signed):
        out = {}
        for k, l in pairs:
            duk = wedges(
                *[dfull(fun(u[m]), R, n) for m in range(n) if m not in (k, l)]
            )
            c = factorial(n - 2) * (
                (-1) ** (k + l) if signed else 1
            )  # k, l 0-based: (-1)^(k+l) same parity
            out = fadd(
                out, fscale(c, wedges(dbar(fun(a[(k, l)]), R, n), duk, dfall))
            )
        return out

    lab = "n=%d f=%s" % (n, fchoice)
    check(L0 != {} and feq(L0, L1), "C5 (26.18) line 1, " + lab)
    check(feq(L1, L2), "C5 (26.18) line 2, " + lab)
    check(feq(L2, L3), "C5 (26.18) <u0, df> replaced by df_k/f_k, " + lab)
    check(feq(L3, L4), "C5 (26.18) (n-2)! wedge du_m ^ df_m, " + lab)
    check(feq(L4, L5(True)), "C5 last line with (-1)^(k+l), " + lab)
    refuted(
        feq(L4, L5(False)), "C5 printed last line without (-1)^(k+l), " + lab
    )
    # Omega(u0, ..., u0, f) = omega(f, fbar) (Section 3), constants without (2
    # pi i)^n
    dfb = [dbar(fun(c), R, n) for c in fb]
    om = {}
    for k in range(n):
        om = fadd(
            om,
            fscale(
                (-1) ** k * fb[k] / N2**n,
                wedges(*[dfb[j] for j in range(n) if j != k], dfall),
            ),
        )
    check(
        feq(Omega([u] * n), fscale(factorial(n - 1), om)),
        "C5 Omega(u0, ..., u0, f) = omega(f, fbar), " + lab,
    )
section("C5")

# ---------------- C6 W_(n, n-1)(u*, zeta, z) in the proof of Theorem 26.14
# W_(p,q)(w) = (-1)^(q+p(n-q-1)) binom(n-1,q)/((2 pi i)^n p!(n-p)!)
# D_(1,q,n-q-1)(w, dbar_z w, dbar_zeta w) ^ D_(p,n-p)(dz, dzeta);
# p = n, q = n-1; the factor (2 pi i)^-n is dropped on both sides.
for n in [2, 3]:
    names = (
        ["x%d" % j for j in range(n)]
        + ["y%d" % j for j in range(n)]
        + ["s%d" % j for j in range(n)]
    )
    R = PolynomialRing(QQ, names)
    F = R.fraction_field()
    x = [F(R.gen(j)) for j in range(n)]  # z
    y = [F(R.gen(n + j)) for j in range(n)]  # zbar
    s = [
        F(R.gen(2 * n + j)) for j in range(n)
    ]  # zeta (W is holomorphic in zeta)
    rho = (
        sum((j + 1) * x[j] * y[j] for j in range(n))
        + (x[0] ** 2 + y[0] ** 2) / 4
        - 1
    )
    P = [rho.derivative(R.gen(j)) for j in range(n)]
    g = sum(P[j] * (s[j] - x[j]) for j in range(n))  # <P(z), zeta - z>
    ustar = [P[j] / g for j in range(n)]
    dbz = lambda c: fadd(
        *[g1(n + m, c.derivative(R.gen(n + m))) for m in range(n)]
    )
    dz_all = wedges(*[g1(j) for j in range(n)])
    D = Dcols((1, [fun(c) for c in ustar]), (n - 1, [dbz(c) for c in ustar]))
    W = fscale(
        (-1) ** (n - 1) / factorial(n), wedge(D, fscale(factorial(n), dz_all))
    )
    Pz = sum(P[j] * x[j] for j in range(n))  # <P(z), z>
    Ps = sum(P[j] * s[j] for j in range(n))  # <P(z), zeta>
    wv = [P[j] / Pz for j in range(n)]  # w(z)
    dP = [dbz(c) for c in P]
    dw = [dbz(c) for c in wv]
    Lsum = lambda vec, dvec, sg: fadd(
        *[
            fscale(
                (-1) ** (j + sg) * vec[j],
                wedges(*[dvec[m] for m in range(n) if m != j], dz_all),
            )
            for j in range(n)
        ]
    )
    omega_zw = Lsum(
        wv, dw, 0
    )  # sum (-1)^(j-1) w_j dw_[j] ^ dz (j 1-based), no constant
    c_n = factorial(n - 1)
    line1_corr = fscale(
        (-1) ** n * c_n / g**n, Lsum(P, dP, 1)
    )  # (-1)^n (n-1)!/(2pi i)^n sum (-1)^j ...
    line2_corr = fscale(
        (-1) ** (n - 1) * c_n * Pz**n / (Ps - Pz) ** n / Pz**n, Lsum(P, dP, 0)
    )
    line3_corr = fscale(
        (-1) ** (n - 1) * c_n / (sum(wv[j] * s[j] for j in range(n)) - 1) ** n,
        omega_zw,
    )
    check(
        W != {} and feq(W, line1_corr),
        "C6 W_(n,n-1)(u*) = (-1)^n (n-1)! sum (-1)^j P_j dP_[j] ^ dz "
        "/ <P, zeta - z>^n, n=%d" % n,
    )
    check(feq(W, line2_corr), "C6 second line corrected, n=%d" % n)
    check(
        feq(W, line3_corr),
        "C6 = (-1)^(n-1) (n-1)! omega(z, w(z)) / (<w, zeta> - 1)^n, n=%d" % n,
    )
    if n == 3:  # for n = 2 the printed first line lacks only (2 pi i)^-2
        refuted(
            feq(W, fscale(1 / g**n, Lsum(P, dP, 1))),
            "C6 printed first line (no constant), n=%d" % n,
        )
    refuted(
        feq(
            W,
            fscale(
                1 / (sum(wv[j] * s[j] for j in range(n)) - 1) ** n, omega_zw
            ),
        ),
        "C6 printed third line, n=%d" % n,
    )
    # alpha^- = int alpha(zeta) ^ W = (-1)^(n-1) (n-1)! omega (-1)^n alpha*(w)
    # = -(n-1)! alpha*(w) omega
    check(
        (-1) ** (n - 1) * (-1) ** n == -1,
        "C6 (26.26): -(n-1)!/(2 pi i)^n alpha*(w(z)) omega(z, w(z))",
    )
section("C6")


# ---------------- D1 Example 1 of §27 (27.1)
Rz = PolynomialRing(QQ, "zz")
zz = Rz.gen()
Fz = Rz.fraction_field()
Lt = LaurentSeriesRing(QQ, "tl", default_prec=40)
tl = Lt.gen()


def res_at(fr, a0):
    """residue of the rational function fr at zz = a0."""
    num, den = fr.numerator(), fr.denominator()
    ser = num(a0 + tl) / den(a0 + tl)
    return ser[-1]


poles = [QQ(1), QQ(-2)]
tests = [
    1 / (zz - 1) ** 2 + 3 / ((zz - 1) * (zz + 2)) + zz**3 - 2 * zz + 5,
    (zz**5 + 1) / ((zz - 1) ** 3 * (zz + 2) ** 2),
    zz**2 / (zz + 2) ** 3 - 7 / (zz - 1),
]
for fr in tests:
    fr = Fz(fr)
    tot = Fz(0)
    for a0 in poles:
        for k in range(1, 7):
            c = res_at(fr * (zz - a0) ** (k - 1), a0)
            tot += c / (zz - a0) ** k
    # c_n = (2 pi i)^-1 int_(|zeta| = R) f zeta^(-n-1) = sum of the residues
    # inside |zeta| = R
    for nn in range(0, 8):
        g = fr / zz ** (nn + 1)
        c = res_at(g, 0) + sum(res_at(g, a0) for a0 in poles)
        tot += c * zz**nn
    check(tot == fr, "D1 (27.1) with c_jk = res (zeta - a_j)^(k-1) f")
fr = Fz(1 / (zz - 1) ** 2)
check(
    res_at(fr * (zz - 1), 1) == 1 and res_at(fr, 1) == 0,
    "D1 c_12 = 1 for (z - 1)^(-2)",
)
refuted(
    res_at(Fz(1 / (zz - 1)) * zz, 1) == 0,
    "D1 printed zeta^(k-1): c_12 of (z - 1)^(-1) would be 1, not 0",
)
section("D1")

# ---------------- D2 Example 2: dependence of the monomials
Rm = PolynomialRing(QQ, "z1,z2")
z1, z2 = Rm.gens()
for d in range(0, 8):
    fams = (
        [z1**m * z2 ** (d - m) for m in range(d + 1)]
        + [z1**m * (z1 + z2) ** (d - m) for m in range(d + 1)]
        + [z2**m * (z1 + z2) ** (d - m) for m in range(d + 1)]
    )
    mons = [z1**i * z2 ** (d - i) for i in range(d + 1)]
    M = matrix(QQ, [[f.monomial_coefficient(mm) for mm in mons] for f in fams])
    check(
        M.rank() == d + 1 and len(fams) == 3 * (d + 1),
        "D2 3(d+1) monomials of degree %d span only d+1 dims" % d,
    )
section("D2")

# ---------------- D3 Example 3
R4 = PolynomialRing(QQ, "z1,z2,s1,s2")
Z1, Z2, S1, S2 = R4.gens()
chi1 = lambda a, b: a**3 + b**3
chi2 = lambda a, b: a**2 + b**2
P11, P12 = Z1**2 + Z1 * S1 + S1**2, Z2**2 + Z2 * S2 + S2**2
P21, P22 = Z1 + S1, Z2 + S2
check(
    chi1(S1, S2) - chi1(Z1, Z2) == (S1 - Z1) * P11 + (S2 - Z2) * P12,
    "D3 Hefer chi_1",
)
check(
    chi2(S1, S2) - chi2(Z1, Z2) == (S1 - Z1) * P21 + (S2 - Z2) * P22,
    "D3 Hefer chi_2",
)
refuted(
    chi2(S1, S2) - chi1(Z1, Z2) == (S1 - Z1) * P21 + (S2 - Z2) * P22,
    "D3 printed chi_2(zeta) - chi_1(z)",
)
Om = P11 * P22 - P12 * P21
h1 = [Z1**2 * Z2 - Z2**2 * Z1, Z1 * Z2 - Z2**2, Z2, Z1, Z1**2 - Z1 * Z2, R4(1)]
g1c = [
    R4(1),
    S1,
    S1**2 - S1 * S2,
    S1 * S2 - S2**2,
    S2,
    S1**2 * S2 - S2**2 * S1,
]
g1p = [
    R4(1),
    S1,
    S1**2 + S1 * S2,
    S1 * S2 - S2**2,
    S2,
    S1**2 * S2 - S2**2 * S1,
]
h2 = [
    Z1**2 * Z2 - Z2**2 * Z1,
    Z1 * Z2 - Z2**2,
    Z2,
    Z1**2 - Z1 * Z2,
    Z1 - Z2,
    -Z1,
    R4(1),
]
g2c = [R4(1), S1, S1**2, S2, S1 * S2, S2**2, S1**2 * S2 - S1 * S2**2]
h2p = h2[:5] + [Z1] + h2[6:]
check(
    sum(a * b for a, b in zip(g1c, h1)) == Om,
    "D3 first representation (corrected)",
)
check(
    sum(a * b for a, b in zip(g1p, h1)) - Om == 2 * Z2 * S1 * S2,
    "D3 printed first representation exceeds Omega by 2 z2 zeta1 zeta2",
)
check(
    sum(a * b for a, b in zip(g2c, h2)) == Om,
    "D3 second representation (corrected)",
)
check(
    sum(a * b for a, b in zip(g2c, h2p)) - Om == 2 * Z1 * S2**2,
    "D3 printed second representation exceeds Omega by 2 z1 zeta2^2",
)
# local algebra and residues at 0 (transformation law)
Rs = PolynomialRing(QQ, "u1,u2", order="degrevlex")
u1, u2 = Rs.gens()
Iq = Rs.ideal([chi1(u1, u2), chi2(u1, u2)])
check(
    Iq.vector_space_dimension() == 6 and Iq.radical() == Rs.ideal([u1, u2]),
    "D3 the only common zero is 0, multiplicity 6",
)
_res_cache = {}


def res0(h, e1, e2):
    """(2 pi i)^-2 int_{|chi_1| = |chi_2| = r} h d zeta/(chi_1^e1 chi_2^e2):
    transformation law
    u_i^N = sum b_ij F_j gives res = coefficient of u^(N-1) in h det(b)."""
    key = (e1, e2)
    if key not in _res_cache:
        F1, F2 = chi1(u1, u2) ** e1, chi2(u1, u2) ** e2
        Ie = Rs.ideal([F1, F2])
        N = 3 * e1 + 2 * e2
        b1 = (u1**N).lift(Ie)
        b2 = (u2**N).lift(Ie)
        assert (
            b1[0] * F1 + b1[1] * F2 == u1**N
            and b2[0] * F1 + b2[1] * F2 == u2**N
        )
        _res_cache[key] = (N, b1[0] * b2[1] - b1[1] * b2[0])
    N, detb = _res_cache[key]
    return (h * detb).monomial_coefficient(u1 ** (N - 1) * u2 ** (N - 1))


toS = R4.hom([0, 0, u1, u2], Rs)
toZ = R4.hom([u1, u2, 0, 0], Rs)
check(
    [res0(u1**a * u2 ** (3 - a), 1, 1) for a in range(4)]
    == [-QQ(1) / 2, -QQ(1) / 2, QQ(1) / 2, QQ(1) / 2],
    "D3 residues of the monomials of degree 3",
)
jac = matrix(
    Rs,
    [
        [chi1(u1, u2).derivative(u1), chi1(u1, u2).derivative(u2)],
        [chi2(u1, u2).derivative(u1), chi2(u1, u2).derivative(u2)],
    ],
).det()
check(res0(jac, 1, 1) == 6, "D3 res of the Jacobian = multiplicity 6")
check(
    res0(Rs(1), 1, 1) == 0 and res0(u1, 1, 1) == 0,
    "D3 residues vanish below the socle degree",
)
lam = lambda gs, hs: matrix(
    QQ, len(gs), len(hs), lambda k, j: res0(toS(gs[k]) * toZ(hs[j]), 1, 1)
)
L1 = lam(g1c, h1)
check(
    L1.det() != 0,
    "D3 det lambda != 0 for the first representation (det = %s)" % L1.det(),
)
check(L1.det() == 1, "D3 det lambda = 1")
refuted(
    lam(g1p, h1).det() != 0, "D3 printed first representation: det lambda = 0"
)
check(
    lam(g2c, h2).det() == 0,
    "D3 second representation: det lambda = 0 (7 functions)",
)
# the expansion (27.4)-(27.5) for monomials f of degree <= 7
RZ = PolynomialRing(QQ, "w1,w2")
w1, w2 = RZ.gens()
for gs, hs, lab in [(g1c, h1, "first"), (g2c, h2, "second")]:
    for dg in range(0, 8):
        for a in range(dg + 1):
            f = u1**a * u2 ** (dg - a)
            tot = RZ(0)
            for k in range(len(gs)):
                gk = toS(gs[k])
                dfg = dg + gk.degree()
                for al1 in range(0, 4):
                    for al2 in range(0, 6):
                        if 3 * al1 + 2 * al2 + 3 != dfg:
                            continue
                        c = res0(f * gk, al1 + 1, al2 + 1)
                        tot += (
                            c
                            * R4.hom([w1, w2, 0, 0], RZ)(hs[k])
                            * chi1(w1, w2) ** al1
                            * chi2(w1, w2) ** al2
                        )
            check(
                tot == w1**a * w2 ** (dg - a),
                "D3 (27.4) for z^(%d,%d), %s representation"
                % (a, dg - a, lab),
            )
section("D3")

# ---------------- D4 3 deg: the normal form (27.8') and Q_n
for m in range(1, 8):
    names = ["A%d" % p for p in range(m)] + ["s", "z"]
    Rq = PolynomialRing(QQ, names)
    A = Rq.gens()[:m]
    s, zz_ = Rq.gens()[m], Rq.gens()[m + 1]
    Pc = lambda X: (
        X**m + sum(A[p] * X**p for p in range(m))
    )  # A_p coefficient of X^p
    Qn = (Pc(s) - Pc(zz_)) // (s - zz_)
    check((Pc(s) - Pc(zz_)) % (s - zz_) == 0, "D4 divisibility")
    gk = lambda k: s ** (m - k) + sum(A[p] * s ** (p - k) for p in range(k, m))
    check(
        Qn == sum(zz_ ** (k - 1) * gk(k) for k in range(1, m + 1)),
        "D4 Q_n = sum z_n^(k-1) g_k, m=%d" % m,
    )
    if m >= 2:
        Pp = lambda X: (
            X**m + sum(A[j - 1] * X ** (m - j) for j in range(1, m + 1))
        )  # printed: A_j coefficient of X^(m-j)
        Qp = (Pp(s) - Pp(zz_)) // (s - zz_)
        refuted(
            Qp == sum(zz_ ** (k - 1) * gk(k) for k in range(1, m + 1)),
            "D4 printed indexing A_1, ..., A_m, m=%d" % m,
        )
# residue at infinity and lambda_(jk); the expansion (27.12)-(27.13)
Rq = PolynomialRing(QQ, "z1,z2")
q1, q2 = Rq.gens()
Fq = Rq.fraction_field()
for m, Acoef in [(2, [2 * q1 + 3, q1]), (3, [2 * q1 + 3, q1**2 - 1, q1])]:
    Pq = q2**m + sum(Acoef[p] * q2**p for p in range(m))
    gq = [
        q2 ** (m - k) + sum(Acoef[p] * q2 ** (p - k) for p in range(k, m))
        for k in range(1, m + 1)
    ]

    S = PowerSeriesRing(
        Rq.change_ring(QQ).fraction_field(), "tt", default_prec=60
    )
    tt = S.gen()

    def c_minus1(G):
        """coefficient of zeta_n^(-1) in the expansion of G at zeta_n =
        infinity (= (2 pi i)^-1 int_{|P| = R} G d zeta_n): G(1/t) as a
        series, coefficient of t."""
        num, den = Fq(G).numerator(), Fq(G).denominator()
        dn, dd = num.degree(q2), den.degree(q2)
        Nt = sum(
            num.coefficient({q2: i}) * tt ** (dn - i) for i in range(dn + 1)
        )
        Dt = sum(
            den.coefficient({q2: i}) * tt ** (dd - i) for i in range(dd + 1)
        )
        ser = Nt / Dt  # G(1/t) = t^(dd - dn) Nt/Dt
        sh = dd - dn
        idx = 1 - sh
        if idx < 0:
            return 0
        return Fq(ser[idx])

    for k in range(0, m):
        val = c_minus1(q2**k / Pq)
        check(
            val == (1 if k == m - 1 else 0),
            "D4 (2 pi i)^-1 int zeta_n^k d zeta_n / P = %s, m=%d k=%d"
            % (val, m, k),
        )
    # standard residue at infinity is -c_(-1): res_(z_n = oo) [z_n^(m-1)/P] =
    # -1
    refuted(
        -c_minus1(q2 ** (m - 1) / Pq) == 1,
        "D4 printed '= res_(z_n = oo)' (standard convention gives -1), m=%d"
        % m,
    )

    def coeff(f, k, al1, al2):
        """a_(k alpha) of (27.13): torus |z1| = R, then |P| = R."""
        G = Fq(f) * gq[k - 1] / Pq ** (al2 + 1)
        inner = Fq(c_minus1(G))
        num, den = inner.numerator(), inner.denominator()
        assert den.degree() == 0
        return (num / den).monomial_coefficient(q1**al1) if al1 >= 0 else 0

    lamM = matrix(QQ, m, m, lambda j, k: coeff(q2**k, j + 1, 0, 0))
    check(
        all(
            lamM[j, k] == (1 if k == j else 0)
            for j in range(m)
            for k in range(m)
            if k <= j
        ),
        "D4 lambda_jk triangular, m=%d" % m,
    )
    check(lamM.det() == 1, "D4 det lambda = 1, m=%d" % m)
    ftests = [
        Fq(1),
        q1,
        q2,
        q2**2,
        q1 * q2**3,
        1 / Pq,
        q2 / Pq,
        1 / Pq**2,
        q1**2 / Pq,
        q2**4 / Pq,
        (q1 + q2) / Pq**2,
    ]
    for f in ftests:
        tot = Fq(0)
        for k in range(1, m + 1):
            for al1 in range(0, 6):
                for al2 in range(-4, 5):
                    c = coeff(f, k, al1, al2)
                    if c != 0:
                        assert al1 < 5 and -3 < al2 < 4, "range"
                        tot += c * q2 ** (k - 1) * q1**al1 * Fq(Pq) ** al2
        check(tot == f, "D4 (27.12) for f = %s, m=%d" % (f, m))
    # b_(k alpha): with the printed sign the expansion of 1/P is -1/P
    f = 1 / Fq(Pq)
    b_printed = -coeff(f, 1, 0, -1)
    check(b_printed == -1, "D4 printed b_(1, 0) = -1")
    refuted(
        b_printed / Fq(Pq) == f,
        "D4 printed b_k alpha without the minus sign, m=%d" % m,
    )
section("D4")


# ---------------- D5 Theorem 27.4 on the coordinate cross L1 = z1, L2 = z2
# families: r = 0 (cycle |z1| = |z2| = R), r = 1, omega = {1} (|z1| = eps, |z2|
# = R),
# omega = {2} (|z2| = eps, |z1| = R), r = 2 (|z1| = eps1, |z2| = eps2).  For a
# Laurent
# monomial every cycle is a torus in (L_alpha, L_(k omega)), so c_(alpha beta)
# = 1 for the
# exponent of the monomial and 0 otherwise; the families differ only in the
# ranges of beta.
def count_terms(a, b, neg):
    lo = -1 if neg else None
    inr = lambda e: (e <= -1) if neg else True  # range of beta_1, ..., beta_r
    fam = 0
    fam += 1 if (a >= 0 and b >= 0) else 0  # r = 0
    fam += (
        1 if (inr(a) and b >= 0) else 0
    )  # omega = {1}: L_1 = z1, L_(2 omega) = z2
    fam += (
        1 if (inr(b) and a >= 0) else 0
    )  # omega = {2}: L_2 = z2, L_(2 omega) = z1
    fam += 1 if (inr(a) and inr(b)) else 0  # r = 2
    return fam


for a in range(-3, 4):
    for b in range(-3, 4):
        check(
            count_terms(a, b, True) == 1,
            "D5 Theorem 27.4 with beta_1..beta_r <= -1: z^(%d,%d)" % (a, b),
        )
refuted(
    count_terms(0, 0, False) == 1,
    "D5 printed ranges: f = 1 is represented 4 times",
)
check(count_terms(0, 0, False) == 4, "D5 printed ranges give 4")
section("D5")

print("ok ch5: %d checks" % COUNT[0])
