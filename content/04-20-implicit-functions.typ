#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[Expansion of implicit functions in power series and function
  series] <sec:implicit-functions>

#source(151)
#point <pt:lagrange-expansion> The logarithmic residue for holomorphic functions
of a single complex variable can be used to easily derive the Lagrange expansion
(see @bib:Markushevich1967, @bib:Whittaker1927, and @bib:Goursat1929)
$
  F(z(zeta)) = F(z_0) + sum_(k = 1)^infinity zeta^k / k!
  d^(k - 1) / (d z^(k - 1)) [F'(z) Psi^k (z)]_(z = z_0),
$ <eq:lagrange>
which expresses the function $F(z)$ in terms of the variable $zeta$ connected
with $z$ by the equation $z = z_0 + zeta Psi(z)$ when $F(z)$ and $Psi(z)$ are
holomorphic functions in a neighborhood of the point $z_0 in CC^1$. In
particular, we obtain the Bürmann-Lagrange series (see @bib:Whittaker1927 and
@bib:Shabat1976a), which enables us to represent one holomorphic function
$Phi(z)$ as a series of powers of another holomorphic function
$w = f(z) = (z - z_0) Psi(z)$, $Psi(z_0) != 0$, in a neighborhood of a point
$z_0 in CC^1$:
$
  Phi(z) = Phi(z_0) + sum_(k = 1)^infinity w^k / k!
  d^(k - 1) / (d z^(k - 1))
  lr([(Phi'(z)) / (Psi^k (z))] |)_(z = z_0).
$ <eq:burmann-lagrange>
For $Phi(z) equiv z$ the series @eq:burmann-lagrange provides an inversion of
the holomorphic function $w = f(z)$ in a neighborhood of $z_0$.

In this section we use the multiple logarithmic residue to derive
generalizations of the Lagrange expansion @eq:lagrange for the case of arbitrary
implicit functions determined by a system of equations, along with inversion
formulas for a holomorphic mapping in $CC^n$, and we consider the determination
of a #source(152) single-valued branch of an implicit function in some
degenerate cases and estimate the domain of convergence and the remainder for
the series obtained.

#point <pt:implicit-lagrange> *Generalization of the Lagrange expansion to
systems of arbitrary implicit functions.* Suppose that $Phi(w, z)$ and
$
  F_j (w, z), quad j = 1, ..., n,
$ <eq:implicit-system-functions>
are holomorphic functions of the variables $w = (w_1, ..., w_m)$ and
$z = (z_1, ..., z_n)$ in a neighborhood of the point $(0, 0) in CC^(m + n)$,
with $F_j (0, 0) = 0$, $j = 1, ..., n$, and
$
  lr((partial F) / (partial z) |)_((0, 0))
  = lr((partial(F_1, ..., F_n)) / (partial(z_1, ..., z_n)) |)_((0, 0)) != 0.
$
By a theorem on the existence of implicit functions (see @bib:Hormander1966 and
@bib:Shabat1976b), the system of equations
$
  F_j (w, z) = 0, quad j = 1, ..., n,
$ <eq:implicit-system>
determines uniquely in a neighborhood of $(0, 0) in CC^(m + n)$ a system of
functions
$
  z_j = phi_j (w), quad j = 1, ..., n med (z = phi(w)),
$ <eq:implicit-functions>
that are holomorphic in a neighborhood of the point $0 in CC^m$. We consider the
problem of finding an explicit representation of $Phi(w, phi(w))$ and, in
particular (for $Phi(w, z) equiv z_j$) of the functions @eq:implicit-functions.
Without loss of generality it can be assumed that
$
  F_j (0, 0) = 0, quad (partial F_j (0, 0)) / (partial z_k) = delta_(j k),
  quad j, k = 1, ..., n.
$ <eq:implicit-normalization>
In case this does not hold we can replace @eq:implicit-system by the equivalent
system
$
  norm((partial F_j (0, 0)) / (partial z_k))^(-1) dot.c F(w, z) = 0.
$

#theorem[
  Suppose that the functions @eq:implicit-system-functions satisfy the
  conditions @eq:implicit-normalization. Then there exist numbers $epsilon > 0$
  and $delta > 0$ such that the integral representation
  $
    Phi(w, phi(w)) = 1 / (2 pi i)^n integral_(Gamma_epsilon)
    (Phi(w, z)) / (F^upright(I) (w, z)) (partial F) / (partial z) d z
  $ <eq:implicit-integral>
  holds in the closed polydisk
  $overline(V)_delta = {w in CC^m: |w_j| <= delta, j = 1, ..., m}$, where
  $F^upright(I) = F_1 dots.c F_n$ and
  $Gamma_epsilon = {z: |z_1| = dots.c = |z_n| = epsilon}$. For
  $Phi(w, z) equiv z_j$ formula @eq:implicit-integral gives an integral
  representation of the implicit functions @eq:implicit-functions determined by
  the equations @eq:implicit-system.
] <th:implicit-integral>

#source(153)
#proof[
  It follows from @eq:implicit-normalization that the Taylor series of the
  function $g_j (w, z) = F_j (w, z) - z_j$, $j = 1, ..., n$, at $(0, 0)$
  contains neither a free term nor terms of first degree in the variables
  $z_1, ..., z_n$. Consequently, there exist numbers $delta > 0$ and
  $epsilon > 0$ such that for any $w in overline(V)_delta$ and
  $z in Gamma_epsilon$
  $
    |g_j (w, z)| < |z_j| = epsilon, quad j = 1, ..., n.
  $
  Since the system of functions $z = (z_1, ..., z_n)$ has a unique simple zero
  at $0 in CC^n$, Theorem~@th:yuzhakov tells us that for any
  $w in overline(V)_delta$ the system @eq:implicit-system has a unique solution
  $z = phi(w) in U_epsilon = {z: |z_j| < epsilon, j = 1, ..., n}$, and
  @eq:implicit-integral holds by @eq:yuzhakov.
]

#theorem(title: [Yuzhakov])[
  Under the conditions of Theorem~@th:implicit-integral the function
  $Phi(w, phi(w))$ can be represented in some polydisk $overline(V)_delta$ by an
  absolutely and uniformly convergent multiple function series
  $
    Phi(w, phi(w)) = sum_(beta >= 0) (-1)^(|beta|) / beta!
    D_z^beta lr([Phi(w, z) g^beta (w, z) (partial F) / (partial z)] |)_(z
    = h(w)),
  $ <eq:implicit-series>
  where $h = (h_1, ..., h_n)$ is an arbitrary vector-valued function that is
  holomorphic in $overline(V)_delta$ with $h(0) = 0$,
  $g^beta = g_1^(beta_1) dots.c g_n^(beta_n)$,
  $beta! = beta_1 ! dots.c beta_n !$, $|beta| = beta_1 + dots.c + beta_n$ and
  $g_j (w, z) = F_j (w, z) - z_j + h_j (w)$, $j = 1, ..., n$.
] <th:yuzhakov-implicit-series>

#remark[
  It is frequently convenient to take $h_j (w) equiv 0$ or
  $h_j (w) equiv F_j (w, 0)$, $j = 1, ..., n$.
]

#proof[
  There exist $delta > 0$ and $epsilon > 0$ such that $|h_j (w)| < epsilon \/ 2$
  and $|g_j (w, z)| < epsilon \/ 2$ for $w in overline(V)_delta$ and
  $z in Gamma_epsilon$. Then the fraction $1 \/ F$ can be expanded in a multiple
  geometric progression
  $
    1 / (product_(j = 1)^n F_j (w, z))
    & = 1 / (product_(j = 1)^n (z_j - h_j)[1 + g_j \/ (z_j - h_j)]) \
    & = sum_(beta >= 0) ((-1)^(|beta|) g^beta (w, z))
    / ([z - h(w)]^(beta + upright(I))),
  $
  which converges absolutely and uniformly on the compact set
  $overline(V)_delta times Gamma_epsilon$. Substituting this in
  @eq:implicit-integral and integrating termwise, we get the series
  $
    Phi(w, phi(w)) = sum_(beta >= 0) (-1)^(|beta|) / (2 pi i)^n
    integral_(Gamma_epsilon)
    (Phi(w, z) g^beta (w, z) (partial F \/ partial z) d z)
    / ([z - h(w)]^(beta + upright(I))),
  $ <eq:implicit-series-integrals>
  which, according to Corollary~@cor:cauchy-derivatives, coincides with the
  series @eq:implicit-series.
]

#proposition[
  The coefficients in the Taylor expansion
  $
    Phi(w, phi(w)) = sum_(alpha >= 0) c_alpha w^alpha,
    quad alpha = (alpha_1, ..., alpha_m),
  $ <eq:implicit-taylor>
  #source(154)
  are determined by the formula
  $
    c_alpha = sum_(|beta| <= 2 |alpha|) (-1)^(|beta|) / (alpha! beta!)
    D_(w, z)^(alpha, beta)
    lr([Phi(w, z) g^beta (w, z) (partial F) / (partial z)] |)_((0, 0)),
  $ <eq:implicit-taylor-coefficients>
  where $g^beta = g_1^(beta_1) dots.c g_n^(beta_n)$ and
  $g_j (w, z) = F_j (w, z) - z_j$, $j = 1, ..., n$.
] <prop:implicit-taylor>

