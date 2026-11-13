#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[Application of the multidimensional logarithmic residue to
  systems of nonlinear equations] <sec:nonlinear-systems>

#source(171)
#point <pt:power-sums> Let $D$ be a bounded domain in $CC^n$ with piecewise
smooth boundary $partial D$. We consider a system of equations
$
  cases(f_1 (z_1, ..., z_n) = 0, dots.v, f_n (z_1, ..., z_n) = 0\,)
$ <eq:nonlinear-system>
where the functions $f_i in A(overline(D))$ do not have any common zeros on
$partial D$. In this case (see @sec:rouche-principle) the system
@eq:nonlinear-system has at most finitely many roots (common zeros) in $D$.
Denote the number of these roots by $N$. The formulas in
@sec:leray-koppelman[§§3] and @sec:cauchy-formula[4] enable us to compute sums
of the form
$
  sum_(l = 1)^N phi(z^((l)))
$ <eq:root-sum>
with the help of the integral over the boundary $partial D$ or over the
skeleton, where $phi$ is any function in $A_C (D)$, and the $z^((l))$
($l = 1, ..., N$) are the roots lying in $D$, with each term $phi(z^((l)))$
taken as many times as the multiplicity#footnote[In sums of the form
  @eq:root-sum each root is counted according to its multiplicity everywhere in
  this section.] of the root $z^((l))$.

If we set $phi = 1$, then the corresponding integrals will be equal to the
number of roots (counting multiplicity) in $D$, i.e., to $N$. This is written
briefly as follows:
$
  phi = 1 => integral dots.c = N.
$ <eq:number-of-roots>
Further,
$
    phi = z_1 & => integral dots.c = sum_(l = 1)^N z_1^((l)), \
  phi = z_1^2 & => integral dots.c = sum_(l = 1)^N (z_1^((l)))^2, \
              & dots.c dots.c dots.c dots.c dots.c dots.c dots.c \
  phi = z_1^N & => integral dots.c = sum_(l = 1)^N (z_1^((l)))^N.
$ <eq:power-sum-integrals>
#source(172)
In these formulas we have for definiteness written the power sums of the first
coordinates of the roots. The power sums of the other coordinates are written
similarly. Thus, computation of the integrals @eq:number-of-roots and
@eq:power-sum-integrals enables us to replace the system @eq:nonlinear-system
(which is in general transcendental) by an algebraic system of the simple form
(we again write the system only for the unknown first coordinates of the roots):
$
  sum_(l = 1)^N (z_1^((l)))^j = S_j, quad j = 1, ..., N.
$
It is possible to proceed in various ways from here. We discuss some variants.

#smallcaps[Method] I. The elementary symmetric polynomials which are (to within
a sign) the coefficients of a polynomial
$Omega(z_1) = z_1^N + b_1 z_1^(N - 1) + dots.c + b_(N - 1) z_1 + b_N$, having
the roots $z_1^((1)), ..., z_1^((N))$ are expressed in terms of the power sums
$S_j$. To find the coefficients $b_j$ it is possible to use either the familiar
Waring formula (see, for example, @bib:Mishina1962, Chapter~III, §5.3) or the
#index-mark("Formula", sub: "Newton recursion")_Newton recursion formula_
$
  j b_j = -S_j - S_(j - 1) b_1 - dots.c - S_1 b_(j - 1), quad j = 1, ..., N.
$ <eq:newton-recursion>
Thus, in finding the polynomial $Omega(z_1)$ we eliminate all the unknowns
except one, with no superfluous roots added and no roots missing. The problem is
reduced to the thoroughly studied problem of finding the roots of a polynomial
in a single complex variable. The main difficulty in this approach is the
necessity of computing the multidimensional integrals in @eq:power-sum-integrals
with sufficient accuracy.

#smallcaps[Method] II. The integral @eq:number-of-roots is computed, then the
domain $D$ is divided into two domains, $D = D_1 union D_2$, and the integral
@eq:number-of-roots is sought. For $D_1$ we get the number $N_1$ of roots in
$D_1$ (and, consequently, the number $N_2 = N - N_1$ in $D_2$); then we divide
each of these domains into two parts, and so on, until a domain is divided into
subdomains each containing one or two roots of the system. For such subdomains
we find the first (or the first two) of the integrals in @eq:power-sum-integrals
and get at once the root (or a quadratic equation for two roots).

This method is especially convenient for the case where $D$ is a rectangular
parallelepiped and the integrals in @eq:number-of-roots are taken over the whole
of $partial D$. The integral of interest to us splits into a finite number of
integrals over faces: ordinary $(2n - 1)$-dimensional integrals. In computing
them we can calculate beforehand the integrals over parts of the faces, and then
it will be easier later to perform the calculations for smaller parallelepipeds.
If during the division of the parallelepiped into parts one of the corresponding
"partition walls" by chance hits a root of the system, then the integral becomes
improper. This can #source(173) be taken into account in making up a computer
program. (If the integral @eq:number-of-roots for a subdomain is computed to be
larger than $N$, then the "partition wall" should be moved slightly.)

If the number of roots does not decrease during the implementation of a fairly
large number of divisions of the domain, this indicates the existence of a
multiple root (or of several close simple roots).

A disadvantage of this method is that it is not known beforehand how any
divisions of the domain must be performed; on the other hand, the integral
@eq:number-of-roots, computed for each division, is an integer and,
consequently, need be computed only to within $1/3$.

#smallcaps[Method] III. It can be applied when all the roots (or their first
coordinates) are real and it is necessary to find a root with the largest first
coordinate. By a change of variables (a translation) we can make the first
coordinates of all the roots positive. It is then necessary to use an elementary
inequality: if $a_1, ..., a_N$ are positive, then
$
  1 < root(k, scripts(sum)_(i = 1)^N a_i^k) \/ a_max <= root(k, N),
$
hence, there is a $k$ such that
$
  root(k, scripts(sum)_(i = 1)^N a_i^k)
$
is sufficiently close to $a_max$. Therefore, to find the largest of the first
coordinates of the roots with the necessary accuracy it suffices to compute one
of the integrals of the form in @eq:power-sum-integrals with $phi = z_1^k$.

In conclusion we note that the integrals in @sec:leray-koppelman contain a large
amount of arbitrariness (the choice of the vector-valued function $w$ or of a
set of vector-valued functions) for $n > 1$ which is not present in the
one-dimensional case. This arbitrariness can be used as follows: for the system
@eq:nonlinear-system we should choose a suitable formula for the logarithmic
residue so that the corresponding integrals can be computed exactly (see the
next subsection) or approximately.

#point <pt:algebraic-systems> Consider the _system of algebraic equations_
$
  Q_j (z) + P_j (z) = 0, quad j = 1, ..., n,
$ <eq:algebraic-system>
where the $Q_j (z)$ are the homogeneous polynomials of highest degree in the
variables jointly and have only one common zero: the origin. The degrees of
$Q_j$ are denoted by $k_j$, so that the degree of $P_j$ is less than $k_j$,
$j = 1, ..., n$. By #source(174) Theorem~@th:rouche-principle (Rouché), the
system @eq:algebraic-system has finitely many roots. Let $m_1, ..., m_n$ be
positive integers such that the equation
$
  sum_(j = 1)^n w_j Q_j (z) = sum_(j = 1)^n |z_j|^(2m_j)
$ <eq:w-equation>
has a solution of the form
$
  w_j = sum_(k = 1)^n a_(j k) (z) overline(z)_k^(m_k), quad j = 1, ..., n,
