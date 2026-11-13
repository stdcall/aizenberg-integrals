#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[Computation of the multiplicity of a zero of a system of
  holomorphic functions from their Taylor series] <sec:multiplicity>

#point <pt:multiplicity-preliminaries> Let
$
  f(z) = (f_1 (z), ..., f_n (z))
$ <eq:holomorphic-system>
be a system of holomorphic functions (a holomorphic mapping) in a neighborhood
$U_a$ of a point $a in CC^n$ that is an isolated zero of the system with
multiplicity $mu_a (f)$ (see @sec:rouche-principle). For a holomorphic function
of a single variable the multiplicity $mu_a (f)$ of a zero always coincides with
the order $d_a (f) = min_(c_k != 0) {k}$ of the function
$f = sum_(k >= 0) c_k (z - a)^k$, i.e., the multiplicity of a zero depends only
on which Taylor coefficients of $f$ at $a$ are not equal to zero. The picture is
more complicated in the multidimensional case. First, the multiplicity of a zero
of @eq:holomorphic-system is not always determined by the orders of the zero $a$
of the functions $f_j$. For example, for the system $f$:
$f_j = z_j^(k_j) + sum_(|alpha| > k_j) c_(j alpha) z^alpha$, $j = 1, ..., n$, we
have
$
  mu_0 (f) = k_1 dots.c k_n = d_0 (f_1) dots.c d_0 (f_n).
$
This is easy to see from Rouché's principle (see Theorem~@th:rouche-principle)
and from the definition of the multiplicity of a zero. On the other hand, the
orders $d_a (f_i)$, $i = 1, 2$, of the functions of the system
$(z_1, z_1 + z_2^2)$ are equal to 1, but $mu_0 (f) = 2$.

#source(190)
In @pt:homogeneous-principal-parts we give a necessary and sufficient condition
on the system @eq:holomorphic-system for $mu_a (f) = d_a (f_1) dots.c d_a (f_n)$
to hold.

Moreover, knowledge of the monomials with nonzero coefficients does not always
enable us to determine the multiplicity of a zero. For example, the systems
$(z_1 + z_2 + z_1^2, z_1 - z_2 + z_2^2)$ and
$(z_1 + z_2 + z_1^2, z_1 + z_2 + z_2^2)$ have the same collection of monomials,
but the multiplicity of the zero $(0, 0)$ is different for them. However, as a
rule, the multiplicity of an isolated zero is determined only by the monomials
appearing in the $f_i$ with nonzero coefficients, i.e., by the sets
$
  S_i = supp f_i = {alpha in NN^n: c_(i alpha) != 0},
$
where $NN = {0, 1, 2, ...}$ and $f_i = sum_alpha c_(i alpha) (z - a)^alpha$.
Therefore, to a given collection $S = {S_1, ..., S_n}$, $S_i subset NN^n$, we
can assign a number $mu_a (S)$ equal to the multiplicity of a zero for "almost
all" the systems $f$ with $supp f_i subset S_i$, $i = 1, ..., n$.

In @pt:newton-polygons we solve constructively the problem of computing
$mu_a (S)$ in terms of the collection $S$, and also give "nondegeneracy"
conditions on the Taylor coefficients of the functions $f_i$ for the equality
$mu_a (f) = mu_a (S)$ to hold.

We present some simple properties of the multiplicity of an isolated zero of a
system of holomorphic functions. If $f(a) != 0$, then $mu_a (f)$ is set equal to
zero.

#proposition[
  #roman-text[1)] $mu_a (f compose g) = mu_0 (f) dot.c mu_a (g)$, where
  $f compose g$ is the composition of the mappings.

  #roman-text[2)] $mu_a (f_1 dot.c g_1, f_2, ..., f_n)
  = mu_a (f_1, f_2, ..., f_n) + mu_a (g_1, f_2, ..., f_n)$.

  #roman-text[3)] The multiplicity of a zero of a system of holomorphic
  functions coincides with the multiplicity of a zero of the system of their
  Weierstrass pseudopolynomials.
] <prop:multiplicity-properties>

#proof[
  1) Suppose that $w = f(z)$, $z = g(zeta)$, $g(a) = 0$ and $f(0) = 0$. If
  $B = {|zeta - a| < delta}$, then, by the argument principle (see
  Theorem~@th:argument-principle),
  $(utilde(f) compose g)(partial B) tilde.op mu_a (f compose g){|w| = delta}$ in
  $CC^n without {0}$. But $utilde(g)(partial B) tilde.op mu_a (g) partial V$ and
  $utilde(f)(partial V) tilde.op mu_0 (f){|w| = delta}$, where
  $V = {|z| < delta}$. Therefore,
  $
    (utilde(f) compose g)(partial B) = utilde(f)(utilde(g)(partial B))
    tilde.op mu_a (g) dot.c utilde(f)(partial V)
    tilde.op mu_0 (f) dot.c mu_a (g) dot.c {|w| = delta}
  $
  in $CC^n without {0}$, and so $mu_a (f compose g) = mu_a (g) dot.c mu_0 (f)$.

  2) By Theorem~@th:skeleton-boundary,
  $
    mu_a (f_1 g_1, f_2, ..., f_n)
    & = 1 / (2 pi i)^n integral_Gamma (d(f_1 g_1)) / (f_1 g_1)
    and (d f_2) / f_2 and dots.c and (d f_n) / f_n \
    & = 1 / (2 pi i)^n integral_Gamma (d f_1) / f_1 and dots.c
    and (d f_n) / f_n
    + 1 / (2 pi i)^n integral_Gamma (d g_1) / g_1 and (d f_2) / f_2
    and dots.c and (d f_n) / f_n \
    & = mu_a (f_1, ..., f_n) + mu_a (g_1, f_2, ..., f_n),
  $
  #source(191)
  where $Gamma = {z in S(epsilon): |f_2 (z)| = dots.c = |f_n (z)| = delta}$ and
  $S(epsilon) = {z: |z - a| = epsilon}$, $delta << epsilon$.

  3) follows from 2), since $mu_a (f)$ is symmetric with respect to the $f_j$
  ($j = 1, ..., n$), and, moreover, for the Weierstrass pseudopolynomials $P_j$
  we have $f_j = P_j psi_j$, $psi_j (a) != 0$, $j = 1, ..., n$.
]

The main apparatus in this section for computing the multiplicity of a zero of a
system $f$ amounts to the Rouché principle, along with a general theorem on the
multiplicity of a zero of $f$ which constructs from $f$ a function of a single
variable with a zero of multiplicity that coincides with $mu_a (f)$.

#point <pt:general-multiplicity-theorem> *A general theorem on the multiplicity
of a zero.* We need two theorems on analytic sets: a theorem on a local
description, and a theorem on the relation of the dimensions of analytic sets
(see @bib:Herve1963).

Let $K$ be a one-dimensional analytic set containing the point $0 in CC^n$.