#proof[
  Let us expand $Phi(w, phi(w))$ in a Taylor series @eq:implicit-taylor with
  coefficients in integral form. Since the series @eq:implicit-series-integrals
  converges uniformly on $overline(V)_delta$, it can be integrated termwise over
  $gamma_delta = {w: |w_1| = dots.c = |w_m| = delta}$. Here we set
  $h(w) equiv 0$ and get
  $
    c_alpha & = 1 / (2 pi i)^m integral_(gamma_delta)
              (Phi(w, phi(w)) d w) / (w^(alpha + upright(I))) \
            & = sum_(beta >= 0) (-1)^(|beta|) / (2 pi i)^(m + n)
              integral_(gamma_delta times Gamma_epsilon)
              (Phi(w, z) g^beta (w, z) (partial F \/ partial z) d w and d z)
              / (w^(alpha + upright(I)) z^(beta + upright(I))).
  $ <eq:implicit-taylor-integrals>
  With the help of the binomial formula the integrals in the terms of
  @eq:implicit-taylor-integrals can be represented in the form
  $
    sum_(0 <= mu <= beta) beta! / (mu! (beta - mu)!)
    integral_(gamma_delta times Gamma_epsilon)
    (Phi Psi^mu theta^(beta - mu) (partial F \/ partial z) d w and d z)
    / (w^(alpha + upright(I)) z^(beta + upright(I))),
  $ <eq:binomial-integrals>
  where $Psi(w) = g(w, 0)$, $theta(w, z) = g(w, z) - Psi(w)$,
  $mu = (mu_1, ..., mu_n)$ and
  $beta - mu = (beta_1 - mu_1, ..., beta_n - mu_n)$. Since the order $d_0 (Psi)$
  of the zero is at least 1, while $d_((0, 0)) (theta) >= 2$, and
  $integral_(gamma_delta times Gamma_epsilon) w^alpha z^beta d w and d z != 0$
  only for $alpha_1 = dots.c = alpha_m = beta_1 = dots.c = beta_n = -1$, it
  follows that the integrals in @eq:binomial-integrals are equal to zero for
  $|mu| > |alpha|$ as well as for
  $|mu| + 2 |beta - mu| = 2 |beta| - |mu| > |alpha| + |beta|$ and, consequently,
  for $|beta| > 2 |alpha|$. Taking this and Corollary~@cor:cauchy-derivatives
  into account, we get @eq:implicit-taylor-coefficients from
  @eq:implicit-taylor-integrals.
]

For $n = 1$ the formulas @eq:implicit-series and
@eq:implicit-taylor-coefficients can be somewhat simplified.

#proposition[
  Suppose that $F(w, z)$, $Phi(w, z)$, and $h(w)$ are holomorphic functions of
  the variables $w = (w_1, ..., w_m) in CC^m$ and $z in CC^1$ in a neighborhood
  of the point $(0, 0) in CC^(m + 1)$, with $F(0, 0) = 0$, $F'_z (0, 0) = 1$,
  and $h(0) = 0$. Then the function $Phi(w, phi(w))$, where $z = phi(w)$ is the
  implicit function determined by the equation $F(w, z) = 0$, can be represented
  by the function series
  $
    Phi(w, phi(w)) = & Phi(w, h(w)) \
                     & + sum_(k = 1)^infinity (-1)^k / k!
                       (partial^(k - 1)) / (partial z^(k - 1))
                       lr([Phi'_z (w, z) g^k (w, z)] |)_(z = h(w)),
  $ <eq:implicit-one-variable-series>
  #source(155)
  where $g(w, z) = F(w, z) - z + h(w)$, as well as by the multiple power series
  $Phi(w, phi(w)) = sum_(alpha >= 0) c_alpha w^alpha$ whose coefficients are
  given by
  $
    c_alpha = 1 / alpha! D_w^alpha Phi(0, 0)
    + sum_(k = 1)^(2 |alpha|) (-1)^k / (k! alpha!)
    lr(D_(w, z)^(alpha, k - 1) (Phi'_z g^k) |)_((0, 0)),
  $ <eq:implicit-one-variable-coefficients>
  where $g(w, z) = F(w, z) - z$.
] <prop:implicit-one-variable>

#proof[
  For $n = 1$ formula @eq:implicit-series can be represented in the form
  $
    Phi(w, phi(w)) & = sum_(k = 0)^infinity (-1)^k / k!
                     (partial^k) / (partial z^k)
                     lr(
                       [Phi(w, z) g^k (w, z)
                         (1 + (partial g) / (partial z))] |
                     )_(z = h(w)) \
                   & = Phi(w, h(w)) + sum_(k = 1)^infinity (-1)^k / k!
                     d^(k - 1) / (d z^(k - 1))
                     lr([d / (d z) (Phi g^k)] |)_(z = h(w)) \
                   & quad - sum_(k = 1)^infinity (-1)^k / k!
                     (partial^(k - 1)) / (partial z^(k - 1))
                     lr((Phi (partial g^k) / (partial z)) |)_(z = h(w)),
  $
  or in the form @eq:implicit-one-variable-series. Formula
  @eq:implicit-one-variable-coefficients can be obtained from
  @eq:implicit-one-variable-series in the same way as in
  Proposition~@prop:implicit-taylor.
]

Observe that the Lagrange series @eq:lagrange is obtained from
@eq:implicit-one-variable-series when $m = 1$, $h(w) = 0$,
$g(w, z) = -w Psi(z)$, and $w = zeta$, if $z - z_0$ is taken in place of $z$.

#point <pt:local-inversion> *Local inversion of a holomorphic mapping in
$CC^n$.* The following is a particular case of the problem just considered.
Suppose that in a neighborhood of $0 in CC^n$ we are given a holomorphic mapping
$
  w_j = f_j (z), quad j = 1, ..., n med (w = f(z)),
$ <eq:mapping-to-invert>
satisfying the condition
$
  f_j (0) = 0, quad (partial f_j (0)) / (partial z_k) = delta_(j k),
  quad j, k = 1, ..., n,
$ <eq:mapping-normalization>
and a holomorphic function $Phi(z)$. It is required to express $Phi(z)$ in terms
of the variables $w = (w_1, ..., w_n)$ and, in particular, to find the mapping
$
  z_j = phi_j (w), quad j = 1, ..., n med (z = phi(w)),
$ <eq:local-inverse>
inverse to @eq:mapping-to-invert in a neighborhood of $0 in CC^n$.

#theorem[
  Under the above assumptions, the expansion
  $
    Phi(phi(w)) = sum_(beta >= 0) (-1)^(|beta|) / beta!
    D^beta lr([Phi(z) g^beta (z) (partial f) / (partial z)] |)_(z = w)
  $ <eq:inversion-series>
  #source(156)
  is valid in a neighborhood of $0 in CC^n$, where
  $g^beta = g_1^(beta_1) dots.c g_n^(beta_n)$, and $g_j (z) = f_j (z) - z_j$,
  $j = 1, ..., n$. For $Phi(z) equiv z_j$, $j = 1, ..., n$, the series
  @eq:inversion-series gives an inversion formula for the holomorphic mapping
  @eq:mapping-to-invert.
] <th:inversion-series>

#proof[
  In Theorem~@th:yuzhakov-implicit-series we set $m = n$,
  $F_j (w, z) = f_j (z) - w_j$, and $h_j (w) = w_j$, and get
  @eq:inversion-series.
]

#proposition[
  The expansion coefficients of the function $Phi(z)$ in a series
  $
    Phi(z) = sum_(alpha >= 0) c_alpha f^alpha (z)
    quad (Phi(phi(w)) = sum_(alpha >= 0) c_alpha w^alpha)
  $ <eq:inversion-expansion>
  with respect to the functions @eq:mapping-to-invert can be expressed by the
  formula
  $
    c_alpha = sum_(|beta| <= |alpha|) (-1)^(|beta|) / (alpha! beta!)
    D^(alpha + beta)
    lr([Phi(z) g^beta (z) (partial f) / (partial z)] |)_(z = 0).
  $ <eq:inversion-coefficients>
] <prop:inversion-coefficients>

#proof[
  Applying the Taylor expansion to @eq:inversion-series and taking into account
  that $d_0 (g_j) >= 2$, we get @eq:inversion-expansion and
  @eq:inversion-coefficients.
]

The series @eq:inversion-series–@eq:inversion-coefficients can be regarded as
multidimensional analogues of the Bürmann-Lagrange series @eq:burmann-lagrange.
For the special case of the functions @eq:mapping-to-invert we get a sharper
analogue of the series @eq:burmann-lagrange.