$ <eq:w-solution>
where the $a_(j k)$ are polynomials in $z$. The indicated condition is certainly
satisfied by $m_j = |k| + 1 - n$, $j = 1, ..., n$, $|k| = k_1 + dots.c + k_n$
(see the theorem of Macaulay @bib:Macaulay1916), but sometimes the $m_i$ can be
chosen to be smaller. A solution @eq:w-solution (which, generally speaking, is
not unique) of @eq:w-equation can be found by the method of undetermined
coefficients, i.e., the $a_(j k) (z)$ are determined after solving the
corresponding system of linear equations. The vector-valued function $w$ found
can now be used in formula @eq:cauchy-fantappie-mapping for $D = B_r^((m)) (0)$,
and this permits us to prove the next assertion.

#theorem(title: [Aĭzenberg])[
  If $R(z)$ is a polynomial of degree $mu$, then
  $
    sum_l R(z^((l))) = frak(M) [R Delta_1 Delta_2 sum_(j = 0)^mu (-1)^j / j!
      chevron.l w, P chevron.r^j],
  $ <eq:aizenberg-power-sum-formula>
  where $Delta_1$ is the Jacobian of the system @eq:algebraic-system,
  $Delta_2 = det norm(a_(j k))$, the summation on the left-hand side of
  @eq:aizenberg-power-sum-formula is over all roots of the system
  @eq:algebraic-system, and $frak(M)$#notation-mark(
    $frak(M)$,
    sort: "zz frak m",
  ) is the linear functional on the polynomials in $z_1, ..., z_n$,
  $overline(z)_1^(m_1), ..., overline(z)_n^(m_n)$ that is given by
  $
    frak(M) [z^beta overline(z)_1^(m_1 alpha_1) dots.c
      overline(z)_n^(m_n alpha_n)]
    = cases(
      alpha!\, quad & "if" beta_j = m_j alpha_j + m_j - 1\, j = 1\, ...\, n\,,
      0\, & "otherwise".
    )
  $
] <th:aizenberg-power-sums>

#proof[
  By @eq:cauchy-fantappie-mapping, for sufficiently large $r$
  $
    sum_l R(z^((l))) = (n - 1)! / (2 pi i)^n integral_(partial B_r^((m)))
    (R sum_(k = 1)^n (-1)^(k - 1) w_k d w_([k]) and d(Q + P))
    / (chevron.l Q + P, w chevron.r^n) .
  $ <eq:root-sum-integral>
  It is not hard to establish that
  $
    sum_(k = 1)^n (-1)^(k - 1) w_k d w_([k]) and d(Q + P)
    = Delta_1 Delta_2 sum_(k = 1)^n (-1)^(k - 1) overline(z)_k^(m_k)
    d overline(z)_([k])^((m)) and d z
  $
  #source(175)
  and, for large $r$, $r^2 > |chevron.l w, P chevron.r|$ on
  $partial B_r^((m)) (0)$; therefore, the integral in @eq:root-sum-integral is
  equal to
  $
      & (n - 1)! / (2 pi i)^n integral_(partial B_r^((m)))
        (R Delta_1 Delta_2 sum_(k = 1)^n (-1)^(k - 1) overline(z)_k^(m_k)
        d overline(z)_([k])^((m)) and d z)
        / (r^2 + chevron.l w, P chevron.r)^n \
    = & 1 / (2 pi i)^n integral_(partial B_r^((m))) R Delta_1 Delta_2
        sum_(j = 0)^infinity (-1)^j ((j + n - 1)!) / (j! r^(2(j + n)))
        chevron.l w, P chevron.r^j \
      & times sum_(k = 1)^n (-1)^(k - 1) overline(z)_k^(m_k)
        d overline(z)_([k])^((m)) and d z.
  $
  Next, we use a formula that is a certain generalization of
  @eq:andreotti-norguet-sphere and is proved similarly:
  $
    1 / (2 pi i)^n integral_(partial B_r^((m))) z^beta
    overline(z)_1^(m_1 alpha_1) dots.c overline(z)_n^(m_n alpha_n)
    sum_(j = 1)^n (-1)^(j - 1) overline(z)_j^(m_j)
    d overline(z)_([j])^((m)) and d z \
    = cases(
      r^(2(n + |alpha|)) (alpha!) / ((|alpha| + n - 1)!) quad
      & "if" beta_j = m_j (alpha_j + 1) - 1\,,
      0 & "otherwise".
    )
  $
  We get
  $
    sum_l R(z^((l))) = sum_(j = 0)^infinity frak(M) [R Delta_1 Delta_2
      (-1)^j / j! chevron.l w, P chevron.r^j].
  $ <eq:root-sum-series>
  #new-par
  It remains to show that the terms of the series on the right-hand side of
  @eq:root-sum-series are equal to zero for $j > mu$. We compute the degree of
  the polynomial in the square brackets in @eq:root-sum-series with respect to
  $z$, after representing it in the form
  $
    R Delta_1 Delta_2 (-1)^j / j! sum_(|alpha| = j) w^alpha P^alpha
    (j!) / (alpha!) .
  $
  The term corresponding to the multi-index $alpha$ has degree in $z$
  $
    mu + |m| - n + sum_(p = 1)^n m_p alpha_p - j.
  $
  According to the definition of the functional $frak(M)$, if it is nonzero,
  then
  $
    mu + |m| - n + sum_(p = 1)^n m_p alpha_p - j
    >= sum_(p = 1)^n m_p alpha_p + |m| - n,
  $
  i.e., $frak(M)$ is nonzero only when $j <= mu$.
]

#source(176)
#corollary[
  $sum_l R(z^((l))) = t \/ s^(mu + n)$, where $t$ is a polynomial in the
  coefficients of the system @eq:algebraic-system and of the polynomial $R$,
  while $s$ is a polynomial only in the coefficients of the polynomials
  $Q_1, ..., Q_n$ and does not depend on $R$.
] <cor:power-sums-rational>

Formula @eq:aizenberg-power-sum-formula has an especially simple form in the
case of the system
$
  z_j^(k_j) + P_j (z) = 0, quad j = 1, ..., n,
$ <eq:simple-system>
where the degree of $P_j$ is less than $k_j$, $j = 1, ..., n$. Here we can take
$m_i = k_i$, $i = 1, ..., n$, so that $w_i = overline(z)_i^(k_i)$, and the
determinant $Delta_2 = 1$, and we arrive at the following assertion.

#theorem(title: [Aĭzenberg])[
  For the system @eq:simple-system and a polynomial $R(z)$ of degree $mu$
  $
    sum_l R(z^((l))) = frak(N) [R Delta_1
      (z_1 dots.c z_n) / (z_1^(k_1) dots.c z_n^(k_n))
      sum_(|alpha| = 0)^mu (-1)^(|alpha|) (P_1 / z_1^(k_1))^(alpha_1) dots.c
      (P_n / z_n^(k_n))^(alpha_n)],
  $ <eq:simple-system-formula>
  where the summation on the left-hand side is over all the roots of
  @eq:simple-system, and $frak(N)$#notation-mark($frak(N)$, sort: "zz frak n")
  is the linear functional on the polynomials in $z_1, ..., z_n$ and
  $1 \/ z_1, ..., 1 \/ z_n$ that assigns to each such polynomial its free term.
] <th:aizenberg-simple-system>

#proof[
  For our case @eq:aizenberg-power-sum-formula has the form
  $
    sum_l R(z^((l))) = frak(M) [R Delta_1 sum_(|alpha| = 0)^mu (-1)^(|alpha|)
      ((overline(z)_1^(k_1) P_1)^(alpha_1) dots.c
      (overline(z)_n^(k_n) P_n)^(alpha_n))
      / (alpha!)],
  $
  and it is now obvious that the expression obtained is equal to the right-hand
  side of @eq:simple-system-formula.
]

Theorem~@th:aizenberg-simple-system (and Theorem~@th:aizenberg-tsikh) lead to a
method of elimination (see @pt:power-sums) of unknowns that seems to us simpler
than the familiar classical method of elimination using the resultants of
polynomials.

