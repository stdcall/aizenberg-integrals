#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[Application of multiple residues for finding generating
  functions and computing combinatorial sums] <sec:generating-functions>

The main idea for the application of one-dimensional and multidimensional
residues in combinatorial analysis (an idea systematically developed by
Egorychev) runs as follows. Suppose that we must find the generating function of
some multiple combinatorial sequence $c_alpha = c_(alpha_1 dots.c alpha_n)$ or a
combinatorial sum whose general term $c_alpha$ can be expressed with the help of
the addition and #source(203) multiplication operations in terms of the
coefficients of known generating functions. Substituting integral
representations of the coefficients of these known functions (the Taylor
coefficients in integral form) into the power series of the generating function
$F(t) = F(t_1, ..., t_n) = sum_(alpha >= 0) c_alpha t^alpha$ or, respectively,
into the unknown combinatorial sum, then replacing products of integrals by
multiple integrals, and then changing the order of integration and summation, we
get a series or a finite sum under the sign of a multiple integral, and these,
as a rule, are much simpler to convolve than the original expressions. Most
frequently a geometric progression ends up under the integral sign. Computing
the integral of the resulting sum with the help of residues, we find the desired
generating function or combinatorial sum. It is sometimes useful to regard a
combinatorial sum as a term in some combinatorial sequence. We get the desired
sum by finding the generating function for the sequence by the indicated method
and expanding this function in a Taylor series in the usual way.

The following are most often used as initial elementary integral formulas:
$
  binom(a, m) = (a(a - 1) dots.c (a - m + 1)) / (m!)
  = 1 / (2 pi i) integral_(|z| = epsilon) ((1 + z)^a d z) / z^(m + 1), \
  a^n / (n!) = 1 / (2 pi i) integral_(|z| = epsilon) (e^(a z) d z) / z^(n + 1),
$ <eq:elementary-integrals>
and so on.

The next result realizes the idea expounded above for a sufficiently general
situation.

#theorem(title: [Egorychev and Yuzhakov])[
  Suppose that the terms of an $n$-fold numerical sequence
  $c_alpha = c_(alpha_1 dots.c alpha_n)$ can be represented in the form
  $
    c_alpha = 1 / (2 pi i)^n integral_(Gamma_rho)
    (phi(z) [f_1 (z)]^(alpha_1 beta_1) dots.c [f_n (z)]^(alpha_n beta_n) d z)
    / (z_1^(beta_1 (alpha_1 + 1)) dots.c z_n^(beta_n (alpha_n + 1))),
  $ <eq:sequence-integral>
  where $phi, f_j in A(overline(U)_R)$,
  $overline(U)_R = {z in CC^n: norm(z) <= R}$ is some polydisk, and
  $Gamma_rho = {z: |z_1| = dots.c = |z_n| = rho}$, $0 < rho < R$. Then the
  series
  $
    F(t) = sum_(alpha >= 0) c_alpha t^alpha, quad t = (t_1, ..., t_n),
  $ <eq:generating-series>
  converges absolutely in some neighborhood
  $V_epsilon = {t: norm(t) < epsilon}$, and
  $
    F(t) = 1 / (2 pi i)^n integral_(Gamma_rho) (phi(z) d z)
    / (product_(j = 1)^n [z_j^(beta_j) - t_j f_j^(beta_j) (z)]).
  $ <eq:generating-integral>
  #source(204)
  In particular:
  + if $beta_1 = dots.c = beta_n = 1$, then
    $
      & F(t) = lr((phi(z) \/ (partial w) / (partial z)) |)_(z = z(t)) \
      & quad = lr(
          [phi(z) \/ det norm(
              delta_(j k)
              - t_j (partial f_j (z)) / (partial z_k)
            )] |
        )_(z = z(t)),
    $ <eq:generating-simple>
    where
    $
      w_j = z_j - t_j f_j (z), quad j = 1, ..., n,
    $ <eq:simple-substitution>
    and $z = z(t)$ is a zero of @eq:simple-substitution lying in
    $U_rho = {z: norm(z) < rho}$; and
  + if $f_j (0) != 0$, $j = 1, ..., n$, then
    $
      F(t) = sum_(mu in M)
      lr([phi(z) \/ (partial w) / (partial z)] |)_(z = z^((mu)) (t)),
    $ <eq:generating-general>
    where
    $
      w_j = z_j^(beta_j) - t_j f_j^(beta_j) (z), quad j = 1, ..., n,
    $ <eq:general-substitution>
    ${z^((mu)) (t), mu in M}$ is the set of zeros of @eq:general-substitution in
    the polydisk $U_rho$, and
    $M = {mu = (mu_1, ..., mu_n), mu_j = 1, ..., beta_j, j = 1, ..., n}$.
] <th:egorychev-yuzhakov>