#theorem(title: [Stieltjes, Poincaré and Good])[
  If the components of the mapping @eq:mapping-to-invert have the form
  $
    w_j = f_j (z) = z_j Psi_j (z), quad Psi_j (0) != 0, quad j = 1, ..., n,
  $
  then the following expansion is valid: #tagged-equation(
    [20.19$'$],
    $
      Phi(phi(w)) = sum_(alpha >= 0) w^alpha / alpha!
      D^alpha lr(
        [(Phi(z)) / (Psi^alpha (z))
          det norm(
            delta_(j k) + z_j / (Psi_j (z))
            (partial Psi_j) / (partial z_k)
          )] |
      )_(z = 0).
    $,
  ) <eq:stieltjes-poincare-good>
] <th:stieltjes-poincare-good>

#proof[
  Let $m = n$, $F_j (w, z) = f_j (z) - w_j$, and $Phi(w, z) = Phi(z)$ in
  @eq:implicit-integral. Expanding the fraction
  $
    product_(j = 1)^n 1 / ([f_j (z) - w_j])
    = product_(j = 1)^n 1 / (f_j (1 - w_j \/ f_j))
  $
  in a multiple geometric progression, we get
  $
    Phi(phi(w)) = 1 / (2 pi i)^n integral_(Gamma_epsilon)
    (Phi(z) (partial f \/ partial z) d z) / ([f(z) - w]^upright(I))
    = sum_(alpha >= 0) w^alpha / (2 pi i)^n integral_(Gamma_epsilon)
    (Phi(z) (partial f \/ partial z) d z)
    / (z^(alpha + upright(I)) Psi^(alpha + upright(I)) (z)).
  $
  Since
  $
    (partial f) / (partial z)
    = det norm(delta_(j k) Psi_j (z) + z_j (partial Psi_j) / (partial z_k)),
  $
  #source(157)
  Corollary~@cor:cauchy-derivatives tells us that the series obtained can be
  written in the form @eq:stieltjes-poincare-good.
]

We indicate a case of inversion of the holomorphic mapping @eq:mapping-to-invert
when $(partial f \/ partial z)|_0 = 0$.

#proposition[
  Suppose that the functions of the system @eq:mapping-to-invert have the form
  $
    w_j = z_j^(k_j) Psi_j (z), quad k_j >= 1, quad Psi_j (0) = 1,
    quad j = 1, ..., n.
  $
  Then in some neighborhood of the point $0 in CC^n$ the inverse of the mapping
  @eq:mapping-to-invert is $(k_1 dots.c k_n)$-valued, has branchings of orders
  $k_j$ on the coordinate planes $w_j = 0$, and can be represented by a series
  in fractional powers of $w$:
  $
    z_j = w_j^(1 \/ k_j) + sum_(|alpha| >= 2) w^(alpha \/ k) / alpha!
    D^alpha lr(
      [z_j / (Psi^((alpha + upright(I)) \/ k) (z))
        det norm((partial(z_j Psi_j^(1 \/ k_j))) / (partial z_k))] |
    )_(z
    = 0),
  $
  where $alpha \/ k = (alpha_1 \/ k_1, ..., alpha_n \/ k_n)$.
] <prop:branched-inversion>

#point <pt:taylor-coefficients> *Expression of the Taylor coefficients of
implicit functions in terms of the Taylor coefficients of the functions
appearing in the equations. Inversion of a system of power series.* Suppose that
the functions @eq:implicit-system-functions are given as power series
$
  F_j (w, z) = z_j + sum'_(mu, nu) a_(j mu nu) w^mu z^nu, quad j = 1, ..., n.
$ <eq:implicit-power-series>
Here and below we assume that the multi-indices $mu = (mu_1, ..., mu_m)$ and
$nu = (nu_1, ..., nu_n)$ in $sum'_(mu, nu)$, $product'_(mu, nu)$ and
${ }'_(mu, nu)$ run through all possible tuples of nonnegative integers for
which $|mu| + |nu| >= 2$ or $|mu| = 1$, $|nu| = 0$. Let
$
  Phi(w, z) = sum_((alpha, beta) >= (0, 0)) b_(alpha beta) w^alpha z^beta.
$ <eq:phi-power-series>

#theorem(title: [Yuzhakov and Bolotov])[
  The coefficients in the Taylor series @eq:implicit-taylor of the function
  $Phi(w, phi(w))$, where $z = phi(w)$ is the implicit vector-valued function
  determined by @eq:implicit-system, can be expressed in terms of the
  coefficients of @eq:implicit-power-series and @eq:phi-power-series by the
  formula
  $
    c_alpha = sum_(eta, tau, S) (-1)^(|rho(S)|) b_(eta tau) Delta(S)
    product_(j = 1)^n [rho(S_j) - 1]!
    product'_(mu, nu) 1 / (s_(j mu nu) !) (a_(j mu nu))^(s_(j mu nu)),
  $ <eq:yuzhakov-bolotov>
  where $S = (S_1, ..., S_n)$, and $S_j = {s_(j mu nu)}'_(mu, nu)$ are finitely
  nonzero sequences of nonnegative integers,
  $rho(S) = (rho(S_1), ..., rho(S_n))$, $rho(S_j) = sum'_(mu, nu) s_(j mu nu)$,
  $Delta(S) = det norm(delta_(k j) rho(S_j) - sigma_k (S_j))_(j, k = 1, ..., n)$
  with $sigma_k (S_j) = sum'_(mu, nu) nu_k s_(j mu nu)$ and $delta_(k j)$ the
  Kronecker #source(158) symbol, and the summation in $sum_(eta, tau, S)$ is
  over all possible multi-indices $eta = (eta_1, ..., eta_m)$,
  $tau = (tau_1, ..., tau_n)$ and systems $S = (S_1, ..., S_n)$ such that
  $
    eta_k + sum_(j = 1)^n lambda_k (S_j) & = alpha_k,
                                           quad             && k = 1, ..., m, \
     tau_k + sum_(j = 1)^n sigma_k (S_j) & = rho(S_k), quad && k = 1, ..., n,
  $ <eq:yuzhakov-bolotov-conditions>
  with $lambda_k (S_j) = sum'_(mu, nu) mu_k s_(j mu nu)$. If $S$ contains an
  $S_j$ for which $rho(S_j) = 0$, then it is necessary to replace
  $[rho(S_j) - 1]!$ by 1 in the corresponding term of @eq:yuzhakov-bolotov, and
  $delta_(k j) rho(S_j) - sigma_k (S_j)$ by $delta_(k j)$ in $Delta(S)$.
] <th:yuzhakov-bolotov>

