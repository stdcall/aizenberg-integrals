#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[A basis in the space of holomorphic functions with fixed
  algebraic singularities] <sec:algebraic-singularities>

#point <pt:bases-in-spaces> The set $A(D)$ of functions holomorphic in a domain
$D subset CC^n$ forms a linear vector space. The notation $A(D)$ will also be
used for this space with the topology of uniform convergence on compact subsets
of $D$. A sequence ${f_k}_1^infinity subset A(D)$ converges in this topology to
a function $f in A(D)$ if $f_k (z) -> f(z)$ uniformly in $z in K$ for any
compact set $K subset D$. A sequence ${phi_k}_1^infinity subset A(D)$ forms a
basis for the space $A(D)$ if any $f in A(D)$ can be represented in a unique way
as $sum_1^infinity c_k phi_k$, where ${c_k}$ is a sequence of complex numbers,
and the series converges in the topology of $A(D)$.

#eg[
  A basis for the space $A(CC^1 without {a_1, ..., a_m})$ is formed by the
  monomials $(z - a_j)^(-k)$, $j = 1, ..., m$, $k = 1, 2, ...$, and $z^n$,
  $n = 0, 1, ...$. The expansion coefficients of an arbitrary function
  $f in A(CC^1 without {a_1, ..., a_m})$
  $
    f(z) = sum_(j = 1)^m sum_(k = 1)^infinity c_(j k) / (z - a_j)^k
    + sum_(n = 0)^infinity c_n z^n,
  $ <eq:one-variable-expansion>
  in the basis are uniquely determined by the formulas
  $
    c_(j k) = 1 / (2 pi i) integral_(|zeta - a_j| = epsilon)
    f(zeta) (zeta - a_j)^(k - 1) d zeta, wide
    c_n = 1 / (2 pi i) integral_(|zeta| = R) (f(zeta) d zeta) / zeta^(n + 1),
  $
  where $epsilon > 0$ is sufficiently small, and $R > max{|a_1|, ..., |a_m|}$.
] <exm:punctured-plane>

For holomorphic functions of several complex variables the zero sets of
holomorphic functions play the role of isolated singular points. We consider a
space $A(CC^n without T)$ of holomorphic functions with algebraic singularities,
where $T = {z: cal(P)(z) = 0}$, $cal(P)$ being a polynomial.

#point <pt:rational-weil-polyhedra> Let us first return to the Weil expansion
@eq:weil-expansion. If $chi_j (z)$, $j = 1, ..., N$, are polynomials or rational
functions, then in @eq:weil-expansion the function $Omega_J (z)$,
$J = (j_1, ..., j_n)$, $1 <= j_1 < dots.c < j_n <= N$, can be represented in the
form
$
  Omega_J (zeta, z) = sum_(k = 1)^(m(J)) g_(J k) (zeta) h_(J k) (z),
$
#source(256)
where $g_(J k)$ and $h_(J k)$ are polynomials or rational functions,
respectively. In this case the Weil expansion @eq:weil-expansion can be
represented in the form
$
  f(z) = sum_J sum_(k = 1)^(m(J)) sum_(alpha >= 0)
  a_(J k alpha) h_(J k) (z) chi_J^alpha (z),
$ <eq:rational-weil-series>
where $alpha = (alpha_1, ..., alpha_n)$,
$chi_J^alpha = chi_(j_1)^(alpha_1) dots.c chi_(j_n)^(alpha_n)$;
$
  a_(J k alpha) = 1 / (2 pi i)^n integral_(gamma_J)
  (f(zeta) g_(J k) (zeta) d zeta) / (chi_J^(alpha + upright(I)) (zeta)).
$ <eq:rational-weil-coefficients>
The series @eq:rational-weil-series, like the Weil series @eq:weil-expansion,
converges uniformly on compact subsets of $Delta$. In the general case the
functions $h_(J k) (z) chi_J^alpha (z)$ do not form a basis for $A(Delta)$,
since functions $f in A(Delta)$ are not always uniquely representable as a
series @eq:rational-weil-series.