For the indicated cases formulas @eq:generating-simple and
@eq:generating-general are expressions of the integral @eq:generating-integral
in terms of multiple residues. In the general case we could not determine
residue formulas for the integral @eq:generating-integral. However, the
computation of the integral @eq:generating-integral does not involve
difficulties in concrete examples. It can sometimes be computed conveniently by
iterated integration.

#proof(title: [Proof of Theorem~@th:egorychev-yuzhakov.])[
  If $z in Gamma_rho$ ($rho$ fixed), $t in V_epsilon$,
  $0 < epsilon < (rho \/ M_j)^(beta_j)$, and
  $M_j = max_(z in Gamma_rho) |f_j (z)|$, $j = 1, ..., n$, then the multiple
  geometric progression
  $
    phi(z) / (product_(j = 1)^n [z_j^(beta_j) - t_j f_j^(beta_j) (z)])
    = sum_(alpha >= 0) phi(z) product_(j = 1)^n
    (t_j^(alpha_j) [f_j (z)]^(beta_j alpha_j)) / z_j^(beta_j (alpha_j + 1))
  $
  converges uniformly and absolutely. Integrating this series termwise over the
  cycle $Gamma_rho$, we get for $t in V_epsilon$ formula @eq:generating-integral
  for the sum of the series @eq:generating-series with coefficients
  @eq:sequence-integral.

  By Lemma~@lem:yuzhakov-homology,
  $
    Gamma_rho tilde.op Gamma_delta
    = {z: |z_j^(beta_j) - t_j f_j^(beta_j) (z)| = delta, j = 1, ..., n},
  $
  for fixed $t in V_epsilon$, where $delta > 0$ is sufficiently small,
  $Gamma_delta = sum_(mu in M) gamma_mu$, $gamma_mu = Gamma_delta inter U_mu$,
  and $U_mu$ is a neighborhood of the zero $z^mu (t)$ of
  @eq:general-substitution. By the Cauchy-Poincaré #source(205)
  Theorem~@th:cauchy-poincare, the integral in @eq:generating-integral is equal
  to
  $
    integral_(Gamma_rho) (phi d z)
    / (product_(j = 1)^n (z_j^(beta_j) - t_j f_j^(beta_j) (z)))
    = sum_(mu in M) integral_(gamma_mu) (phi(z) d z)
    / (product_(j = 1)^n (z_j^(beta_j) - t_j f_j^(beta_j) (z))).
  $ <eq:integral-over-components>
  In case a) the system @eq:general-substitution takes the form
  @eq:simple-substitution and has one simple zero in $U_rho$. In case b) this
  system has $beta_1 dots.c beta_n$ distinct simple zeros in $U_rho$, because
  the systems
  $
    z_j - t_j^(1 \/ beta_j) f_j (z) = 0, quad j = 1, ..., n,
  $
  each have a single simple zero in $U_rho$, and these zeros are distinct for
  distinct values of the root $t_j^(1 \/ beta_j)$ if $f_j (0) != 0$. Since
  $(partial w \/ partial z)|_(z^((mu)) (t)) != 0$, the mapping
  @eq:general-substitution is biholomorphic in a sufficiently small neighborhood
  $U_mu$ of the zero $z^mu (t)$. Performing the change @eq:general-substitution
  in $U_mu$, we get
  $
    & 1 / (2 pi i)^n integral_(gamma_mu) (phi(z) d z)
      / (product_(j = 1)^n [z_j^(beta_j) - t_j f_j^(beta_j) (z)])
      = 1 / (2 pi i)^n integral_(|w_j| = delta, j = 1, ..., n)
      (phi(z(w)) (partial z \/ partial w) d w) / w^II \
    & quad = lr([phi(z(w)) (partial z) / (partial w)] |)_(w = 0)
      = lr([phi(z) \/ (partial w) / (partial z)] |)_(z = z^((mu)) (t)).
  $ <eq:local-change>
  #new-par
  From @eq:local-change and @eq:integral-over-components we obtain
  @eq:generating-general, and then @eq:generating-simple for
  $beta_1 = dots.c = beta_n = 1$.
]

