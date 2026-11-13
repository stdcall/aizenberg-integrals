#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[Integral formulas for functions holomorphic in $n$-circular
  domains] <sec:n-circular>

#point <pt:temlyakov> Let $D$ be a bounded convex $n$-circular domain centered
at zero and such that the function $psi(attach(|zeta|, tl: '))$ determining the
boundary $partial D = {z: |zeta_1| = psi(attach(|zeta|, tl: ')),
  attach(|zeta|, tl: ') in overline(G)}$ is twice continuously differentiable;
here $attach(|zeta|, tl: ') = (|zeta_2|, ..., |zeta_n|)$, and $G$ is the
projection of the image of $D$ in the absolute octant of moduli
$(|zeta_1|, ..., |zeta_n|)$ on the hyperplane ${|zeta_1| = 0}$. In this case the
integral representation @eq:linearly-convex-formula holds for functions
holomorphic in $D$ and of class $C(overline(D))$, where
$rho(z) = |zeta_1| - psi(attach(|zeta|, tl: '))$. If we set
$
  phi_j (attach(|zeta|, tl: ')) = (|zeta_j| psi'_(|zeta_j|))
  / (|zeta_2| psi'_(|zeta_2|) + dots.c + |zeta_n| psi'_(|zeta_n|) - psi),
  quad j = 2, ..., n,
$
then we get the formula
$
  f(z) = (n - 1)! / (2 pi i)^n integral_G d phi(attach(|zeta|, tl: '))_([1])
  integral_(Delta_zeta) f(zeta) / (1 - y_1 - dots.c - y_n)^n (d zeta) / zeta,
$ <eq:temlyakov-moduli>
where
$
  d phi(attach(|zeta|, tl: '))_([1]) = d phi_2 (attach(|zeta|, tl: '))
  and dots.c and d phi_n (attach(|zeta|, tl: ')), \
  y_j = z_j overline(zeta)_j phi_j (attach(|zeta|, tl: ')) |zeta_j|^(-2),
  quad j = 1, ..., n,
$
#source(88)
$
  phi_1 (attach(|zeta|, tl: ')) = 1 - phi_2 - dots.c - phi_n
  = -psi [ |zeta_2| psi'_(|zeta_2|) + dots.c + |zeta_n| psi'_(|zeta_n|)
    - psi]^(-1),
$
and $Delta_zeta = {zeta': |zeta'_i| = |zeta_i|, i = 1, ..., n}$. In the integral
representation @eq:temlyakov-moduli the integral over $partial D$ is written as
a repeated integral: the integration is first over the arguments of the
variables, and then over their moduli. We form the following change of variables
in @eq:temlyakov-moduli: $phi_j (attach(|zeta|, tl: ')) = tau_j$,
$|zeta_1| = r_1 (tau)$, $zeta_1 = r_1 (tau) xi$,
$zeta_j = r_j (tau) xi e^(i theta_j)$, $theta_j = arg zeta_j - arg zeta_1$,
$j = 2, ..., n$, $|xi| = 1$, $tau = (tau_1, ..., tau_n)$,
$tau_1 = 1 - tau_2 - dots.c - tau_n$, $r = (r_1 (tau), ..., r_n (tau))$,
$theta = (theta_2, ..., theta_n)$. The function $f$ on $partial D$ can be
written as a function of $(xi, r, theta)$, where $xi$ varies on the unit circle,
$0 <= theta_j <= 2 pi$, $j = 2, ..., n$, and
$
  (tau_2, ..., tau_n) in Delta^*
  = {(tau_2, ..., tau_n): tau_2 + dots.c + tau_n < 1, tau_i > 0, i = 2, ..., n}.
$
Now @eq:temlyakov-moduli is transformed as follows:
$
  f(z) = (n - 1)! / ((2 pi)^n i) integral_(Delta^*) d tau_([1])
  integral_(Delta_*) d theta_([1])
  integral_(|xi| = 1) f(xi, r, theta) / (1 - u overline(xi))^n (d xi) / xi,
$ <eq:temlyakov-arguments>
where $Delta_* = {(theta_2, ..., theta_n): 0 <= theta_j <= 2 pi, j = 2, ..., n}$
and
$
  u = tau_1 / (r_1 (tau)) z_1 + (tau_2 e^(-i theta_2)) / (r_2 (tau)) z_2
  + dots.c + (tau_n e^(-i theta_n)) / (r_n (tau)) z_n.
$
#new-par
Formula @eq:temlyakov-arguments can be rewritten in a more convenient form for
what follows; namely,
$
  f(z) = (n - 1)! / ((2 pi)^n i) integral_(Delta^*) d tau_([1])
  integral_(Delta_*) d theta_([1])
  integral_(|xi| = 1) (xi^(n - 1) f(xi, r, theta)) / (xi - u)^n d xi.
$ <eq:temlyakov-cauchy>
We now consider the linear differential operators
$
  L_0 (f) = f, quad quad L_k (f) = (n - k) L_(k - 1) (f)
  + sum_(nu = 1)^n z_nu partial / (partial z_nu) L_(k - 1) (f), \
  k = 1, 2, ..., n - 1.
$
Let $M_k (xi, u) = (n - k - 1)! xi^(n - k - 1) (xi - u)^(k - n)$. Then
$
  L_k (M_k) = ((n - 1)! xi^(n - 1)) / (xi - u)^n, quad k = 0, 1, ..., n - 1.
$ <eq:temlyakov-operators>
By @eq:temlyakov-operators, formula @eq:temlyakov-cauchy can be written as
$
  f(z) = 1 / ((2 pi)^n i) integral_(Delta^*) d tau_([1])
  integral_(Delta_*) d theta_([1])
  integral_(|xi| = 1) f(xi, r, theta) L_k (M_k) d xi.
$ <eq:temlyakov-operator-form>
Applying the inverse operators $L_k^(-1)$ (whose existence is easily
ascertained) to both sides of @eq:temlyakov-operator-form and changing the
notation for the functions, we get the next assertion.

#source(89)
#theorem(title: [Temlyakov, Opial, and Siciak])[
  Let $k in {0, ..., n - 1}$ be fixed. Then the integral representation
  $
    f(z) = (n - k - 1)! / ((2 pi)^n i) integral_(Delta^*) d tau_([1])
    integral_(Delta_*) d theta_([1])
    integral_(|xi| = 1) (xi^(n - k - 1) L_k (f) d xi) / (xi - u)^(n - k)
  $ <eq:temlyakov-representation>
  is valid for every $f in A(D)$ such that $L_k (f) in A_C (D)$.
] <th:temlyakov-opial-siciak>

For $n = 2$ the formulas @eq:temlyakov-representation give the #index-mark(
  "Integral",
  sub: "Temlyakov",
  subsub: "of the first kind",
)_Temlyakov integral of the first kind_ ($k = 1$)
$
  f(z) = 1 / (4 pi^2 i) integral_0^(2 pi) d t integral_0^1 d tau
  integral_(|xi| = 1) F(r_1 (tau) xi, r_2 (tau) xi e^(i t)) / (xi - u) d xi
$
and the #index-mark(
  "Integral",
  sub: "Temlyakov",
  subsub: "of the second kind",
)_Temlyakov integral of the second kind_ ($k = 0$)
$
  f(z) = 1 / (4 pi^2 i) integral_0^(2 pi) d t integral_0^1 d tau
  integral_(|xi| = 1) (xi f(r_1 (tau) xi, r_2 (tau) xi e^(i t))) / (xi - u)^2
  d xi,
$
where $F = L_1 (f)$ and
$
  u = (z_1 tau) / (r_1 (tau)) + (z_2 (1 - tau) e^(-i t)) / (r_2 (tau)).
$
#new-par
The Temlyakov integral of the first kind is convenient in that the inside
integral in it has a Cauchy kernel. This circumstance helps in applications.

#point <pt:szego-n-circular> Despite the great generality of the
Cauchy-Fantappiè formula, the question of finding integral representations with
holomorphic kernel for concrete domains $D subset CC^n$ still remains.
Therefore, it is of interest to determine ways of constructing integral formulas
with holomorphic kernels for specific domains or classes of domains. One such
way will be considered in this and the next subsection.

Let $D$ be a bounded complete $n$-circular domain with center at $0$, and let
$lambda$ be a finite measure on $|partial D|$. The measure $lambda$ is said to
be #index-mark("Measure", sub: "admissible")_admissible_ if for any nonnegative
integers $(k_1, ..., k_n) = k$
$
  op("Ess Sup", limits: #true)_(|partial D|) |z^k|
  = max_(|partial D|) |z^k|.
$
#new-par
We present without proof the following result on the existence of integral
representations with Szegö kernel.

#theorem(title: [Aĭzenberg])[
  Let $lambda_0$ be a finite measure on $|partial D|$. Then an integral
  representation ($z in D$)
  $
    f(z) = 1 / (2 pi i)^n integral_(|partial D|) d lambda_0
    integral_(Delta_zeta) f(zeta) h(z overline(zeta)) (d zeta) / zeta
  $ <eq:szego-n-circular>
  #source(90)
  exists for any $f in A_C (D)$, where the Szegö kernel
  $h(z overline(zeta)) = h(z_1 overline(zeta)_1, ..., z_n overline(zeta)_n)$
  is in $A(overline(D))$ with respect to $overline(zeta)$ for fixed $z in D$ and
  in $A(D)$ with respect to $z$ for fixed $zeta in partial D$ and does not
  depend on $f$, if and only if $lambda_0$ is admissible. The Szegö kernel can
  be expanded for $z in D$ and $zeta in partial D$ in a multiple power series
  $
    h(z overline(zeta))
    = sum_(alpha = (alpha_1, ..., alpha_n) \ alpha_i >= 0)
    a_alpha z^alpha overline(zeta)^alpha,
  $ <eq:szego-series>
  where
  $
    a_alpha = [integral_(|partial D|) |zeta^(2 alpha)| d lambda_0]^(-1).
  $ <eq:szego-coefficients>
] <th:aizenberg-szego>

We remark that admissible measures are measures which are #index-mark(
  "Measure",
  sub: "massive, on the Shilov boundary",
)_massive on the Shilov boundary_ of $D$ (i.e.,
$overline(|partial D| without E) supset |S(D)|$ for every $E subset |partial D|$
of zero $lambda$-measure).

#index-mark("Examples of computation", sub: "of Szegö kernels")Let us consider
the computation of some Szegö kernels, restricting ourselves to the case
$n = 2$. If the boundary of $D$ has the form
$partial D = {z: |z_2| = Phi(|z_1|), 0 <= |z_1| < r}$, where $Phi$ is a
decreasing function, then the integration with respect to $lambda$ over
$|partial D|$ can be replaced by integration over $[0, r]$ with respect to some
measure $lambda'$ that can be given, in particular, by means of an increasing
continuous function.

1\. Consider the sequence of domains
$D_p = {z: |z_2|^2 + |z_1|^(2 \/ p) < 1, 0 <= |z_1| < 1}$, $p = 1, 2, ...$, and
take the measure $lambda'$ on $[0, 1]$ to be the measure generated by the
function $|z_1|^2$. The Szegö kernel $h_p$ for $D_p$ will have the form
$
  h_p (z_1 overline(zeta)_1, z_2 overline(zeta)_2)
  = sum_(k_1 >= 0, k_2 >= 0) a_k^((p)) (z_1 overline(zeta)_1)^(k_1)
  (z_2 overline(zeta)_2)^(k_2),
$
where
$
  a_k^((p))
  = [integral_0^1 |zeta_1|^(2 k_1) (1 - |zeta_1|^(2 \/ p))^(k_2)
    d|zeta_1|^2]^(-1)
  = ([p(k_1 + 1) + k_2]!) / (p [p(k_1 + 1) - 1]! k_2 !).
$
It remains to determine the function
$
  h_p (x_1, x_2) = 1 / p sum_(k_1 >= 0, k_2 >= 0)
  ([p(k_1 + 1) + k_2]!) / ([p(k_1 + 1) - 1]! k_2 !) x_1^(k_1) x_2^(k_2)
$
in finite form where $x_1 = z_1 overline(zeta)_1$ and
$x_2 = z_2 overline(zeta)_2$.

#source(91)
Note that $z in D_p$ and $zeta in partial D_p$; therefore, $|x_2| < 1$ and
$|x_1 (1 - x_2)^(-p)| < 1$. Then
$
  1 / ((1 - x_2)^p - x_1)
  & = 1 / (1 - x_2)^p 1 / (1 - x_1 \/ (1 - x_2)^p)
  = sum_(m = 0)^infinity x_1^m (1 / (1 - x_2))^(p(m + 1)) \
  & = sum_(m = 0)^infinity x_1^m / ([p(m + 1) - 1]!)
  (d^(p(m + 1) - 1)) / (d x_2^(p(m + 1) - 1)) 1 / (1 - x_2) \
  & = sum_(k_1, k_2 = 0)^infinity
  ([p(k_1 + 1) + k_2 - 1]!) / ([p(k_1 + 1) - 1]! k_2 !) x_1^(k_1) x_2^(k_2).
$
We now get that
$
  h_p (x_1, x_2) = 1 / p d / (d x_2) 1 / ((1 - x_2)^p - x_1)
  = (1 - x_2)^(p - 1) / [(1 - x_2)^p - x_1]^2.
$
#new-par
Thus, for $f in A_C (D_p)$ we have the integral representation ($z in D_p$)
$
  f(z) = 1 / (2 pi i)^2 integral_0^1 d|zeta_1|^2 integral_(Delta_zeta)
  (f(zeta) (1 - z_2 overline(zeta)_2)^(p - 1))
  / [(1 - z_2 overline(zeta)_2)^p - z_1 overline(zeta)_1]^2 (d zeta) / zeta.
$ <eq:szego-domain-p>
Here $|zeta_2|^2 = 1 - |zeta_1|^(2 \/ p)$. In the case $p = 1$ this gives us
$
  f(z) = 1 / (2 pi i)^2 integral_0^1 d|zeta_1|^2 integral_(Delta_zeta)
  f(zeta) / (1 - z_1 overline(zeta)_1 - z_2 overline(zeta)_2)^2
  (d zeta) / zeta
$ <eq:szego-ball>
for the ball $D_1 = B_1 (0)$. This is the Bochner integral representation (see
@eq:ellipsoid-formula) and is, moreover, a particular case of
@eq:temlyakov-moduli. Thus, in the case of a ball the Temlyakov integral
representation is an integral representation with Szegö kernel.

2\. Suppose that $D = {z: |z_1| + |z_2| < 1, 0 <= |z_1| < 1}$, and take the
measure $lambda'$ on $[0, 1]$ to be ordinary Lebesgue measure. Then
$
  a_k = [integral_0^1 |zeta_1|^(2 k_1) (1 - |zeta_1|)^(2 k_2) d|zeta_1| ]^(-1)
  = (2 k_1 + 2 k_2 + 1)! / ((2 k_1)! (2 k_2)!),
$
and the Szegö kernel for the given case has the form
$
  h(x_1, x_2) = sum_(k_1 >= 0 \ k_2 >= 0)
  (2 k_1 + 2 k_2 + 1)! / ((2 k_1)! (2 k_2)!) x_1^(k_1) x_2^(k_2),
$
#source(92)
where again $x_i = z_i overline(zeta)_i$, $i = 1, 2$. Since $|z_1| + |z_2| < 1$
and $|zeta_1| + |zeta_2| = 1$, it follows that $sqrt(|x_1|) + sqrt(|x_2|) < 1$,
so that
$
  & sum_k (2 k_1 + 2 k_2 + 1)! / ((2 k_1)! (2 k_2)!) x_1^(k_1) x_2^(k_2) \
  & quad = 1 / 4 lr(
      \[sum_(m_1, m_2 = 0)^infinity (m_1 + m_2 + 1)! / (m_1 ! m_2 !)
      (sqrt(x_1))^(m_1) (sqrt(x_2))^(m_2)
    ) \
  & quad quad + sum_(m_1, m_2 = 0)^infinity (m_1 + m_2 + 1)! / (m_1 ! m_2 !)
    (sqrt(x_1))^(m_1) (-sqrt(x_2))^(m_2) \
  & quad quad + sum_(m_1, m_2 = 0)^infinity (m_1 + m_2 + 1)! / (m_1 ! m_2 !)
    (-sqrt(x_1))^(m_1) (sqrt(x_2))^(m_2) \
  & quad quad + lr(
      sum_(m_1, m_2 = 0)^infinity (m_1 + m_2 + 1)! / (m_1 ! m_2 !)
      (-sqrt(x_1))^(m_1) (-sqrt(x_2))^(m_2) \]
    ) \
  & quad = 1 / 4 lr(
      \[1 / (1 - sqrt(x_1) - sqrt(x_2))^2
      + 1 / (1 - sqrt(x_1) + sqrt(x_2))^2
    ) \
  & quad quad + lr(
      1 / (1 + sqrt(x_1) - sqrt(x_2))^2
      + 1 / (1 + sqrt(x_1) + sqrt(x_2))^2 \]
    ) \
  & quad = ((1 - x_1 - x_2) (1 + 2 x_1 x_2 - x_1^2 - x_2^2) + 8 x_1 x_2)
    / [(1 - x_1 - x_2)^2 - 4 x_1 x_2]^2.
$
#new-par
3\. The domains $D_(p, q) = {z: |z_1|^(2 \/ p) + |z_2|^(2 \/ q) < 1}$,
$p, q = 1, 2, ...$, represent a more general case. With the same measure as in
the first example it can be shown that
$
  h_(p, q) (x_1, x_2) = 1 / (p q) partial / (partial x_1)
  sum_(j_1 = 1)^p sum_(j_2 = 1)^q 1 / (1 - y_(j_1 1) - y_(j_2 2)),
$
where $y_(j_1 1) = x_1^(1 \/ p) epsilon_(j_1)$,
$y_(j_2 2) = x_2^(1 \/ q) epsilon_(j_2)^1$, the $epsilon_(j_1)$ are all the
$p$th roots of unity ($j_1 = 1, ..., p$) and the $epsilon_(j_2)^1$ are all the
$q$th roots of unity ($j_2 = 1, ..., q$). The Szegö kernels $h_(p, q)$ are
rational.

#point <pt:extended-szego> We fix a domain $D_0$ and an admissible measure
$lambda_0$ on $|partial D_0|$. By Theorem~@th:aizenberg-szego, the integral
representation @eq:szego-n-circular with Szegö kernel is valid. We consider an
arbitrary domain $D$ and pose the following problem: if possible, #source(93)
choose functions $phi_1 (|zeta_1|, ..., |zeta_n|), ...,
phi_n (|zeta_1|, ..., |zeta_n|)$ and a measure $lambda$ on $|partial D|$ such
that the integral representation
$
  f(z) = 1 / (2 pi i)^n integral_(|partial D|) d lambda
  integral_(Delta_zeta) f(zeta) h(z overline(zeta) phi / (|zeta|^2))
  (d zeta) / zeta
$ <eq:extended-szego-representation>
holds for $D$, where
$
  h(z overline(zeta) phi / (|zeta|^2))
  = h(z_1 overline(zeta)_1 phi_1 / (|zeta_1|^2), ...,
    z_n overline(zeta)_n phi_n / (|zeta_n|^2))
  = sum_k a_k z^k overline(zeta)^k phi^k / (|zeta^(2 k)|)
$ <eq:extended-szego-kernel>
($h$ is the same function as in the integral representation
@eq:szego-n-circular), with
$
  a_k = [integral_(|partial D|) phi^k d lambda]^(-1).
$ <eq:extended-szego-coefficients>
#new-par
It is always possible to choose $phi_1, ..., phi_n$ and the measure $lambda$ on
$|partial D|$ in such a way that the $a_k$ in @eq:extended-szego-coefficients
equal the corresponding $a_k$ in @eq:szego-coefficients. (This can be realized
by a change of variables under which the integral @eq:szego-coefficients over
$|partial D_0|$ becomes the integral @eq:extended-szego-coefficients over
$|partial D|$). If the functions $phi_1, ..., phi_n$ so chosen satisfy the
condition that the series @eq:extended-szego-kernel converges for $z in D$ and
$zeta in partial D$, then the desired integral representation
@eq:extended-szego-representation exists. It turns out that our problem has a
solution for a certain class $frak(M)$ of $n$-circular domains that depends only
on the domain $D_0$ and not on the choice of the measure $lambda_0$ (or, what is
the same, not on the choice of the Szegö kernel $h$). The kernels
@eq:extended-szego-kernel are called #index-mark(
  "Kernel function",
  sub: "Szegö",
  subsub: "extended",
)_extended Szegö kernels_. In particular, if $D_0$ is a ball, then $frak(M)$ is
the class of bounded convex $n$-circular domains with certain natural
restrictions on their boundaries. But the Temlyakov integral representation
@eq:temlyakov-moduli is an extension to convex $n$-circular domains of an
integral representation with Szegö kernel for the ball. We shall not give a
description of the class $frak(M)$ in the general case (see @bib:Aizenberg1964b
or @bib:Aizenberg1973a), remarking only that for any complete $n$-circular
domain of holomorphy $D$ with $C^((2))$-boundary there exists an integral
representation @eq:extended-szego-representation with kernel that is rational in
$z$ and is an extension of a Szegö kernel for the domain
$D_p = {z: |z_1|^(2 \/ p) + dots.c + |z_n|^(2 \/ p) < 1}$ for some positive
integer $p$ (see @bib:Borodin1969 or @bib:Zinovev1974).

Results analogous to those in @pt:szego-n-circular and @pt:extended-szego can be
obtained also for tubular domains, where instead of a general basis of monomials
we use a continuous basis of exponentials, and instead of power series we use
Fourier integrals (see @bib:Gindikin1962).

#point <pt:universal-n-circular> Let $D$ be a bounded complete $n$-circular
domain with center at zero (no particular smoothness of $partial D$ is assumed),
and $M$ the set of vectors $k$ whose coordinates are relatively prime
nonnegative integers. For each $k in M$ let $zeta(k)$ #source(94) be a point at
which the monomial $|zeta^k|$ attains a maximum on $partial D$ (such a point may
not be unique, in which case we choose one of them). The corresponding skeleton
$Delta_(zeta(k))$ is denoted simply by $Delta(k)$. Finally, consider any
skeleton in $partial D$ and denote it by $Delta(0)$.

#theorem(title: [de Leeuw, Aĭzenberg, and Gindikin])[
  For any $f in A_C (D)$ the integral representation
  $
    f(z) = 1 / (2 pi i)^n [integral_(Delta(0)) f(zeta) (d zeta) / zeta
      + sum_(k in M) z^k integral_(Delta(k)) f(zeta) / (zeta^k - z^k)
      (d zeta) / zeta]
  $ <eq:de-leeuw-aizenberg-gindikin>
  holds for $z in D$, where the series converges absolutely and uniformly on
  compact subsets of $D$.
] <th:de-leeuw-aizenberg-gindikin>

#proof[
  It can be assumed at once that $f in A(overline(D))$, since we can consider a
  homothety $D_r$ ($r < 1$) in place of $D$ and then pass to the limit as
  $r -> 1$. We represent $f(z)$ in $D$ by the power series
  $
    f(z) & = sum_k c_k z^k
           = c_0 + sum_(k in M) sum_(l = 1)^infinity c_(k l) z^(k l) \
         & = 1 / (2 pi i)^n [integral_(Delta(0)) f(zeta) (d zeta) / zeta
             + sum_(k in M) sum_(l = 1)^infinity z^(k l)
             integral_(Delta(k)) f(zeta) / zeta^(k l) (d zeta) / zeta] \
         & = 1 / (2 pi i)^n [integral_(Delta(0)) f(zeta) (d zeta) / zeta
             + sum_(k in M) integral_(Delta(k)) (f(zeta) z^k) / (zeta^k - z^k)
             (d zeta) / zeta],
  $
  where $k l = (k_1 l, ..., k_n l)$ and
  $
    sum_(l = 1)^infinity (z^k / zeta^k)^l = z^k / (zeta^k - z^k),
  $
  since $|z^k| < |zeta^k|$ for $z in D$ and $zeta in Delta(k)$.
]

We remark that formula @eq:de-leeuw-aizenberg-gindikin is universal for the
class of domains under consideration.