#eg[
  For the Weil polyhedron
  $Delta = {z in CC^2: |z_1| < 1, |z_2| < 1, |z_1 + z_2| < 1}$ every
  $f in A(Delta)$ can be expanded according to @eq:rational-weil-series and
  @eq:rational-weil-coefficients in a series
  $
    f(z) = sum_(m, n = 0)^infinity a_(m n) z_1^m z_2^n
    + sum_(m, n = 0)^infinity b_(m n) z_1^m (z_1 + z_2)^n
    + sum_(m, n = 0)^infinity c_(m n) z_2^m (z_1 + z_2)^n.
  $
  However, this expansion is not unique, because the monomials
  $
    z_1^m z_2^n, z_1^m (z_1 + z_2)^n quad "and" quad z_2^m (z_1 + z_2)^n,
  $
  $m + n = const$, are dependent.
] <exm:non-unique-expansion>

We mention an important particular case where @eq:rational-weil-series can be
unique. Consider the special Weil polyhedron
$Delta = {z in D: |chi_j (z)| < R_j, j = 1, ..., n}$, $chi_j in A(D)$,
$Delta relcomp D subset CC^n$. In this case the skeleton of the polyhedron
$Delta_epsilon = {z in D: |chi_j (z)| < R_j - epsilon_j, j = 1, ..., n}$,
consists of the single component
$gamma = {z in D: |chi_j (z)| = R_j - epsilon_j, j = 1, ..., n}$, and for
rational functions $chi_j$ the expansion @eq:rational-weil-series takes the form
$
  f(z) = sum_(|alpha| >= 0) sum_(k = 1)^m a_(k alpha) h_k (z) chi^alpha (z),
$ <eq:special-weil-series>
where
$
  a_(k alpha) = 1 / (2 pi i)^n integral_gamma
  (f(zeta) g_k (zeta) d zeta) / (chi^(alpha + upright(I)) (zeta)).
$ <eq:special-weil-coefficients>
Recall that here
$
  chi_j (zeta) - chi_j (z)
  = sum_(k = 1)^n (zeta_k - z_k) cal(P)_(j k) (zeta, z),
  quad j = 1, ..., n,
$ <eq:special-hefer-expansion>
#source(257)
is a Hefer expansion in which the $cal(P)_(j k)$ are polynomials or rational
functions, and
$
  Omega(zeta, z) = mat(
    delim: "|",
    cal(P)_11 (zeta, z), cal(P)_(1 n) (zeta, z);
    dots.v, dots.v;
    cal(P)_(n 1) (zeta, z), cal(P)_(n n) (zeta, z)
  ) = sum_(k = 1)^m g_k (zeta) h_k (z).
$ <eq:special-hefer-determinant>

#proposition(title: [Mikhaĭlova])[
  Any function $f$ holomorphic in a special Weil polyhedron $Delta$ has a unique
  expansion in a series @eq:special-weil-series if and only if
  $det norm(lambda_(k j)) != 0$, where
  $
    lambda_(k j) = 1 / (2 pi i)^n integral_gamma
    (g_k (zeta) h_j (zeta) d zeta) / (chi^upright(I) (zeta)),
    quad k, j = 1, ..., m.
  $ <eq:mikhailova-matrix>
] <prop:mikhailova>