The next theorem, which is important in combinatorics, is a special case of
Theorem~@th:egorychev-yuzhakov.

#theorem(title: [main theorem of MacMahon])[
  Let $X_j = sum_(k = 1)^n a_(k j) x_k$, $j = 1, ..., n$. Then the coefficient
  $b_alpha = b_(alpha_1 dots.c alpha_n)$ of $x_1^(alpha_1) dots.c x_n^(alpha_n)$
  in the expansion of $X_1^(alpha_1) dots.c X_n^(alpha_n)$ is equal to the
  coefficient of $t_1^(alpha_1) dots.c t_n^(alpha_n)$ in the expansion of
  $
    F(t) = mat(
      delim: "|",
      1 - a_11 t_1, -a_21 t_1, , -a_(n 1) t_1;
      -a_12 t_2, 1 - a_22 t_2, dots.c, -a_(n 2) t_2;
      dots, dots, dots, dots;
      dots, dots, dots, dots;
      dots, dots, dots, dots;
      -a_(1 n) t_n, -a_(2 n) t_n, dots.c, 1 - a_(n n) t_n
    )^(-1).
  $ <eq:macmahon-determinant>
] <th:macmahon>

#proof[
  The coefficient $b_alpha$ can be represented in the form
  $
    b_alpha = 1 / (2 pi i)^n integral_(|x_j| = epsilon, j = 1, ..., n)
    (X_1^(alpha_1) dots.c X_n^(alpha_n) d x_1 and dots.c and d x_n)
    / (x_1^(alpha_1 + 1) dots.c x_n^(alpha_n + 1)).
  $
  #source(206)
  By Theorem~@th:egorychev-yuzhakov (see case a)), the generating function
  $F(t) = sum_(alpha >= 0) b_alpha t^alpha$ is determined by
  $
    F(t) = 1 \/
    lr((partial(w_1, ..., w_n)) / (partial(x_1, ..., x_n)) |)_(x = x(t)),
  $
  where $w_j = x_j - t_j X_j$, $j = 1, ..., n$, or @eq:macmahon-determinant.
]

#eg[
  Prove the identity
  $
    sum_(k = 0)^N binom(m, k) binom(n, k) binom(m + n + p - k, m + n)
    = binom(m + p, m) binom(n + p, n),
  $ <eq:binomial-identity>
  where $m, n, p > 0$ and $N = min(m, n, p)$. We solve the problem of computing
  the combinatorial sum
  $
    A_(m n) = sum_(k = 0)^N binom(m, k) binom(n, k) binom(m + n + p - k, m + n).
  $
  Using @eq:elementary-integrals and the fact that
  $
    integral_(|z| = epsilon) ((1 + z)^m d z) / z^(k + 1) = 0
  $
  for $k > m$, we represent $A_(m n)$ in the form
  $
    A_(m n) & = sum_(k = 0)^infinity 1 / (2 pi i)^3
              integral_(|z_1| = rho_1) ((1 + z_1)^m d z_1) / z_1^(k + 1)
              integral_(|z_2| = rho_2) ((1 + z_2)^n d z_2) / z_2^(k + 1) \
            & quad times integral_(|z_3| = rho_3)
              ((1 + z_3)^(m + n + p - k) d z_3) / z_3^(m + n + 1).
  $
  Consider the generating function of the sequence $A_(m n)$:
  $
    & F(u, v) = sum_(m, n = 0)^infinity A_(m n) u^m v^n
      = sum_(m, n, k = 0)^infinity 1 / (2 pi i)^3 integral_Gamma
      [(u(1 + z_1)(1 + z_3)) / z_3]^m \
    & quad times [(v(1 + z_2)(1 + z_3)) / z_3]^n [1 / (z_1 z_2 (1 + z_3))]^k
      (1 + z_3)^p / (z_1 z_2 z_3) d z_1 and d z_2 and d z_3,
  $ <eq:binomial-generating-integral>
  where $Gamma = {z: |z_j| = rho_j, j = 1, 2, 3}$. For $rho_1 = rho_2 = 2$,
  $rho_3 = 1 / 2$, $|u| < 1 / 9$, and $|v| < 1 / 9$ it is possible to
  interchange the summation and integration in @eq:binomial-generating-integral,
  #source(207) because the triple geometric progression then converges uniformly
  on $Gamma$. An argument similar to that for @eq:generating-integral yields
  $
    & F(u, v) = 1 / (2 pi i)^3 \
    & quad times integral_Gamma
      ((1 + z_3)^(p + 1) z_3 d z_1 and d z_2 and d z_3)
      / ([z_3 - u(1 + z_1)(1 + z_3)] [z_3 - v(1 + z_2)(1 + z_3)]
      [z_1 z_2 (1 + z_3) - 1]).
  $
  Computing the integral obtained as an iterated integral, we find that
  $
    F(u, v) = 1 / ((1 - u)^(p + 1) (1 - v)^(p + 1)).
  $
  The Taylor expansion of this function has the form
  $
    F(u, v) = sum_(m, n = 0)^infinity binom(m + p, m) binom(n + p, n) u^m v^n.
  $
  From this and @eq:binomial-generating-integral, we get @eq:binomial-identity.
] <exm:binomial-identity>

