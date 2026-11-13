#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Integral representation for strictly pseudoconvex domains
<sec:strictly-pseudoconvex>

A bounded domain $D$ is said to be #index-mark(
  "Domain",
  sub: "strictly pseudoconvex",
)_strictly pseudoconvex_ if there exist a neighborhood $U supset overline(D)$
and a function $rho in C^((2)) (U)$ such that $D = {z: z in U, rho(z) < 0}$,
where $grad rho != 0$ on $partial D$ and the function $rho$ is #index-mark(
  "Function",
  sub: "strictly plurisubharmonic",
)_strictly plurisubharmonic_ in $U$, i.e.,
$
  sum_(j, k = 1)^n (partial^2 rho(z)) / (partial z_j partial overline(z)_k)
  w_j overline(w)_k > 0
$
for $z in U$ and all $w in CC^n$, $w != 0$.

Strictly pseudoconvex domains play an important role in multidimensional complex
analysis. Any domain of holomorphy can be approximated from the inside by these
domains (as well as by Weil polyhedra; see @sec:dbar-problem). We need some
auxiliary propositions in order to get an integral representation of functions
#source(81) holomorphic in strictly pseudoconvex domains from the
Cauchy-Fantappiè formula. Let
$
  D_delta = {z: z in U, rho(z) < delta}, quad
  V_delta = {z: z in U, |rho(z)| < delta}, \
  U_(epsilon, delta) = {(zeta, z): zeta in V_delta, z in D_delta,
    |zeta - z| < epsilon}
$
where $epsilon, delta > 0$. The space of $C^((1))$-functions in $V_delta$ with
values in a space $H$ is denoted by $C^((1)) (V_delta, H)$.

#lemma[
  For every strictly pseudoconvex domain $D$ there exist positive constants
  $epsilon$, $delta$, $sigma$ and functions
  $
    F in C^((1)) (U_(epsilon, delta)), quad
    G in C^((1)) (U_(epsilon, delta)), quad
    Phi in C^((1)) (V_delta, A(D_delta))
  $
  that satisfy the following conditions:
  #enum(numbering: "1)")[$Phi = F G$ on $U_(epsilon, delta)$, $F(z, z) = 0$,
    $|G| > delta$ on $U_(epsilon, delta)$, and $|Phi| > delta$ outside
    $U_(epsilon, delta)$.][$2 Re F(zeta, z) >= rho(zeta) - rho(z)
    + sigma |zeta - z|^2$ on $U_(epsilon, delta)$.][$d_zeta F(zeta, z)|_(zeta
    = z) = -d_z F(zeta, z)|_(zeta = z) = partial rho(z)$.]
] <lem:support-function>