#proof[
  _Necessity._ Take $f = h_j$, $j = 1, ..., m$. Then, since the expansion
  @eq:special-weil-series is unique, the formulas @eq:special-weil-coefficients
  with $alpha = 0 = (0, ..., 0)$ give us that
  $lambda_(k j) = a_(k 0) = delta_(k j)$, $k = 1, ..., m$. Consequently,
  $det norm(lambda_(k j)) != 0$.

  _Sufficiency._ Suppose that $det norm(lambda_(k j)) != 0$. We show that if
  $
    0 equiv sum_(k = 1)^m sum_(alpha >= 0) a_(k alpha) h_k (z) chi^alpha (z)
  $ <eq:vanishing-series>
  and the series converges uniformly on compact subsets of $Delta$, then
  $a_(k alpha) = 0$ for all $k = 1, ..., m$ and $alpha >= 0$. Let us use
  induction on $p = |alpha|$. Multiply @eq:vanishing-series by the form
  $g_j (z) d z \/ (2 pi i)^n chi^upright(I) (z)$, $j = 1, ..., m$, and integrate
  over the cycle $gamma$. This gives
  $
    0 = sum_(k = 1)^m sum_(|alpha| >= 0) a_(k alpha) 1 / (2 pi i)^n
    integral_gamma h_k (z) g_j (z) chi^(alpha - upright(I)) (z) d z.
  $
  By the Cauchy-Poincaré Theorem~@th:cauchy-poincare,
  $integral_gamma h_k g_j chi^(alpha - upright(I)) d z = 0$ for $|alpha| > 0$,
  since in this case $gamma tilde.op 0$ in the domain of regularity of the
  integrand form. Indeed, if $alpha_q >= 1$, then $gamma = plus.minus partial B$
  for
  $
    B = {z in D: |chi_j (z)| = R_j - epsilon, j = 1, ... [q] ..., n,
      |chi_q (z)| <= R_q - epsilon},
  $
  and the form $h_k g_j chi^(alpha - upright(I)) d z$ is holomorphic on $|B|$.
  Thus, in the notation @eq:mikhailova-matrix,
  $
    sum_(k = 1)^m a_(k 0) lambda_(j k) = 0, quad j = 1, ..., m.
  $
  From the condition $det norm(lambda_(j k)) != 0$ it follows that
  $a_(k 0) = 0$, $k = 1, ..., m$. Assume that $a_(k alpha) = 0$ for
  $|alpha| <= p - 1$ in the expansion @eq:vanishing-series. Let us then show
  that $a_(k beta) = 0$, $k = 1, ..., m$, for $|beta| = p$. Multiplying
  @eq:vanishing-series by the form #source(258)
  $g_j (z) d z \/ (2 pi i)^n chi^(beta + upright(I)) (z)$, $j = 1, ..., m$, we
  have
  $
    0 = sum_(k = 1)^m sum_(|alpha| >= p) a_(k alpha)
    integral_gamma h_k (z) g_j (z) chi^(alpha - beta - upright(I)) (z) d z.
  $
  The equality $integral_gamma h_k g_j chi^(alpha - beta - upright(I)) d z = 0$
  holds for $alpha != beta$, $|alpha| >= p$, because $alpha_q - beta_q - 1 >= 0$
  for at least one index $q in {1, ..., n}$. Thus,
  $
    sum_(k = 1)^m a_(k beta) lambda_(j k) = 0, quad j = 1, ..., m,
  $
  and so $a_(k beta) = 0$, $k = 1, ..., m$.
]

#remark[
  The Hefer expansion @eq:special-hefer-expansion and the representation
  @eq:special-hefer-determinant are not unique, so for a given special Weil
  polyhedron defined by rational functions $chi_j$ ($j = 1, ..., n$) it is
  possible to choose in different ways the system
  ${h_k (z) chi^alpha (z), k = 1, ..., m, alpha >= 0}$ of functions for
  expanding functions $f in A(Delta)$. It may form a basis in $A(Delta)$ for
  some choice of the functions $h_k (z)$ and $g_k (z)$, and it may not form a
  basis for others.
]

