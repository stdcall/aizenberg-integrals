#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Modifications and the simplest particular cases of the Leray formula
<sec:leray-modifications>

#source(73)
#point <pt:conformal-modifications> For $n = 1$ the Cauchy-Fantappiè formula
@eq:cauchy-fantappie or the generalized Cauchy-Fantappiè formula
@eq:generalized-cauchy-fantappie becomes the classical Cauchy formula. However,
for holomorphic functions of a single complex variable it is possible to get
other integral representations that recover the values of a function at points
$z in D$ from its values on $partial D$ and that differ from the Cauchy formula,
for example, by means of a conformal mapping.

Let $w_1 = psi(z_1)$ be a conformal mapping of a closed domain $overline(D)$
onto a closed domain $overline(G)$, and consider the inverse mapping
$z_1 = theta(w_1)$, $z_1 in overline(D)$, $w_1 in overline(G)$. From the
classical Cauchy formula @eq:cauchy-formula-one-variable we now get that
$
  f(theta(w_1)) & = 1 / (2 pi i) integral_(partial G) f(theta(eta_1))
                  (theta'(eta_1) d eta_1) / (theta(eta_1) - theta(w_1)) \
                & = 1 / (2 pi i) integral_(partial G) f(theta(eta_1))
                  (theta'(eta_1) (eta_1 - w_1)) / (theta(eta_1) - theta(w_1))
                  (d eta_1) / (eta_1 - w_1),
$
or, in other notation,
$
  f(z_1) = 1 / (2 pi i) integral_(partial D) f(zeta_1) phi(zeta_1, z_1)
  (d zeta_1) / (zeta_1 - z_1),
$ <eq:conformal-cauchy>
where the function $phi$ is jointly continuous for $z_1 in D$,
$zeta_1 in overline(D)$ and holomorphic with respect to $zeta_1$ in
$overline(D)$, with $phi(z_1, z_1) equiv 1$. Formula @eq:conformal-cauchy does
not follow from the general formulas @eq:generalized-cauchy-fantappie and
@eq:cauchy-fantappie.

It is natural to generalize @eq:generalized-cauchy-fantappie and
@eq:cauchy-fantappie in the corresponding way. The next result is easy to
obtain.

#source(74)
#proposition[
  Suppose that $w^j (zeta, z)$ satisfies the conditions
  $w^0 in C_zeta (partial D)$, $w^j in C_zeta^((1)) (partial D)$,
  $j = 1, ..., n - 1$ and $chevron.l w^j, zeta - z chevron.r != 0$,
  $zeta in partial D$, $z in D$, $j = 0, 1, ..., n - 1$, the function
  $phi(zeta, z)$ belongs to $A_C (D)$ with respect to $zeta$ for fixed $z in D$,
  and $phi(z, z) equiv 1$. Then for every $f in A_C (D)$ and any $z in D$ the
  following modifications of @eq:generalized-cauchy-fantappie and
  @eq:cauchy-fantappie are valid:
  $
    integral_(partial D) f phi Omega(w^0, w^1, ..., w^(n - 1), zeta - z)
    = f(z),
  $ <eq:modified-generalized-cauchy-fantappie>
  $
    integral_(partial D) f phi omega(zeta - z, w^1) = f(z).
  $ <eq:modified-cauchy-fantappie>
] <prop:modified-cauchy-fantappie>

#proof[
  We apply @eq:generalized-cauchy-fantappie to the function
  $f(zeta) phi(zeta, z)$ for a fixed $z in D$:
  $
    integral_(partial D) f phi Omega = f(z) phi(z, z) = f(z).
  $
]

For $n = 1$ formulas @eq:modified-generalized-cauchy-fantappie and
@eq:modified-cauchy-fantappie contain all possible integral representations that
are analogues of the Cauchy integral (see @sec:orthogonal-forms). Even when
$n > 1$ formula @eq:modified-cauchy-fantappie has a certain completeness.