#eg[
  Compute the sum
  $
    S_m = sum_(k = 0)^m (-1)^k binom(m, k)^3.
  $
  With the help of @eq:elementary-integrals, taking account of the fact that
  $
    integral_(|z| = epsilon) (1 + z)^m d z \/ z^(k + 1) = 0
  $
  for $k > m$, we find the integral representation
  $
    S_m = sum_(k = 0)^infinity (-1)^k / (2 pi i)^3 integral_Gamma
    (1 + z_1)^m / z_1^(m - k + 1) (1 + z_2)^m / z_2^(m - k + 1)
    (1 + z_3)^m / z_3^(k + 1) d z_1 and d z_2 and d z_3,
  $
  where $Gamma = {z: |z_j| = rho_j, j = 1, 2, 3}$. To assure that not all the
  variable powers end up in the denominator, we use the identity
  $binom(m, k) = binom(m, m - k)$. Interchanging the summation and integration,
  we get for $rho_1 = rho_2 = 1$ and $rho_3 = 2$ that
  $
    S_m = 1 / (2 pi i)^3 integral_Gamma
    ((1 + z_1)^m (1 + z_2)^m (1 + z_3)^m)
    / (z_1^(m + 1) z_2^(m + 1) (z_3 + z_1 z_2))
    d z_1 and d z_2 and d z_3.
  $
  The integration with respect to $z_3$ yields
  $
    S_m = 1 / (2 pi i)^2 integral_(|z_1| = |z_2| = 1)
    ((1 + z_1)^m (1 + z_2)^m (1 - z_1 z_2)^m d z_1 and d z_2)
    / (z_1^(m + 1) z_2^(m + 1)).
  $
  If we now seek the generating function immediately for $S_m$, we get a double
  integral whose direct computation leads either to the original power series or
  to #source(208) the period of an elliptic integral. Therefore, it is expedient
  to consider the double sequence
  $
    R_(m n) = 1 / (2 pi i)^2 integral_(|z_1| = |z_2| = 1)
    ((1 + z_1)^m (1 + z_2)^m (1 - z_1 z_2)^n d z_1 and d z_2)
    / (z_1^(m + 1) z_2^(n + 1)),
  $
  for which $R_(m m) = S_m$. Theorem~@th:egorychev-yuzhakov (see case a)) can
  now be applied to the sequence $R_(m n)$. By @eq:generating-series and
  @eq:generating-simple, elementary computations give us
  $
    F(t_1, t_2) & = sum_(m, n = 0)^infinity R_(m n) t_1^m t_2^n \
                & = 1 / (2 pi i)^2 integral_(|z_1| = |z_2| = 1)
                  (d z_1 and d z_2)
                  / ([z_1 - t_1 (1 + z_1)(1 + z_2)] [z_2 - t_2 (1 - z_1 z_2)]) \
                & = [(1 - t_1)^2 + 4 t_1 t_2^2]^(-1 \/ 2).
  $
  Expanding this function in a binomial series first with respect to $t_2$ and
  then with respect to $t_1$, we find that
  $
    R_(m n) = cases(
      0 & "for" n "odd"\,,
      ((-1)^p (m + p)!) / ((p!)^2 (m - p)!) quad & "for" n = 2p.
    )
  $
  Hence,
  $
    S_m = sum_(k = 0)^m (-1)^k binom(m, k)^3
    = cases(
      0 & "for" m "odd"\,,
      ((-1)^p (3p)!) / ((p!)^3) quad & "for" m = 2p.
    )
  $
] <exm:dixon-sum>