#eg[
  It is not hard to show that the special analytic polyhedron
  $Delta = {z in CC^2: |chi_j (z)| < 1, j = 1, 2}$, where
  $chi_1 (z) = z_1^3 + z_2^3$ and $chi_2 (z) = z_1^2 + z_2^2$, is a Weil
  polyhedron. For the Hefer expansions
  $
    chi_1 (zeta) - chi_1 (z) = sum_(j = 1)^2 (zeta_j - z_j)
    (z_j^2 + z_j zeta_j + zeta_j^2), \
    chi_2 (zeta) - chi_2 (z) = sum_(j = 1)^2 (zeta_j - z_j) (zeta_j + z_j)
  $
  the determinant
  $
    Omega(zeta, z) = mat(
      delim: "|",
      z_1^2 + z_1 zeta_1 + zeta_1^2, z_2^2 + z_2 zeta_2 + zeta_2^2;
      z_1 + zeta_1, z_2 + zeta_2
    )
  $
  can be represented in the form
  $
    Omega & = (z_1^2 z_2 - z_2^2 z_1) + (z_1 z_2 - z_2^2) zeta_1
            + z_2 (zeta_1^2 - zeta_1 zeta_2) \
          & quad + z_1 (zeta_1 zeta_2 - zeta_2^2) + (z_1^2 - z_1 z_2) zeta_2
            + (zeta_1^2 zeta_2 - zeta_2^2 zeta_1)
  $
  and in the form
  $
    Omega & = (z_1^2 z_2 - z_2^2 z_1) + (z_1 z_2 - z_2^2) zeta_1 + z_2 zeta_1^2
            + (z_1^2 - z_1 z_2) zeta_2 \
          & quad + (z_1 - z_2) zeta_1 zeta_2 - z_1 zeta_2^2
            + (zeta_1^2 zeta_2 - zeta_1 zeta_2^2).
  $
  In the first case the expansion satisfies the conditions of
  Proposition~@prop:mikhailova, and in the second case it does not. Thus, the
  system
  $
    {h_k (z) chi_1^(alpha_1) (z) chi_2^(alpha_2) (z), k = 1, ..., 6,
      alpha_1, alpha_2 >= 0},
  $
  #source(259)
  where $h_1 = z_1^2 z_2 - z_1 z_2^2$, $h_2 = z_1 z_2 - z_2^2$, $h_3 = z_2$,
  $h_4 = z_1$, $h_5 = z_1^2 - z_1 z_2$, and $h_6 = 1$, forms a basis for
  $A(Delta)$.
] <exm:cubic-polyhedron>