#proof[
  Suppose first that $D$ is strictly convex; more precisely, suppose that $rho$
  is strictly convex in $U$, and then let
  $
    Phi = F = sum_(i = 1)^n (partial rho(zeta)) / (partial zeta_i)
    (zeta_i - z_i).
  $
  #new-par
  Taylor's formula implies the existence of a $sigma > 0$ such that
  $
    2 Re F(zeta, z) >= rho(zeta) - rho(z) + sigma |zeta - z|^2
  $
  for $zeta in D_delta$, and $z in D_delta$, and the assertions of the lemma are
  valid in this case.

  In the general case there exists (see Lemma~@lem:local-convexification) for
  every $tilde(zeta) in partial D$ a biholomorphic mapping $w(z, tilde(zeta))$
  of some neighborhood $tilde(U)_(tilde(zeta))$ of $tilde(zeta)$ onto some
  neighborhood $B$ of zero in $CC_w^n$ such that the inverse mapping
  $z(w, tilde(zeta))$ carries the strictly plurisubharmonic function $rho(z)$
  into the strictly convex function
  $rho_(tilde(zeta)) (w) = rho(z(w, tilde(zeta)))$ of the variable $w$ in $B$.
  By Taylor's formula, there exist $tilde(epsilon)', tilde(sigma)' > 0$ such
  that for $|w'| < tilde(epsilon)'$ and $|w - w'| < tilde(epsilon)'$ we have
  $
    2 Re sum_(j = 1)^n (partial rho_(tilde(zeta)) (w')) / (partial w_j)
    (w'_j - w_j)
    >= rho_(tilde(zeta)) (w') - rho_(tilde(zeta)) (w)
    + tilde(sigma)' |w' - w|^2.
  $
  Therefore, there exist $epsilon', sigma' > 0$ such that
  $
    & 2 Re sum_(j = 1)^n
      (partial rho_(tilde(zeta)) (w(zeta, tilde(zeta)))) / (partial w_j)
      [w_j (zeta, tilde(zeta)) - w_j (z, tilde(zeta))] \
    & quad >= rho(zeta) - rho(z) + sigma' |zeta - z|^2
  $ <eq:local-support-estimate>
  #source(82)
  if $|zeta - tilde(zeta)| < epsilon'$ and $|zeta - z| < epsilon'$. Let
  $
    F_(tilde(zeta)) & = sum_(j = 1)^n
                      (partial rho_(tilde(zeta)) (w(zeta, tilde(zeta))))
                      / (partial w_j)
                      [w_j (zeta, tilde(zeta)) - w_j (z, tilde(zeta))] \
                    & = sum_(j = 1)^n (partial rho(zeta)) / (partial zeta_j)
                      [sum_(i = 1)^n
                        (partial z_j (w(zeta, tilde(zeta)))) / (partial w_i)
                        [w_i (zeta, tilde(zeta)) - w_i (z, tilde(zeta))]] .
  $ <eq:local-support-function>
  #new-par
  Here again $|zeta - tilde(zeta)| < epsilon'$ and $|zeta - z| < epsilon'$. We
  consider also points $tilde(zeta)^1, ..., tilde(zeta)^N$ on $partial D$ such
  that
  $
    partial D subset union.big_(j = 1)^N B_(epsilon'_j) (tilde(zeta)^j).
  $
  Suppose that the functions ${phi_i}_(i = 1, ..., N)$ form a partition of unity
  in $V_(delta')$, with the support of $phi_j$ in
  $B_(epsilon'_j) (tilde(zeta)^j)$. Let
  $
    F(zeta, z) = sum_(j = 1)^N F_(tilde(zeta)^j) (zeta, z) phi_j (zeta),
  $ <eq:support-function-partition>
  where $zeta in V_(delta')$ and $|zeta - z| < 2 epsilon = min_j epsilon'_j$.

  We now get from @eq:local-support-estimate–@eq:support-function-partition that
  $
    2 Re F(zeta, z) >= rho(zeta) - rho(z) + sigma |zeta - z|^2, quad
    (zeta, z) in U_(2 epsilon, delta).
  $ <eq:support-function-estimate>
  Here $sigma = min_j sigma'_j$. This proves assertions 2); 3) can be verified
  directly.

  For small $delta' > 0$ it follows from @eq:support-function-estimate that for
  $zeta in V_(delta')$, $z in D_(delta')$ and $epsilon < |zeta - z| < 2 epsilon$
  $
    Re F(zeta, z) > 0.
  $ <eq:support-function-positive>
  #new-par
  Fix a continuous single-valued branch in $ln F$ in the domain ${F: Re F > 0}$
  and consider a real-valued $C^((infinity))$-function $chi(z)$ with compact
  support in the ball $B_(2 epsilon) (0)$ such that $chi(z) = 1$ in
  $overline(B_epsilon (0))$. We introduce an exterior differential form
  $A(zeta, z)$ of type $(0, 1)$ that depends smoothly on the parameter
  $zeta in V_(delta')$:
  $
    A(zeta, z) = cases(
      dbar_z [(ln F) chi(zeta - z)]
      quad & "if" z in supp grad_z chi(zeta - z)\,,
      0 & "if" z in.not supp grad_z chi(zeta - z).
    )
  $ <eq:dbar-data>
  #new-par
  Since $A(zeta, z) in C^((1)) (V_delta, C(overline(D)_delta))$ for
  $0 < delta < delta'$, it follows (see Theorem~@th:dbar-domain-holomorphy) that
  there is a function $B(zeta, z) in C^((1)) (V_delta, C(overline(D)_delta))$
  such that
  $
    dbar_z B(zeta, z) = A(zeta, z).
  $ <eq:dbar-equation>
  #source(83)
  Let
  $
    Phi(zeta, z) = cases(
      F(zeta, z) exp [-B(zeta, z)]
      & "for" zeta in V_delta\, z in D_delta\, |zeta - z| <= epsilon\,,
      exp [ln F chi(zeta - z) - B(zeta, z)]
      & "for" zeta in V_delta\, z in D_delta\, |zeta - z| >= epsilon.
    )
  $ <eq:support-function-global>
  This function is well-defined, because $F exp [-B(zeta, z)] = exp [ln F - B]$
  for $|zeta - z| = epsilon$. Assertion 1) of the lemma now follows from
  @eq:dbar-data–@eq:support-function-global.
]

#lemma[
  Let $D = {z: z in U, rho(z) < 0}$ be a strictly pseudoconvex domain. For any
  point $tilde(zeta) in partial D$ there exists a biholomorphic mapping of some
  neighborhood $tilde(U)_(tilde(zeta))$ of $tilde(zeta)$ onto some neighborhood
  $B$ of zero in $CC_w^n$ under which the domain
  $D inter tilde(U)_(tilde(zeta))$ is biholomorphically equivalent to a convex
  domain in $CC_w^n$, and the inverse mapping carries the strictly
  plurisubharmonic function $rho(z)$ into a strictly convex function.
] <lem:local-convexification>

#proof[
  By a parallel translation we can take the point $tilde(zeta)$ to zero, and
  then in some neighborhood of zero
  $
    rho(z) & = 2 Re sum_(j = 1)^n (partial rho(0)) / (partial z_j) z_j
             + sum_(j, k = 1)^n (partial^2 rho(0))
             / (partial z_j partial overline(z)_k) z_j overline(z)_k \
           & quad + Re sum_(j, k = 1)^n (partial^2 rho(0))
             / (partial z_j partial z_k) z_j z_k + o(|z|^2).
  $
  By the implicit function theorem, we can take the local coordinates in a
  smaller neighborhood of zero to be the function
  $
    w_1 (z) = 2 sum_(j = 1)^n (partial rho(0)) / (partial z_j) z_j
    + sum_(j, k = 1)^n (partial^2 rho(0)) / (partial z_j partial z_k) z_j z_k
  $
  together with any linear functions $w_2, ..., w_n$ that are coordinates in the
  hyperplane
  $
    {z: (partial rho(0)) / (partial z_1) z_1 + dots.c
      + (partial rho(0)) / (partial z_n) z_n = 0}.
  $
  Strict pseudoconvexity at 0 now means that
  $
    sum_(j, k = 1)^n a_(j k) zeta_j overline(zeta)_k >= gamma |zeta|^2,
  $
  where $gamma > 0$ and
  $a_(j k) = partial^2 rho(0) \/ partial w_j partial overline(w)_k$. In the new
  local coordinates $w$ we have
  $
    rho = x_1 + sum_(j, k = 1)^n a_(j k) w_j overline(w)_k + o(|w|^2).
  $ <eq:convex-local-coordinates>
  #source(84)
  Here $x_1 = Re w_1$. The function @eq:convex-local-coordinates is strictly
  convex in the coordinates of $w$. If $epsilon > 0$ is sufficiently small, then
  $B_epsilon (0) inter D$ is a convex domain in the coordinates of $w$, where
  $B_epsilon (0) = {w: |w| < epsilon}$.
]

#lemma[
  Under the conditions of Lemma~@lem:support-function
  $
    Phi(zeta, z) = sum_(i = 1)^n P_i (zeta, z) (zeta_i - z_i),
  $
  where $P_i (zeta, z) in C^((1)) (V_delta, A(D_delta))$, $i = 1, ..., n$,
  $zeta in V_delta$ and $z in D_delta$.
] <lem:hefer-decomposition>

#proof[
  Let $C(zeta, z, w) = Phi(zeta, z) - Phi(zeta, w)$; then
  $
    C(zeta, z, w) in C^((1)) (V_delta, A(D_delta times D_delta)).
  $
  For fixed $zeta in V_delta$ the function $C$ is in the ideal $J$ of
  holomorphic functions that are zero on the set
  ${(z, w): z in D_delta, w in D_delta, z = w}$. By Hefer's theorem (see
  @sec:dbar-problem), this ideal has generators $w_1 - z_1, ..., w_n - z_n$, and
  the expansion of $C(zeta, z, w)$ in these generators can be made continuously
  differentiable with respect to the parameter $zeta$ (see
  Theorem~@th:oka-hefer-prime[25.2$'$]), i.e., there exist
  $Q_i (zeta, z, w) in C^((1)) (V_delta, A(D_delta times D_delta))$,
  $i = 1, ..., n$, such that
  $
    C(zeta, z, w) = sum_(i = 1)^n Q_i (zeta, z, w) (w_i - z_i).
  $
  We remark that $F(zeta, zeta) = 0$; hence, also $Phi(zeta, zeta) = 0$ (see the
  proof of Lemma~@lem:support-function), and so
  $
    Phi(zeta, z) = C(zeta, z, zeta)
    = sum_(i = 1)^n P_i (zeta, z) (zeta_i - z_i),
  $
  where $P_i (zeta, z) = Q_i (zeta, z, zeta)$, $i = 1, ..., n$.
]

Using the vector-valued function
$
  P = P(zeta, z) = (P_1 (zeta, z), ..., P_n (zeta, z)),
$
whose existence was proved in Lemma~@lem:hefer-decomposition, we can now get the
following assertion from the Cauchy-Fantappiè formula.

#theorem(title: [#index-mark(
    "Formula",
    sub: "Khenkin, for strictly pseudoconvex domains",
    target: <th:khenkin-ramirez>,
  )Khenkin and Ramírez de Arellano])[
  Under the condition of Lemma~@lem:support-function the formula
  $
    f(z) = integral_(partial D) f(zeta) omega(zeta - z, P(zeta, z))
  $ <eq:khenkin-ramirez>
  holds for every $f in A_C (D)$ and any point $z in D$.
] <th:khenkin-ramirez>

The kernel in the integral representation @eq:khenkin-ramirez is not written
explicitly; however, the estimates in Lemma~@lem:support-function enable us to
get information about the #source(85) singularity of this kernel, and that
proves to be sufficient for important applications.

#theorem(title: [Khenkin])[
  For every point $z in overline(D)$ and any $delta$, $0 < delta < gamma_0$,
  $
    integral_(partial D without B(z, delta))
    (d sigma_zeta) / (|Phi(zeta, z)|^n)
    <= gamma_1 ln gamma_1 / (delta + |rho(z)|),
  $ <eq:khenkin-estimate>
  where $d sigma_zeta$ is the surface element of $partial D$, and the positive
  constants $gamma_0$ and $gamma_1$ do not depend on $z$ nor $delta$.
] <th:khenkin-estimate>