#proposition[
  1\. The kernel $phi omega(z - a, w^1)$ is transformed into a kernel of the
  same form under a biholomorphic mapping of the closed domain $overline(D)$.

  2\. If $n = 2$, the functions $F_1 (z)$ and $F_2 (z)$ belong to $A_C (D)$, and
  $F_1 + F_2 != 0$ in $D$, then the reproducing kernel
  $
    (F_1 phi_1 omega(z - a, w^1) + F_2 phi_2 omega(z - a, w^2))
    / (F_1 + F_2)
  $
  is again a kernel of the same form as in @eq:modified-cauchy-fantappie.
] <prop:modified-kernel-forms>

We mention one more formal generalization of the Cauchy-Fantappiè formula
@eq:cauchy-fantappie consisting in replacement of the inner product
$chevron.l w, zeta - z chevron.r$ by $chevron.l w, Q(zeta) - Q(z) chevron.r$ in
the denominator of the kernel $omega(z - a, w)$, where $Q in A^n (overline(D))$.
By Theorem~@th:oka-hefer (Hefer),
$
  Q_i (zeta) - Q_i (z) = sum_(j = 1)^n q_(i j) (zeta_j - z_j), quad
  i = 1, ..., n,
$
where $q_(i j) (zeta, z) in A^n (overline(D) times overline(D))$. Let
$Omega = det |q_(i j)|$. Then @eq:cauchy-fantappie gives us

#proposition(title: [Aĭzenberg])[
  For every $f in A_C (D)$ and any point $z in D$
  $
    integral_(partial D) f phi Omega tilde(omega)(Q(zeta) - Q(z), w) = f(z),
  $ <eq:aizenberg-formula>
  #source(75)
  where
  $
    tilde(omega)(F, w) = ((n - 1)!) / (2 pi i)^n
    (sum_(k = 1)^n (-1)^(k - 1) w_k d w_([k]) and d zeta)
    / (chevron.l w, F chevron.r^n) .
  $
] <prop:aizenberg>

Although @eq:aizenberg-formula is formally more general than the
Cauchy-Fantappiè formula @eq:cauchy-fantappie, each is a simple consequence of
the other.

#point <pt:martinelli-bochner-from-cauchy-fantappie> The Martinelli-Bochner
formula @eq:martinelli-bochner can be obtained from the Cauchy-Fantappiè formula
@eq:cauchy-fantappie by taking $w = overline(zeta) - overline(z)$.

#point <pt:linearly-convex> A domain $D = {z: rho(z, overline(z)) < 0}$ is said
to be a #index-mark("Domain", sub: "regular linearly convex")_regular linearly
convex_ domain if the real function $rho$ belongs to the class $C^((2))$ in a
neighborhood of $overline(D)$, $grad rho != 0$ on $partial D$, and for every
$zeta in partial D$ the tangential analytic plane
${z: chevron.l z - zeta, grad rho(zeta) chevron.r = 0}$ does not intersect $D$.
For such a domain we can regard $grad rho$ as the $w$ in @eq:cauchy-fantappie,
in which case we get
$
  f(z) = ((n - 1)!) / (2 pi i)^n integral_(partial D)
  (f(zeta) sum_(k = 1)^n delta_k d overline(zeta)_([k]) and d zeta)
  / [rho'_(zeta_1) (zeta_1 - z_1) + dots.c + rho'_(zeta_n) (zeta_n - z_n)]^n
$ <eq:linearly-convex-formula>
for $f in A_C (D)$, where
$
  delta_k = mat(
    delim: "|",
    rho'_(zeta_1), , rho'_(zeta_n);
    rho''_(zeta_1 overline(zeta)_1), , rho''_(zeta_n overline(zeta)_1);
    dots.c, [k], dots.c;
    rho''_(zeta_1 overline(zeta)_n), dots.c, rho''_(zeta_n overline(zeta)_n)
  ), quad k = 1, ..., n.