#point <pt:algebraic-singularities-basis> We construct a basis for the space
$A(CC^n without T)$, where $T = {z in CC^n, cal(P)(z) = 0}$, $cal(P)$ being a
polynomial. Without loss of generality it can be assumed that $cal(P)$ has the
form #tagged-equation(
  [27.8$'$],
  $
    cal(P)(z) = z_n^m + A_(m - 1) (attach(z, tl: ')) z_n^(m - 1) + dots.c
    + A_0 (attach(z, tl: ')),
  $,
) <eq:normalized-polynomial>
where $attach(z, tl: ') = (z_1, ..., z_(n - 1))$. Otherwise, we make a linear
change of variables.

For any point $z in CC^n without T$ there is a number $R > 0$ such that
$z in Delta_R subset CC^n without T$, where #tagged-equation(
  [27.9$'$],
  $
    Delta_R & = {z in CC^n: |z_j| < R, j = 1, ..., n - 1,
                1 \/ R < |cal(P)(z)| < R} \
            & = {z: |z_j| < R, j = 1, ..., n - 1, |cal(P)(z)| < R,
                |1 \/ cal(P)(z)| < R}
  $,
) <eq:polynomial-polyhedron>
It is not hard to show that $Delta_R$ is a Weil polyhedron. The distinguished
boundary of $Delta_R$ consists of two components:
$gamma_R = {z: |z_1| = dots.c = |z_(n - 1)| = |cal(P)(z)| = R}$ and
$gamma_R^- = {z: |z_1| = dots.c = |z_(n - 1)| = |1 \/ cal(P)(z)| = R}$. We
observe that $gamma_R^- tilde.op -gamma_R$ in $CC^n without T$. Let
$
  cal(P)(zeta) - cal(P)(z) = sum_(j = 1)^n (zeta_j - z_j) Q_j (zeta, z),
$ <eq:polynomial-hefer-expansion>
where the $Q_j$ ($j = 1, ..., n$) are polynomials. Then
$
  cal(P)^(-1) (zeta) - cal(P)^(-1) (z) = sum_(j = 1)^n (zeta_j - z_j)
  [-Q_j (zeta, z) cal(P)^(-1) (zeta) cal(P)^(-1) (z)];
$
$
  Omega_1 (zeta, z) = mat(
    delim: "|",
    1, 0, dots.c, 0;
    0, 1, dots.c, 0;
    dots.v, dots.v, dots.down, dots.v;
    0, 0, 1, 0;
    Q_1, Q_2, dots.c, Q_n
  ) = Q_n (zeta, z),
$
$
  Omega_2 (zeta, z) = -Q_n (zeta, z) cal(P)^(-1) (zeta) cal(P)^(-1) (z).
$
Let
$
  Q_n (zeta, z) = sum_(k = 1)^N g_k (zeta) h_k (z),
$ <eq:polynomial-hefer-determinant>
where the $g_k$ and $h_k$ are polynomials. According to @eq:rational-weil-series
and @eq:rational-weil-coefficients, any function $f in A(CC^n without T)$ can be
expanded in the Weil polyhedron $Delta_R$ in a series
$
  f(z) = sum_(k = 1)^N sum_(alpha >= 0) a_(k alpha) h_k (z)
  attach(z, tl: ', tr: attach(alpha, tl: ')) cal(P)^(alpha_n) (z)
  + sum_(k = 1)^N sum_(alpha >= 0) b_(k alpha) h_k (z)
  attach(z, tl: ', tr: attach(alpha, tl: ')) cal(P)^(-alpha_n - 1) (z),
$
#source(260)
where
$
  a_(k alpha) = 1 / (2 pi i)^n integral_(gamma_R)
  (f(zeta) g_k (zeta) d zeta)
  / (attach(zeta, tl: ', tr: attach(alpha, tl: ') + attach(upright(I), tl: '))
  cal(P)^(alpha_n + 1) (zeta)), wide
  b_(k alpha) = -1 / (2 pi i)^n integral_(gamma_R^-)
  (f(zeta) g_k (zeta) cal(P)^(alpha_n) d zeta)
  / attach(zeta, tl: ', tr: attach(alpha, tl: ') + attach(upright(I), tl: ')).
$
Passing to the uniform notation
$a_(k alpha_1 dots.c alpha_(n - 1), -alpha_n - 1) = b_(k alpha)$ and taking into
account the fact that $gamma_R^- tilde.op -gamma_R$, we write this expansion in
the form
$
  f(z) = sum_(k = 1)^N sum_(attach(alpha, tl: ') >= attach(0, tl: '))
  sum_(alpha_n = -infinity)^infinity a_(k alpha) h_k (z)
  z_1^(alpha_1) dots.c z_(n - 1)^(alpha_(n - 1)) cal(P)^(alpha_n) (z),
$ <eq:algebraic-series>
where
$
  a_(k alpha) = 1 / (2 pi i)^n integral_(gamma_R)
  (f(zeta) g_k (zeta) d zeta)
  / (zeta_1^(alpha_1 + 1) dots.c zeta_(n - 1)^(alpha_(n - 1) + 1)
  cal(P)^(alpha_n + 1)).
$ <eq:algebraic-coefficients>
Since the cycle $gamma_R$ varies homotopically in $CC^n without T$ as $R$
changes, $R -> infinity$, it follows that the expansion @eq:algebraic-series
with the coefficients @eq:algebraic-coefficients is valid for an
$f in A(CC^n without T)$ in the whole domain $CC^n without T$. Moreover,
@eq:algebraic-series converges uniformly on any compact set
$K subset CC^n without T$.

#proposition[
  Every function $f in A(CC^n without T)$ can be expanded uniquely in a series
  of the form @eq:algebraic-series if and only if $det norm(lambda_(k j)) != 0$,
  where
  $
    lambda_(k j) = 1 / (2 pi i)^n integral_(gamma_R)
    (g_k (zeta) h_j (zeta) d zeta)
    / (zeta_1 dots.c zeta_(n - 1) cal(P)(zeta)).
  $ <eq:algebraic-matrix>
] <prop:algebraic-uniqueness>

#proof[
  The necessity can be proved just as in Proposition~@prop:mikhailova.

  We remark that, by Proposition~@prop:mikhailova, the condition
  $det norm(lambda_(k j)) != 0$ for the $lambda_(k j)$ defined by
  @eq:algebraic-matrix is necessary and sufficient for the expansion of an
  arbitrary function $f in A(Delta_R^*)$ in a series
  $
    f(z) = sum_(k = 1)^N sum_(alpha >= 0) a_(k alpha) h_k (z)
    attach(z, tl: ', tr: attach(alpha, tl: ')) cal(P)^(alpha_n) (z)
  $ <eq:truncated-series>
  to be unique, where
  $Delta_R^* = {z: |z_j| < R, j = 1, ..., n - 1, |cal(P)(z)| < R}$. This remark
  again implies the necessity in Proposition~@prop:algebraic-uniqueness.

  We prove the sufficiency. Suppose that $det norm(lambda_(k j)) != 0$ and that
  $
    0 equiv sum_(k = 1)^N sum_(attach(alpha, tl: ') >= attach(0, tl: '))
    sum_(alpha_n = -infinity)^infinity a_(k alpha) h_k (z)
    attach(z, tl: ', tr: attach(alpha, tl: ')) cal(P)^(alpha_n) (z),
  $
  where the series converges uniformly on compact subsets of $CC^n without T$.
  Let us show that all the coefficients $a_(k alpha)$ are zero. Multiply the
  last equality by the form
  $
    g_j (z) d z \/ (2 pi i)^n
    attach(z, tl: ', tr: attach(beta, tl: ') + attach(upright(I), tl: '))
    cal(P)^(beta_n + 1), quad j = 1, ..., N,
  $
  #source(261)
  and integrate over the cycle $gamma_R$. For $alpha != beta$
  $
    1 / (2 pi i)^n integral_(gamma_R) (g_j (z) h_k (z) d z)
    / (attach(
      z,
      tl: ',
      tr: attach(beta, tl: ') - attach(alpha, tl: ')
      + attach(upright(I), tl: '),
    )
    cal(P)^(beta_n - alpha_n + 1))
    = 0.
  $ <eq:off-diagonal-vanishing>
  Indeed, if $alpha_q > beta_q$ for at least one index $q in {1, ..., n}$, then
  @eq:off-diagonal-vanishing follows from the Cauchy-Poincaré theorem. But if
  $alpha_j <= beta_j$, $j = 1, ..., n$, then the integral on the left-hand side
  of @eq:off-diagonal-vanishing can be regarded as the coefficient of
  $h_j attach(z, tl: ', tr: attach(beta, tl: ') - attach(alpha, tl: '))
  cal(P)^(beta_n - alpha_n)$
  in the expansion of the function $h_k (z) in A(overline(Delta)_R^*)$ in a
  series of the form @eq:truncated-series. This coefficient is equal to zero for
  $beta - alpha != 0$, since the expansion is unique. Thus, taking
  @eq:algebraic-matrix into account, we have
  $
    sum_(k = 1)^N a_(k beta) lambda_(j k) = 0, quad j = 1, ..., N.
  $
  Consequently, $a_(k beta) = 0$, $k = 1, ..., N$, because
  $det norm(lambda_(k j)) != 0$.
]

#theorem[
  The functions
  $
    z_n^(k - 1) z_1^(alpha_1) dots.c z_(n - 1)^(alpha_(n - 1))
    cal(P)^(alpha_n) (z),
  $ <eq:algebraic-basis>
  $
    k = 1, ..., m, wide alpha_1, ..., alpha_(n - 1) = 0, 1, ..., wide
    alpha_n = 0, plus.minus 1, plus.minus 2, ...,
  $
  form a basis in $A(CC^n without T)$, where $T = {z: cal(P)(z) = 0}$, $cal(P)$
  being the polynomial @eq:normalized-polynomial. The expansion coefficients of
  a function $f in A(CC^n without T)$ in the basis @eq:algebraic-basis can be
  expressed by the formulas
  $
    a_(k alpha) = 1 / (2 pi i)^n integral_(gamma_R)
    (f(zeta) [zeta_n^(m - k)
      + sum_(p = k)^(m - 1) A_p (attach(zeta, tl: ')) zeta_n^(p - k)]
    d zeta)
    / (zeta_1^(alpha_1 + 1) dots.c zeta_(n - 1)^(alpha_(n - 1) + 1)
    cal(P)^(alpha_n + 1)),
  $ <eq:algebraic-basis-coefficients>
  where $gamma_R = {z: |z_1| = dots.c = |z_(n - 1)| = |cal(P)(z)| = R}$,
  $R > 0$.
] <th:algebraic-basis>

#proof[
  The polynomial $Q_n (zeta, z)$ in the Hefer expansion
  @eq:polynomial-hefer-expansion can be taken equal to
  $
    Q_n (zeta, z) = [cal(P)(zeta) - cal(P)(attach(zeta, tl: '), z_n)]
    \/ (zeta_n - z_n) = sum_(k = 1)^m z_n^(k - 1)
    [zeta_n^(m - k) + sum_(p = k)^(m - 1) A_p (attach(zeta, tl: '))
      zeta_n^(p - k)].
  $
  From this it is clear that in @eq:polynomial-hefer-determinant we can set
  $
    h_k (z) = z_n^(k - 1), quad
    g_k (zeta) = zeta_n^(m - k)
    + sum_(p = k)^(m - 1) A_p (attach(zeta, tl: ')) zeta_n^(p - k),
    wide k = 1, ..., m.
  $ <eq:polynomial-basis-choice>
  Let us show that the conditions of Proposition~@prop:algebraic-uniqueness hold
  for this choice of the functions $h_k$ and $g_k$. Indeed, for any fixed
  $attach(zeta, tl: ') in CC^(n - 1)$
  $
    1 / (2 pi i) integral_(|cal(P)(zeta)| = R)
    (zeta_n^k d zeta_n) / (cal(P)(zeta))
    = -limits(res)_(z_n = infinity) [z_n^k / (cal(P)(zeta))]
    = cases(0\, quad & k < m - 1\,, 1\, & k = m - 1.)
  $
  #source(262)
  Consequently,
  $
    lambda_(j k) = 1 / (2 pi i)^n integral_(|zeta_1| = R)
    (d zeta_1) / zeta_1 dots.c integral_(|zeta_(n - 1)| = R)
    (d zeta_(n - 1)) / zeta_(n - 1) integral_(|cal(P)(zeta)| = R)
    (zeta_n^(k - 1) g_j (zeta) d zeta_n) / (cal(P)(zeta))
    = cases(0\, quad & k < j\,, 1\, & k = j\,)
  $
  because $deg_(z_n) [z_n^(k - 1) g_j (z)] = m - j + k - 1$ and
  $det norm(lambda_(j k)) = 1 != 0$.
]

In the case @eq:polynomial-basis-choice, i.e., under the conditions of
Theorem~@th:algebraic-basis, @eq:algebraic-series is a generalization of the
expansion @eq:one-variable-expansion for holomorphic functions of $n$ variables
with algebraic singularities.

#small-print[
  #point <pt:linear-factors> In the case where the polynomial $cal(P)(z)$ splits
  into linear factors it is possible to construct a more precise analogue of the
  expansion @eq:one-variable-expansion. Suppose that
  $cal(P)(z) = product_(j = 1)^N L_j (z)$, where
  $L_j (z) = sum_(k = 1)^n a_(j k) z_k + a_(j 0)$, $j = 1, ..., N$. Then
  $T = union.big_1^N E_j$, where $E_j = {z: L_j (z) = 0}$. Assume that
  $L_j != L_k$ for $k != j$, i.e., $cal(P)$ does not contain multiple factors.
  Let $Omega_r$, $0 <= r <= p$, where $p$ is the rank of the matrix
  $norm(a_(j k))$, $j = 1, ..., N$, $k = 1, ..., n$, denote the family of all
  possible maximal subsets $omega_r subset {1, ..., N}$ such that the ranks of
  the matrices
  $
    norm(a_(j k))_(j in omega_r, k = 1, ..., n) quad "and" quad
    norm(a_(j k))_(j in omega_r, k = 0, 1, ..., n)
  $
  are equal to $r$. For each $omega_r$ we choose $n - r$ linear functions
  $L_(k omega_r) (z)$, $k = r + 1, ..., n$, such that the rank of the matrix of
  coefficients of the functions $L_j$, $j in omega_r$, and $L_(k omega_r)$,
  $k = r + 1, ..., n$, is equal to $n$. Let $J(omega_r)$ denote the set of
  multi-indices $alpha = (alpha_1, ..., alpha_r) subset omega_r$, for which the
  ordered systems of functions $L_(alpha_1), ..., L_(alpha_r)$ form a canonical
  family of $r$-systems of the system ${L_j, j in omega_r}$ (see
  @sec:local-residues, @pt:linear-denominators). For $r = 0$ the sets
  $Omega_0 = {omega_0 = emptyset}$ and $J(omega_0) = emptyset$ are assumed to be
  singletons. For each multi-index $alpha in J(omega_r)$, $omega_r in Omega_r$,
  $r = 0, ..., p$, we construct the cycle
  $
    Gamma_alpha = {z: |L_(alpha_1) (z)| = epsilon_1, ...,
      |L_(alpha_r) (z)| = epsilon_r, |L_(k omega_r) (z)| = R,
      k = r + 1, ..., n},
  $
  where $R$ is a sufficiently large number, and $epsilon_r$,
  $epsilon_(r - 1) \/ epsilon_r, ..., epsilon_1 \/ epsilon_2$ are sufficiently
  small positive numbers. The next result holds under these assumptions.

  #theorem(title: [Yuzhakov])[
    Every function $f in A(CC^n without union.big_1^N E_j)$ can be represented
    as a series
    $
      f(z) = sum_(r = 0)^p sum_(omega_r in Omega_r) sum_(alpha in J(omega_r))
      sum_(beta, r) c_(alpha beta) L_(alpha omega_r)^beta (z),
    $
    where
    $
      sum_(beta, r) = sum_(beta_1, ..., beta_r = -infinity)^(-1)
      sum_(beta_(r + 1), ..., beta_n = 0)^infinity, wide
      L_(alpha omega_r)^beta = L_(alpha_1)^(beta_1) dots.c
      L_(alpha_r)^(beta_r) L_(r + 1, omega_r)^(beta_(r + 1)) dots.c
      L_(n, omega_r)^(beta_n).
    $
    This series#ed-note[The 1983 edition lets $beta_1, ..., beta_r$ run from
      $-infinity$ to $infinity$. Then the families of different $r$ overlap: for
      $L_1 = z_1$, $L_2 = z_2$ in $CC^2$ all four families contain the term with
      $beta = 0$, and for $f equiv 1$ the series would be equal to $4$. With
      $beta_1, ..., beta_r <= -1$, as in the expansion
      @eq:one-variable-expansion, each monomial $z_1^a z_2^b$ occurs exactly
      once.] converges uniformly on compact subsets of
    $CC^n without union.big_1^N E_j$, and its coefficients are uniquely
    determined by the formula
    $
      c_(alpha beta) = 1 / (2 pi i)^n integral_(Gamma_alpha)
      (f(z) d L_(alpha omega_r) (z))
      / (L_(alpha omega_r)^(beta + upright(I)) (z)),
    $
    where $d L_(alpha omega_r) = d L_(alpha_1) and dots.c and d L_(alpha_r)
    and d L_(r + 1, omega_r) and dots.c and d L_(n omega_r)$.
  ] <th:yuzhakov-linear-factors>

  This theorem can be proved by using Theorem~@th:yuzhakov-separation along with
  the idea underlying the proof of Theorem~@th:linear-dual-bases.
]