To prove this theorem we need some auxiliary facts.

#lemma[
  There exist $sigma > 0$, $delta > 0$, and $gamma > 0$ such that for every
  $z in V_sigma$ it is possible to make a smooth change of variables
  $eta = eta(zeta)$ in $B_delta (z)$ with the properties that
  #enum(numbering: "1)")[$eta_1 (zeta) = rho(zeta) - rho(z)
    + i Im F(zeta, z)$.][$eta(z) = 0$,][$|zeta - z|
    >= gamma |eta(zeta) - eta(z)| >= gamma^2 |zeta - z|$ for
    $zeta in B_(2 delta) (z)$, and][$1 \/ gamma
    >= |partial eta \/ partial zeta| >= gamma$ for $zeta in B_(2 delta) (z)$,]
  where $F(zeta, z)$ is the function constructed in Lemma~@lem:support-function.
] <lem:eta-coordinates>

#proof[
  There exists a $sigma > 0$ such that $d_zeta F(zeta, z)|_(zeta = z) != 0$ for
  every $z in V_sigma$. Consequently, there exist $tilde(gamma) > 0$ and
  $tilde(delta) > 0$ such that for $z in V_sigma$ it is possible to make a
  smooth change of variables $tilde(eta) = tilde(eta)(zeta)$ in
  $B_(tilde(delta)) (z)$ under which we have properties 2)–4) for
  $delta = tilde(delta)$ and $gamma = tilde(gamma)$ and the property 1$'$)
  expressed by $tilde(eta)_1 (zeta) = F(zeta, z)$. Further,
  $Im tilde(eta)_1 (zeta) = Im F(zeta, z) = Im eta_1 (zeta)$ and, according to
  assertion 3) in Lemma~@lem:support-function, we get that
  $
    d_zeta Re tilde(eta)_1 (zeta)|_(zeta = z)
    = d_zeta Re F(zeta, z)|_(zeta = z)
    = 1 / 2 d_zeta rho(zeta)|_(zeta = z)
    = 1 / 2 d_zeta Re eta_1 (zeta)|_(zeta = z),
  $
  so there exist a $gamma$ and a $delta$ as claimed in our lemma.
]