#proof[
  From @eq:implicit-integral and the first part of @eq:implicit-taylor-integrals
  we get an integral formula for the coefficients in the Taylor series for
  $Phi(w, phi(w))$:
  $
    c_alpha = 1 / (2 pi i)^(m + n) integral_(gamma_delta times Gamma_epsilon)
    (Phi(w, z) (partial F \/ partial z) d w and d z)
    / (F^upright(I) (w, z) w^(alpha + upright(I))).
  $ <eq:taylor-coefficient-integral>
  The function
  $
    (Phi(w, z)) / (F^upright(I) (w, z)) (partial F) / (partial z)
    = Phi(w, z) (partial ln F(w, z)) / (partial z)
  $ <eq:logarithmic-jacobian>
  is holomorphic on the $(n + m)$-circular compact set
  $overline(V)_delta times Gamma_epsilon$ and can be expanded in a multiple
  Laurent series on it. It follows from @eq:taylor-coefficient-integral that the
  coefficient $c_alpha$ is equal to the coefficient of $w^alpha z^(-upright(I))$
  in this series. The expansion of the function @eq:logarithmic-jacobian in a
  Laurent series can be found directly. Taking into account that the
  inequalities $|g_j (w, z)| < |z_j| = epsilon$, $j = 1, ..., n$, hold for
  $w in overline(V)_delta$ and $z in Gamma_epsilon$, where
  $g_j (w, z) = F_j (w, z) - z_j = sum'_(mu, nu) a_(j mu nu) w^mu z^nu$, we get
  the expansions
  $
    ln F_j (w, z) & = ln z_j + ln[1 + g_j (w, z) \/ z_j] \
    & = ln z_j + sum_(p = 1)^infinity (-1)^(p - 1) g_j^p (w, z) \/ p z_j^p \
    & = ln z_j + sum_(p = 1)^infinity (-1)^(p - 1) (p - 1)!
    sum_(rho(S_j) = p)
    [product'_(mu, nu) 1 / (s_(j mu nu) !) dot.c
      (a_(j mu nu))^(s_(j mu nu))] \
    & quad times w^(lambda(S_j)) z^(sigma(S_j) - rho(S_j) e_j) \
    & = ln z_j + sum_(rho(S_j) >= 1) (-1)^(rho(S_j) - 1) [rho(S_j) - 1]!
    [product'_(mu, nu) 1 / (s_(j mu nu) !) (a_(j mu nu))^(s_(j mu nu))] \
    & quad times w^(lambda(S_j)) z^(sigma(S_j) - rho(S_j) e_j),
    quad j = 1, ..., n,
  $
  #source(159)
  where $e_j = (delta_(j 1), ..., delta_(j n))$,
  $lambda(S_j) = (lambda_1 (S_j), ..., lambda_m (S_j))
  = sum'_(mu, nu) mu s_(j mu nu)$, and
  $sigma(S_j) = (sigma_1 (S_j), ..., sigma_n (S_j))
  = sum'_(mu, nu) nu s_(j mu nu)$. Hence,
  $
    (partial ln F_j (w, z)) / (partial z_k)
    & = delta_(j k) / z_j + sum_(rho(S_j) >= 1) (-1)^(rho(S_j))
    [rho(S_j) - 1]! \
    & quad times
    [product'_(mu, nu) 1 / (s_(j mu nu) !) (a_(j mu nu))^(s_(j mu nu))]
    [delta_(k j) rho(S_j) - sigma_k (S_j)] \
    & quad times w^(lambda(S_j)) z^(sigma(S_j) - rho(S_j) e_j - e_k),
    quad j, k = 1, ..., n.
  $ <eq:log-derivative-expansion>
  The term $delta_(j k) \/ z_j$ in @eq:log-derivative-expansion can be regarded
  as the term on the sum $sum_(rho(S_j) >= 0) dots.c$ when $rho(S_j) = 0$, with
  account taken of the conventions adopted in the formulation of the theorem.
  Substituting @eq:log-derivative-expansion in the Jacobian
  $partial(ln F) \/ partial z$ and taking the summation signs and common factors
  in the rows and columns out from under the determinant sign, we get
  $
    (partial ln F(w, z)) / (partial z)
    & = sum_S (-1)^(|rho(S)|) Delta(S) {product_(j = 1)^n [rho(S_j) - 1]! \
      & quad times product'_(mu, nu) 1 / (s_(j mu nu) !)
      (a_(j mu nu))^(s_(j mu nu))}
    w^(lambda(S)) z^(sigma(S) - rho(S) - upright(I)),
  $ <eq:log-jacobian-expansion>
  where $lambda(S) = lambda(S_1) + dots.c + lambda(S_n)$ and
  $sigma(S) = sigma(S_1) + dots.c + sigma(S_n)$. Multiplying out the series
  @eq:log-jacobian-expansion and @eq:phi-power-series, we find the Laurent
  series of the function @eq:logarithmic-jacobian. Singling out the coefficient
  of $w^alpha z^(-upright(I))$ in it, we get @eq:yuzhakov-bolotov.
]

#remark[
  The coefficients of the Taylor series
  $z_q = phi_q (w) = sum_(alpha >= 0) c_(q alpha) w^alpha$, $q = 1, ..., n$, of
  the implicit functions @eq:implicit-functions can be expressed in terms of the
  coefficients of @eq:implicit-power-series by the formula
  $
    c_(q alpha) = sum_S (-1)^(|rho(S)|) Delta(S)
    product_(j = 1)^n [rho(S_j) - 1]!
    product'_(mu, nu) 1 / (s_(j mu nu) !) (a_(j mu nu))^(s_(j mu nu)),
  $
  where the summation runs over all possible $n$-tuples $S = (S_1, ..., S_n)$
  such that
  $
    lambda_k (S_1) + dots.c + lambda_k (S_n) & = alpha_k, quad
    && k = 1, ..., m; \
    delta_(q k) + sigma_k (S_1) + dots.c + sigma_k (S_n) & = rho(S_k), quad
    && k = 1, ..., n.
  $
]

Theorem~@th:yuzhakov-bolotov gives us the following result for $m = n$,
$F_j (w, z) = f_j (z) - w_j$, $j = 1, ..., n$, and $Phi(w, z) equiv Phi(z)$.

#source(160)
#theorem(title: [Cayley, Sylvester and Sack])[
  Suppose that the functions @eq:mapping-to-invert and $Phi(z)$ are given by the
  power series
  $
    w_j = f_j (z) = z_j + sum_(|alpha| >= 2) a_(j alpha) z^alpha,
    quad j = 1, ..., n,
  $ <eq:power-series-system>
  $
    Phi(z) = sum_(alpha >= 0) b_alpha z^alpha.
  $ <eq:phi-series>
  Then the coefficients of the Taylor series @eq:inversion-expansion of the
  function $Phi(phi(w))$, where $z = phi(w)$ is the inverse of the system
  @eq:power-series-system, can be expressed in terms of the coefficients of the
  power series @eq:power-series-system and @eq:phi-series by the formula
  $
    c_alpha = sum_(tau, S) (-1)^(|rho(S)|) b_tau Delta(S)
    product_(j = 1)^n ([rho(S_j) + alpha_j - 1]!) / (alpha_j !)
    product_(|nu| >= 2) 1 / (s_(j nu) !) (a_(j nu))^(s_(j nu)),
  $ <eq:cayley-sylvester-sack>
  where $S = (S_1, ..., S_n)$, $S_j = {s_(j nu)}_(|nu| >= 2)$,
  $rho(S) = (rho(S_1), ..., rho(S_n))$, $rho(S_j) = sum_(|nu| >= 2) s_(j nu)$,
  $Delta(S) = det norm(delta_(k j) [alpha_j + rho(S_j)] - sigma_k (S_j))$ with
  $sigma_k (S_j) = sum_(|nu| >= 2) nu_k s_(j nu)$, and the summation in
  $sum_(tau, S)$ is over all possible multi-indices $tau = (tau_1, ..., tau_n)$,
  $|tau| >= 0$, and $n$-tuples $S$, $rho(S) >= 0$, such that
  $
    tau_k + sum_(j = 1)^n sigma_k (S_j) = alpha_k + rho(S_k),
    quad k = 1, ..., n.
  $
  If $rho(S_j) + alpha_j = 0$, then $[rho(S_j) + alpha_j - 1]!$ should be
  replaced by 1, and $delta_(k j) [alpha_j + rho(S_j)] - sigma_k (S_j)$ by
  $delta_(k j)$.
] <th:cayley-sylvester-sack>

If $Phi(w, z) = z_q$, $q = 1, ..., n$, then @eq:inversion-expansion and
@eq:cayley-sylvester-sack provide formulas for inverting the systems of power
series @eq:power-series-system. In particular, a formula for inverting a power
series is obtained for $n = 1$.

#proposition(title: [Sylvester])[
  Consider a power series $w = sum_1^infinity a_k z^k$, $a_1 != 0$. Then the
  coefficients of the inverse series $z = sum_1^infinity c_n w^n$ can be
  expressed by the formula
  $
    c_n = 1 / (n! a_1^n) sum_(k_2, ..., k_n)
    ((n + k_2 + dots.c + k_n - 1)!) / (k_2 ! dots.c k_n !)
    (-a_2 / a_1)^(k_2) dots.c (-a_n / a_1)^(k_n),
  $
  where the summation is over all possible $n$-tuples of numbers
  $k_2, ..., k_n >= 0$ such that $k_2 + 2 k_3 + dots.c + (n - 1) k_n = n - 1$.
] <prop:sylvester>

#point <pt:degenerate-branch> *Determination of a single-valued branch of a
system of implicit functions for certain degenerate cases.* Let us consider a
case in which we determine a single-valued holomorphic branch of an implicit
vector-valued function for the #source(161) system @eq:implicit-system in a
neighborhood of the point $(0, 0) in CC^(m + n)$ when
$(partial F \/ partial z)|_((0, 0)) = 0$. Suppose that in a neighborhood of
$(0, 0)$ the functions of the system @eq:implicit-system-functions can be
represented in the form
$
  F_j (w, z) = z_j P_j (w, z) + Q_j (w, z), quad j = 1, ..., n,
$ <eq:degenerate-form>
where $z_j P_j (w, z)$ is the homogeneous polynomial of least degree in the
expansion of $F_j$ in a series of homogeneous polynomials in $w$ and $z$,
$P_j (w, 0) equiv.not 0$. Let
#room[$w^(lambda(j)) = w_1^(lambda_(j 1)) dots.c w_m^(lambda_(j m))$] be the
highest term in the polynomial $P_j (w, 0)$ in the lexicographical ordering of
its terms (for any term $a_(j alpha) w^alpha$ of $P_j (w, 0)$,
$alpha != lambda(j)$, the conditions
$alpha_1 = lambda_(j 1), ..., alpha_(k - 1) = lambda_(j, k - 1)$,
$alpha_k < lambda_(j k)$ hold for some $k$, $1 <= k <= m$). We set the
coefficient of $w^(lambda(j))$ equal to 1. Let
$
  g_j (w, z) = F_j (w, z) - z_j w^(lambda(j)), quad j = 1, ..., n,
  quad lambda = (lambda_((1)), ..., lambda_((n))); \
  lambda dot.c (beta + upright(I)) = (lambda_(11) (beta_1 + 1) + dots.c
    + lambda_(n 1) (beta_n + 1), ..., lambda_(1 m) (beta_1 + 1) \
    + dots.c + lambda_(n m) (beta_n + 1)), \
  gamma_delta = {w: |w_1| = dots.c = |w_m| = delta}, quad
  Gamma_epsilon = {z: |z_1| = dots.c = |z_n| = epsilon},