We remark that if the system @eq:simple-system has real coefficients, then after
elimination of the unknowns we get a polynomial $Omega(z_1)$ that also has real
coefficients. If we are only interested in the real roots of @eq:simple-system,
then it remains to find the real roots of $Omega(z_1)$ with sufficient accuracy,
i.e., things reduce to a thoroughly studied classical problem.

The formula @eq:simple-system-formula leads to especially simple computations
when the degree of $R(z)$ is small.

#source(177)
#eg[
  If we are interested in the number $N$ of roots of @eq:simple-system, then in
  @eq:simple-system-formula we must take $R(z) equiv 1$ and $mu = 0$. In this
  case
  $
    N = frak(N) [Delta_1 (z_1 dots.c z_n) / (z_1^(k_1) dots.c z_n^(k_n))],
  $
  and it remains to find the coefficient of the monomial
  $z_1^(k_1 - 1) dots.c z_n^(k_n - 1)$ in the Jacobian $Delta_1$. This
  coefficient is obviously equal to $k_1 dots.c k_n$, and we have obtained
  Bézout's theorem#footnote[See Theorem~@th:bezout.] for the given case:
  $N = k_1 dots.c k_n$.
] <exm:bezout>

#eg[
  In the three-dimensional space $RR^3$ we consider the three third-order
  surfaces:
  $
    cases(
      x_1^3 + sum_(i + j + k <= 2) a_(i j k) x_1^i x_2^j x_3^k = 0\,,
      x_2^3 + sum_(i + j + k <= 2) b_(i j k) x_1^i x_2^j x_3^k = 0\,,
      x_3^3 + sum_(i + j + k <= 2) c_(i j k) x_1^i x_2^j x_3^k = 0\,,
    )
  $ <eq:third-order-surfaces>
  where $i, j, k$ are nonnegative integers, and the coefficients $a_(i j k)$,
  $b_(i j k)$, $c_(i j k)$ are real numbers. We require that the surfaces
  @eq:third-order-surfaces be "in general position" in the sense that they have
  a maximal number of points of intersection in $RR^3$ (counting multiplicity),
  i.e. (see Example~@exm:bezout) 27 common points. Consider any fixed point
  $(A, B, C) in RR^3$. We pose the problem of computing the mean square distance
  from this point to the 27 common points of the surfaces
  @eq:third-order-surfaces. It suffices to find the sum of the squares of the
  distances from $(A, B, C)$ to the points of intersection of
  @eq:third-order-surfaces. By @eq:simple-system-formula this is easily done,
  because the square of the distance is a polynomial of only second order. We
  get
  $
    & sum_(l = 1)^27 [(A - x_1^((l)))^2 + (B - x_2^((l)))^2
        + (C - x_3^((l)))^2] \
    & quad = 9(a_200^2 + b_020^2 + c_002^2) - 18(a_100 + b_010 + c_001) \
    & quad + 6(a_101 c_002 + a_110 b_020 + a_200 b_110 + b_011 c_002
        + a_200 c_101 + b_020 c_011) \
    & quad + 12(a_002 c_101 + a_020 b_110 + a_110 b_200 + b_002 c_011
        + b_011 c_020 + a_101 c_200) \
    & quad + 27(A^2 + B^2 + C^2) + 18(A a_200 + B b_020 + C c_002).
  $
  It is curious that the answer does not depend on 12 of the 30 coefficients of
  the surfaces @eq:third-order-surfaces.
] <exm:third-order-surfaces>

#source(178)
In what follows we generalize Theorem~@th:aizenberg-simple-system in order to
include the case of systems of a more general form than @eq:simple-system.
Although systems of a more special form than @eq:algebraic-system will be
considered, the result will be more clear (it is not necessary, as under the
conditions of Theorem~@th:aizenberg-power-sums, to find solutions of
@eq:w-equation). We first consider a system of algebraic equations of the form
$
  f_i (z) = z_i^(k_i) + sum_(j = 1)^(i - 1) z_j phi_(i j) (z) + P_i (z), quad
  i = 1, ..., n,
$ <eq:triangular-system>
where the $phi_(i j) (z)$ are homogeneous polynomials of degree $k_i - 1$, and
the $P_i (z)$ are polynomials of degree at most $k_i - 1$. System
@eq:simple-system is obtained from @eq:triangular-system when all the
$phi_(i j)$ are identically 0. As before, let $Delta_1$ be the Jacobian of
system @eq:triangular-system, let $frak(N)$ be the functional that assigns to a
polynomial in $z_1, ..., z_n$ and $1 \/ z_1, ..., 1 \/ z_n$ its free term, and
let $z^((1)), ..., z^((N))$ be the roots of @eq:triangular-system.

#theorem(title: [Aĭzenberg and Tsikh])[
  The equality
  $
    sum_(l = 1)^N R(z^((l))) = frak(N) [(R Delta_1 z_1 dots.c z_n)
      / (z_1^(k_1) dots.c z_n^(k_n)) sum_alpha (-1)^(|alpha|)
      (s_1 / z_1^(k_1))^(alpha_1) dots.c (s_n / z_n^(k_n))^(alpha_n)]
  $ <eq:aizenberg-tsikh-formula>
  holds for any polynomial $R(z)$ of degree $m_i$ in the variable $z_i$
  ($i = 1, ..., n$) and of degree $mu$ in the variables jointly, where
  $s_i (z) = f_i (z) - z_i^(k_i)$, $i = 1, ..., n$, and the summation on the
  right-hand side of @eq:aizenberg-tsikh-formula is taken over all $n$-tuples
  $alpha$ with integer coordinates in the parallelepiped
  $M = {alpha: 0 <= alpha_1 <= mu, 0 <= alpha_2 <= k_1 (|m| + 1) - m_1 - 2,
    0 <= alpha_j <= k_1 dots.c k_(j - 1) (|m| + 1)
    - k_2 dots.c k_(j - 1) (m_1 + 1) - k_3 dots.c k_(j - 1) (m_2 + 1) - dots.c
    - k_(j - 1) (m_(j - 2) + 1) - (m_(j - 1) + 1) - 1, j = 3, 4, ..., n}$.
] <th:aizenberg-tsikh>