#lemma[
  For every $epsilon$ and $delta$ such that $0 < epsilon < 1$ and
  $0 < delta < 1$
  $
    J & = integral_(delta^2 <= t_2^2 + t_3^2 + dots.c + t_(2n)^2 <= 1)
        (d t_2 and dots.c and d t_(2n))
        / (t_2^2 + dots.c + t_(2n)^2 + epsilon^2 + |t_2|)^n \
      & <= gamma_0 |ln(epsilon + delta)| + gamma_0,
  $ <eq:log-integral-estimate>
  where $gamma_0 > 0$ does not depend on $epsilon$ nor $delta$.
] <lem:log-integral-estimate>

#source(86)
#proof[
  We consider the case $n > 1$ of interest to us. Let
  $r^2 = t_2^2 + dots.c + t_(2n)^2$. Passing to a spherical system of
  coordinates, we find that
  $
    J & <= (4 pi^(n - 1)) / ((n - 2)!) integral_delta^1 d r
        integral_0^(pi\/2) (r^(2n - 2) sin^(2n - 3) phi d phi)
        / (r^2 + epsilon^2 + r cos phi)^n \
      & <= (4 pi^(n - 1)) / ((n - 2)!) integral_delta^1 d r integral_0^1
        (r^(2n - 2) d s) / (r^2 + epsilon^2 + r s)^n
        <= (4 pi^(n - 1)) / ((n - 1)!) integral_delta^1
        (r^(2n - 3) d r) / (r^2 + epsilon^2)^(n - 1) \
      & <= (2^(n + 1) pi^(n - 1)) / ((n - 1)!) integral_delta^1
        (d r) / (r + epsilon)
        = (2^(n + 1) pi^(n - 1)) / ((n - 1)!)
        ln (1 + epsilon) / (epsilon + delta) \
      & <= gamma_0 |ln(epsilon + delta)| + gamma_0.
  $
]