$
where $delta$ and $epsilon$ are sufficiently small positive numbers.

Under our assumptions we have

#theorem(title: [Yuzhakov])[
  There exists a system of holomorphic functions
  $
    z_j = phi_j (w) = phi_j (w_1, ..., w_m), quad j = 1, ..., n,
  $ <eq:degenerate-branch>
  satisfying the system @eq:implicit-system in a neighborhood of the point
  $(0, 0) in CC^(m + n)$ along with the conditions
  $
    phi_j (0) = 0, quad (partial phi_j (0)) / (partial w_k) = 0,
    quad j = 1, ..., n, k = 1, ..., m,
  $ <eq:degenerate-branch-conditions>
  if and only if
  $
    sum_(beta >= 0) (-1)^(|beta|) integral_(gamma_delta times Gamma_epsilon)
    (z_j g^beta (w, z) (partial F \/ partial z) d w and d z)
    / (z^(beta + upright(I)) w^(lambda(beta + upright(I)) + alpha + upright(I)))
    = 0
  $ <eq:degenerate-existence-conditions>
  for $j = 1, ..., n$ and all the integer multi-indices
  $alpha = (alpha_1, ..., alpha_m)$, $-infinity < alpha_q < infinity$, such that
  $|alpha| >= 2$ and $alpha_q < 0$ for at least one $q in {1, ..., m}$. Under
  the conditions @eq:degenerate-existence-conditions the expansion coefficients
  in the power series
  $
    Phi(w, phi(w)) = sum_(alpha >= 0) c_alpha w^alpha,
  $ <eq:degenerate-taylor>
  #source(162)
  where $Phi(w, z)$ is a holomorphic function in a neighborhood of $(0, 0)$ and
  $phi = (phi_1, ..., phi_n)$ is the vector-valued function
  @eq:degenerate-branch, are determined by the formula
  $
    c_alpha = sum_(beta >= 0 \ |beta| < N(alpha))
    (-1)^(|beta|) / (beta! [lambda(beta + upright(I)) + alpha]!)
    D_(z, w)^(beta, lambda(beta + upright(I)) + alpha)
    lr([Phi g^beta (partial F) / (partial z)] |)_((0, 0)).
  $ <eq:degenerate-taylor-coefficients>
] <th:yuzhakov-degenerate>

Equalities @eq:degenerate-taylor and @eq:degenerate-taylor-coefficients give the
Taylor series for the functions @eq:degenerate-branch when
$Phi(w, z) equiv z_j$.

#corollary[
  For $m = 1$ the conditions @eq:degenerate-form always imply the existence of a
  single-valued branch @eq:degenerate-branch satisfying @eq:implicit-system and
  @eq:degenerate-branch-conditions.
] <cor:one-parameter-branch>

For $m > 1$ the conditions @eq:degenerate-form are not enough to ensure the
existence of the single-valued branch of @eq:degenerate-branch. For example, the
left-hand side of the equation $z(w_1 + w_2) + w_1^4 = 0$ satisfies
@eq:degenerate-form, but in a neighborhood of $(0, 0, 0) in CC^3$ this equation
determines only the meromorphic function $z = -w_1^4 \/ (w_1 + w_2)$.

#proof(title: [Proof of Theorem~@th:yuzhakov-degenerate.])[
  From our assumptions it follows that there are numbers
  $delta_1 > delta_2 > dots.c > delta_m > epsilon > 0$ such that the
  inequalities
  $
    |g_j (w, z)| < |w^(lambda(j)) z_j|, quad j = 1, ..., n,
  $ <eq:degenerate-inequalities>
  hold for $z in Gamma_epsilon$ and
  $w in gamma = {w: |w_1| = delta_1, ..., |w_m| = delta_m}$. For example, it
  suffices to take $delta_1 = delta$,
  $delta_2 = delta^2, ..., delta_m = delta^m$ and $epsilon = delta^(m + 1)$,
  where $delta > 0$ is sufficiently small. Since $gamma times Gamma_epsilon$ is
  compact, @eq:degenerate-inequalities holds also when $z in Gamma_epsilon$ and
  $w in V(gamma)$, where $V(gamma)$ is some $m$-circular neighborhood of
  $gamma$. By Theorem~@th:yuzhakov, for any $w in V(gamma)$ there is a unique
  point $z = phi(w) in U_epsilon = {z: norm(z) < epsilon}$ satisfying the system
  $z_j - g_j (w, z) \/ w^(lambda(j)) = 0$, $j = 1, ..., n$, i.e., the system
  @eq:implicit-system. By @eq:yuzhakov,
  $
    z_j = phi_j (w) = 1 / (2 pi i)^n integral_(Gamma_epsilon)
    (z_j (partial F \/ partial z) d z) / (F^upright(I) (w, z)),
    quad j = 1, ..., n,
  $ <eq:degenerate-integral>
  and
  $
    Phi(w, phi(w)) = 1 / (2 pi i)^n integral_(Gamma_epsilon)
    (Phi(w, z)) / (F^upright(I) (w, z)) (partial F) / (partial z) d z.
  $ <eq:degenerate-phi-integral>
  The fact that the integrand forms in @eq:degenerate-integral and
  @eq:degenerate-phi-integral are holomorphic implies that the functions
  $phi_j (w)$ and $Phi(w, phi(w))$ are holomorphic in $V(gamma)$. Consequently,
  the functions @eq:degenerate-integral can be expanded in $V(gamma)$ in
  multiple Laurent series
  $
    z_j = phi_j (w) = sum c_(j alpha) w^alpha,
    quad alpha = (alpha_1, ..., alpha_m), -infinity < alpha_q < infinity,
  $ <eq:degenerate-laurent>
  #source(163)
  where
  $
    c_(j alpha) & = 1 / (2 pi i)^m integral_gamma
                  (phi_j (w) d w) / (w^(alpha + upright(I)))
                  = 1 / (2 pi i)^(n + m) integral_(gamma times Gamma_epsilon)
                  (z_j (partial F \/ partial z) d w and d z)
                  / (F^upright(I) (w, z) w^(alpha + upright(I))) \
                & = sum_(beta >= 0) (-1)^(|beta|) / (2 pi i)^(n + m)
                  integral_(gamma times Gamma_epsilon)
                  (z_j g^beta (w, z) (partial F \/ partial z) d w and d z)
                  / (z^(beta + upright(I))
                  w^(lambda(beta + upright(I)) + alpha + upright(I))).
  $ <eq:degenerate-laurent-coefficients>
  Here we have used @eq:degenerate-inequalities to expand the fraction
  $
    1 / (F^upright(I) (w, z))
    = 1 / (product_(q = 1)^n z_q w^(lambda(q))
    [1 + g_q (w, z) \/ z_q w^(lambda(q))])
  $
  in a multiple geometric progression.

  Let us show that $c_(j alpha) = 0$ for $|alpha| < 2$. To do this we expand the
  functions $g_j^(beta_j) = [z_j Q_j + theta_j]^(beta_j)$ with
  $Q_j = P_j - w^(lambda(j))$ by the binomial formula. We obtain
  $
    & integral_(gamma times Gamma_epsilon)
      (z_j g^beta (partial F \/ partial z) d w and d z)
      / (z^(beta + upright(I))
      w^(lambda(beta + upright(I)) + alpha + upright(I))) \
    & quad = sum_(0 <= mu <= beta) beta! / (mu! (beta - mu)!)
      integral_(gamma times Gamma_epsilon)
      (z_j Q^mu theta^(beta - mu) (partial F \/ partial z) d w and d z)
      / (z^(beta - mu + upright(I))
      w^(lambda(beta + upright(I)) + alpha + upright(I))).
  $ <eq:degenerate-binomial>
  Since $d_((0, 0)) (theta_j) >= |lambda_((j))| + 2$,
  $d_((0, 0)) (partial F \/ partial z) = lambda(upright(I))
  = |lambda_((1))| + dots.c + |lambda_((n))|$, and
  $d_((0, 0)) (Q_j) >= |lambda_((j))|$, the order
  $d_((0, 0)) (z_j Q^mu theta^(beta - mu) (partial F \/ partial z))$ of the
  numerator in the integral after the summation sign in @eq:degenerate-binomial
  is at least
  $1 + lambda(mu) + |lambda(beta - mu)| + 2 |beta - mu| + lambda(upright(I))
  = 1 + lambda(beta + upright(I)) + 2 |beta - mu|$. Consequently, this integral
  is equal to zero when
  $
    1 + lambda(beta + upright(I)) + 2 |beta - mu|
    > |beta - mu| + |lambda(beta + upright(I)) + alpha|,
  $
  i.e., when $1 + |beta - mu| > |alpha|$, and also when $|beta - mu| < 1$ with
  only the integration with respect to $z$ taken into account. Thus, it is equal
  to zero for $|alpha| < 2$. From this it follows that under the conditions
  @eq:degenerate-existence-conditions the Laurent series @eq:degenerate-laurent
  do not contain terms with negative powers, i.e., the functions
  @eq:degenerate-integral extend analytically to
  $overline(V) = {w: |w_1| <= delta_1, ..., |w_m| <= delta_m}$, and, by the
  uniqueness theorem for holomorphic functions, these functions satisfy
  @eq:implicit-system in $overline(V) times U_epsilon$. Since $c_(j alpha) = 0$
  for $|alpha| < 2$, these functions also satisfy
  @eq:degenerate-branch-conditions.

  We prove the necessity of the conditions @eq:degenerate-existence-conditions.
  If there exist functions @eq:degenerate-branch that are holomorphic in
  $overline(V)$ and satisfy @eq:implicit-system and
  @eq:degenerate-branch-conditions, then they coincide in $V(gamma)$ with
  @eq:degenerate-integral because the solution of @eq:implicit-system is unique
  in $V(gamma) times U_epsilon$. Consequently, the Laurent series
  @eq:degenerate-laurent do not contain terms with negative powers. The
  conditions @eq:degenerate-existence-conditions follow from this and
  @eq:degenerate-laurent-coefficients.

  #source(164)
  If the conditions @eq:degenerate-existence-conditions hold, then the function
  @eq:degenerate-phi-integral is also holomorphic in $overline(V)$. Expanding
  the fraction $1 \/ F^upright(I)$ in @eq:degenerate-phi-integral in a multiple
  geometric progression and then expanding @eq:degenerate-phi-integral in a
  Taylor series, we get @eq:degenerate-taylor with the coefficients
  $
    c_alpha = sum_(beta >= 0) (-1)^(|beta|) / (2 pi i)^(n + m)
    integral_(gamma times Gamma_epsilon)
    (Phi(w, z) g^beta (w, z) (partial F \/ partial z) d w and d z)
    / (z^(beta + upright(I))
    w^(lambda(beta + upright(I)) + alpha + upright(I))),
  $ <eq:degenerate-taylor-integrals>
  i.e., @eq:degenerate-taylor-coefficients. It can be shown that the terms of
  @eq:degenerate-taylor-integrals vanish for $|beta| > N(alpha)$, where
  $N(alpha)$ is an integer depending on $alpha$. This gives us that in the
  integration cycle $gamma times Gamma_epsilon$ the numbers
  $delta_1, ..., delta_m$, and $epsilon$ can be chosen arbitrarily, provided
  only that they are small enough.
]