$
#new-par
In @eq:linearly-convex-formula, as in Cauchy's formula for $n = 1$, the outside
variable $z$ appears only in the denominator of the kernel, and the denominator
is a linear function of $z$, taken to the power $n$. This nice structure for the
kernel results in a number of beautiful applications of
@eq:linearly-convex-formula.

We represent $partial D$ as a union of disjoint sets $Gamma_m$, $m = 1, ..., n$,
in such a way that $rho'_(overline(zeta)_m) != 0$ on $Gamma_m$. Moreover, on
$Gamma_m$
$
  d overline(zeta)_([k]) and d zeta
  = (-1)^(m - k) (rho'_(overline(zeta)_k)) / (rho'_(overline(zeta)_m))
  d overline(zeta)_([m]) and d zeta.
$
Therefore, @eq:linearly-convex-formula can be written in the form#ed-note[The
  1983 edition omits this formula: the text passes from "in the form" directly
  to "where $L(rho)$ is the Levi determinant". It is restored from
  @eq:linearly-convex-formula and the preceding equality on $Gamma_m$, with
  $L(rho)$ expanded along its first column.]
$
  & f(z) = ((n - 1)!) / (2 pi i)^n sum_(m = 1)^n (-1)^(m - 1) \
  & quad times integral_(Gamma_m)
    (f(zeta) L(rho) d overline(zeta)_([m]) and d zeta)
    / (rho'_(overline(zeta)_m)
    [rho'_(zeta_1) (zeta_1 - z_1) + dots.c + rho'_(zeta_n) (zeta_n - z_n)]^n),
$ <eq:linearly-convex-levi>
#source(76)
where $L(rho)$ is the #index-mark("Determinant", sub: "Levi")Levi determinant
$
  L(rho) = - mat(
    delim: "|",
    0, rho'_(zeta_1), rho'_(zeta_n);
    rho'_(overline(zeta)_1), rho''_(zeta_1 overline(zeta)_1),
    rho''_(zeta_n overline(zeta)_1);
    dots.v, dots.v, dots.v;
    rho'_(overline(zeta)_n), rho''_(zeta_1 overline(zeta)_n),
    rho''_(zeta_n overline(zeta)_n)
  ) .
$
#new-par
A point $zeta in partial D$ is called a #index-mark(
  "Point",
  sub: "of strict pseudoconvexity",
)_point of strict pseudoconvexity_ if the #index-mark("Levi form")_Levi form_
$
  sum_(j, k = 1)^n (partial^2 rho(zeta))
  / (partial zeta_j partial overline(zeta)_k) eta_j overline(eta)_k
$
is positive for any $eta$ such that
$
  {eta: sum_(j = 1)^n (partial rho) / (partial zeta_j) eta_j = 0}.
$ <eq:complex-tangent-hyperplane>

#proposition[
  The Levi determinant $L(rho)$ is equal to the product of the eigenvalues of
  the Levi form on the hyperplane @eq:complex-tangent-hyperplane, multiplied by
  $|grad rho(zeta)|^2$.
] <prop:levi-determinant>

It follows from this proposition that the integration in
@eq:linearly-convex-formula is over the closure of the set of points of strict
pseudoconvexity in $partial D$. From Theorem~@th:shilov-boundary-converse it now
follows that this closure contains the Shilov boundary $S(D)$ in the case of a
regular linearly convex domain $D$. The requirement of linear convexity for $D$
can be discarded in this assertion.

#theorem(title: [Rossi and Basener])[
  Let $D$ be a bounded domain with $partial D in C^((2))$. Then $S(D)$ is
  contained in the closure of the set of points of strict pseudoconvexity in
  $partial D$.
] <th:rossi-basener>