#theorem(title: [on a local description])[
  There exist a basis in $CC^n$ and a polycylinder
  $U_epsilon = {z: |z_j| < epsilon_j, j = 1, ..., n}$ (the radii $epsilon_j$ are
  assumed to be sufficiently small) that satisfy the following conditions:
  + $z = 0$ is an isolated point of the set $K inter {z: z_n = 0}$.
  + For any $z_n^((0)) in U_(epsilon_n) without {0}
    = {z_n in CC^1: 0 < |z_n| < epsilon_n}$ the set
    $K(z_n^((0))) = {z in K inter U_epsilon: z_n = z_n^((0))}$ consists of one
    and the same finite number $p$ of points.
  + There exist pseudopolynomials $P_j (z_j, z_n)$, $j = 1, ..., n - 1$,
    distinguished with respect to the $z_j$, such that $K inter U_epsilon
    subset.eq {z in U_epsilon: P_j (z_j, z_n) = 0, j = 1, ..., n - 1}$.
] <th:local-description>

The local description theorem implies that in a neighborhood of each point
$z_n^((0)) in U_(epsilon_n) without {0}$ the set $K(z_n)$ is a finite tuple
$
  z^((nu)) (z_n) = (z_1^((nu)) (z_n), ..., z_(n - 1)^((nu)) (z_n), z_n),
  quad nu = 1, ..., p,
$
of holomorphic vector-valued functions that can be continued along any path in
$U_(epsilon_n) without {0}$ and can be expressed there by fractional power
series of the form
$
  z_i^((nu)) (z_n) = sum_(k = 1)^infinity a_(i k)^((nu)) z_n^(k \/ m),
  quad i = 1, ..., n - 1, nu = 1, ..., p,
$ <eq:branches-fractional>
where $m > 0$ is an integer. A one-dimensional analytic set will be called an
#index-mark("Curve", sub: "analytic")_analytic curve_, and the vector-valued
functions $z^((nu)) (z_n)$ #index-mark("Branch of an analytic curve")_the
branches of the curve_.

#theorem[
  Suppose that $A$ is an analytic set in an open set $U subset CC^n$, $h$ is a
  function holomorphic in $U$, and $A' = {z in A: h(z) = 0}$. Then
  $dim_a A' = dim_a A$ or $dim_a A' = dim_a A - 1$ for each point $a in A'$,
  where $dim_a$ is the complex dimension at a point $a$ of an analytic set.
] <th:dimension-of-section>

#source(192)
The concept of the resultant of a function with respect to a system plays the
main role in the general multiplicity theorem. If a system
$phi = (phi_1, ..., phi_n)$ of functions holomorphic in a domain $D subset CC^n$
has a finite set $E = {z^((nu))}_(nu = 1)^s$ of zeros there, then the
#index-mark(
  "Resultant of a function with respect to a system",
)_resultant of a function $psi$ with respect to the system $phi$_ is defined to
be the number
$
  R(phi, psi) = product_(nu = 1)^s psi^(mu_nu) (z^((nu))),
$
where $mu_nu = mu_(z^((nu))) (phi)$ is the multiplicity of the zero $z^((nu))$
of $phi$.

In the case where $n = 1$, $D = CC^1$, and $phi_1$ and $psi$ are polynomials,
the resultant $R(phi_1, psi)$ coincides with the usual Sylvester resultant of
$phi_1$ and $psi$.

Suppose that $z = 0$ is an isolated zero of @eq:holomorphic-system. Then, by
Theorem~@th:dimension-of-section, the complex dimension at 0 of the analytic set
$K = {z in U_0: f_j (z) = 0, j = 1, ..., n - 1}$ is equal to 1. According to the
local description theorem, there is a basis in $CC^n$ such that the following
condition holds in the polycylinder
$U_epsilon = {z: |z_j| < epsilon_j, j = 1, ..., n}$: for any
$zeta in U_(epsilon_n) without {0} = {z_n: 0 < |z_n| < epsilon_n}$ the set
$
  K(zeta) = {z in U_epsilon: f_1 (z) = dots.c = f_(n - 1) (z) = 0, z_n = zeta}