#point <pt:convergence-estimates> *Estimation of the domain of convergence and
the remainder of the series @eq:implicit-series and @eq:inversion-series.* We
need the following generalization of the multi-dimensional analogue of the
Schwarz lemma.

#theorem[
  #index-mark(
    "Lemma",
    sub: "generalized Schwarz",
    target: <th:generalized-schwarz-lemma>,
  )Let $B_r^((1)) = {w in CC^m: norm(w)_1 < r}$ and
  $B_R^((2)) = {z in CC^n: norm(z)_2 < R}$ be balls in some norms $norm(dot)_1$
  and $norm(dot)_2$, and suppose that $f: B_r^((1)) -> B_R^((2))$ is a
  holomorphic mapping such that $f(0) = 0$ and the #index-mark(
    "Order of a zero",
    sub: "of a mapping at a point",
  )order of the zero at 0 is
  $d_0 (f) = min{d_0 (f_1), ..., d_0 (f_n)} = k >= 1$. Then
  $norm(f(w))_2 <= R norm(w)_1^k \/ r^k$ for any $w in B_r^((1))$.
] <th:generalized-schwarz-lemma>

#proof(title: none)[
  The proof is carried out just as was done for the case $k = 1$ in the book
  @bib:Shabat1976b (p.~56). It is only necessary to take into account that the
  vector-valued function
  $f(zeta w) \/ zeta^k = f(zeta w_1, ..., zeta w_m) \/ zeta^k$ is holomorphic in
  the disk $|zeta| < 1$ for any $w in partial B_r^((1))$.
]

We estimate the domain of convergence of @eq:implicit-series first under certain
additional assumptions.

#theorem(title: [Yuzhakov])[
  Suppose that the functions @eq:implicit-system-functions and $Phi(w, z)$ are
  holomorphic in the closed polydisk
  $overline(U)_(r, R) = {(w, z): norm(w) <= r, norm(z) <= R}$ and satisfy the
  conditions @eq:implicit-normalization and
  $
    (partial F_j (0, 0)) / (partial w_k) = 0,
    quad j = 1, ..., n, k = 1, ..., m.
  $ <eq:no-linear-w-terms>
  Then for $h equiv 0$ the series @eq:implicit-series converges absolutely and
  uniformly on compact subsets of the polydisk $V_rho = {w: norm(w) < rho}$ of
  radius $rho = min{r R \/ A, r}$, where
  $A = max_(overline(U)_(r, R)) norm(g(w, z))$.
] <th:yuzhakov-convergence>

#proof[
  It follows from @eq:implicit-normalization and @eq:no-linear-w-terms that
  $d_((0, 0)) (g) >= 2$. In $CC^(m + n)$ we introduce the norm
  $norm((w, z))_1 = max{norm(w) \/ r, norm(z) \/ R}$. Then, by
  Theorem~@th:generalized-schwarz-lemma, #source(165) for any
  $(w, z) in overline(U)_(r, R) = {(w, z): norm((w, z))_1 <= 1}$ the inequality
  $norm(g(w, z)) <= A norm((w, z))_1^2$ holds. This implies the inequalities
  $
    |g_j (w, z)| <= A sigma^2 = delta epsilon A \/ r R
    <= delta epsilon \/ rho < epsilon = |z_j|, \
    j = 1, ..., n,
  $
  for $w in overline(V)_delta$ and $z in Gamma_epsilon$, where
  $delta = r sigma$, $epsilon = R sigma$ and $sigma < min{R \/ A, 1}$.
  Consequently, for $w in overline(V)_delta$ and $h equiv 0$ the series
  @eq:implicit-series-integrals, which coincides with @eq:implicit-series, is
  majorized by the multiple geometric progression with ratio $delta \/ rho$.
  Thus, for $h equiv 0$ the series @eq:implicit-series converges uniformly in
  $overline(V)_delta subset V_rho$.
]

The general case considered in Theorem~@th:yuzhakov-implicit-series can be
reduced to the case when condition @eq:no-linear-w-terms holds by means of the
substitution
$
  tilde(z)_j = z_j - sum_(k = 1)^m (partial F_j (0, 0)) / (partial w_k) w_k,
  quad j = 1, ..., n.
$
However, it is also useful in the general case to have estimates of the radius
of the polycylinder of convergence of the series @eq:implicit-series.

#theorem[
  Suppose that the functions @eq:implicit-system-functions and $Phi$ are
  holomorphic in $overline(U)_r = {(w, z): norm((w, z)) <= r}$ and satisfy the
  conditions @eq:implicit-normalization. Let
  $
    theta(w, z) = F(w, z) - z - F(w, 0), quad
    K = max_(norm(w) <= r) norm(F(w, 0)), \
    A = max_(norm((w, z)) <= r) norm(theta(w, z)).
  $
  Then the series @eq:implicit-series with $h equiv 0$ converges absolutely and
  uniformly on compact subsets of the polydisk $U_rho$ of radius
  $
    rho = cases(
      r^3 \/ 4 A K quad & "if" K >= r \/ 2\, A >= r \/ 2\,,
      r(r - A) \/ K quad & "if" A <= r \/ 2\, A + K >= r\,,
      r(r - K) \/ A quad & "if" K <= r \/ 2\, A + K >= r\,,
      r quad & "if" A + K <= r.
    )
  $ <eq:convergence-radius>
] <th:convergence-general>

#proof[
  The conditions @eq:implicit-normalization imply that $d_0 (F(w, 0)) >= 1$,
  while $d_((0, 0)) (theta) >= 2$. Then, by
  Theorem~@th:generalized-schwarz-lemma, $norm(F(w, 0)) <= K norm(w) \/ r$ and
  $norm(theta(w, z)) <= A norm((w, z))^2 \/ r^2$ for any
  $(w, z) in overline(U)_r$. If $epsilon < r^2 t \/ A$,
  $delta < r epsilon (1 - t) \/ K$, $0 < delta <= epsilon <= r$, and
  $0 < t < 1$, then for $w in overline(V)_delta$ and $z in Gamma_epsilon$
  $
    norm(g(w, z)) <= norm(F(w, 0)) + norm(theta(w, z))
    <= K delta \/ r + A epsilon^2 \/ r^2 < epsilon = |z_j|.
  $
  From this inequality it follows that @eq:implicit-series and
  @eq:implicit-series-integrals converge absolutely and uniformly in
  $overline(U)_delta$. Thus,
  $
    rho = sup{delta} = sup_(0 < t < 1)
    min{r^3 t (1 - t) \/ K A, r^2 t \/ A, r^2 (1 - t) \/ K, r}.
  $
  #source(166)
  Investigating this expression for the maximum with respect to $t$, we get
  @eq:convergence-radius.
]