#proof(title: none)[
  This can be proved in the same way as Theorem~@th:aizenberg-power-sums by
  using the $(2n - 1)$-dimensional logarithmic residue (more precisely, one of
  the formulas for this residue with a suitable vector-valued function $w$). But
  in the present case it is also possible to take another path, namely, to use
  the $n$-dimensional logarithmic residue and Theorem~@th:yuzhakov. To
  demonstrate the different approaches we give a proof by the second method. Let
  $Delta_r$ be the distinguished boundary of the polydisk $U_r$, i.e.,
  $Delta_r = {z: |z_i| = r_i, i = 1, ..., n}$, $r = (r_1, ..., r_n)$, $r_i > 0$,
  $i = 1, ..., n$. We first choose $r$ so that on $Delta_r$
  $
    |z_i^(k_i)| > lr(|sum_(j = 1)^(i - 1) z_j phi_(i j) (z)|), quad
    i = 2, ..., n.
  $ <eq:polydisk-choice>
  By increasing $r_n$, we can make @eq:polydisk-choice hold for $i = n$. Or we
  can leave $r_n$ alone and decrease $r_1, ..., r_(n - 1)$. We then decrease
  $r_1, ..., r_(n - 2)$ so that @eq:polydisk-choice is valid for $i = n$ and
  $i = n - 1$, and so on. The required inequalities @eq:polydisk-choice are
  #source(179) obtained in $n - 1$ steps. It is now not difficult to establish
  the existence of an $r$ such that on $Delta_r$
  $
    |z_i^(k_i)| > |s_i (z)|, quad i = 1, ..., n;
  $ <eq:rouche-polydisk>
  it suffices to use @eq:polydisk-choice and replace $(r_1, ..., r_n)$ by
  $(R r_1, ..., R r_n)$ with sufficiently large $R$; here it is necessary to
  take into account that the degree of $P_i$ is less than $k_i$,
  $i = 1, ..., n$.

  Thus, let $r$ be such that @eq:rouche-polydisk holds. By Rouché's theorem
  (Theorem~@th:rouche-principle), all the roots of @eq:triangular-system lie in
  the polydisk $U_r$. We next apply Theorem~@th:yuzhakov:
  $
    sum_(l = 1)^N R(z^((l))) & = 1 / (2 pi i)^n integral_(Delta_r) R(z)
    (d f(z)) / (f(z))
    = 1 / (2 pi i)^n integral_(Delta_r)
    (R Delta_1 d z) / (product_(i = 1)^n (z_i^(k_i) + s_i)) \
    & = 1 / (2 pi i)^n integral_(Delta_r) (R Delta_1)
    / (z_1^(k_1) dots.c z_n^(k_n))
    sum_(alpha_1 = 0)^infinity (-1)^(alpha_1) (s_1 / z_1^(k_1))^(alpha_1)
    dots.c sum_(alpha_n = 0)^infinity (-1)^(alpha_n)
    (s_n / z_n^(k_n))^(alpha_n) d z \
    & = sum_alpha frak(N) [(R Delta_1 z_1 dots.c z_n)
      / (z_1^(k_1) dots.c z_n^(k_n)) (-1)^(|alpha|)
      (s_1 / z_1^(k_1))^(alpha_1) dots.c (s_n / z_n^(k_n))^(alpha_n)].
  $ <eq:root-sum-expansion>
  It remains to show that the terms in @eq:root-sum-expansion are equal to zero
  for $alpha in.not M$. Since $Delta_1$, $s_1$ and $s_j$ ($j = 2, ..., n$) are
  polynomials in $z$ of degree at most $|k| - n$, $k_1 - 1$, and $k_j$
  ($j = 2, ..., n$), respectively, for a nonzero term in @eq:root-sum-expansion
  it is necessary that
  $
    mu + |k| + sum_(j = 1)^n k_j alpha_j - alpha_1
    >= |k| + sum_(j = 1)^n k_j alpha_j,
  $
  i.e., $alpha_1 <= mu$. We next compute the maximal possible degree $d_i$ of
  the polynomial $R Delta_1 z_1 dots.c z_n s_1^(alpha_1) dots.c s_n^(alpha_n)$
  in the variables $z_i, z_(i + 1), ..., z_n$ jointly. The polynomials $s_j$
  ($j = 1, ..., i$) have degree at most $k_j - 1$ in these variables, while the
  polynomials $s_j$ ($j = i + 1, ..., n$) have degree at most $k_j$. Therefore,
  $
    d_i = sum_(j = i)^n m_j + |k| - 2i + 2 + sum_(j = 1)^n k_j alpha_j
    - alpha_1 - dots.c - alpha_i.
  $ <eq:degree-bound>
  In @eq:degree-bound there is a contribution only from terms with $alpha$ for
  which
  $
    d_i >= sum_(j = i)^n k_j (alpha_j + 1).
  $ <eq:degree-condition>
  By @eq:degree-bound and @eq:degree-condition,
  $
    alpha_i <= sum_(j = i)^n m_j + sum_(j = 1)^(i - 1) k_j - 2i + 2
    + sum_(j = 1)^(i - 1) (k_j - 1) alpha_j.
  $ <eq:alpha-bound>
  #source(180)
  #new-par
  Formula @eq:alpha-bound enables us to successively find the limits of
  variation of $alpha_i$ when they are known for $alpha_1, ..., alpha_(i - 1)$.
  In particular, it follows from @eq:alpha-bound that
  $
    alpha_2 <= k_1 (|m| + 1) - m_1 - 2, quad
    alpha_3 <= k_1 k_2 (|m| + 1) - k_2 m_1 - k_2 - m_2 - 2.
  $
  We now carry out the induction. Suppose that there are nonzero terms in
  @eq:root-sum-expansion only for $alpha$ such that
  $
    alpha_j <= & k_1 dots.c k_(j - 1) (|m| + 1)
                 - k_2 dots.c k_(j - 1) (m_1 + 1) \
               & - dots.c - k_(j - 1) (m_(j - 2) + 1) - (m_(j - 1) + 1) - 1,
  $ <eq:alpha-induction>
  where $j = 3, 4, ..., i - 1$. It is easy to see that @eq:alpha-bound and
  @eq:alpha-induction give us the estimate also for $alpha_i$. Thus, we can
  confine ourselves in @eq:root-sum-expansion to a finite number of terms,
  namely, those with $alpha in M$.
]

#eg[
  In the plane let us consider two "remarkable" third-order curves: the
  Tschirnhausen cubic (see @bib:Savelov1960, p.~89) and the Chasles cubic (see
  @bib:Smogorzhevskii1961, p.~229):
  $
    cases(
      2(2p + x)^3 = 27p(x^2 + y^2)\,,
      y = a x^3 + b x^2 y + c x y^2 + d y^3.
    )
  $ <eq:remarkable-cubics>
  #new-par
  It is easy to investigate this system when $a = b = c = 0$ and to show that it
  has nine distinct real roots for $p = 1$ and $3/4 < d < 1$; therefore, we can
  assert that the curves in @eq:remarkable-cubics are "in general position"
  (i.e., have the maximal possible number (nine) of points of intersection) if
  $|a|, |b|, |c| < epsilon$, $|p - 1| < epsilon$ and
  $3/4 - epsilon < d < 1 + epsilon$ for sufficiently small $epsilon > 0$. We
  assume that the "general position" condition is satisfied.

  To each generic point $(x, y)$ of the curves @eq:remarkable-cubics we assign
  the area (algebraic) of the rectangle bounded by the coordinate axes and the
  perpendiculars from $(x, y)$ to these axes, i.e., the number $x y$. Consider
  the problem of computing the sum of all these areas. This problem is easy to
  solve with the help of @eq:aizenberg-tsikh-formula:#ed-note[The value
    displayed below, as printed in the 1983 edition, is not right for the system
    @eq:remarkable-cubics: for $a = b = c = 0$ the roots are symmetric under
    $y -> -y$, so the sum is $0$, not $p (22 + 121 p) \/ 4$. Formula
    @eq:aizenberg-tsikh-formula gives
    $sum x^((l)) y^((l)) = p^2 [-1215 a \/ (2d) - 129 c \/ (4d)
      + 3645 a b \/ (4d^2) + 1215 b c \/ (2d^2)
      - 3645 (b^2 c + a c^2) \/ (4d^3) - 405 c^3 \/ (2d^3)
      + 3645 b c^3 \/ (4d^4) - 729 c^5 \/ (4d^5)]$. Also, for $a = b = c = 0$
    and $p = 1$ the line $y = 0$ passes through the double point $(4, 0)$ of the
    first curve, and the lines $y = plus.minus d^(-1 \/ 2)$ meet it in three
    real points only for $d > 1$; so the system has a double root and, for
    $3 \/ 4 < d < 1$, only four distinct real roots.]
  $
    sum_(l = 1)^9 x^((l)) y^((l)) = & -c + p / 4 (22 + 121p) \
    & - p / (4d) (54a + 75b + 76c + 1329p a + 594p b + 715p c) \
    & + p / (4d^2) (54b^2 + 76c^2 + 108b c + 264p b c + 729p b^2 + 1458p a b) \
    & - p / (4d^3) (54c^3 + 162b c^2 + 1323p c^3 + 2187p b c^2 + 2187p a c
      + 2187p b^2 c) \
    & + p / (4d^4) (54c^4 - 729p c^4 + 729p b c^3) - p / (4d^5) 729p c^5.
  $
] <exm:remarkable-cubics>