Note that every regular convex domain is also a regular linearly convex domain;
therefore, the integral representation @eq:linearly-convex-formula is valid for
it. In particular, for the ellipsoid
$D = {z: alpha_1 |z_1|^2 + dots.c + alpha_n |z_n|^2 < R^2}$, $alpha_i > 0$,
$i = 1, ..., n$, we have
$
  f(z) = (alpha_1 dots.c alpha_n (n - 1)!) / (2 pi i)^n integral_(partial D)
  (f(zeta) sum_(k = 1)^n (-1)^(k - 1) overline(zeta)_k
  d overline(zeta)_([k]) and d zeta)
  / [R^2 - alpha_1 overline(zeta)_1 z_1 - dots.c
    - alpha_n overline(zeta)_n z_n]^n .
$ <eq:ellipsoid-formula>
For $alpha_1 = dots.c = alpha_n = R = 1$ this formula is called the #index-mark(
  "Formula",
  sub: "Bochner",
)_Bochner formula_ for functions holomorphic in the unit ball. The kernel in
@eq:ellipsoid-formula is holomorphic in $z$ and antiholomorphic in $zeta$ (i.e.,
holomorphic in $overline(zeta)$). Such reproducing kernels for integration over
$partial D$ are called #index-mark("Kernel function", sub: "Szegö")_Szegö
kernels_ (see @sec:kernels).

#source(77)
#point <pt:bochner-ono> Let $D$ be a bounded domain with piecewise smooth
boundary $partial D$, and for an arbitrary point $z in D$ choose a $v in D$ such
that the ball $B_r (v)$ is in $D$ and $z in B_r (v)$. If $zeta in partial D$,
then
$
  |chevron.l overline(zeta) - overline(v), zeta - z chevron.r|
  & = |chevron.l overline(zeta) - overline(v), zeta - v chevron.r
  - chevron.l overline(zeta) - overline(v), z - v chevron.r| \
  & >= |zeta - v|^2
  - |chevron.l overline(zeta) - overline(v), z - v chevron.r| \
  & >= |zeta - v| (|zeta - v| - |z - v|) > 0;
$
therefore, we can take $overline(zeta) - overline(v)$ as the $w$ in the
Cauchy-Fantappiè formula, and for $z in B_r (v)$ we get the #index-mark(
  "Formula",
  sub: "Bochner-Ono",
)_Bochner-Ono formula_
$
  f(z) = ((n - 1)!) / (2 pi i)^n integral_(partial D)
  (f(zeta) sum_(k = 1)^n (-1)^(k - 1) (overline(zeta)_k - overline(v)_k)
  d overline(zeta)_([k]) and d zeta)
  / (chevron.l overline(zeta) - overline(v), zeta - z chevron.r^n) .
$ <eq:bochner-ono>
It is possible to choose an at most countable set of points $v in D$ such that
the corresponding balls $B_(r(v)) (v)$ cover the whole of $D$. The kernel in
@eq:bochner-ono is holomorphic with respect to $z in B_r (v)$, but is not even
continuous with respect to $z$ in the whole domain $D$. If $D$ is a ball, then
@eq:bochner-ono becomes the Bochner formula.

#point <pt:hermitian-defining-function> We consider a bounded domain of
holomorphy $Q$ and a function $Psi(z, overline(zeta))$ on $Q times Q$ that is
holomorphic in $z$ and antiholomorphic in $zeta$. Suppose that
$Psi(z, overline(z))$ is real; the domain $D = {z: Psi(z, overline(z)) < 0}$ is
bounded and has a piecewise smooth boundary, $overline(D) subset Q$, and for
$zeta in partial D$ and $z in D$
$
  Psi(z, overline(z)) - Psi(z, overline(zeta))
  - overline(Psi(z, overline(zeta))) + Psi(zeta, overline(zeta)) >= 0,
$ <eq:hermitian-condition>
whence $Re Psi(z, overline(zeta)) < 0$. Under these assumptions we can take the
inner product $chevron.l w, zeta - z chevron.r$ in @eq:cauchy-fantappie to be
the difference $Psi(z, overline(zeta)) - Psi(zeta, overline(zeta))
equiv Psi(z, overline(zeta)) != 0$ for $z in D$ and $zeta in partial D$.