Estimates for the series @eq:inversion-series are obtained similarly.

#theorem[
  If the functions @eq:mapping-to-invert and $Phi(z)$ are holomorphic in the
  closed polydisk $overline(U)_r = {z: norm(z) <= r}$, then the series
  @eq:inversion-series converges absolutely and uniformly on compact subsets of
  the polydisk $V_rho = {w: norm(w) < rho}$, where
  $rho = min{r^2 \/ 4 A, r \/ 2}$ and $A = max_(norm(z) <= r) norm(g(z))$.
] <th:inversion-convergence>

It is possible to get a sharper estimate: $rho = r^2 \/ 4 A$ if $A > r \/ 2$,
and $rho = r - A$ if $A <= r \/ 2$. Obviously, the respective series
@eq:implicit-taylor and @eq:inversion-expansion also converge in the indicated
polydisks.

We mention one more simple particular case.

#proposition[
  If in Theorem~@th:yuzhakov-implicit-series the functions
  @eq:implicit-system-functions and $Phi$ are holomorphic in
  $overline(U)_(r, R)$ and
  $
    g_j (w, z) = F_j (w, z) - z_j = w_j Psi_j (w, z), quad j = 1, ..., n,
  $
  then the series @eq:implicit-series converges in the polydisk $V_rho$ of
  radius
  $
    rho = min{R \/ A, r}, quad "where" A = max_(U_(r, R)) norm(Psi(w, z)).
  $
] <prop:convergence-special>

We estimate the remainders for the series @eq:implicit-series and
@eq:inversion-series. Let $Psi_beta (w)$ be the general term,
$S_k (w) = sum_(|beta| <= k) Psi_beta (w)$ a partial sum, and
$
  r_k (w) = Psi(w) - S_k (w) = sum_(|beta| > k) Psi_beta (w)
$
the remainder of @eq:implicit-series with $h equiv 0$ or of
@eq:inversion-series.

#theorem[
  Suppose that the functions @eq:implicit-system-functions and $Phi(w, z)$ are
  holomorphic in $overline(U)_(delta, epsilon)$ and that
  $|g_j (w, z)| < |z_j| = epsilon$ for any $w in overline(V)_delta$ and
  $z in Gamma_epsilon$. Then the remainder of the series @eq:implicit-series
  with $h equiv 0$ satisfies the following estimate for any
  $w in overline(V)_delta$:
  $
    |r_k (w)| <= M dot.c (sigma \/ epsilon)^(k + 1)
    sum_(p = 1)^n binom(k + n - p, k) (1 - sigma \/ epsilon)^(-p),
  $ <eq:remainder-estimate>
  where
  $
    sigma = max_(overline(U)_(delta, epsilon)) norm(g(w, z)), quad
    M = max_(overline(U)_(delta, epsilon))
    lr(|Phi(w, z) (partial F) / (partial z)|).
  $
] <th:remainder-estimate>

#source(167)
#proof[
  The integral representation of the terms of @eq:implicit-series (see
  @eq:implicit-series-integrals) gives us the estimate
  $|Psi_beta (w)| <= M (sigma \/ epsilon)^(|beta|)$. Then
  $
    |r_k (w)| & <= sum_(|beta| >= k + 1) |Psi_beta (w)|
                <= M sum_(|beta| >= k + 1) (sigma \/ epsilon)^(|beta|) \
              & = M sum_(q = k + 1)^infinity binom(q + n - 1, q)
                (sigma \/ epsilon)^q.
  $
  This implies @eq:remainder-estimate, because for $0 < a < epsilon < 1$ the
  remainder of the Taylor series of $(1 - a)^(-n)$ is
  $
    & sum_(q = k + 1)^infinity binom(q + n - 1, q) a^q
      = sum_(q = k + 1)^infinity 1 / (2 pi i) integral_(|zeta| = epsilon)
      (a^q d zeta) / ((1 - zeta)^n zeta^(q + 1)) \
    & quad = 1 / (2 pi i) integral_(|zeta| = epsilon)
      (a^(k + 1) d zeta) / ((1 - zeta)^n zeta^(k + 1) (zeta - a))
      = a^(k + 1) sum_(p = 1)^n binom(k + n - p, k) (1 - a)^(-p).
  $
]

#remark[
  As is clear from the proof of Theorems~@th:yuzhakov-convergence
  and~@th:convergence-general, for any $w in V_rho$ there exist $epsilon$ and
  $delta$ satisfying the conditions of Theorem~@th:remainder-estimate. By
  solving the elementary extremum problem we can choose $epsilon$ and $delta$
  such that $sigma \/ epsilon$ is minimal. For example, under the conditions of
  Theorem~@th:yuzhakov-convergence it is necessary to take $delta = norm(w)$ and
  $epsilon = norm(w) R \/ r$.
]

The next result is proved similarly.

#theorem[
  Under the conditions of Theorem~@th:inversion-convergence,
  $
    |r_k (w)| <= M (sigma \/ delta)^(k + 1)
    sum_(p = 1)^n binom(k + n - p, k) (1 - sigma \/ delta)^(-p)
  $
  for any $w in overline(V)_delta$ and $delta < rho$, where
  $
    M = max_(norm(z) <= 2 delta) |Phi(z) partial f \/ partial z|, quad
    sigma = max_(norm(z) <= 2 delta) norm(g(z)).
  $
] <th:inversion-remainder>

#unnumbered([Examples])[
  #point <pt:implicit-examples> 1\. We find the implicit functions
  $z_j = phi_j (w_1, w_2)$, $j = 1, 2$, determined by the system
  $
    z_1 - w_1 e^(z_2 w_2) = 0, quad z_2 - w_2 e^(z_1 w_1) = 0.
  $
  By @eq:implicit-series with $h equiv 0$,
  $
    z_j = sum_(m, n = 0)^infinity (w_1^m w_2^n) / (m! n!)
    (partial^(m + n)) / (partial z_1^m partial z_2^n)
    [z_j e^(m w_2 z_2 + n w_1 z_1)
      (1 - w_1^2 w_2^2 e^(w_1 z_1 + w_2 z_2))]_(z = 0).
  $
  #source(168)
  From this we get
  $
    z_1 & = w_1 + sum_(m, n = 1)^infinity 1 / (m! n!)
          n^(m - 1) m^n w_1^(2m - 1) w_2^(2n), \
    z_2 & = w_2 + sum_(m, n = 1)^infinity 1 / (m! n!)
          m^(n - 1) n^m w_1^(2m) w_2^(2n - 1).
  $ <eq:example-series>
  Using Proposition~@prop:convergence-special, we find the radius $rho$ of the
  bidisk of convergence of these series. Here $Psi_1 = e^(w_2 z_2)$,
  $Psi_2 = e^(w_1 z_1)$, and $A = max_(overline(U)_(r, R)) norm(Psi) = e^(r R)$.
  We obtain $rho = min{r, R e^(-r R)}$. This quantity has a maximum equal to
  $rho = 1 \/ sqrt(e) approx 0.607$ at $r = 1 \/ sqrt(e)$, $R = sqrt(e)$. A
  direct study of the series @eq:example-series shows that this estimate is
  sharp. We find an estimate of the remainder for the series @eq:example-series
  by Theorem~@th:remainder-estimate. For $delta = norm(w)$,
  $epsilon = 1 \/ delta$, and $M = max|z_j| = epsilon = 1 \/ delta$ (the terms
  of the series corresponding to the second term of the Jacobian
  $1 - w_1^2 w_2^2 exp(w_1 z_1 + w_2 z_2)$ cancel) we have the estimate:
  $
    |r_k (w)| <= 1 / delta (delta^2 e)^(k + 1)
    [(k + 1) / (1 - delta^2 e) + 1 / (1 - delta^2 e)^2].
  $
  In particular, $|r_k (w)| < 0.0041$ for $delta = 0.2$ and $k = 3$.

  2\. We find the inverse of the holomorphic mapping
  $
    w_1 = z_1 - z_2^p, quad w_2 = z_2 - z_1^q, quad p > 1, q > 1.
  $
  By @eq:inversion-expansion and @eq:inversion-coefficients,
  $
    z_j = sum_(m, n = 0)^infinity c_(j m n) w_1^m w_2^n, quad j = 1, 2,
  $
  where
  $
    c_(j m n) = sum_(m + n >= k + r >= 0) 1 / (k! r! m! n!)
    (partial^(m + n + k + r)) / (partial z_1^(m + k) partial z_2^(n + r))
    [z_j z_2^(p k) z_1^(q r) (1 - p q z_1^(q - 1) z_2^(p - 1))]_((0, 0)).
  $
  The computations yield
  $
    z_1 = sum_(q r + 1 >= k >= 0 \ p k >= r >= 0)
    ((q r)! (p k)!) / (k! r! (q r - k + 1)! (p k - r)!)
    w_1^(q r - k + 1) w_2^(p k - r).
  $
  An analogous series is obtained for $z_2$.

  3\. Let us determine the holomorphic branches of the curve (folium of
  Descartes)
  $
    w^3 - 3 w z + z^3 = 0
  $
  #source(169)
  in a neighborhood of $(0, 0)$. According to Theorem~@th:yuzhakov-degenerate, a
  regular branch tangent to the complex curve $z = 0$ is determined by the
  series $z = sum_1^infinity c_n w^n$, where
  $
    c_n = sum_(k >= 0) 1 / (2 pi i)^2
    integral.double_(|w| = delta \ |z| = epsilon)
    (z (z^3 + w^3)^k (w - z^2) d w and d z) / (3^k z^(k + 1) w^(k + n + 2)),
  $
  i.e.,
  $
    z = sum_(r = 0)^infinity ((3r)! w^(3r + 2)) / (3^(3r + 1) r! (2r + 1)!)
    = w^2 / 3 + w^5 / 3^4 + w^8 / 3^6 + (4 w^11) / 3^9 + dots.c.
  $
  A second branch tangent to $w = 0$ is determined similarly.
]