#source(181)
We extend the result obtained in Theorem~@th:aizenberg-tsikh to the case where
the polynomials $f_i - P_i$ ($i = 1, ..., n$) in @eq:triangular-system are not
simply homogeneous, but #index-mark(
  "Polynomial",
  sub: "weighted homogeneous",
)_weighted-homogeneous with proportional weights_ and of highest weighted
degree. This means the existence of positive rational numbers $a_1, ..., a_n$
and $c_1, ..., c_n$ such that
$
  z_i^(k_i) + sum_(j = 1)^(i - 1) z_j phi_(i j) (z)
$
consists of monomials $z^beta$ such that
$beta_1 \/ a_1 + dots.c + beta_n \/ a_n = c_i$, while $P_i (z)$ consists of
monomials such that $beta_1 \/ a_1 + dots.c + beta_n \/ a_n < c_i$,
$i = 1, ..., n$. Then there is an integer $q > 0$ such that all the numbers
$l_j = q product_(l != j) a_l$, $j = 1, ..., n$, are integers.

#theorem(title: [Aĭzenberg and Tsikh])[
  Suppose that the system @eq:triangular-system satisfies the
  weighted-homogeneity conditions indicated above, and that $R(z)$ is any
  polynomial. Let $mu'$ be the maximal of the numbers
  $beta_1 l_1 + dots.c + beta_n l_n$, with the maximum taken over all monomials
  $z^beta$ in $R(z)$, and let $m'_j$ be the maximal of the numbers $beta_j l_j$,
  $j = 1, ..., n$. Then @eq:aizenberg-tsikh-formula holds, where the summation
  on the right-hand side is over all $n$-tuples $alpha$ with integer coordinates
  in the parallelepiped
  $
    M' = \{alpha: & 0 <= alpha_1 <= mu', 0 <= alpha_2
                    <= k_1 l_1 (|m'| + 1) - m'_1 - 2, \
                  & 0 <= alpha_j
                    <= k_1 l_1 dots.c k_(j - 1) l_(j - 1) (|m'| + 1)
                    - k_2 l_2 dots.c k_(j - 1) l_(j - 1) (m'_1 + 1) \
                  & - dots.c - k_(j - 1) l_(j - 1) (m'_(j - 2) + 1)
                    - (m'_(j - 1) + 1) - 1,
                    j = 3, 4, ..., n\}.
  $
] <th:aizenberg-tsikh-weighted>

#proof[
  It is easy to verify that the change of variables $z_j (zeta) = zeta_j^(l_j)$,
  $j = 1, ..., n$, reduces things to the case considered in
  Theorem~@th:aizenberg-tsikh. Therefore, denoting by
  $zeta^((1)), ..., zeta^((N'))$ the roots of the system
  $
    tilde(f)_i (zeta) = f_i (z(zeta)) = 0, quad i = 1, ..., n,
  $ <eq:weighted-system>
  we get
  $
    sum_(j = 1)^(N') R(z(zeta^((j))))
    & = frak(N) [(R(z(zeta)) Delta_1 (tilde(f)) zeta_1 dots.c zeta_n)
      / (zeta_1^(k_1 l_1) dots.c zeta_n^(k_n l_n)) \
      & quad times sum_alpha (-1)^(|alpha|)
      ((s_1 (z(zeta))) / zeta_1^(k_1 l_1))^(alpha_1) dots.c
      ((s_n (z(zeta))) / zeta_n^(k_n l_n))^(alpha_n)].
  $ <eq:weighted-formula>
  #new-par
  To each root $z^((j))$, $j = 1, ..., N$, of @eq:triangular-system there
  correspond $l_1 dots.c l_n$ roots of @eq:weighted-system under our conditions,
  and the coordinates of these roots are roots of #source(182) degree $l_q$ from
  $z_q^((j))$, $q = 1, ..., n$. Consequently,
  $
    sum_(j = 1)^N R(z^((j))) = 1 / (l_1 dots.c l_n)
    sum_(j = 1)^(N') R(z(zeta^((j)))).
  $ <eq:root-sum-reduction>
  #new-par
  Taking account of the connection between the Jacobians of the systems
  @eq:triangular-system and @eq:weighted-system, we now get
  @eq:aizenberg-tsikh-formula from @eq:weighted-formula and
  @eq:root-sum-reduction after returning to the original variables. The limits
  of variation of $alpha$ in this case can be established just as in the proof
  of Theorem~@th:aizenberg-tsikh.
]

Theorem~@th:aizenberg-tsikh can be obtained from
Theorem~@th:aizenberg-tsikh-weighted, because in the case of the usual
homogeneity $l_1 = dots.c = l_n = 1$ and $mu' = mu$, $M' = M$. On the other
hand, the proof of Theorem~@th:aizenberg-tsikh-weighted amounts to reducing
matters to the case considered in Theorem~@th:aizenberg-tsikh by a suitable
change of variables. We regard Theorem~@th:aizenberg-tsikh as the main result of
these two; therefore, it is formulated separately even though it is a
consequence of Theorem~@th:aizenberg-tsikh-weighted. Formula
@eq:aizenberg-tsikh-formula can be applied to solve various problems directly
(see Examples~@exm:bezout–@exm:remarkable-cubics; it is also not hard to show
that the number of roots is again $N = k_1 dots.c k_n$ in the case of
Theorem~@th:aizenberg-tsikh-weighted) or as a method of elimination of unknowns.
It is sometimes useful to combine it with the method to be presented in
@sec:multiplicity.

Suppose that we are given a system of the form
$
  f_j (z, z_(n + 1)) = 0, quad j = 1, ..., n, n + 1,
$ <eq:extended-system>
where the functions $f_j (z, z_(n + 1))$, $j = 1, ..., n$, have the form
@eq:triangular-system for fixed $z_(n + 1)$, while $f_(n + 1)$ is an arbitrary
polynomial. Let $z^((j)) (z_(n + 1))$, $j = 1, ..., N$, be the roots of the
system of equations $f_j (z, z_(n + 1)) = 0$, $j = 1, ..., n$, with $z_(n + 1)$
as a parameter. The holomorphic function
$
  r(z_(n + 1)) = product_(j = 1)^N f_(n + 1) (z^((j)) (z_(n + 1)), z_(n + 1))
$
is called the #index-mark("Resultant of a polynomial")_resultant of the
polynomial $f_(n + 1)$ with respect to the system $f_j = 0$_, $j = 1, ..., n$,
and its zeros are precisely the $(n + 1)$st coordinates of the roots of
@eq:extended-system. We can find $r(z_(n + 1))$ as follows: use
@eq:aizenberg-tsikh-formula to determine the power sums
$
  S_q (z_(n + 1)) = sum_(j = 1)^N f_(n + 1)^q (z^((j)) (z_(n + 1)), z_(n + 1)),
  quad q = 1, ..., N,
$
then use Newton's formula @eq:newton-recursion to compute
$b_N = (-1)^N r(z_(n + 1))$ (from this it is clear, in particular, that
$r(z_(n + 1))$ is a polynomial). The determination of $r(z_(n + 1))$ means the
elimination of the unknowns $z_1, ..., z_n$, and also enables us to find out how
many (finite) roots system @eq:extended-system has.

#source(183)
The #index-mark("Method of elimination")method of elimination based on
@eq:simple-system-formula or @eq:aizenberg-tsikh-formula can be realized
considerably more easily than the classical method, which uses resultants of
polynomials. For example, these formulas contain a determinant of order $n$,
while if elimination is performed by the classical method, at the last step it
is necessary to compute a determinant of order
$
  k_1^(2^(n - 3)) k_2^(2^(n - 4)) dots.c k_(n - 3)^2 k_(n - 2)
  (k_(n - 1) + k_n).
$
#new-par
Below we give an example of our method in which the computations are carried out
"by hand." We do not know how to employ the classical method in this example
without using a computer, since at the last step it would be necessary to
compute a determinant of at least order ten.

Of course, the use of a computer extends considerably the possibilities of the
method of elimination given in this section.

#eg[
  Consider the system
  $
    cases(
      f_1 = z_1 - z_3 - z_2^3 = 0\,,
      f_2 = z_2^4 - z_3 - z_1 = 0\,,
      f_3 = z_1^2 - z_3 - z_2^2 = 0.
    )
  $ <eq:elimination-example>
  It is required to eliminate $z_1$ and $z_2$. We represent $f_1 = z_1 + P_1$
  and $f_2 = z_2^4 - z_1 + P_2$, where $z_1$ and $z_2^4 - z_1$ are
  weighted-homogeneous polynomials of weight $(1, 4)$, and $P_1$ and $P_2$ have,
  respectively, small weighted degree with respect to the variables $z_1$ and
  $z_2$ jointly. The system of equations $f_1 = 0$, $f_2 = 0$ for fixed $z_3$
  has 4 roots; therefore,
  $
    S_q (z_3) & = sum_(j = 1)^4 f_3^q (z_1^((j)) (z_3), z_2^((j)) (z_3), z_3) \
              & = frak(N) [sum_(alpha_1, alpha_2) (f_3^q Delta_1) / z_2^3
                  ((z_3 + z_2^3) / z_1)^(alpha_1)
                  ((z_3 + z_1) / z_2^4)^(alpha_2)], quad
                q = 1, ..., 4.
  $
  Here the functional $frak(N)$ acts on the Laurent polynomial in $z_1$ and
  $z_2$, while the variable $z_3$ is a parameter. The computations give the
  following results:
  $
    S_1 (z_3) = 4z_3^2 + 10z_3, \
    S_2 (z_3) = 4z_3^4 + 244z_3^3 + 100z_3^2, \
    S_3 (z_3) = 4z_3^6 + 1374z_3^5 + 4140z_3^4 + 826z_3^3 - 12z_3^2, \
    S_4 (z_3) = 4z_3^8 + 4584z_3^7 + 50904z_3^6 + 54696z_3^5 + 7124z_3^4
    - 16z_3^3.
  $
  #source(184)
  #new-par
  With the help of the Newton recursion formula @eq:newton-recursion we then
  find the desired polynomial:
  $
    r(z_3) = z_3^8 - 6z_3^7 - 64z_3^6 - 106z_3^5 + 123z_3^4 - 36z_3^3.
  $
  Thus, elimination of $z_1$ and $z_2$ from @eq:elimination-example gives the
  equation $r(z_3) = 0$.
] <exm:elimination>

#small-print[
  Let us consider the problem of finding a multidimensional analogue of Waring's
  formula (see, for example, @bib:Mishina1962, Chapter~III, §5.3) for the
  systems @eq:triangular-system, a formula which expresses the power sums $S_j$
  at once in terms of the coefficients of the corresponding polynomial; this is
  more cumbersome than Newton's formula @eq:newton-recursion but, on the other
  hand, it gives the answer at once and not in a recursive way.

  The power sums for the coordinates of the roots of @eq:triangular-system are
  denoted as follows:
  $
    sum_(j = 1)^N (z_l^((j)))^m = S_l^((m)).
  $
  Further, let $attach(sum, b: alpha, tr: j)$ stand for summation over all
  multi-indices $alpha$ such that either $|alpha| < k_j$, or $|alpha| = k_j$ but
  for some $i$ we have $alpha_1 = dots.c = alpha_(i - 1) = 0$, $alpha_i >= 1$,
  $i = 1, ..., j - 1$. The product $attach(product, b: alpha, tr: j)$ is defined
  similarly, as are the tuples of numbers ${ }_alpha^j$, $j = 1, ..., n$. In
  this notation @eq:triangular-system can be written in the form
  $
    z_j^(k_j) - attach(sum, b: alpha, tr: j) a_(j alpha) z^alpha = 0, quad
    j = 1, ..., n.
  $ <eq:waring-system>

  #theorem(title: [Bolotov])[
    The following multidimensional analogue of Waring's formula is valid for the
    system @eq:waring-system:
    $
      S_l^((m)) = sum_q product_(j = 1)^n [(beta_j (q) - 1)!
        attach(product, b: alpha, tr: j) (a_(j alpha)^(lambda_(j alpha)))
        / (lambda_(j alpha) !)] D(q),
    $ <eq:waring-formula>
    where $q = (q_1, ..., q_n)$, $q_j = {lambda_(j alpha)}_alpha^j$, the
    $lambda_(j alpha)$ are nonnegative integers,
    $beta_j (q) = attach(sum, b: alpha, tr: j) lambda_(j alpha)$, and
    $D(q) = det norm(delta_(p j) k_j beta_j (q) - gamma_p (q_j))$,
    $p, j = 1, ..., n$, with
    $gamma_p (q_j) = attach(sum, b: alpha, tr: j) lambda_(j alpha) alpha_p$. The
    summation with respect to $q$ in @eq:waring-formula runs over all $n$-tuples
    $q$ such that
    $
      sum_(j = 1)^n gamma_p (q_j) - k_p beta_p (q) + delta_(l p) dot.c m = 0,
      quad p = 1, ..., n.
    $
    Here $delta_(l p)$ is the Kronecker symbol. If $beta_j (q) = 0$, then
    $(beta_j (q) - 1)!$ should be replaced by 1, and
    $delta_(p j) k_j beta_j (q) - gamma_p (q_j)$ by $delta_(p j) k_j$. There are
    only finitely many terms in @eq:waring-formula.
  ] <th:bolotov-waring>

  We do not give the proof. It is similar to that of
  Theorem~@th:yuzhakov-bolotov. The formula @eq:waring-formula (with $n = 1$)
  contains the familiar classical Waring formula.
]

#point <pt:arbitrary-systems> Consider now _an arbitrary system of algebraic
equations_
$
  P_j (z) = 0, quad j = 1, ..., n,
$ <eq:arbitrary-system>
along with an auxiliary system of the form @eq:simple-system:
$
  lambda z_j^(k_j) + P_j (z) = 0, quad j = 1, ..., n,
$ <eq:auxiliary-system>
where $k_j$ is greater than the degree of $P_j (z)$, $j = 1, ..., n$. Without
loss of generality it can be assumed that zero is not among the roots of
@eq:arbitrary-system (in the contrary case a translation can be made). Suppose
that this system has $N$ #source(185) (finite) roots, while @eq:auxiliary-system
has $N' = k_1 dots.c k_n$ roots (see Example~@exm:bezout). We introduce linear
combinations of the coordinates of the roots of @eq:auxiliary-system:
$
  a_1 z_1^((j)) (lambda) + dots.c + a_n z_n^((j)) (lambda), quad
  j = 1, ..., N', a in CC^n.
$ <eq:linear-combinations>
As $lambda -> 0$ the "superfluous" $N' - N$ roots tend to $infinity$, while $N$
roots tend to the roots of @eq:arbitrary-system, as is not hard to establish
with the help of Rouché's theorem. Therefore, for all parameters $a in CC^n$
with the exception of a set of complex dimension $n - 1$ exactly $N' - N$ of the
numbers @eq:linear-combinations tend to $infinity$ as $lambda -> 0$, while $N$
of them tend to the corresponding (nonzero) linear combinations of roots of
@eq:arbitrary-system. Let
$
  S_a^((m)) (lambda) = sum_(j = 1)^(N') chevron.l a, z^((j)) (lambda)
  chevron.r^m, quad m = 1, 2, ..., N'.
$
The sums $S_a^((m)) (lambda)$ can be computed by
Theorem~@th:aizenberg-simple-system. From $S_a^((m)) (lambda)$ and Newton's
formula @eq:newton-recursion we can find the elementary symmetric polynomials in
@eq:linear-combinations, which we denote by $sigma_a^((m)) (lambda)$,
$m = 1, ..., N'$. We next consider the ratios
$
  (sigma_a^((m)) (lambda)) / (sigma_a^((N')) (lambda)), quad
  m = N' - 1, N' - 2, ..., 1, 1 / (sigma_a^((N')) (lambda)),
$ <eq:symmetric-ratios>
which are elementary symmetric polynomials in
$chevron.l a, z^((j)) (lambda) chevron.r^(-1)$, $j = 1, ..., N'$. They are
rational functions of the coefficients of @eq:auxiliary-system. Letting
$lambda -> 0$, we get from @eq:symmetric-ratios that
$
  delta_1, ..., delta_N, underbrace(0\, ...\, 0, N' - N),
$ <eq:ratio-limits>
where the $delta_j$ are the elementary symmetric polynomials in
$chevron.l a, z^((j)) chevron.r^(-1)$, the $z^((j))$ being the roots of
@eq:arbitrary-system, $j = 1, ..., N$. Hence, we have constructed a polynomial
$Omega(z_1)$ in the single complex variable $z_1$ that has the roots
$chevron.l a, z^((j)) chevron.r^(-1)$, $j = 1, ..., N$, thereby indicating a
#index-mark("Method of elimination")_method of elimination for arbitrary
algebraic systems_ and, in particular, an algorithm that enables us to determine
the total number of (finite) roots of these systems (the index $N$ of the number
$delta_N$ after which there are only zeros in @eq:ratio-limits.)#footnote[It may
  happen that $delta_N$ is equal to zero also for the excluded set of parameters
  $a in CC^n$ of complex dimension $n - 1$.] We note that this method works
correctly for parameters $a in CC^n$ outside a set of parameters of complex
dimension $n - 1$. The given method of elimination seems to us (as does the
method indicated in @pt:algebraic-systems for the systems @eq:triangular-system)
to be simpler than the classical method which uses resultants of polynomials.

#source(186)
#point <pt:real-roots> We discuss the question of #index-mark(
  "Number",
  sub: "of real roots of a nonlinear algebraic system with real coefficients",
)_the number of real roots of a nonlinear algebraic system with real
coefficients_. Suppose that the coefficients of @eq:arbitrary-system are real.
As before, the roots of this system are denoted by $z^((1)), ..., z^((N))$.
Consider the linear combinations $chevron.l a, z^((j)) chevron.r$,
$j = 1, ..., N$, of the coordinates of the roots, with the parameter $a$ taken
from the real space $RR^n$ this time. We construct a polynomial $Omega_a (z_1)$
of a single variable having the roots $chevron.l a, z^((j)) chevron.r$,
$j = 1, ..., N$ (this is easy to do by computing the sums
$S_a^((m)) = sum_(j = 1)^N chevron.l a, z^((j)) chevron.r^m$; for system
@eq:triangular-system $S_a^((m))$ can be calculated for any $a in RR^n$, but for
the general case of the system @eq:arbitrary-system it can be calculated for
$a in RR^n$ outside an $(n - 1)$-dimensional subset of $RR^n$). If the root
$z^((j))$ is real, then the linear combination $chevron.l a, z^((j)) chevron.r$
is also real. But if $chevron.l a, z^((j)) chevron.r$ is real, then either the
root $z^((j))$ is real or the parameter $a$ satisfies the equation
$chevron.l a, Im z^((j)) chevron.r = 0$.

An algebraic system with real coefficients has, along with each complex root
$z^((j))$, also the root $overline(z^((j)))$. Therefore, we have

#proposition[
  The polynomial $Omega_a (z_1)$ has as many real roots as has the system of
  equations under consideration with the exception of the case where the
  parameter $a$ lies on a "singular" set consisting of not more than $N \/ 2$
  hyperplanes in $RR^n$.
] <prop:real-roots>

If we find the number of real roots of $Omega_a (z_1)$ by any classical method
and it turns out that for small variations in the coefficients of
$Omega_a (z_1)$ this number does not change,#footnote[Generally speaking, the
  degree of $Omega_a (z_1)$ is equal to $N$. If for a given $a$ it turns out to
  be less than $N$, then we regard the missing coefficients as equal to zero,
  and it is also necessary to vary them when we speak of varying the
  coefficients.] <fn:missing-coefficients> then we can be certain that the given
number is also the number of real roots of the system. It is often sufficient
just to eliminate all the unknowns except for one from the given nonlinear
system.

#eg[
  Consider the system of equations
  $
    cases(
      z_1^3 - z_2 + z_3^2 - 1 = 0\,,
      z_2^3 + z_1 - z_3 + 1 = 0\,,
      z_3^2 - z_1 - z_2 + 2 = 0\,,
    )
  $ <eq:no-real-roots-system>
  which has the form @eq:simple-system. It is possible to compute
  $Omega_a (z_1)$ for any $a$ by using @eq:simple-system-formula (first compute
  the sums $S_a^((m))$, and then use Newton's formula @eq:newton-recursion).
  However, to determine the number of real roots of @eq:no-real-roots-system it
  suffices to eliminate the unknowns $z_1$ and $z_3$. The result is
  $
    P(z_2) = & z_2^18 + 6z_2^15 - 3z_2^13 + 23z_2^12 - 12z_2^10 + 54z_2^9
    + 3z_2^8 \
    & - 30z_2^7 + 56z_2^6 + 6z_2^5 - 14z_2^4 - 3z_2^3 + 7z_2^2 - 8z_2 + 3 = 0.
  $
  #source(187)
  If we consider the number of sign changes in the sequence $P(z_2)$,
  $P'(z_2), ..., P^((18)) (z_2)$ at the points $-infinity$, $-1$, 1, and
  $infinity$, then we see by the Budan-Fourier theorem (see, for example,
  @bib:Mishina1962, Chapter~III, §4.2) that $P(z_2)$ has no roots on
  $(-infinity, -1)$ and $(1, infinity)$, and the sign sequences contain only
  plus and minus signs and no zeros. It is easy to estimate the polynomial
  $P(z_2)$ on $[-1, 1]$ and to show that it also has no roots there. Since small
  changes in the coefficients of $P$ preserve the inequalities used here as well
  as the plus and minus signs in the sign sequences, we arrive at the conclusion
  that none of the 18 roots of @eq:no-real-roots-system are real.

  We remark that if we eliminated $z_2$ and $z_3$, then we would get
  $Q(z_1) = z_1^3 + z_1 - 3 = 0$. The polynomial $Q(z_1)$ has real roots, but
  this does not mean that our system also has real roots (see footnote
  @fn:missing-coefficients). In other words, the point $(1, 0, 0)$ is on the
  "singular" set of parameters (see Proposition~@prop:real-roots).
] <exm:no-real-roots>

#eg[
  Consider the system @eq:elimination-example in Example~@exm:elimination. It is
  easy to eliminate $z_1$ and $z_3$, with the result
  $P(z_2) = z_2^2 Q(z_2) = 0$, where
  $Q(z_2) = z_2^6 + 2z_2^5 + z_2^4 - 2z_2^2 + 2z_2 - 4$. If we vary the
  coefficients of $P(z_2)$ a little, then the number of real roots can change
  (the multiple $z_2 = 0$ can pass into a pair of complex conjugate roots);
  therefore, it is not possible to apply Proposition~@prop:real-roots directly
  here. But we can proceed differently. With the help of
  Theorem~@th:weighted-principal-part it is easy to see that
  @eq:elimination-example has $(0, 0, 0)$ as a root of multiplicity two.
  Therefore, we look for the number of real roots of it different from zero.
  Then we can investigate $Q(z_2)$. If we compute the number of sign changes in
  the sequence $Q(z_2)$, $Q'(z_2), ..., Q^((6)) (z_2)$ at the points $-infinity$
  and $-1$, then we see by the Budan-Fourier theorem that $(-infinity, -1]$
  contains a single root, and there are only plus or minus signs in the sign
  sequences. Further, it is easy to see that $z_2 = 1$ is a simple root and
  there are no other roots in $[0, infinity)$. Simple inequalities give us that
  there are also no roots in $(-1, 0)$. Thus, @eq:elimination-example has 4 real
  roots. We arrive at a similar conclusion if we eliminate $z_1$ and $z_2$ (see
  Example~@exm:elimination), i.e., the points $(0, 1, 0)$ and $(0, 0, 1)$ do not
  lie on the "singular" set of parameters.
] <exm:real-roots-elimination>

Let us next consider the question of #index-mark(
  "Number",
  sub: (
    "of real roots of a nonlinear algebraic system with real coefficients"
      + " in a specified ellipsoid"
  ),
)_the number of roots of a nonlinear algebraic system with real coefficients in
a given ellipsoid in $RR^n$_ (the discussion of a method for finding the number
of roots in a domain bounded by an algebraic surface is similar).

We first compute the sums
$
  S_(a, b)^((m)) = sum_(j = 1)^N [a_1 (z_1^((j)) - b_1)^2 + dots.c
    + a_n (z_n^((j)) - b_n)^2]^m,
$
$m = 1, ..., N$. Then we use Newton's formula @eq:newton-recursion to find the
coefficients of a polynomial $Omega_(a, b) (z_1)$ having the roots
$
  a_1 (z_1^((j)) - b_1)^2 + dots.c + a_n (z_n^((j)) - b_n)^2,
$ <eq:ellipsoid-combination>
#source(188)
$j = 1, ..., N$. Here the parameters $(a, b)$ form a point in $RR^(2n)$. If the
root $z^((j))$ is real, then the expression @eq:ellipsoid-combination is also
real. But if @eq:ellipsoid-combination is real, then either $z^((j))$ is real or
the parameters $(a, b)$ satisfy the equation obtained by setting the imaginary
part of @eq:ellipsoid-combination equal to zero. There cannot be more than
$N \/ 2$ such equations, where $N$ is the total number of zeros of the given
system, i.e., we have

#proposition[
  The polynomial $Omega_(a, b) (z_1)$ has as many roots on $[0, r)$ as the given
  system has in the ellipsoid
  ${x: x in RR^n, a_1 (x_1 - b_1)^2 + dots.c + a_n (x_n - b_n)^2 < r}$, with the
  exception of the case when the point $(a, b)$ belongs to the "singular" set,
  which consists of at most $N \/ 2$ second-order hypersurfaces in $RR^(2n)$.
] <prop:roots-in-ellipsoid>

The remark after Proposition~@prop:real-roots about how to determine that
$(a, b)$ does not lie on the "singular" set is also true in this case. Another
method consists in the following. First it is necessary to use
Proposition~@prop:real-roots to find the total number $N_1$ of real roots of the
system. Then determine the number $N_2$ of roots of the polynomial
$Omega_(a, b)$ on $[0, infinity)$. If $N_2 = N_1$, then the parameter point
$(a, b)$ is not on the "singular" set.

#eg[
  Consider the system
  $
    cases(z_1^3 - z_2^2 - 1 = 0\,, z_2^3 - z_1^2 - z_1 = 0.)
  $ <eq:ellipse-system>
  If we eliminate $z_2$, we get
  $z_1^9 - 3z_1^6 - z_1^4 + z_1^3 - z_1^2 - 1 = 0$. Just as in
  Examples~@exm:no-real-roots and @exm:real-roots-elimination, it can then be
  established that @eq:ellipse-system has a single real root. This system is not
  large, so $Omega_(a, b)$ can be computed even without assigning concrete
  values to $a$ or $b$. For example, when $b = (0, 0)$ and $a in RR^2$,
  $
    Omega & = z_1^9 - (5a_1 a_2 + 6a_2^2) z_1^7
            - (7a_1^3 + 7a_1^2 a_2 + 14a_1 a_2^2 + 6a_2^3) z_1^6 \
          & - (6a_1^4 + 42a_1^3 a_2 + 19a_1^2 a_2^2 + a_1 a_2^3
              - 9a_2^4) z_1^5 \
          & - (7a_1^5 + 29a_1^4 a_2 + 91a_1^3 a_2^2 + 6a_1^2 a_2^3
              - 27a_1 a_2^4
              - 17a_2^5) z_1^4 \
          & - (7a_1^6 + 29a_1^5 a_2 + 39a_1^4 a_2^2 + 88a_1^3 a_2^3
              - 4a_1^2 a_2^4
              - 30a_1 a_2^5 - 3a_2^6) z_1^3 \
          & - (3a_1^7 + 24a_1^6 a_2 + 30a_1^5 a_2^2 + 12a_1^4 a_2^3
            + 60a_1^3 a_2^4
            + 13a_1^2 a_2^5 \
          & quad - 17a_1 a_2^6 + 13a_2^7) z_1^2 \
          & - (2a_1^8 + 6a_1^7 a_2 + 18a_1^6 a_2^2 + 7a_1^5 a_2^3
            - 7a_1^4 a_2^4
            + 36a_1^3 a_2^5 + 11a_1^2 a_2^6 \
          & quad - 10a_1 a_2^7 + 12a_2^8) z_1 \
          & - a_1^9 - 2a_1^8 a_2 - 3a_1^7 a_2^2 - 4a_1^6 a_2^3 + a_1^5 a_2^4
            + 2a_1^4 a_2^5 \
          & - 9a_1^3 a_2^6 - a_1^2 a_2^7 + 4a_1 a_2^8 - 4a_2^9.
  $
  #source(189)
  It is now possible to find the number of roots of @eq:ellipse-system in the
  ellipse ${x: x in RR^2, a_1 x_1^2 + a_2 x_2^2 < r}$.

  For example, if $a_1 = a_2 = 1$, then
  $Omega = z_1^9 - 11z_1^7 - 34z_1^6 - 59z_1^5 - 89z_1^4 - 126z_1^3
  - 138z_1^2 - 75z_1 - 17$. As in the preceding examples, it is not hard to
  establish that this polynomial has one root in $[0, infinity)$; therefore, the
  parameters $a_1 = a_2 = 1$ and $b_1 = b_2 = 0$ do not lie on the "singular"
  set. Next, it is easy to see that $Omega(4) < 0$ and $Omega(5) > 0$, i.e.,
  this root lies in the interval $(4, 5)$. Our system therefore has a root in
  the disk ${x: x_1^2 + x_2^2 < 5}$, but no roots in the disk
  ${x: x_1^2 + x_2^2 < 4}$.

  If $a_1 = 1$ and $a_2 = 2$, then
  $Omega = z_1^9 - 34z_1^7 - 125z_1^6 - 30z_1^5 + 499z_1^4 + 291z_1^3
  - 2219z_1^2 - 3678z_1 - 1697$, and it is easy to find as in the foregoing that
  @eq:ellipse-system has a root in the ellipse ${x: x_1^2 + 2x_2^2 < 8}$, but no
  roots in the ellipse ${x: x_1^2 + 2x_2^2 < 7}$.
] <exm:roots-in-ellipse>

#remark[
  Thus, we have given an algorithm that enables us to answer the question of the
  number of roots of a system in a given ellipsoid in $RR^n$. In particular, by
  varying the sizes of the axes of the ellipsoid we can speak of the number of
  roots in a ball or, for example, of the number of roots in a neighborhood of
  an interval.
]