#proof(title: [Proof of Theorem~@th:khenkin-estimate.])[
  According to Lemma~@lem:support-function,
  $
    integral_(partial D without B_delta (z))
    (d sigma_zeta) / (|Phi(zeta, z)|^n)
    & <= integral_((B_(delta') (z) without B_delta (z)) inter partial D)
    (d sigma_zeta) / (|F(zeta, z)|^n |G(zeta, z)|^n) \
    & quad + integral_(partial D without B_(delta') (z))
    (d sigma_zeta) / (|Phi(zeta, z)|^n) \
    & <= 1 / sigma^n
    [integral_((B_(delta') (z) without B_delta (z)) inter partial D)
      (d sigma_zeta) / (|F(zeta, z)|^n) \
      & quad + integral_(partial D) d sigma_zeta],
  $ <eq:khenkin-estimate-split>
  where $sigma$, $F$, and $G$ are from Lemma~@lem:support-function, and the
  sufficiently small $delta'$ satisfies the conditions of
  Lemmas~@lem:support-function and @lem:eta-coordinates. In the ball
  $B_(delta') (z)$ we make a change of variables $eta = eta(zeta)$ as in
  Lemma~@lem:eta-coordinates. Let $t_(2i - 1) = Re eta_i$ and
  $t_(2i) = Im eta_i$. From 2) in Lemma~@lem:support-function and 1) in
  Lemma~@lem:eta-coordinates we get
  $
    |F(zeta, z)|
    >= [((t_1 + sigma |zeta - z|^2) / 2)^2 + t_2^2]^(1\/2)
    >= 1 / sqrt(2) ((|t_1| + sigma |zeta - z|^2) / 2 + |t_2|)
  $
  for $zeta in B_(delta') (z)$. Since $t_1 = -rho(z)$ for
  $zeta in (partial D) inter B_(delta') (z)$, we now find from 3) and 4) of
  Lemma~@lem:eta-coordinates that
  $
    & integral_((B_(delta') (z) without B_delta (z)) inter partial D)
      (d sigma_zeta) / (|F(zeta, z)|^n) \
    & quad <= gamma_2 integral_(delta^2 <= t_2^2 + dots.c + t_(2n)^2 <= 1)
      (d t_2 and dots.c and d t_(2n))
      / (t_2^2 + dots.c + t_(2n)^2 + |rho(z)| + |t_2|)^n,
  $ <eq:khenkin-estimate-near>
  where $gamma_2 > 0$ does not depend on $z$ or $delta$. Then
  @eq:khenkin-estimate follows from @eq:khenkin-estimate-split,
  @eq:khenkin-estimate-near, and @eq:log-integral-estimate.
]

In conclusion we give a result about the connection between the Khenkin-Ramírez
de Arellano formula @eq:khenkin-ramirez, written in the form
$
  f(z) = integral_(partial D) f(zeta) H(z, zeta) d sigma,
$ <eq:khenkin-ramirez-measure>
#source(87)
and the integral representation with #index-mark(
  "Kernel function",
  sub: "Szegö",
)Szegö kernel
$
  f(z) = integral_(partial D) f(zeta) S(z, overline(zeta)) d sigma_zeta.
$ <eq:szego-representation>
#new-par
Let $A(z, zeta) = overline(H(zeta, z)) - H(z, zeta)$. The integrals on the
right-hand sides of @eq:khenkin-ramirez-measure and @eq:szego-representation
give rise to operators in $L_(d sigma)^2 (partial D)$ which we denote by
$tilde(H)$ and $tilde(S)$. The operator $tilde(A)$ is introduced similarly. The
following result is based on Theorem~@th:khenkin-estimate.

#theorem(title: [Kerzman and Stein])[
  Let $D$ be a strictly pseudoconvex domain with $C^((infinity))$-boundary. The
  kernel $A(z, zeta)$ is absolutely integrable with respect to
  $zeta in partial D$ for fixed $z in partial D$. The equality
  $
    tilde(S) = tilde(H) + tilde(H) tilde(A) + dots.c + tilde(H) tilde(A)^k
    + dots.c
  $
  is valid in the asymptotic sense, i.e.,
  $
    tilde(S) - tilde(H) - sum_(j = 1)^k tilde(H) tilde(A)^j
  $
  is a bounded operator from $L_(d sigma)^2 (partial D)$ to
  $C^((alpha(k))) (partial D)$. Here $alpha(k) -> infinity$ as $k -> infinity$.
] <th:kerzman-stein>