The integral representation so obtained is interesting in that its kernel is
holomorphic in $z$, and the "equation" of the boundary $partial D$ of $D$ is in
the denominator of the kernel. For example, for the domain
$D = B_r^alpha (0) = {z: |z_1|^(2 alpha_1) + dots.c + |z_n|^(2 alpha_n) < 1}$
we have the integral formula
$
  & f(z) = ((n - 1)!) / (2 pi i)^n \
  & quad times integral_(partial D)
    (f(zeta) product_(k = 1)^n (alpha_k overline(zeta)_k^(alpha_k - 1)
      sum_(i + j = alpha_k - 1) z_k^i zeta_k^j)
    sum_(k = 1)^n (-1)^(k - 1) alpha_k^(-1) overline(zeta)_k
    d overline(zeta)_([k]) and d zeta)
    / (1 - z_1^(alpha_1) overline(zeta)_1^(alpha_1) - dots.c
      - z_n^(alpha_n) overline(zeta)_n^(alpha_n))^n .
$
#source(78)
#new-par
An example of a function satisfying condition @eq:hermitian-condition is a
function of the form
$
  Psi(z, overline(zeta)) = F(z) + F(overline(zeta))
  + sum_(k = 1)^n a_k z_k^(m_k) overline(zeta)_k^(m_k),
$
where the $m_k$ are positive integers, $a_k > 0$, $k = 1, ..., n$, and
$overline(F(overline(zeta))) = F(zeta)$.

Another example is based on the following theorem.

#theorem(title: [Bishop])[
  Suppose that $D$ is a domain of holomorphy in $CC^n$. Then there exist
  functions $phi_1 (z), ..., phi_(n + 1) (z)$ holomorphic in $D$ such that for
  any $R > 0$ the set $D_R = {z: sum_(k = 1)^(n + 1) |phi_k (z)|^2 < R}$ has the
  property that $D_R relcomp D$ and, moreover, the boundary $partial D_R$ is
  smooth for almost all $R > 0$.
] <th:bishop>

Let us consider the function
$
  K(z, overline(zeta)) = sum_(m = 1)^(n + 1) phi_m (z) overline(phi_m (zeta)),
$
which is holomorphic with respect to $z$ and antiholomorphic with respect to
$zeta$ in $D times D$. For each connected component of $D_R$ inequality
@eq:hermitian-condition is valid if we set
$Psi(z, overline(zeta)) = K(z, overline(zeta)) - R$, since
$
  Psi(z, overline(z)) - Psi(z, overline(zeta))
  - overline(Psi(z, overline(zeta))) + Psi(zeta, overline(zeta))
  = sum_(m = 1)^(n + 1) |phi_m (z) - phi_m (zeta)|^2.
$
For $R > 0$ such that $partial D_R$ is smooth we now get that for $f in A_C (D)$
and $z in D_R$
$
  f(z) = integral_(partial D_R) f(zeta) mu,
$ <eq:universal-representation>
where the kernel $mu$ is an exterior differential form like the Cauchy-Fantappiè
form (see @eq:cauchy-fantappie), and the inner product
$chevron.l w, zeta - z chevron.r$ is taken to be the function
$K(z, overline(zeta)) - R = K(z, overline(zeta)) - K(zeta, overline(zeta))$, to
which the Hefer theorem is applicable. We remark that in
@eq:universal-representation we need not integrate over the whole boundary
$partial D_R$, but only over the boundary of the connected component of $D_R$
containing $z$. The kernel $mu$ in @eq:universal-representation is holomorphic
in $z$ and does not depend on $R$, and $union.big_R D_R = D$. It is natural to
say that the representation @eq:universal-representation is #index-mark(
  "Representation",
  sub: "universal, with respect to a given domain",
)_universal with respect to the given domain $D$_.

We remark in conclusion that the Bergman kernel function could be taken as
$K(z, overline(zeta))$ (see @sec:kernels).

In the next three sections we illuminate some other consequences of the
Cauchy-Fantappiè integral representation.