$
consists of $p$ points $z^((nu)) (zeta)$, $nu = 1, ..., p$. Therefore, for any
$z_n in U_(epsilon_n) without {0}$ we can define the resultant of the function
$f_n$ with respect to the system $attach(f, tl: ') = (f_1, ..., f_(n - 1))$,
namely,
$
  R(attach(f, tl: '), f_n)
  = product_(nu = 1)^p f_n^(mu_nu) (attach(z, tl: ')^((nu)) (z_n), z_n),
$
where the $attach(z, tl: ')^((nu)) (z_n)
= (z_1^((nu)) (z_n), ..., z_(n - 1)^((nu)) (z_n))$, $nu = 1, ..., p$, are
isolated zeros of the system $attach(f, tl: ')$ in the domain
$attach(U, tl: ')_epsilon
= {attach(z, tl: ') in CC^(n - 1): |z_j| < epsilon_j, j = 1, ..., n - 1}$, and
$mu_nu$ is the multiplicity of the zero $attach(z, tl: ')^((nu)) (z_n)$ of the
system $attach(f, tl: ')$.

We remark that the multiplicity $mu_nu$ does not depend on $z_n$, although the
zeros $attach(z, tl: ')^((nu)) (z_n)$ do. Indeed, by
Theorem~@th:logarithmic-residue, the multiplicity of the zero
$attach(z, tl: ')^((nu)) (z_n)$ can be expressed by the integral
$mu_nu = integral_(S_nu (delta))
omega(attach(f, tl: '), overline(attach(f, tl: ')))$, where
$S_nu (delta) = {attach(z, tl: '):
  |attach(z, tl: ') - attach(z, tl: ')^((nu)) (zeta)| = delta}$, $delta$ is
sufficiently small, and the Martinelli-Bochner kernel
$omega(attach(f, tl: '), overline(attach(f, tl: ')))$ is a form continuous in
the parameter $z_n$. Therefore, $mu_nu = mu(attach(z, tl: ')^((nu)) (z_n))$,
being a continuous and integer-valued function, takes a single value for all
$z^((nu)) (z_n)$ in a connected component of $K without {0}$.

Further, it is easy to see that $R(attach(f, tl: '), f_n)$ is a holomorphic
function in the disk $U_(epsilon_n) = {z_n: |z_n| < epsilon_n}$, since it is
symmetric with respect to the branches $z^((nu)) (z_n)$ of the curve $K$.

We can now state a general theorem on the multiplicity of a zero of a system of
holomorphic functions.

#source(193)
#theorem(title: [Tsikh])[
  The multiplicity of the isolated zero $z = 0$ of the system
  @eq:holomorphic-system is equal to the multiplicity of the zero $z_n = 0$ of
  the resultant of $f_n$ with respect to the system $attach(f, tl: ')$:
  $mu_0 (f) = mu_0 (R(attach(f, tl: '), f_n))$.
] <th:multiplicity-resultant>

#proof[
  By Theorem~@th:skeleton-boundary,
  $
    mu_0 (f) = 1 / (2 pi i)^n integral_Gamma (d f) / f
    = 1 / (2 pi i)^n integral_Gamma (d attach(f, tl: ')) / attach(f, tl: ')
    and (d f_n) / f_n,
  $
  where
  $Gamma = {z in partial U_epsilon: |f_j (z)| = delta, j = 1, ..., n - 1}$,
  $0 < delta < min_(z in partial U_epsilon) norm(f)$, with
  $norm(f) = max{|f_1|, ..., |f_n|}$. Since we are operating under the
  conditions of the local description theorem, for sufficiently small $delta$ we
  can write the cycle $Gamma$ in the form
  $Gamma = {z: |f_j (z)| = delta, j = 1, ..., n - 1, |z_n| = epsilon_n}$. With
  the notation $gamma = K inter {z: |z_n| = epsilon_n}$ it follows that
  $Gamma tilde.op Gamma' = union.big_(w in gamma) Gamma_w$ in
  $U_epsilon without {z: f_1 (z) dots.c f_n (z) = 0}$, where $Gamma_w$ is the
  connected component of the $(n - 1)$-dimensional cycle
  ${z in U_epsilon: |f_j (z)| = delta, j = 1, ..., n - 1, z_n = w_n}$ (this
  cycle has $p$ components if $delta$ is sufficiently small) that lies in a
  neighborhood of the point $w in gamma$. By
  Theorem~@th:caccioppoli-martinelli-sorani,
  $
    1 / (2 pi i)^(n - 1) integral_(Gamma_w)
    (d attach(f, tl: ')) / attach(f, tl: ') = mu(w),
  $
  where $mu(w)$ is the multiplicity of the isolated zero
  $attach(w, tl: ') = (w_1, ..., w_(n - 1))$ of the system $attach(f, tl: ')$
  for $z_n = w_n$. Consequently,
  $
    mu_0 (f) = 1 / (2 pi i)^n integral_(Gamma')
    (d attach(f, tl: ')) / attach(f, tl: ') and (d f_n) / f_n
    = 1 / (2 pi i) integral_gamma mu(w) (d f_n) / f_n.
  $
  #new-par
  Since on $gamma$ the $p$ points $w = z^((nu)) (z_n)$, $nu = 1, ..., p$,
  correspond to any given $z_n in gamma_0 = {|z_n| = epsilon_n}$, and
  $mu(w) = mu(z^((nu)) (z_n)) = mu_nu$ does not depend on $z_n$, the last
  integral is equal to
  $
    1 / (2 pi i) integral_(gamma_0) sum_(nu = 1)^p mu_nu
    (d f_n (z^((nu)) (z_n))) / (f_n (z^((nu)) (z_n)))
    & = 1 / (2 pi i) integral_(gamma_0)
    (d(product_(nu = 1)^p f_n^(mu_nu) (z^((nu)) (z_n))))
    / (product_(nu = 1)^p f_n^(mu_nu) (z^((nu)) (z_n))) \
    & = 1 / (2 pi i) integral_(gamma_0)
    (d R(attach(f, tl: '), f_n)) / R(attach(f, tl: '), f_n).
  $
]

#remark[
  By Theorem~@th:multiplicity-resultant and
  Proposition~@prop:multiplicity-properties, the multiplicity of the zero
  $(0, 0) in CC^2$ of a system of two holomorphic functions is equal to the
  multiplicity of a zero of the Sylvester resultant of their Weierstrass
  pseudopolynomials, which can be written in the form of a determinant. Since
  the coefficients of a Weierstrass pseudopolynomial can be found constructively
  (see Theorem~@th:yuzhakov-power-sums), Theorem~@th:multiplicity-resultant
  gives a practical method for computing the multiplicity of a zero of any
  holomorphic system in $CC^2$.
]

#source(194)
Theorem~@th:multiplicity-resultant and the Rouché principle enable us easily to
prove the familiar theorem of Bézout on the total number of roots of a system of
algebraic equations in the complex projective plane $CC P^n$. We use this
theorem in what follows.

Suppose that we are given a system of equations
$
  f_j (zeta) = 0, quad j = 1, ..., n,
$ <eq:homogeneous-system>
where the $f_j (zeta)$ are homogeneous polynomials and
$zeta = (zeta_0, zeta_1, ..., zeta_n)$ are homogeneous coordinates in $CC P^n$.
Proportional solutions of @eq:homogeneous-system determine a single point in
$CC P^n$, called a _root_ of @eq:homogeneous-system in $CC P^n$. If
$tilde(zeta) = (tilde(zeta)_0, tilde(zeta)_1, ..., tilde(zeta)_n)$ is an
isolated root of @eq:homogeneous-system in $CC P^n$ with $tilde(zeta)_i != 0$,
then the multiplicity $mu_(tilde(zeta)) (f)$ of this root is defined to be the
multiplicity of the zero
$(tilde(zeta)_0 \/ tilde(zeta)_i, ..., tilde(zeta)_(i - 1) \/ tilde(zeta)_i,
  tilde(zeta)_(i + 1) \/ tilde(zeta)_i, ..., tilde(zeta)_n \/ tilde(zeta)_i)$
of the system $f_j (zeta_0, ..., zeta_(i - 1), 1, zeta_(i + 1), ..., zeta_n)$,
$j = 1, ..., n$, in $CC^n$.

#theorem(title: [Bézout])[
  If the system @eq:homogeneous-system has only isolated roots in $CC P^n$, then
  their number, counting multiplicity, is equal to the product of the degrees of
  the polynomials $f_j (zeta)$, $j = 1, ..., n$.
] <th:bezout>

#proof[
  Let us use induction on the number of variables. For $n = 1$ the proof is
  elementary. We assume the validity of the theorem for $n - 1$ and prove it for
  $n$. Choose a system of homogeneous coordinates
  $zeta = (zeta_0, zeta_1, ..., zeta_n)$ in $CC P^n$ such that
  @eq:homogeneous-system does not have roots on the plane $zeta_0 = 0$. Then the
  number of roots of this system in $CC P^n$ coincides with the number of zeros
  of the system
  $
    f_j (1, z_1, ..., z_n), quad j = 1, ..., n,
  $ <eq:affine-system>
  in $CC^n$. Suppose that
  $f_j (1, z_1, ..., z_n) = sum_(|alpha| <= k_j) c_(j alpha) z^alpha$,
  $j = 1, ..., n$, with $k_j = deg f_j$; then the system
  $
    Q_j (z) = f_j (0, z_1, ..., z_n) = sum_(|alpha| = k_j) c_(j alpha) z^alpha,
    quad j = 1, ..., n,
  $ <eq:leading-forms>
  does not have zeros different from $z = 0$ in $CC^n$, for otherwise
  @eq:homogeneous-system would have a root on the plane $zeta_0 = 0$.

  We first prove that the multiplicity of the zero $z = 0$ of @eq:leading-forms
  is equal to $k_1 dots.c k_n$. Choose a coordinate system in $CC^n$ such that
  $K inter {z: z_n = 0} = {0}$, where $K = {z: Q_j (z) = 0, j = 1, ..., n - 1}
  = {z = a^((nu)) z_n}_(nu = 1)^p$, and
  $a^((nu)) = (a_1^((nu)), ..., a_(n - 1)^((nu)), 1)$ is the set of roots of the
  system of equations $Q_j (z) = 0$, $j = 1, ..., n - 1$, in $CC P^(n - 1)$ with
  homogeneous coordinates $z = (z_1, ..., z_n)$. If
  $mu_nu = mu_(attach(a, tl: ')^((nu))) (attach(Q, tl: '))$ is the multiplicity
  of the zero $attach(a, tl: ')^((nu)) = (a_1^((nu)), ..., a_(n - 1)^((nu)))$ of
  the system $attach(Q, tl: ') (attach(z, tl: '), 1)
  = (Q_1 (attach(z, tl: '), 1), ..., Q_(n - 1) (attach(z, tl: '), 1))$, then
  $
    sum_(nu = 1)^p mu_nu = k_1 dots.c k_(n - 1)
  $
  #source(195)
  by the induction hypothesis. Since $z = 0$ is an isolated zero of
  @eq:leading-forms, it follows that
  $Q_n (a^((nu)) z_n) = z_n^(k_n) Q_n (a^((nu))) equiv.not 0$, $nu = 1, ..., p$;
  therefore, the multiplicity of the zero $z_n = 0$ of the resultant
  $R(attach(Q, tl: '), Q_n) = product_(nu = 1)^p Q_n^(mu_nu) (a^((nu)) z_n)$ is
  equal to $k_1 dots.c k_n$. By Theorem~@th:multiplicity-resultant,
  $mu_0 (Q) = k_1 dots.c k_n$.

  It remains to prove that @eq:affine-system and @eq:leading-forms have the same
  number of zeros in $CC^n$, counting multiplicity. We note first that
  $f_j (1, z_1, ..., z_n) = g_j (z) + Q_j (z)$, where
  $g_j (z) = sum_(|alpha| < k_j) c_(j alpha) z^alpha$, $j = 1, ..., n$. Since
  ${z: Q_j (z) = 0, j = 1, ..., n} = {0}$, there exists for any point
  $w in S(1) = {z: |z| = 1}$ an index $j in {1, ..., n}$ for which
  $Q_j (w) != 0$. There exist a neighborhood $U_w$ of $w$ on $S(1)$ and a number
  $r_w > 0$ such that for all $z in U_w$ and $r > r_w$
  $
    |Q_j (r z)| = lr(|r^(k_j) sum_(|alpha| = k_j) c_(j alpha) z^alpha|)
    > lr(|sum_(m = 0)^(k_j - 1) r^m sum_(|alpha| = m) c_(j alpha) z^alpha|)
    = |g_j (r z)|.
  $
  Choosing from the covering ${U_w}_(w in S(1))$ of the compact set $S(1)$ a
  finite subcovering $U_(w_1), ..., U_(w_N)$ and letting
  $r_0 = max{r_(w_1), ..., r_(w_N)}$, we get that on the sphere
  $S(r) = {z: |z| = r}$ the systems $Q$ and $g$ satisfy the conditions of
  Rouché's principle for any $r > r_0$. Consequently, @eq:affine-system and
  @eq:leading-forms have the same number of zeros in $CC^n$ counting
  multiplicity, and this number is equal to the product $k_1 dots.c k_n$ of the
  degrees of the polynomials $f_j (zeta)$, $j = 1, ..., n$.
]

#point <pt:homogeneous-principal-parts> *Computation of the multiplicity of a
zero from the homogeneous and weighted-homogeneous principal parts.* Let
$f_j (z) = sum_(|alpha| >= k_j) c_(j alpha) z^alpha$, $j = 1, ..., n$, be the
Taylor expansion of $f_j$ in @eq:holomorphic-system at the point 0, where
$k_j = d_0 (f_j)$ is the order of the zero $z = 0$ of this function. We write
$P_j (z) = sum_(|alpha| = k_j) c_(j alpha) z^alpha$, $j = 1, ..., n$, and call
the system of homogeneous polynomials
$
  P(z) = (P_1 (z), ..., P_n (z))
$ <eq:homogeneous-principal-part>
the #index-mark(
  "Part",
  sub: "principal homogeneous, of a system of holomorphic functions at a point",
)_homogeneous principal part of the system_ @eq:holomorphic-system.

#theorem(title: [Tsikh and Yuzhakov])[
  The multiplicity of the isolated zero $z = 0$ of the system
  @eq:holomorphic-system is equal to the product of the orders of the zero
  $z = 0$ of the functions in this system
  ($mu_0 (f) = d_0 (f_1) dots.c d_0 (f_n)$) if and only if 0 is an isolated zero
  of the system @eq:homogeneous-principal-part. Moreover, the inequality
  $mu_0 (f) >= d_0 (f_1) dots.c d_0 (f_n)$ always holds.
] <th:tsikh-yuzhakov>

#proof[
  Let $l(z) = c_1 z_1 + dots.c + c_n z_n$ be an arbitrary linear form, and
  $z^((nu)) (z_n)$, $nu = 1, ..., p$, the branches of the curve
  $K = {z in U_epsilon: f_j (z) = 0, j = 1, ..., n - 1}$, represented in the
  form @eq:branches-fractional. The resultant
  $
    R(attach(f, tl: '), l) = product_(nu = 1)^p l^(mu_nu) (z^((nu)) (z_n))
  $
  #source(196)
  is a power series in $z_n$ whose coefficients are polynomials in
  $c = (c_1, ..., c_n)$. Consequently, the set of $c$ such that the multiplicity
  $mu_0 (R(attach(f, tl: '), l)) = mu_0 (attach(f, tl: '), l)$ is minimal
  (denote this multiplicity by $mu$) is open and dense in $CC^n$, being the
  complement of the zero set of the polynomial which is the coefficient of the
  lowest power of $z_n$. In the space $CC^n$ of variables $z$ we choose a
  coordinate system such that the equalities $mu_0 (attach(f, tl: '), z_i) = mu$
  are satisfied for the forms $l(z) = z_i$, $i = 1, ..., n$. In this coordinate
  system the representation @eq:branches-fractional for the analytic elements of
  the curve $K$ takes the form
  $
    z_i^((nu)) (z_n) = a_i^((nu)) z_n + o(z_n^(1 + lambda)),
  $ <eq:branches-linear>
  where#footnote[The number $p$ actually depends on the choice of the coordinate
    system in $CC^n$, but we keep the notation in @eq:branches-fractional.]
  $a_i^((nu)) != 0$, $i = 1, ..., n - 1$, $nu = 1, ..., p$,
  $o(z_n^(1 + lambda))$ is infinitesimally small with respect to
  $z_n^(1 + lambda)$ as $z_n -> 0$, and $lambda > 0$ is a constant. We prove
  this. Since $mu_0 (attach(f, tl: '), z_n) = mu$ and
  $R(attach(f, tl: '), z_n) = z_n^(mu_1 + dots.c + mu_p)$, it follows that
  $mu_1 + dots.c + mu_p = mu$. If @eq:branches-fractional is written in the form
  $z_i^((nu)) (z_n) = b_i^((nu)) z_n^(epsilon_(i nu))
  + o(z_n^(epsilon_(i nu)))$, $b_i^((nu)) != 0$, then for almost all $u in CC^1$
  we have
  $
    mu_0 (R(attach(f, tl: '), z_i + u z_n))
    & = sum_(nu: epsilon_(i nu) >= 1) mu_nu
    + sum_(nu: epsilon_(i nu) < 1) mu_nu epsilon_(i nu) \
    & = mu = mu_1 + dots.c + mu_p,
  $
  which implies that $epsilon_(i nu) >= 1$, $i = 1, ..., n - 1$,
  $nu = 1, ..., p$. But
  $mu_0 (R(attach(f, tl: '), z_i)) = sum_(nu = 1)^p mu_nu epsilon_(i nu) = mu$,
  $i = 1, ..., n - 1$; consequently, all the $epsilon_(i nu)$ are equal to 1,
  and @eq:branches-linear is proved.

  We write @eq:branches-linear in the vector form
  $z^((nu)) (z_n) = a^((nu)) z_n + o(z_n^(1 + lambda))$, where
  $a^((nu)) = (a_1^((nu)), ..., a_(n - 1)^((nu)), 1)$; then
  $
    f_j (z^((nu)) (z_n)) = z_n^(k_j) P_j (a^((nu))) + o(z_n^(k_j)) equiv 0,
  $
  and so
  $
    P_j (a^((nu)) z_n) equiv 0, quad j = 1, ..., n - 1, nu = 1, ..., p.
  $ <eq:principal-part-on-lines>
  #new-par
  We show that if the complex dimension at 0 of the set
  $K_1 = {z: P_j (z) = 0, j = 1, ..., n - 1}$ is equal to 1, then $K_1$ is the
  union of the analytic lines
  $
    A = union.big_(nu = 1)^p {z = a^((nu)) t, t in CC^1}.
  $
  Let
  $
    f_j (z) = P_j (z) + sum_(i = 1)^infinity P_(j i) (z),
    quad j = 1, ..., n - 1,
  $
  #source(197)
  be the expansion of $f_j$ in a series of homogeneous polynomials, with
  $deg P_(j i) = k_j + i$. Consider the system
  $
    F_j (attach(z, tl: '), t, tau) = P_j (attach(z, tl: '), t)
    + sum_(i = 1)^infinity tau^i P_(j i) (attach(z, tl: '), t)
    = tau^(-k_j) f_j (tau(attach(z, tl: '), t)),
  $ <eq:homotopy-system>
  $j = 1, ..., n - 1$, which depends on the parameters $t in CC^1$,
  $tau in [0, 1]$. It is clear that
  $F_j (attach(z, tl: '), t, 1) = f_j (attach(z, tl: '), t)$ and
  $F_j (attach(z, tl: '), t, 0) = P_j (attach(z, tl: '), t)$. Further,
  @eq:homotopy-system has $p$ isolated zeros $attach(z, tl: ')^((nu)) (t, tau)$
  for fixed $t$ and $tau$, and they satisfy the condition
  $tau attach(z, tl: ')^((nu)) (t, tau)
  = attach(a, tl: ')^((nu)) t tau + O((t, tau)^(1 + lambda))$, from which we get
  $attach(z, tl: ')^((nu)) (t, tau)
  = attach(a, tl: ')^((nu)) t + o(t^(1 + lambda) tau^lambda)$, $nu = 1, ..., p$.
  Therefore, for $|t|$ sufficiently small and for any $tau in [0, 1]$ the zero
  $attach(z, tl: ')^((nu)) (t, tau)$ of @eq:homotopy-system lies in the ball
  $B_nu (t) = {attach(z, tl: '):
    |attach(z, tl: ') - attach(a, tl: ')^((nu)) t| < |t|^(1 + delta)}$, where
  $0 < delta < lambda$. We have thus constructed a homotopy
  $attach(F, tl: ') (attach(z, tl: '), t, tau)$ between the systems
  $attach(P, tl: ') (attach(z, tl: '), t)$ and
  $attach(f, tl: ') (attach(z, tl: '), t)$ that does not have zeros on the
  spheres $partial B_nu (t)$ for small $|t|$. Therefore, these systems have the
  same number (counting multiplicity) of zeros in
  $B(t) = union.big_1^p B_nu (t)$. The system
  $attach(f, tl: ') (attach(z, tl: '), t)$ has $mu = mu_1 + dots.c + mu_p$ zeros
  in $B(t)$, counting multiplicity. But we are under the conditions of the local
  description theorem; therefore, the system
  $attach(f, tl: ') (attach(z, tl: '), t)$ does not have zeros on the boundary
  of the polycylinder $attach(U, tl: ')_epsilon
  = {attach(z, tl: '): |z_j| < epsilon_j, j = 1, ..., n - 1}$ for any fixed $t$
  with $|t| <= epsilon_n$. Consequently,
  $mu_0 (attach(f, tl: ') (attach(z, tl: '), 0)) = mu$. It can be assumed that
  ${attach(z, tl: ') in CC^(n - 1): P_j (attach(z, tl: '), 0) = 0,
    j = 1, ..., n - 1} = {0}$. If we now use induction on the number of
  variables (i.e., assume the validity of the theorem for $n - 1$ variables),
  then we can conclude that
  $mu_0 (attach(f, tl: ') (attach(z, tl: '), 0)) = k_1 dots.c k_(n - 1)$. Hence,
  the system $attach(P, tl: ') (attach(z, tl: '), t)$ has $k_1 dots.c k_(n - 1)$
  zeros (counting multiplicity) in $B(t)$ for sufficiently small $|t|$. By
  Bézout's theorem, all the zeros of $attach(P, tl: ') (attach(z, tl: '), t)$
  lie in $B(t)$. Since the radii of the balls $B_nu (t)$ tend to zero as
  $t -> 0$ more rapidly than the distance between points lying in the hyperplane
  ${z: z_n = t}$ and on distinct analytic lines in $K_1$, it follows that
  $K_1 subset A$. The reverse inclusion $A subset K_1$ follows from
  @eq:principal-part-on-lines.

  Let $E_1 = {z: P_j (z) = 0, j = 1, ..., n}$. If $E_1 = {0}$, i.e., the system
  @eq:homogeneous-principal-part has $z = 0$ as an isolated zero, then $K_1$ is
  one-dimensional and equal to $A$. Consequently,
  $P_n (a^((nu)) z_n) equiv.not 0$, $nu = 1, ..., p$. Since all the branches
  $z^((nu)) (z_n)$ of the curve $K$ have the form @eq:branches-linear, it
  follows that
  $
    f_n (z^((nu)) (z_n)) = z_n^(k_n) P_n (a^((nu))) + o(z_n^(k_n)),
    quad P_n (a^((nu))) != 0.
  $
  By what has been proved, $sum_(nu = 1)^p mu_nu = k_1 dots.c k_(n - 1)$, and so
  the multiplicity of the zero $z_n = 0$ of the resultant
  $R(attach(f, tl: '), f_n)
  = product_(nu = 1)^p f_n^(mu_nu) (z^((nu)) (z_n))$ is equal to
  $k_1 dots.c k_n$. Theorem~@th:multiplicity-resultant gives us the sufficiency.

  We prove the necessity by induction on the number of variables. Suppose that
  @eq:homogeneous-principal-part has a nonisolated zero; then $dim_0 K_1 >= 1$.
  If $dim_0 K_1 = 1$, then #source(198) $K_1 = A$. Since $E_1 != {0}$, there
  exists a $nu_0$ ($1 <= nu_0 <= p$) such that $P_n (a^((nu_0))) = 0$, from
  which we obtain $f_n (z^((nu_0)) (z_n)) = o(z_n^(k_n))$. Therefore,
  $
    mu_0 (R(attach(f, tl: '), f_n)) = mu_0 (f) > k_1 dots.c k_n.
  $
  If $dim_0 K_1 > 1$, then
  $dim_0 {z: P_j (attach(z, tl: '), 0) = 0, j = 1, ..., n - 1} >= 1$. By the
  induction hypothesis,
  $mu_0 (attach(f, tl: ') (attach(z, tl: '), 0)) > k_1 dots.c k_(n - 1)$. On the
  other hand, $mu_0 (attach(f, tl: ') (attach(z, tl: '), 0))$ is equal to the
  number of zeros (counting multiplicity) of the system
  $attach(f, tl: ') (attach(z, tl: '), z_n)$ in the polycylinder
  $attach(U, tl: ')_epsilon$, i.e., to the number $sum_1^p mu_nu$; therefore,
  $mu_0 (R(attach(f, tl: '), f_n)) = mu_0 (f) > k_1 dots.c k_n$.
]

#remark[
  The sufficiency of the condition in Theorem~@th:tsikh-yuzhakov is easy to
  prove by means of Rouché's principle and Bézout's theorem.
]

Theorem~@th:tsikh-yuzhakov is easily generalized to the case which uses the
concept of weighted homogeneity instead of ordinary homogeneity. Let
$a_1, ..., a_n$ be positive rational numbers. We recall that a polynomial $g(z)$
is said to be #index-mark(
  "Polynomial",
  sub: "weighted homogeneous",
)_weighted-homogeneous with respect to the weight_ $(1 \/ a_1, ..., 1 \/ a_n)$
if all its monomials $z_1^(i_1) dots.c z_n^(i_n)$ have the same weighted degree
$d = i_1 \/ a_1 + dots.c + i_n \/ a_n$ with respect to this weight.

#theorem[
  Suppose that $f_j (z) = P_j (z) + theta_j (z)$, where $P_j (z)$ is a
  weighted-homogeneous polynomial of degree $d_j$ with respect to the weight
  $(1 \/ a_1, ..., 1 \/ a_n)$, and $theta_j (z)$ is a series of monomials having
  weighted degree greater than $d_j$ with respect to the same weight,
  $j = 1, ..., n$. Then
  $
    mu_0 (f) = mu_0 (f_1, ..., f_n) >= a_1 d_1 dots.c a_n d_n,
  $
  and equality holds if and only if $z = 0$ is an isolated zero of the system
  $(P_1, ..., P_n)$.
] <th:weighted-principal-part>

#proof(title: none)[
  Theorem~@th:weighted-principal-part can be obtained from
  Theorem~@th:tsikh-yuzhakov by the change of variables $z_j = zeta_j^(s_j)$,
  $j = 1, ..., n$, where $s_j = q product_(k != j) a_k$, and $q$ is chosen so
  that all the $s_j$ ($j = 1, ..., n$) are integers. Then $f_j (z)$ becomes
  $tilde(f)_j (zeta) = tilde(P)_j (zeta) + tilde(theta)_j (zeta)$, where
  $tilde(P)_j (zeta)$ is a homogeneous polynomial of degree
  $d_j q a_1 dots.c a_n$. Therefore,
  $mu_0 (tilde(f)) = q^n d_1 dots.c d_n a_1^n dots.c a_n^n$ if and only if
  $zeta = 0$ is an isolated zero of the system $(tilde(P)_1, ..., tilde(P)_n)$.
  But the property of being an isolated zero does not change under the indicated
  change of variables, and, moreover, by
  Proposition~@prop:multiplicity-properties,
  $
    mu_0 (f) = (mu_0 (tilde(f))) / (mu_0 (z(zeta)))
    = (q^n (product_(j = 1)^n d_j) (product_(j = 1)^n a_j)^n)
    / (q^n (product_(j = 1)^n a_j)^(n - 1))
    = a_1 d_1 dot.c dots.c dot.c a_n d_n.
  $
]

#point <pt:newton-polygons> *Computation of the multiplicity of a zero from
Newton polygons.* In analogy with homogeneous principal parts we describe a
larger class of systems of polynomials that play the role of principal parts.
Let $NN$ and $RR_+$ denote the sets of nonnegative integers and nonnegative real
numbers, respectively. For a #source(199) function
$g = sum_alpha c_alpha z^alpha$ and a compact subset $M subset RR_+^n$ we let
$supp g = {alpha in NN^n, c_alpha != 0}$ and
$g_M = sum_(alpha in M inter NN^n) c_alpha z^alpha$.

The system @eq:holomorphic-system is said to be _nondegenerate on $M$_ if the
polynomials $f_(1 M), ..., f_(n M)$ do not vanish on the set $(CC without 0)^n$.
For any polyhedron $Delta subset RR_+^n$ the $n$-dimensional volume of $Delta$
is denoted by $v(Delta)$.

The #index-mark("Polyhedron", sub: "Newton")_Newton polyhedron
$Gamma_+ (f_1, ..., f_n)$ of the system_ @eq:holomorphic-system _at zero_ is
defined to be the convex hull in $RR_+^n$ of the set
$
  (union (alpha + RR_+^n): alpha in (supp f_1 union dots.c union supp f_n)
    without {0}).
$
#new-par
The #index-mark("Polygon", sub: "Newton")_Newton polygon $Gamma(f_1, ..., f_n)$
of the system_ @eq:holomorphic-system _at zero_ is defined to be the union of
the closed compact faces of the polyhedron $Gamma_+ (f_1, ..., f_n)$. We let
$Gamma_- (f_1, ..., f_n)$ be the union of all the segments with initial point at
0 and final point on $Gamma(f_1, ..., f_n)$, and we call the number
$n! v(Gamma_- (f_1, ..., f_n))$ #index-mark(
  "Number",
  sub: "Newton, of a system of holomorphic functions at a point",
)_the Newton number of the system_ @eq:holomorphic-system _at zero_. For brevity
we denote $Gamma(f_1, ..., f_n)$ by $Gamma$ and call the polynomials
$f_(1 Gamma), ..., f_(n Gamma)$ #index-mark(
  "Part",
  sub: "principal homogeneous, of a system of holomorphic functions at a point",
)_the principal parts of the system_ @eq:holomorphic-system _at zero_. We say
that the system @eq:holomorphic-system is #index-mark(
  "System",
  sub: "nondegenerate",
)_nondegenerate at zero_ if for any face $sigma$ of the Newton polygon the
system is nondegenerate on the set $sigma$ (this is a condition on the principal
parts of the system at zero).

It is assumed that the system @eq:holomorphic-system is #index-mark(
  "System",
  sub: "convenient",
)_suitable_, i.e., such that for any $i$ from 1 to $n$ at least one of the
functions $f_1, ..., f_n$ contains a monomial of the form $z_i^(k_i)$
($k_i >= 1$) with nonzero coefficient.

#theorem(title: [Kushnirenko])[
  1\. The multiplicity of the isolated zero $z = 0$ of the system
  @eq:holomorphic-system is not less than the Newton number of the system at
  zero, and if the system is nondegenerate at zero, then they are equal.

  2\. The set of principal parts of all the systems that are nondegenerate at
  zero and have a given Newton polygon is an open dense subset of the manifold
  of all principal parts corresponding to the given Newton polygon.
] <th:kushnirenko>

#proof(qed: false)[
  1\. It suffices to prove the assertion when the supports coincide:
  $supp f_1 = dots.c = supp f_n$. Indeed, for small $tau_j != 0$
  ($j = 1, ..., n$) the systems @eq:holomorphic-system and
  $F_i = f_i + sum_(j != i) tau_j f_j$, $i = 1, ..., n$, have the zero $z = 0$
  with the same multiplicity, are degenerate at the same time on faces on the
  Newton polygon $Gamma = Gamma(f_1, ..., f_n)$, and, moreover, have
  $supp F_1 = dots.c = supp F_n$. For simplicity let $n = 2$. Let
  $sigma subset Gamma$ be a one-dimensional face, which is determined by its
  endpoints $(alpha_1, alpha_2), (beta_1, beta_2) in NN^2$ (assume that
  $beta_1 > alpha_1$). To the face $sigma$ there correspond $beta_1 - alpha_1$
  (counting multiplicity) local solutions of $f_1 (z_1, z_2) = 0$, and they have
  the form
  $
    z_1^nu (z_2) = a^nu z_2^lambda + o(z_2^lambda),
    quad nu = 1, ..., beta_1 - alpha_1,
  $
  where $lambda = (alpha_2 - beta_2) \/ (beta_1 - alpha_1)$, $a^((nu)) != 0$,
  and satisfy the condition (see @bib:Chebotarev1948)
  $
    f_(1 sigma) (a^nu z_2^lambda, z_2) equiv 0,
    quad nu = 1, ..., beta_1 - alpha_1.
  $
  #source(200)
  The product
  $
    phi_sigma (z_2) & = product_(nu = 1)^(beta_1 - alpha_1)
    f_2 (z_1^nu (z_2), z_2) \
    & = product_(nu = 1)^(beta_1 - alpha_1)
    [f_(2 sigma) (a^nu z_2^lambda, z_2) + o(z_2^(lambda alpha_1 + alpha_2))]
  $
  in the resultant $R(f_1, f_2)$ corresponds to the face $sigma$. If the system
  $(f_1, f_2)$ is nondegenerate on $sigma$, then
  $f_(2 sigma) (a^((nu)) z_2^lambda, z_2) equiv.not 0$,
  $nu = 1, ..., beta_1 - alpha_1$; therefore, the smallest degree in the
  expansion of $phi_sigma (z_2)$ in fractional powers of the variable $z_2$ is
  equal to $(beta_1 - alpha_1)(lambda alpha_1 + alpha_2)$, and it is greater
  than this number if $(f_1, f_2)$ is degenerate on $sigma$. It is not hard to
  see that $(beta_1 - alpha_1)(lambda alpha_1 + alpha_2)$ is double the area of
  the triangle with vertex at 0 and base $sigma$. Taking into account the fact
  that $R(f_1, f_2) = product_(sigma subset Gamma) phi_sigma (z_2)$, we get what
  is required.

  2\. Let $sigma$ be a face of the Newton polygon $Gamma$, and $f_1, ..., f_n$
  polynomials with variable coefficients and with $supp f_i subset Gamma$.
  Obviously, $f_(1 sigma), ..., f_(n sigma)$ are weighted-homogeneous
  polynomials with respect to a common weight; therefore, the change of
  variables $z_j = zeta_j^(s_j)$, $j = 1, ..., n$ (see the proof of
  Theorem~@th:weighted-principal-part), takes the system
  $f_sigma = (f_(1 sigma), ..., f_(n sigma))$ to a system
  $tilde(f)(zeta) = (tilde(f)_1 (zeta), ..., tilde(f)_n (zeta))$ of homogeneous
  polynomials. But for any $i$ from 1 to $n$ the system
  $
    tilde(f)_j (zeta_1 / zeta_i, ..., 1, ..., zeta_n / zeta_i),
    quad j = 1, ..., n,
  $
  of polynomials in the $n - 1$ variables
  $zeta_1 \/ zeta_i, ..., [i] dots.c zeta_n \/ zeta_i$ does not have zeros in
  $CC^(n - 1)$ for almost all coefficients. Therefore, the systems
  $tilde(f)(zeta)$ and $f_sigma (z)$ almost always do not have zeros in
  $(CC without 0)^n$.
]

#remark[
  We have actually proved that in the two-dimensional case the nondegeneracy
  condition for @eq:holomorphic-system on each face of the Newton polygon
  $Gamma(f)$ is also necessary for $mu_0 (f)$ to equal the Newton number.
]

In Theorem~@th:kushnirenko the Newton polygon $Gamma(f)$ was constructed for the
whole system $f$, namely, for the union of the supports $supp f_i$,
$i = 1, ..., n$. However, the Newton polygon can be constructed for each support
separately. Then the polynomials $f_(1 Gamma_1), ..., f_(n Gamma_n)$, where
$Gamma_i = Gamma(f_i)$ is the Newton polygon constructed for $supp f_i$, enter
the roles of the principal parts for $f$. This approach to the computation of
the multiplicity of a zero can be reduced to the case where the supports
coincide, $supp f_1 = dots.c = supp f_n$, i.e., to Theorem~@th:kushnirenko.

#proposition[
  Let $S = (S_1, ..., S_n)$ be an $n$-tuple of finite subsets of
  $NN^n without {0}$ such that there exists a system of polynomials $g$ with
  $supp g_i subset S_i$ that has an isolated zero at $z = 0$. Then the
  multiplicity $mu_0 (f)$ is one and the same and is minimal among all possible
  multiplicities for all systems $f$ with $supp f_i subset S_i$ except for an
  analytic set in the coefficient space.
] <prop:generic-multiplicity>

#source(201)
#proof[
  Let $c$ be the variable in the space of coefficients $CC^m$ ($m$ is equal to
  the sum of the cardinalities of the sets $S_i$, $i = 1, ..., n$), and let
  $f_i (z, c) = sum_(alpha in S_i) c_(i alpha) z^alpha$, $i = 1, ..., n$, be a
  system with variable coefficients. Rouché's principle implies that the set $M$
  of $c$ with $mu_0 (f(z, c))$ minimal is open in $CC^m$. Therefore, there
  exists a neighborhood $U$ of the point $(0, c^((0))) in CC^n times M$ such
  that for the analytic set
  $E_f = {(z, c) in CC^n times CC^m: f_i (z, c) = 0, i = 1, ..., n}$ we have
  $U inter E_f = {(z, c) in U: z = 0}$. If $tilde(c)$ is a boundary point of
  $M$, then $V inter E_f without {(z, c): z = 0} != emptyset$ for any
  neighborhood $V$ of $(0, tilde(c))$. Indeed, otherwise there would exist balls
  $B_1 (0) in CC^n$ and $B_2 (tilde(c)) in CC^m$ about the respective points 0
  and $tilde(c)$ such that for any $c in B_2 (tilde(c))$ the system $f(z, c)$
  has in $B_1 (0)$ the unique zero $z = 0$, i.e., $tilde(c) in M$. Further, the
  germ of the analytic set $Pi = {(z, c): z = 0}$ at $(0, tilde(c))$ does not
  belong to any other irreducible component of the germ of the analytic set
  $E_f$. Therefore, there exist functions $phi_1, ..., phi_s$ holomorphic in the
  neighborhood $V(0, tilde(c))$ such that
  $E_f = Pi union {(z, c) in V(0, tilde(c)):
    phi_1 (z, c) = dots.c = phi_s (z, c) = 0}$.

  Thus, the set of points $(0, c) in Pi$ in any neighborhood of which
  $E_f without Pi != emptyset$ satisfies the system of equations
  $psi_j (c) = phi_j (0, c) = 0$, $j = 1, ..., s$, in a neighborhood of
  $(0, tilde(c))$. Consequently, $CC^m without M$ is an analytic set.
]

For the tuple $S = (S_1, ..., S_n)$ we let $mu(S)$ stand for the minimal
multiplicity of zero among all multiplicities $mu_0 (f)$ of systems $f$ such
that $supp f_i subset S_i$. The Rouché principle implies that for any $S$ there
exists a finite subtuple $S' = (S'_1, ..., S'_n)$, $S'_i subset S_i$ with the
property that $mu(S') = mu(S)$. Therefore, for the computation of $mu(S)$ it
will be assumed that the $S_i$ are finite.

We introduce an addition operation on subsets of $NN^n$ by setting
$S_1 + S_2 = {q_1 + q_2: q_1 in S_1, q_2 in S_2}$. It is clear that to
multiplication of the functions $g_1 g_2$ there corresponds addition of their
supports: $supp g_1 + supp g_2$. Hence, by
Proposition~@prop:multiplicity-properties,
$
  mu(S_1 + S'_1, S_2, ..., S_n) = mu(S_1, ..., S_n) + mu(S'_1, S_2, ..., S_n).
$ <eq:multiplicity-additive>
Moreover, $mu(S)$ is symmetric with respect to its arguments, and is thus
multilinear by @eq:multiplicity-additive. Consequently, $mu(S)$ can be recovered
from its values on the diagonal as follows:
$
  mu(S) = (-1)^n / (n!) sum_(k = 1)^n (-1)^k
  sum_(1 <= i_1 < dots.c < i_k <= n)
  mu(S_(i_1) + dots.c + S_(i_k), ..., S_(i_1) + dots.c + S_(i_k)).
$
For a set $S subset NN^n without {0}$ we use the following notation:
$Gamma_+ (S)$ is the convex hull of the set ${alpha + RR_+^n: alpha in S}$,
$Gamma(S)$ is the union of the closed compact faces of the polyhedron
$Gamma_+ (S)$, and $Gamma_- (S)$ is the union of all segments with initial point
at 0 and final point on $Gamma(S)$. In what follows we assume that for each $i$
from 1 to $n$ the set $S_i$ in the $n$-tuple $S = (S_1, ..., S_n)$ contains
points of the #source(202) form $alpha = (0, ..., alpha_j, ..., 0)$,
$j = 1, ..., n$. Then, by Theorem~@th:kushnirenko,
$
  mu(S_(i_1) + dots.c + S_(i_k), ..., S_(i_1) + dots.c + S_(i_k))
  = n! v(Gamma_- (S_(i_1) + dots.c + S_(i_k))),
$
$k = 1, ..., n$, and
$
  mu(S) = (-1)^n sum_(k = 1)^n (-1)^k sum_(1 <= i_1 < dots.c < i_k <= n)
  v(Gamma_- (S_(i_1) + dots.c + S_(i_k))).
$ <eq:multiplicity-volumes>
#new-par
We describe nondegeneracy conditions on a system $f$ with $supp f_i subset S_i$
that ensure the equality $mu_0 (f) = mu(S)$. Suppose that $S subset NN^n$ and
$l = (l_1, ..., l_n)$, the $l_j > 0$ being rational numbers. We set
$
  m(l, S)
  = min{chevron.l l, alpha chevron.r = l_1 alpha_1 + dots.c + l_n alpha_n,
    alpha in S}
$
and let $S_l = {alpha in S: chevron.l l, alpha chevron.r = m(l, S)}$ (the
intersection of $S$ with the supporting plane in the direction $l$). For a
function $g = sum_alpha c_alpha z^alpha$ such that $supp g subset S$ let
$g_l = sum_(alpha in S_l) c_alpha z^alpha$. If $f = (f_1, ..., f_n)$ is a system
such that $supp f_j subset S_j$, $j = 1, ..., n$, then let
$f_l = (f_(1 l), ..., f_(n l))$.

#theorem[
  Suppose that $f = (f_1, ..., f_n)$ is a system such that
  $supp f_i subset S_i$, $i = 1, ..., n$. If for any positive rational vector
  $l$ the system of $f_l$ does not have zeros in $(CC without 0)^n$, then
  $mu_0 (f) = mu(S)$, where $mu(S)$ can be computed by @eq:multiplicity-volumes.
] <th:nondegenerate-multiplicity>

It is important to note that the condition of the theorem has to be checked only
for finitely many vectors $l$ giving distinct tuples $S_(i l)$, $i = 1, ..., n$.
Namely: it suffices to take those $l$ for which the intersections of the
polygons $Gamma(S_i)$ ($i = 1, ..., n$) with the supporting planes in the
direction $l$ consist of more than one point, i.e., are faces and not vertices.

#proof[
  Consider the system $f + t g = (f_1 + t g_1, ..., f_n + t g_n)$, where $g$ is
  a system such that $supp g_i subset S_i$ and $mu_0 (g) = mu(S)$. Suppose that
  $mu_0 (f) > mu(S) = mu_0 (g)$. Then for the curve
  $K = {(z, t) in CC^(n + 1), f_j + t g_j = 0, j = 1, ..., n}$ there exists an
  analytic element $z(t) equiv.not 0$ such that $z(0) = 0$. By
  Proposition~@prop:generic-multiplicity, $g$ can be chosen so that
  $z(t) = a t^l + o(t^l)$, where $a = (a_1, ..., a_n) in (CC without 0)^n$.
  Since $z(0) = 0$, it follows that $l_j > 0$; therefore, the conditions
  $f_j (z(t)) + t g_j (z(t)) = t^q f_(j l) (a) + o(t^q) equiv 0$,
  $j = 1, ..., n$, imply that $f_(j l) (a) = 0$, $j = 1, ..., n$. This is a
  contradiction.
]