#small-print[
  #point <pt:weierstrass-pseudopolynomial> *Analogues of the Lagrange expansion
  for the coefficients of a Weierstrass pseudopolynomial.* Let $f(z)$ be a
  holomorphic function of the variables $z = (z_1, ..., z_n)$ in a neighborhood
  of the point $0 in CC^n$, with $f(0) = 0$,
  $partial^k f(0) \/ partial z_n^k = 0$, $k = 1, ..., m - 1$, and
  $partial^m f(0) \/ partial z_n^m != 0$. According to the Weierstrass
  preparation theorem (see @bib:Shabat1976b), $f$ can be represented in a
  neighborhood of $0 in CC^n$ in the form
  $
    f(z) = [z_n^m + a_1 (attach(z, tl: ')) z_n^(m - 1) + dots.c
      + a_m (attach(z, tl: '))] Psi(z),
  $ <eq:weierstrass-preparation>
  where $a_j (attach(z, tl: '))$ and $Psi(z)$ are holomorphic functions,
  $attach(z, tl: ') = (z_1, ..., z_(n - 1))$, $a_j (attach(0, tl: ')) = 0$,
  $j = 1, ..., m$, and $Psi(0) != 0$. The polynomial in $z_n$ in
  @eq:weierstrass-preparation is called the #index-mark(
    "Pseudopolynomial",
    sub: "Weierstrass",
  )_Weierstrass pseudopolynomial of $f$ at 0_. It is well known (see
  @bib:Shabat1976b, p.~113) that there exist numbers $epsilon > 0$ and
  $delta > 0$ such that for $attach(z, tl: ') in attach(U, tl: ', br: delta)
  = {attach(z, tl: '): norm(attach(z, tl: ')) < delta}$ the roots of the
  pseudopolynomial with respect to the variable $z_n$ lie in the disk
  $|z_n| < epsilon$, and the sum of the $k$th powers of these roots can be
  expressed by the formula
  $
    S_k (attach(z, tl: ')) = sum_(j = 1)^m z_(n j)^k (attach(z, tl: '))
    = 1 / (2 pi i) integral_gamma (z_n^k f'_(z_n) (z) d z) / f(z),
  $ <eq:power-sums>
  where $gamma = {z_n: |z_n| = epsilon}$. We find explicit expressions for the
  functions @eq:power-sums. For convenience we assume that
  $partial^m f(0) \/ partial z_n^m = m!$, i.e., that the coefficient of $z_n^m$
  in the Taylor expansion of the function at the point 0 is equal to 1.

  #theorem(title: [Yuzhakov])[
    Under the above assumptions the functions @eq:power-sums can be expressed by
    the formula
    $
      S_k (attach(z, tl: ')) = k sum_(r = 1)^infinity (-1)^r / ((m r - k)! r)
      lr((partial^(m r - k) [g^r (z)]) / (partial z_n^(m r - k)) |)_(z_n = 0),
    $ <eq:power-sums-series>
    where $g(z) = f(z) - z_n^m$.
  ] <th:yuzhakov-power-sums>

  The coefficients of the Weierstrass pseudopolynomial can be expressed in terms
  of the power sums $S_k (attach(z, tl: '))$ by the Newton formula (see
  @sec:nonlinear-systems):
  $
    a_k (attach(z, tl: ')) = -1 / k [S_k (attach(z, tl: '))
      + a_1 (attach(z, tl: ')) S_(k - 1) (attach(z, tl: ')) + dots.c
      + a_(k - 1) (attach(z, tl: ')) S_1 (attach(z, tl: '))].
  $ <eq:newton-formula>

  #source(170)
  #proof[
    It follows from the hypotheses that $partial^k g(0) \/ partial z_n^k = 0$
    for $k = 1, ..., m$. Starting from this, we can show that $epsilon$ and
    $delta$ can be chosen in such a way that $|g(z)| < |z_n|^m = epsilon^m$ for
    $attach(z, tl: ') in attach(U, tl: ', br: delta)$ and $z_n in gamma$.
    Consequently, $1 \/ f$ can be expanded in a multiple geometric progression
    $
      1 / f(z) = 1 / (z_n^m [1 + g(z) \/ z_n^m])
      = sum_(r = 0)^infinity ((-1)^r g^r (z)) / (z_n^(m(r + 1)))
    $ <eq:inverse-f-expansion>
    which converges uniformly on $gamma$ for any
    $attach(z, tl: ') in attach(U, tl: ', br: delta)$. Substituting
    @eq:inverse-f-expansion into @eq:power-sums, we get
    $
      S_k (attach(z, tl: ')) & = sum_(r = 0)^infinity (-1)^r / (2 pi i)
      integral_gamma (g^r (z) [m z_n^(m - 1)
        + g'_(z_n) (z)] d z_n) / (z_n^(m(r + 1) - k)) \
      & = sum_(r = 1)^infinity ((-1)^r m) / (2 pi i)
      integral_gamma (g^r (z) d z_n) / (z_n^(m r - k + 1))
      + sum_(r = 1)^infinity (-1)^(r - 1) / (r 2 pi i)
      integral_gamma ([g^r (z)]'_(z_n) d z_n) / (z_n^(m r - k)).
    $
    By the formula for integration by parts
    (Proposition~@prop:integration-by-parts-holomorphic),
    $
      integral_gamma ([g^r (z)]'_(z_n) d z_n) / (r z_n^(m r - k))
      = integral_gamma ([m r - k] g^r (z) d z_n) / (r z_n^(m r - k + 1)).
    $
    Thus,
    $
      S_k (attach(z, tl: ')) = sum_(r = 1)^infinity
      ((-1)^r k) / (r dot.c 2 pi i)
      integral_gamma (g^r (z) d z) / (z_n^(m r - k + 1)),
    $
    which is equivalent to @eq:power-sums-series.
  ]

  #example[
    Let us find the Weierstrass pseudopolynomial of the function
    $f(w, z) = w^5 + w^3 - z^3 + z^5$ at the point $(0, 0) in CC^2$ with respect
    to the variable $w$. Here $m = 3$ and $g(w, z) = w^5 - z^3 + z^5$. By
    @eq:power-sums-series,
    $
      S_k (z) = k sum_(r = 1)^infinity (-1)^r / (r (3r - k)!)
      lr(
        (partial^(3r - k)) / (partial w^(3r - k))
        (w^5 - z^3 + z^5)^r |
      )_(w = 0),
      quad k = 1, 2, 3.
    $
    From this we get
    $
      S_1 (z) & = sum_(q = 0)^infinity ((-1)^(q + 1) (5q + 1)!)
                / ((3q + 1)! (2q + 1)!) (z^3 - z^5)^(2q + 1), \
      S_2 (z) & = 2 sum_(q = 0)^infinity ((-1)^q (5q + 3)!)
                / ((3q + 2)! (2q + 2)!) (z^3 - z^5)^(2q + 2), \
      S_3 (z) & = 3 sum_(q = 0)^infinity ((-1)^q (5q)!)
                / ((3q)! (2q + 1)!) (z^3 - z^5)^(2q + 1).
    $
    Then the coefficients of the Weierstrass pseudopolynomial
    $
      w^3 + a_1 (z) w^2 + a_2 (z) w + a_3 (z)
    $
    of $f$ at $(0, 0)$ are found from @eq:newton-formula:
    $
      a_1 (z) & = (z^3 - z^5) - 5 (z^3 - z^5)^3 + 66 (z^3 - z^5)^5 - dots.c, \
      a_2 (z) & = -(z^3 - z^5)^2 + 9 (z^3 - z^5)^4 - 136 (z^3 - z^5)^6
                + dots.c, \
      a_3 (z) & = -(z^3 - z^5) + 2 (z^3 - z^5)^3 - 23 (z^3 - z^5)^5 + dots.c.
    $
  ]
]
