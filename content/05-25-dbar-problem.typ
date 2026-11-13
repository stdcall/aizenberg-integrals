#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== The $dbar$-problem and Oka's theorems <sec:dbar-problem>

#point <pt:oka-scheme> The following result occupies an important place in
complex analysis.

#unnumbered([Theorem], title: [Oka], slant: true)[
  If at each point of its boundary a domain $D subset CC^n$ is not
  holomorphically extendible, then $D$ is a domain of holomorphy.
]

Recall that a domain $D$ #index-mark(
  "Domain",
  sub: "not extendible holomorphically at a point",
)_is not holomorphically extendible at a point_ $zeta in partial D$ if there
exist a neighborhood $U$ of $zeta$ and a function $f in A(D inter U)$ that
cannot be extended holomorphically to $zeta$.

The existing accounts of this theorem, which solves the famous _Levi problem_,
make use either of algebraic methods (sheaf theory) or of the theory of
differential operators (solvability of the $dbar$-Neumann problem).

Here we give a proof of Oka's theorem, due to Khenkin, that uses (as in the
original work of Oka) only function-theoretic methods, mainly integral
representations.

The following two assertions can be found in many complex analysis courses (see,
for example, @bib:Vladimirov1964, Chapter~III, §16.7, and Chapter~II, §12.10).

#unnumbered([I], slant: true)[
  If at each point of its boundary the domain $D$ is not holomorphically
  extendible, then $D$ is pseudoconvex (i.e., there exists a function
  plurisubharmonic in $D$ that tends to $+infinity$ as $partial D$ is
  approached).
]

#unnumbered([II], slant: true)[
  If $D$ is pseudoconvex, then $D = union.big_1^infinity D_k$, where the $D_k$
  are strictly pseudoconvex domains and $D_k relcomp D_(k + 1)$,
  $k = 1, 2, ...$.
]

To prove Oka's theorem it now suffices to prove the following.

#unnumbered([III], slant: true)[
  If $D$ is a strictly pseudoconvex domain, then $D$ is a domain of holomorphy.
]

#source(219)
#unnumbered([IV], slant: true)[
  If $D = union.big_1^infinity D_k$, $D_k relcomp D_(k + 1)$, and the $D_k$ are
  domains of holomorphy, then $D$ is a domain of holomorphy.
]

It is easy to see that III follows from the next assertion (see, for example,
@bib:Vladimirov1964, Chapter~III, §16.6).

#theorem(title: [Oka])[
  Suppose that $D$ is a strictly pseudoconvex domain. Then for any
  $zeta in partial D$ there exists a $g in A(D)$ such that $g(z) -> infinity$ as
  $z -> zeta$, $z in D$.
] <th:oka-peak-function>

Next, assertion IV is the Behnke-Stein theorem (see @bib:Vladimirov1964,
Chapter~III, §16.10). The Oka-Hefer theorem can be used in the following
formulation to prove this theorem.

#theorem(title: [Oka and Hefer])[
  Suppose that $D$ is a pseudoconvex domain in $CC^n$ and $f in A(D)$. Then for
  any domain $G relcomp D$ there exist functions
  $P_j (zeta, z) in A(G times G)$, $j = 1, ..., n$, such that
  $
    f(zeta) - f(z)
    = P_1 (zeta, z) dot.c (zeta_1 - z_1) + dots.c
    + P_n (zeta, z) dot.c (zeta_n - z_n)
  $
  for $zeta, z in G$.
] <th:oka-hefer>

Thus, to solve the Levi problem the main thing is to prove
Theorems~@th:oka-peak-function and~@th:oka-hefer. Moreover, the following
assertions are needed to construct a barrier function for a strictly
pseudoconvex domain (Lemma~@lem:support-function).

#unnumbered([Theorem~@th:oka-hefer$'$], slant: true)[
  Suppose that $D$ is a domain of holomorphy in $CC^n$ and $G relcomp D$. There
  exist linear operators $P_j: A(D) -> A_C (G times G)$, $j = 1, ..., n$, such
  that for $zeta, z in overline(G)$
  $
    f(zeta) - f(z)
    = (P_1 f)(zeta, z) dot.c (zeta_1 - z_1) + dots.c
    + (P_n f)(zeta, z) dot.c (zeta_n - z_n).
  $
] <th:oka-hefer-prime>

#theorem[
  Suppose that $D$ is a domain of holomorphy in $CC^n$, and let
  $A_(0, 1) (overline(D))$ be the space of $dbar$-closed continuous forms of
  type $(0, 1)$ in the closed domain $overline(D)$. Then for any domain
  $G relcomp D$ there exists a linear operator
  $tau: A_(0, 1) (overline(D)) -> C(overline(G))$, such that $dbar tau g = g$ in
  $G$ for any form $g in A_(0, 1) (overline(D))$.
] <th:dbar-domain-holomorphy>

#point <pt:dbar-strictly-convex> *The $dbar$-problem for strictly convex
domains.* Let $A_(p, q) (overline(D))$#notation-mark(
  $A_(p, q) (overline(D))$,
) denote the space of continuous forms $f$ of type $(p, q)$ on $overline(D)$
such that $dbar f = 0$, and let $C_(p, q)^((tau)) (overline(D))$#notation-mark(
  $C_(p, q)^((tau)) (overline(D))$,
) denote the space of forms of type $(p, q)$ whose coefficients satisfy a Hölder
condition with exponent $tau$, $0 < tau <= 1$. It is assumed that these spaces
are equipped with the natural topology. Here $D$ is a bounded domain in $CC^n$.

Suppose now that $D$ is a #index-mark("Domain", sub: "strictly convex")strictly
convex domain, i.e., $D = {z, rho(z) < 0}$, where $rho in C^((2)) (Omega)$,
$Omega$ is a domain $overline(D) subset Omega$, $grad rho|_(partial D) != 0$,
and the second differential $d^2 rho$ is positive definite in $Omega$. In this
subsection we prove

#theorem[
  Suppose that $D$ is a strictly convex domain in $CC^n$. There exists a linear
  operator
  $G_(p, q): A_(p, q) (overline(D)) -> C_(p, q - 1)^((1\/2)) (overline(D))$,
  $0 <= p <= n$, $1 <= q <= n$, such that the equation $dbar u = f$ is satisfied
  by the form $u = G_(p, q) f$.
] <th:dbar-strictly-convex>

#source(220)
In other words, $G_(p, q)$ is a right inverse of the operator $dbar$. The
construction#footnote[The construction of $G_(p, q)$ given in
  @eq:dbar-solution-operator is made with its use in @sec:orthogonal-forms also
  in mind. Simpler assertions suffice to prove
  Theorem~@th:dbar-strictly-convex.] of $G_(p, q)$ is given by
@eq:dbar-solution-operator for any $k >= 2$. Theorem~@th:dbar-strictly-convex is
a corollary to Theorems~@th:dbar-solution and~@th:dbar-holder.

Let
$
       P(zeta) & = (P_1 (zeta), ..., P_n (zeta))
                 = ((partial rho) / (partial zeta_1) (zeta), ...,
                   (partial rho) / (partial zeta_n) (zeta)), \
  Phi(zeta, z) & = sum_(j = 1)^n P_j (zeta) dot.c (zeta_j - z_j), quad
                 tilde(Phi)(zeta, z) = Phi(zeta, z) - rho(zeta).
$ <eq:support-function-convex>
#new-par
From Taylor's formula and the strict convexity of the function $rho$ it follows
that there exists a constant $sigma > 0$ such that if $zeta, z in Omega'$ and
$overline(D) subset Omega' relcomp Omega$, then
$
         2 Re Phi(zeta, z) & >= rho(zeta) - rho(z) + sigma |zeta - z|^2, \
  2 Re tilde(Phi)(zeta, z) & >= -rho(zeta) - rho(z) + sigma |zeta - z|^2.
$ <eq:support-function-estimates>
#new-par
We now get from @eq:support-function-estimates that for
$zeta, z in overline(D)$
$
  |zeta - z|^2 <= 2 / sigma |tilde(Phi)(zeta, z)|,
$ <eq:distance-estimate>
$
  |Phi(zeta, z)| <= |tilde(Phi)(zeta, z)|,
$ <eq:phi-tilde-bound>
$
  |tilde(Phi)(zeta, z)| >= sigma_1 [ |rho(zeta) - rho(z)| + |Im Phi(zeta, z)|
    - rho(zeta) - rho(z) + |zeta - z|^2],
$ <eq:phi-tilde-estimate>
where $sigma_1 > 0$ is a constant depending only on $D$.

Let $w(zeta, z, lambda) = (w_1, ..., w_n)$ be a vector-valued function defined
on a set
$U subset (CC_zeta^n times CC_z^n times RR_lambda^1)
without {(zeta, z, lambda): z = zeta}$
and such that $chevron.l w, zeta - z chevron.r = 1$. For $w in C^((1)) (U)$ let
$
  tilde(W)_(p, q) (w, zeta, z, lambda)
  & = ((-1)^(q + p(n - q - 1)) binom(n - 1, q)) / ((2 pi i)^n p! (n - p)!) \
  & quad times D_(1, q, n - q - 1) (w, dbar_z w, (dbar_zeta + d_lambda) w)
  and D_(p, n - p) (partial z, partial zeta), \
  & quad quad W_(p, -1) = W_(p, n) = 0.
$
#notation-mark($tilde(W)_(p, q) (w, zeta, z, lambda)$)
If $w$ does not depend on $lambda$, then
$tilde(W)_(p, q) (w, zeta, z, lambda) = W_(p, q) (w, zeta, z)$ (see
@sec:martinelli-bochner-koppelman). We introduce the vector-valued functions
$
  u(zeta, z) = (P(zeta)) / (Phi(zeta, z)) quad "and" quad
  eta(zeta, z, lambda) = (1 - lambda) t + lambda u(zeta, z),
$ <eq:homotopy-vector>
#source(221)
and the function
$
  alpha_k (zeta, z)
  = [1 - ((Phi(zeta, z)) / (tilde(Phi)(zeta, z)))^(2n)]^k
  = (-(rho(zeta)) / (tilde(Phi)(zeta, z)))^k
  [sum_(j = 0)^(2n - 1) ((Phi(zeta, z)) / (tilde(Phi)(zeta, z)))^j]^k.
$ <eq:alpha-k>
Here $zeta, z in overline(D)$, $Phi(zeta, z) != 0$, $lambda in [0, 1]$, and
$t = (overline(zeta) - overline(z)) \/ |zeta - z|^2$.

#lemma[
  If $Phi(zeta, z) != 0$, then the form
  $
    dbar_zeta alpha_k (zeta, z) and (tilde(W)_(p, q) (eta, zeta, z, lambda)
      - W_(p, q) (eta, zeta, z))
  $
  can be represented as a linear combination of forms like
  $
    ((rho(zeta)) / (tilde(Phi)(zeta, z)))^(k - 1)
    ((Phi(zeta, z)) / (tilde(Phi)(zeta, z)))^s
    ((overline(zeta)_j - overline(z)_j) phi(zeta, z, lambda)
    and dbar rho(zeta))
    / (|zeta - z|^(2(q + r + 1)) tilde(Phi)^(n - q - r) (zeta, z))
  $ <eq:kernel-difference-first>
  and
  $
    ((rho(zeta)) / (tilde(Phi)(zeta, z)))^k
    ((Phi(zeta, z)) / (tilde(Phi)(zeta, z)))^s
    ((overline(zeta)_j - overline(z)_j) (zeta_m - z_m) Psi(zeta, z, lambda))
    / (|zeta - z|^(2(q + r + 1)) tilde(Phi)^(n - q - r) (zeta, z)),
  $ <eq:kernel-difference-second>
  where $1 <= j, m <= n$, $0 <= r <= n - q - 2$, $s = 0, 1, ...$, and the forms
  $phi$ and $Psi$ have type $(p, q)$ in $z$, degree $1$ in $lambda$, and type
  $(n - p, n - q - 2)$ and $(n - p, n - q - 1)$ in $zeta$. The coefficients of
  the forms $phi$ and $Psi$ are derivatives of $rho(zeta)$ of order at most two,
  multiplied by a polynomial in $lambda$.
] <lem:kernel-difference>

#proof[
  From @eq:homotopy-vector, the properties of a determinant, and the fact that
  the vector-valued function $u$ is holomorphic in $z$ when $Phi(zeta, z) != 0$,
  we get
  $
    & D_(1, q, n - q - 1) (eta, dbar_z eta, (dbar_zeta + d_lambda) eta)
      - D_(1, q, n - q - 1) (eta, dbar_z eta, dbar_zeta eta) \
    & quad = (n - q - 1) D_(1, q, 1, n - q - 2)
      (t, dbar_z eta, d_lambda eta, dbar_zeta eta) \
    & quad = (-1)^(n - q) (n - q - 1) D_(1, q, 1, n - q - 2)
      (t, (1 - lambda) dbar_z t, u - t, \
    & (1 - lambda) dbar_zeta t + lambda dbar_zeta u) and d lambda \
    & quad = sum_(r = 0)^(n - q - 2) (-1)^n (n - q - 1) binom(n - q - 2, r)
      D_(1, 1, q, r, n - q - r - 2)
      (t, u, dbar_z t, dbar_zeta t, dbar_zeta u) \
    & quad and lambda^(n - q - r - 2) (1 - lambda)^(q + r) d lambda.
  $ <eq:determinant-difference>
  Just as in the proof of @eq:koppelman-determinant,
  $
    & D_(1, 1, q, r, n - q - r - 2)
      (t, u, dbar_z t, dbar_zeta t, dbar_zeta u)
      = (-1)^q
      / (|zeta - z|^(2(q + r + 1)) Phi^(n - q - r - 1) (zeta, z)) \
    & quad times D_(1, 1, q, r, n - q - r - 2) (
        overline(zeta) - overline(z),
        P,
        dbar_z overline(z),
        dbar_zeta overline(zeta),
        dbar P
      ).
  $
  #source(222)
  #new-par
  It now follows from @eq:determinant-difference and the definitions of
  $tilde(W)_(p, q)$ and $W_(p, q)$ that $tilde(W)_(p, q) (eta) - W_(p, q) (eta)$
  is a linear combination of forms like
  $
    ((overline(zeta)_j - overline(z)_j) phi(zeta, z, lambda))
    / (|zeta - z|^(2(q + r + 1)) Phi^(n - q - r - 1) (zeta, z)),
  $ <eq:kernel-difference-forms>
  where $1 <= j <= n$, $0 <= r <= n - q - 2$; $phi$ has type $(p, q)$ in $z$,
  type $(n - p, n - q - 2)$ in $zeta$, and degree $1$ in $lambda$, and the
  coefficients of $phi$ are derivatives of $rho(zeta)$ of order at most two,
  multiplied by a polynomial in $lambda$.

  On the other hand,
  $
    dbar_zeta alpha_k (zeta, z)
    = -k dot.c 2n alpha_(k - 1) (zeta, z) (Phi / tilde(Phi))^(2n - 1)
    (Phi / tilde(Phi) (dbar rho(zeta)) / (tilde(Phi)(zeta, z))
      - (rho(zeta) dbar_zeta Phi) / tilde(Phi)^2).
  $
  #new-par
  The assertion of the lemma follows from this equality,
  @eq:kernel-difference-forms, and the equality
  $dbar_zeta Phi = chevron.l dbar_zeta P, zeta - z chevron.r$.
]

We define the operators
$
  (G_(p, q)^k f)(z)
  & = - integral_(D_zeta) f(zeta) and alpha_k (zeta, z) U_(p, q - 1) (zeta, z) \
  & + (-1)^(p + q - 1) integral_(D_zeta times [0, 1]_lambda)
  f(zeta) and dbar_zeta alpha_k (zeta, z)
  and tilde(W)_(p, q - 1) (eta, zeta, z, lambda),
$ <eq:dbar-solution-operator>
where $0 <= p <= n$, $1 <= q <= n$, $f in C_(p, q) (overline(D))$.

#remark[
  The form $f(zeta) and dbar_zeta alpha_k (zeta, z) and W_(p, q - 1) (eta)$ is
  of type $(n, n + 1)$ in $zeta$; therefore, it vanishes. Consequently, the
  integrand in the second integral in @eq:dbar-solution-operator actually has
  the form
  $
    f(zeta) and dbar_zeta alpha_k
    and (tilde(W)_(p, q - 1) (eta) - W_(p, q - 1) (eta)).
  $
  Since $tilde(Phi)(zeta, z) != 0$ and $Phi(zeta, zeta) = 0$ for $z in D$ and
  $zeta in overline(D)$, the form
  $dbar_zeta alpha_k and (tilde(W)_(p, q - 1) (eta) - W_(p, q - 1) (eta))$ can
  be extended continuously to $overline(D)_zeta times D_z times [0, 1]_lambda$
  (this follows from Lemma~@lem:kernel-difference). Thus, the second integral in
  @eq:dbar-solution-operator is a proper integral.
]

#theorem[
  If $f in A_(p, q) (overline(D))$, $q >= 1$, then the form $u = G_(p, q)^k f$
  is a solution of the equation $dbar u = f$ for any $k >= 2$.
] <th:dbar-solution>

#proof[
  Let us take the function $alpha_k (zeta, z)$ as $phi$ in
  @eq:koppelman-weighted. Since $alpha_k$ is holomorphic in $z$ and
  $alpha_k (zeta, z) equiv 0$ for $zeta in partial D$ (see @eq:alpha-k), the
  equality $dbar f = 0$ #source(223) gives us that for $z in D$
  $
    f(z) & = (-1)^(p + q - 1) integral_(D_zeta)
           f(zeta) and dbar_zeta alpha_k (zeta, z) and U_(p, q) (zeta, z) \
         & quad - dbar_z integral_(D_zeta)
           f(zeta) and alpha_k (zeta, z) U_(p, q - 1) (zeta, z).
  $ <eq:koppelman-alpha>
  By Stokes' formula,
  $
    & integral_(D_zeta times [0, 1]_lambda)
      d (f(zeta) and dbar_zeta alpha_k (zeta, z)
        and tilde(W)_(p, q) (eta, zeta, z, lambda)) \
    & quad = integral_(D_zeta)
      f(zeta) and dbar_zeta alpha_k (zeta, z) and W_(p, q) (u, zeta, z) \
    & quad - integral_(D_zeta)
      f(zeta) and dbar_zeta alpha_k (zeta, z) and U_(p, q) (zeta, z) \
    & quad + integral_(partial D_zeta times [0, 1]_lambda)
      f(zeta) and dbar_zeta alpha_k (zeta, z)
      and tilde(W)_(p, q) (eta, zeta, z, lambda).
  $
  The vector-valued function $u$ is holomorphic in $z in D$, so
  $W_(p, q) (u, zeta, z) equiv 0$ for $q >= 1$. For $k >= 2$ and
  $zeta in partial D$ we have $dbar_zeta alpha_k = 0$; consequently, the
  preceding equality gives us
  $
    & integral_(D_zeta)
      f(zeta) and dbar_zeta alpha_k (zeta, z) and U_(p, q) (zeta, z) \
    & quad = (-1)^(p + q) integral_(D_zeta times [0, 1]_lambda)
      f(zeta) and dbar_zeta alpha_k (zeta, z)
      and (dbar_zeta + d_lambda) tilde(W)_(p, q) (eta, zeta, z, lambda) \
    & quad = dbar_z integral_(D_zeta times [0, 1]_lambda)
      f(zeta) and dbar_zeta alpha_k (zeta, z)
      and tilde(W)_(p, q - 1) (eta, zeta, z, lambda).
  $ <eq:homotopy-stokes>
  #new-par
  Here we have used the condition $dbar f = 0$, the equality
  $
    (dbar_zeta + d_lambda) tilde(W)_(p, q)
    = (-1)^(p + q) dbar_z tilde(W)_(p, q - 1)
  $
  (which can be proved in the same way as Lemma~@lem:koppelman-kernel-dbar), and
  the fact that $alpha_k$ is holomorphic in $z$. Substituting
  @eq:homotopy-stokes into @eq:dbar-solution-operator, we get the theorem.
]

Two lemmas are needed for estimating the solution of $dbar u = f$ given in
Theorem~@th:dbar-solution.

#lemma[
  Let#ed-note[The 1983 edition omits the formula defining
    $J_(alpha, k, l) (epsilon)$: the text passes from "Let" directly to "where
    $alpha$, $k$, and $l$ are real". It is restored from the proof of the lemma,
    which computes this integral in spherical coordinates.]
  $
    J_(alpha, k, l) (epsilon)
    = integral_(|t| < 1, t_1 + epsilon > 0)
    ((t_1 + epsilon)^alpha d v(t))
    / ((|t_1| + |t_2| + epsilon + |t|^2)^k |t|^l), quad
    t in RR^(2n), quad epsilon > 0,
  $
  #source(224)
  where $alpha$, $k$, and $l$ are real, and $alpha > -1$. Then:
  + $
      J_(alpha, k, 2n - 1) (epsilon)
      = cases(
        O(epsilon^(1 - k + alpha))\, quad & k - alpha > 1\,,
        O(ln epsilon)\, & k - alpha = 1.
      )
    $
  + For $m >= 0$
    $
      J_(alpha, k, 2n - 3 - 2m) (epsilon)
      = cases(
        O(epsilon^(-k + alpha + m + 5\/2))\, quad & k - alpha - m > 5\/2\,,
        O(ln epsilon)\, & k - alpha - m = 5\/2.
      )
    $
] <lem:model-integral>

#proof[
  Let us pass to the spherical coordinates $t_1 = r cos phi_1$,
  $t_2 = r sin phi_1 cos phi_2, ...$, in the integral defining $J_(alpha, k, l)$
  and make the change of variables $s_i = cos phi_i$, $i = 1, 2$:
  $
    J_(alpha, k, l) (epsilon)
    = O(1) integral_(0 < r, s_2 < 1 \ -1 < s_1 < 1 \ r s_1 + epsilon > 0)
    ((r s_1 + epsilon)^alpha r^(2n - 1 - l) d r d s_1 d s_2)
    / ([r(|s_1| + s_2 sqrt(1 - s_1^2)) + epsilon + r^2]^k).
  $
  #new-par
  We use the inequality $|s_1| + s_2 sqrt(1 - s_1^2) >= 1/4 (|s_1| + s_2)$ for
  $-1 <= s_1 <= 1$, $0 <= s_2 <= 1$. The change of variables $s_1 = s u$,
  $s_2 = s(1 - |u|)$ leads to
  $
    J_(alpha, k, l) (epsilon)
    = O(1) integral_(0 < r, s < 2 \ -1 < u < 1 \ r s u + epsilon > 0)
    ((r s u + epsilon)^alpha r^(2n - 1 - l) s d r d s d u)
    / (r s + epsilon + r^2)^k.
  $
  #new-par
  Let $l = 2n - 1$. We pass to the coordinates $(v, s, u)$, where
  $v = epsilon^(-1) r s$, and make use of the inequality
  $r s + epsilon + r^2 >= r s + epsilon$:
  $
    J_(alpha, k, 2n - 1) (epsilon)
    & = O(epsilon^(1 - k + alpha)) [integral_0^1 (d v) / (v + 1)^k
      integral_(-1)^1 (v u + 1)^alpha d u \
      & quad quad + integral_1^(4 epsilon^(-1)) (d v) / (v + 1)^k
      integral_(-v^(-1))^1 (v u + 1)^alpha d u] \
    & = O(epsilon^(1 - k + alpha)) [integral_0^1
      ((1 + v)^(1 + alpha) - (1 - v)^(1 + alpha)) / v d v
      + integral_1^(4 epsilon^(-1)) (d v) / (v (v + 1)^(k - alpha - 1))].
  $
  This gives us assertion a).

  #source(225)
  Suppose now that $l = 2n - 3 - 2m$, $m >= 0$. Then
  $
    J_(alpha, k, 2n - 3 - 2m)
    & = O(1) integral_0^2 r^(2m) d r integral_0^2
    (r d s) / (r s + epsilon + r^2)^k
    integral_(-epsilon (r s)^(-1))^1 (r s u + epsilon)^alpha r s d u \
    & = O(1) integral_0^2 r^(2m) d r integral_0^2
    (r d s) / (r s + epsilon + r^2)^(k - alpha - 1) \
    & = O(1) integral_0^2 (r^(2m) d r) / (epsilon + r^2)^(k - alpha - 2)
    = O(1) integral_0^2
    (d r) / (r + sqrt(epsilon))^(2(k - alpha - m - 2)).
  $
  #new-par
  Assertion b) is obtained by direct integration.
]

#lemma[
  Suppose that $D = {x, rho(x) < 0}$ is a bounded domain in $RR^n$ with smooth
  boundary and the function $F: D -> CC^1$ satisfies the condition
  $
    |F(x) - F(y)| <= |x - y| lambda(|rho(x)|) quad "for" rho(x) > rho(y),
  $
  where $lambda(t)$ is a monotonically decreasing nonnegative function on
  $(0, infinity)$ such that $integral_0^1 lambda(t) d t < infinity$. Then
  $
    |F(x) - F(y)| = O(1) (Lambda(|x - y|) + |x - y| lambda(|x - y|)), quad
    x, y in D,
  $
  where $Lambda(t) = integral_0^t lambda(tau) d tau$, and the constant in $O(1)$
  does not depend on $F$.

  In particular,
  $
    |F(x) - F(y)| = O(1) |x - y|^(1 - tau),
  $
  if $lambda(t) = t^(-tau)$, $0 <= tau < 1$, and
  $
    |F(x) - F(y)| = O(1) |x - y| ln |x - y|
  $
  if $lambda(t) = -ln t$.
] <lem:hardy-littlewood>

This assertion is a slight generalization of a result of Hardy and Littlewood
for the case where $D$ is the disk in the plane and $lambda(t) = t^(-tau)$ (see,
for example, @bib:Goluzin1966).

#theorem[
  If $f in C_(p, q) (overline(D))$, then
  $G_(p, q)^k f in C_(p, q - 1)^((1\/2)) (overline(D))$, and $G_(p, q)^k$ is a
  linear operator from #room[$C_(p, q) (overline(D))$] to
  #room[$C_(p, q - 1)^((1\/2)) (overline(D))$].
] <th:dbar-holder>

#proof[
  Let $tilde(G)_(p, q)^k$ and $tilde(tilde(G))_(p, q)^k$ be the operators
  defined, respectively, by the first and second integrals in
  @eq:dbar-solution-operator. Consider the function
  $
    H(z) = integral_(D_zeta) h(zeta) alpha_k (zeta, z)
    (overline(zeta)_j - overline(z)_j) / (|zeta - z|^(2n)) d v, quad
    "where" h in C(overline(D)).
  $
  #source(226)
  Then for $z, w in D$
  $
    |H(w) - H(z)| & <= integral_(D_zeta) |h(zeta)| |alpha_k (zeta, w)|
                    lr(
                      |(overline(zeta)_j - overline(w)_j) / (|zeta - w|^(2n))
                      - (overline(zeta)_j - overline(z)_j) / (|zeta - z|^(2n))|
                    ) d v \
                  & quad + integral_(D_zeta) |h(zeta)|
                    |alpha_k (zeta, w) - alpha_k (zeta, z)|
                    (d v) / (|zeta - z|^(2n - 1)).
  $ <eq:h-difference>
  #new-par
  From @eq:support-function-estimates, @eq:phi-tilde-bound, and @eq:alpha-k,
  $
    |grad_z alpha_k (zeta, z)|
    & = 2 k n |alpha_(k - 1) (zeta, z)|
    lr(|(Phi(zeta, z)) / (tilde(Phi)(zeta, z))|)^(2n - 1)
    lr(|(rho(zeta) grad_z Phi(zeta, z)) / (tilde(Phi)^2 (zeta, z))|) \
    & = O(1) 1 / (|tilde(Phi)(zeta, z)|).
  $
  Suppose that $rho(z) >= rho(w)$. By the mean value theorem, there is a
  $theta$, $0 < theta < 1$, such that
  $
    |alpha_k (zeta, w) - alpha_k (zeta, z)|
    & <= |grad_z alpha_k (zeta, w + theta(z - w))| dot.c |w - z| \
    & = O(1) (|w - z|) / (|tilde(Phi)(zeta, w + theta(z - w))|)
    = O(1) (|w - z|) / (|tilde(Phi)(zeta, z)|).
  $
  #new-par
  If $frak(J)(z, w)$ denotes the second integral in @eq:h-difference, we get
  that
  $
    frak(J)(z, w) = O(1) norm(h)_(C(overline(D)))
    (1 + integral_((D inter B_delta (z))_zeta)
      (d v(zeta)) / (|tilde(Phi)(zeta, z)| |zeta - z|^(2n - 1))) |w - z|.
  $
  #new-par
  Now let $sigma$ and $delta$ be chosen in accordance with
  Lemma~@lem:eta-coordinates, and suppose that $z in D$ and $rho(z) > -delta$.
  We pass to the variables $t_(2j - 1) = Re eta_j (zeta)$,
  $t_(2j) = Im eta_j (zeta)$ (the functions $eta_j$ are defined in
  Lemma~@lem:eta-coordinates), use @eq:phi-tilde-estimate, and find for
  $rho(z) >= rho(w)$ that
  $
    frak(J)(z, w) = O(1) norm(h)_(C(overline(D)))
    (1 + J_(0, 1, 2n - 1) (|rho(z)|)) |w - z|.
  $
  By Lemma~@lem:model-integral,
  $
    frak(J)(z, w) = O(1) norm(h)_(C(overline(D))) |w - z| ln |rho(z)|
  $ <eq:j-estimate>
  when $rho(z) > -delta$. Obviously, @eq:j-estimate holds also when
  $rho(z) <= -delta$. On the other hand, @eq:alpha-k and @eq:phi-tilde-bound
  show that $alpha_k (zeta, w) = O(1)$ for $zeta, w in D$. Moreover, it is known
  that
  $
    integral_(D_zeta) |h(zeta)|
    lr(
      |(overline(zeta)_j - overline(w)_j) / (|zeta - w|^(2n))
      - (overline(zeta)_j - overline(z)_j) / (|zeta - z|^(2n))|
    ) d v(zeta)
    = O(1) norm(h)_(C(D)) |w - z| ln |w - z|.
  $
  Consequently, @eq:h-difference and @eq:j-estimate imply that
  $
    |H(w) - H(z)| = O(1) norm(h)_(C(overline(D))) |w - z|
    (ln |rho(z)| + ln |w - z|)
  $
  #source(227)
  for $rho(z) >= rho(w)$. By Lemma~@lem:hardy-littlewood,
  $
    |H(w) - H(z)| = O(1) norm(h)_(C(overline(D))) |w - z| ln |w - z|.
  $
  From the definition of the operator $tilde(G)_(p, q)^k$ and the kernel
  $U_(p, q - 1)$ it now follows that $tilde(G)_(p, q)^k$ satisfies the
  conditions of the theorem.

  It remains to prove that $tilde(tilde(G))_(p, q)^k$ also satisfies these
  conditions. Lemma~@lem:kernel-difference and the remark after
  @eq:dbar-solution-operator show that to do this it suffices to prove that
  $
    |F_1 (w) - F_1 (z)| = O(1) norm(h)_(C(overline(D))) |w - z|^(1\/2)
  $ <eq:f1-holder>
  and
  $
    |F_2 (w) - F_2 (z)| = O(1) norm(h)_(C(overline(D))) |w - z| ln |w - z|,
  $ <eq:f2-holder>
  where
  $
    F_1 (z) & = integral_(D_zeta) h(zeta)
              ((rho(zeta)) / (tilde(Phi)(zeta, z)))^(k - 1)
              ((Phi(zeta, z)) / (tilde(Phi)(zeta, z)))^s
              ((overline(zeta)_j - overline(z)_j) phi(zeta))
              / (|zeta - z|^(2r) tilde(Phi)^(n - r + 1) (zeta, z))
              d v(zeta), \
    F_2 (z) & = integral_(D_zeta) h(zeta)
              ((rho(zeta)) / (tilde(Phi)(zeta, z)))^k
              ((Phi(zeta, z)) / (tilde(Phi)(zeta, z)))^s
              ((overline(zeta)_j - overline(z)_j) (zeta_m - z_m) phi(zeta))
              / (|zeta - z|^(2r) tilde(Phi)^(n - r + 1) (zeta, z))
              d v(zeta).
  $
  Here $phi(zeta)$ is a product of derivatives of $rho(zeta)$ of order at most
  two, $1 <= j, m <= n$, and $s = 0, 1, ...$.

  We can differentiate under the integral sign in the integrals defining $F_1$
  and $F_2$. A direct computation with use of
  @eq:support-function-estimates–@eq:phi-tilde-bound gives us that
  $
    |grad F_1 (z)| & = O(1) (integral_(D_zeta)
      (d v) / (|zeta - z|^(2r - 1) |tilde(Phi)(zeta, z)|^(n - r + 2)) \
      & quad quad + integral_(D_zeta)
      (d v) / (|zeta - z|^(2r) |tilde(Phi)(zeta, z)|^(n - r + 1))) \
    & = O(1) (integral_(D_zeta)
      (d v) / (|zeta - z|^(2n - 3) |tilde(Phi)(zeta, z)|^3)
      + integral_(D_zeta)
      (d v) / (|zeta - z|^(2n - 1) |tilde(Phi)(zeta, z)|^(3\/2))).
  $
  #new-par
  Let $sigma$ and $delta$ be chosen according to Lemma~@lem:eta-coordinates.
  Then for $rho(z) > -delta$
  $
    |grad F_1 (z)| & = O(1) norm(h)_(C(overline(D)))
    (1 + integral_((D inter B_delta (z))_zeta)
      (d v) / (|zeta - z|^(2n - 3) |tilde(Phi)(zeta, z)|^3) \
      & quad quad + integral_((D inter B_delta (z))_zeta)
      (d v) / (|zeta - z|^(2n - 1) |tilde(Phi)(zeta, z)|^(3\/2))) \
    & = O(1) norm(h)_(C(overline(D)))
    (1 + J_(0, 3, 2n - 3) (|rho(z)|) + J_(0, 3\/2, 2n - 1) (|rho(z)|)).
  $
  #source(228)
  Here we have used the substitution $t_(2j - 1) = Re eta_j (zeta)$,
  $t_(2j) = Im eta_j (zeta)$ and @eq:phi-tilde-estimate.
  Lemma~@lem:model-integral now shows that for $rho(z) > -delta$
  $
    |grad F_1 (z)| = O(1) norm(h)_(C(overline(D))) |rho(z)|^(-1\/2).
  $
  The mean value theorem and Lemma~@lem:hardy-littlewood then give us
  @eq:f1-holder. The proof of @eq:f2-holder is similar.
]

#point <pt:dbar-strictly-pseudoconvex> *The $dbar$-problem for strictly
pseudoconvex domains.* Let $B_(p, q) (overline(D))$#notation-mark(
  $B_(p, q) (D)$,
) denote the subspace of forms $f in A_(p, q) (overline(D))$, $q >= 1$, such
that $dbar u = f$ for some form $u in C_(p, q - 1)^((1\/2)) (overline(D))$.

#theorem[
  Let $D$ be a bounded strictly pseudoconvex domain in $CC^n$. Then $B_(p, q)$
  is a subspace of finite codimension in $A_(p, q) (overline(D))$.
] <th:finite-codimension>

#proof[
  Lemma~@lem:local-convexification implies the existence of a finite covering
  ${U_j}$, $j = 1, ..., k$, of the compact set $overline(D)$ such that for each
  $j = 1, ..., k$ there is a mapping $phi_j (z)$ biholomorphic in a neighborhood
  of $overline(D)_j = overline(U)_j inter overline(D)$ for which
  $phi_j (overline(D)_j)$ is the closure of a strictly convex domain. If
  $f in A_(p, q) (D)$, then
  $f(phi_j^(-1) (w)) in A_(p, q) (phi_j (overline(D)))$. By
  Theorem~@th:dbar-strictly-convex, there are linear operators
  #room[$G_(p, q)^((j)): A_(p, q) (phi_j (D_j))
  -> C_(p, q - 1)^((1\/2)) (phi_j (D_j))$] such that
  $
    dbar G_(p, q)^((j)) f(phi_j^(-1) (w)) = f(phi_j^(-1) (w)).
  $
  Thus, we can define linear operators $G_(p, q)^((j)): A_(p, q) (overline(D))
  -> C_(p, q - 1)^((1\/2)) (overline(D)_j)$, $j = 1, ..., k$, for which
  $dbar G_(p, q)^((j)) f = f$ on $overline(D)_j$.

  Let ${chi_j}$ be a partition of unity subordinate to the covering ${U_j}$, and
  define operators
  $
    N_(p, q): A_(p, q) (overline(D))
    -> C_(p, q - 1)^((1\/2)) (overline(D)) quad "and" quad
    T_(p, q): A_(p, q) (overline(D)) -> C_(p, q) (overline(D))
  $
  by the equalities
  $
    N_(p, q) f = sum_(j = 1)^k chi_j G_(p, q)^((j)) f, quad
    T_(p, q) f = sum_(j = 1)^k dbar chi_j and G_(p, q)^((j)) f.
  $
  We have
  $
    dbar N_(p, q) f = T_(p, q) f + f.
  $ <eq:dbar-n-operator>
  This implies that $T_(p, q)$ carries $A_(p, q) (D)$ into
  $A_(p, q) (overline(D))$. Moreover, the definition of $T_(p, q)$ implies that
  it is continuous, regarded as an operator from $A_(p, q) (overline(D))$ to
  $C_(p, q)^((1\/2)) (overline(D))$. By Ascoli's theorem (see
  @bib:Dieudonne1960, Chapter~7, §5),
  $T_(p, q): A_(p, q) (overline(D)) -> A_(p, q) (overline(D))$ is a compact
  operator. The Riesz-Fredholm theorem (see @bib:Dieudonne1960, Chapter~11, §3)
  tells us that the set $tilde(B)_(p, q) (overline(D))$ of forms
  $T_(p, q) f + f$ with $f in A_(p, q) (overline(D))$ is a closed subspace of
  $A_(p, q) (overline(D))$ with finite codimension. From @eq:dbar-n-operator it
  follows that $tilde(B)_(p, q) (overline(D)) subset B_(p, q) (overline(D))$,
  and so $B_(p, q) (overline(D))$ is a closed subspace of finite codimension in
  $A_(p, q) (overline(D))$.
]

#small-print[
  #source(229)
  We note that results in this section are used to prove
  Lemma~@lem:support-function, which enables us to construct operators analogous
  to the operators $G_(p, q)^k$ for a strictly pseudoconvex domain. A repetition
  of all the arguments in @pt:dbar-strictly-convex of this section gives us

  #theorem(title: [Romanov and Khenkin])[
    Let $D$ be a strictly pseudoconvex domain in $CC^n$. Then there exist linear
    operators $G_(p, q): A_(p, q) (overline(D))
    -> C_(p, q - 1)^((1\/2)) (overline(D))$, $0 <= p <= n$, $1 <= q <= n$, such
    that the form $u = G_(p, q) f$ satisfies the equation $dbar u = f$.
  ] <th:romanov-khenkin>

  This theorem is stronger than Theorem~@th:finite-codimension, but its proof
  uses consequences of the latter.
]

#proof(title: [Proof of Theorem~@th:oka-peak-function.])[
  #point <pt:oka-peak-proof> Suppose that $zeta$ is a fixed point of
  $partial D$, where $D$ is a bounded strictly pseudoconvex domain. In
  Lemma~@lem:local-convexification it is actually proved that there is a
  $delta > 0$ such that $Re F(zeta, z) < 0$ when $0 < |zeta - z| < 2 delta$ and
  $z in overline(D)$, where
  $
    F(zeta, z) = 2 sum_(j = 1)^n (partial rho) / (partial zeta_j) (zeta)
    (z_j - zeta_j)
    + sum_(j, k = 1)^n (partial^2 rho) / (partial zeta_j partial zeta_k)
    (zeta) (z_j - zeta_j) (z_k - zeta_k).
  $
  #new-par
  Let $chi$ be a compactly supported infinitely differentiable function on
  $CC^n$ with support in $B_(2 delta) (zeta)$ and with $chi(z) equiv 1$ for
  $z in B_delta (zeta)$. We construct the forms
  $
    f_k (z) = cases(
      dbar ((chi(z)) / (F^k (zeta, z))) = (dbar chi(z)) / (F^k (zeta, z))
      quad & "for" z in overline(D)
             inter (B_(2 delta) (zeta) without B_delta (zeta))\,,
      0 & "for" z in overline(D)
          without (B_(2 delta) (zeta) without B_delta (zeta))\,
    )
  $
  $k = 1, 2, ...$. It is not hard to verify that the $f_k$ are in
  $A_(0, 1) (overline(D))$ and are linearly independent; therefore, by
  Theorem~@th:finite-codimension, there exist a positive integer $k$ and complex
  numbers $a_1, ..., a_(k - 1)$ such that
  $f_k + a_(k - 1) f_(k - 1) + dots.c + a_1 f_1 = dbar u$, where
  $u in C(overline(D))$. The function
  $
    g(z) = chi(z) (1 / (F^k (zeta, z)) + a_(k - 1) / (F^(k - 1) (zeta, z))
      + dots.c + a_1 / (F(zeta, z))) - u(z)
  $
  is holomorphic in $D$, and
  $
    lim_(z -> zeta \ z in D) g(z) = infinity.
  $
]

#proof(
  title: [Proofs of Theorem~@th:oka-hefer and @th:oka-hefer-prime[25.2$'$].],
  qed: false,
)[
  #point <pt:oka-hefer-proofs> We need
]

#lemma[
  Suppose that $D$ and $G$ satisfy the conditions of Theorem~@th:oka-hefer,
  $Pi_(n - 1) = {z_n = 0}$, where $Pi_(n - 1) inter G != emptyset$, and
  $f(attach(z, tl: '))$ is a holomorphic function on $D inter Pi_(n - 1)$, where
  $attach(z, tl: ') = (z_1, ..., z_(n - 1))$. Then there exists an $F in A(G)$
  such that $F|_(G inter Pi_(n - 1)) = f$.
] <lem:hyperplane-extension>

#proof[
  Part II in the scheme for proving Oka's theorem (see @pt:oka-scheme) shows
  that there exists a strictly pseudoconvex domain $Omega$ such that
  $G relcomp Omega relcomp D$. Let
  $Omega_epsilon = {z in Omega: |z_n| < epsilon}$. Since $Omega relcomp D$, $f$
  can be extended to $Omega_(2 epsilon)$ for sufficiently small $epsilon$ by
  setting $f(z) = f(attach(z, tl: '))$.

  #source(230)
  Let $chi$ be a compactly supported infinitely differentiable function on the
  plane with support in $B_(2 epsilon) (0)$ with $chi equiv 1$ on
  $B_epsilon (0)$. We introduce the forms
  $
    f_k (z) = cases(
      dbar ((chi(z_n) f(z)) / z_n^k) = dbar chi(z_n) (f(z)) / z_n^k quad
      & "for" z in Omega_(2 epsilon) without Omega_epsilon\,,
      0 & "for" z in Omega_epsilon union (Omega without Omega_(2 epsilon))\,
    )
  $
  $k = 1, 2, ...$. Just as in the preceding subsection, we get that
  $f_k + a_(k - 1) f_(k - 1) + dots.c + a_1 f_1 = dbar u$, where $u in C(Omega)$
  for some positive integer $k$ and complex numbers $a_1, ..., a_(k - 1)$. The
  function
  $
    F(z) = chi(z_n) f(z) (1 + a_(k - 1) z_n + dots.c + a_1 z_n^(k - 1))
    - z_n^k u(z)
  $
  gives the desired extension of the function $f$ in $Omega$.
]

#ends-with-square[The proof of Theorem~@th:oka-hefer now goes through in the
  usual way, for example, as in @bib:Shabat1976b (p.~260), except that again
  "domain of holomorphy" must be replaced by "pseudoconvex domain".]

#ends-with-square[If Theorem~@th:dbar-domain-holomorphy is used in the proof of
  Lemma~@lem:hyperplane-extension instead of Theorem~@th:finite-codimension,
  then a strengthened form of Lemma~@lem:hyperplane-extension is obtained in
  which $F$ is constructed from $f$ with the help of a linear operator
  $P: A(D) -> A_C (G)$, and this, in turn, implies
  Theorem~@th:oka-hefer-prime[25.2$'$]. We remark that the proof of
  Theorem~@th:dbar-domain-holomorphy uses Theorem~@th:oka-hefer and not
  @th:oka-hefer-prime[25.2$'$].]

#proof(
  title: [Proof of Theorem~@th:dbar-domain-holomorphy.],
  qed: false,
)[
  #point <pt:khenkin-polyakov> Since $D$ is a domain of holomorphy and
  $G relcomp D$, there is a Weil polyhedron $Delta$ such that
  $G relcomp Delta relcomp D$. This polyhedron has the form (see
  @sec:bergman-weil)
  $
    Delta = {z in D: |chi_j (z)| < 1, j = 1, ..., N},
  $
  where the $chi_j$ are holomorphic in $D$, and the nonempty faces
  $sigma_(j_1 dots.c j_k) = {z in D: |chi_(j_1) (z)| = dots.c
    = |chi_(j_k) (z)| = 1, |chi_j (z)| <= 1, j = 1, ..., N,
    j != j_1, ..., j_k}$
  have dimension $2n - k$ for all $j_1, ..., j_k$,
  $1 <= j_1 < dots.c < j_k <= N$.

  We construct a chain $Gamma$ in $CC_zeta^n times RR_lambda^(N + 1)$ as
  follows: if $j_1, ..., j_k$ are such that $1 <= j_1 < dots.c < j_k <= N$ and
  $sigma_(j_1, ..., j_k) != emptyset$, then
  $
    Gamma_(j_1, ..., j_k) = {(zeta, lambda): zeta in sigma_(j_1, ..., j_k);
      lambda = (lambda_0, lambda_1, ..., lambda_N), lambda_m >= 0 \
      "for" m = 0, 1, ..., N, lambda_m = 0 "for" m != j_1, ..., j_k, 0
      "and" \
      lambda_0 + lambda_(j_1) + dots.c + lambda_(j_k) = 1}; \
    Gamma = sum_(k = 1)^N sum_(1 <= j_1 < dots.c < j_k <= N)
    Gamma_(j_1, ..., j_k).
  $
  It is not hard to verify that
  $partial Gamma = Gamma inter {lambda_0 = 1} - Gamma inter {lambda_0 = 0}$
  and $Gamma inter {lambda_0 = 1} = partial Delta$.

  #source(231)
  Suppose now that $w(zeta, z, lambda)$ is defined in the set
  $U subset CC_zeta^n times CC_z^n times RR_lambda^(N + 1)$. The forms
  $tilde(W)_(p, q) (w, zeta, z, lambda)$ are defined as in
  @pt:dbar-strictly-convex, the vector-valued functions $u_j$ as in
  @sec:bergman-weil (here is where Theorem~@th:oka-hefer is used),
  $t = (overline(zeta) - overline(z)) \/ |zeta - z|^2$, and
  $eta(zeta, z, lambda) = lambda_0 t + sum_1^N lambda_j u^j$. We define the
  following operator for $f in A_(p, q) (overline(Delta))$:
  $
    (tau_(p, q) f)(z) & = integral_(Gamma_(zeta, lambda))
    f(zeta) and tilde(W)_(p, q - 1) (eta, zeta, z, lambda) \
    & quad - integral_(Delta_zeta) f(zeta) and U_(p, q - 1) (zeta, z).
  $ <eq:khenkin-polyakov-operator>
]

#theorem(title: [Khenkin-Polyakov])[
  If $f in A_(p, q) (overline(Delta))$, $0 <= p <= n$, $1 <= q <= n$, then
  $tau_(p, q) f in C_(p, q - 1) (overline(G))$, where $G relcomp Delta$. The
  operator
  $tau_(p, q): A_(p, q) (overline(Delta)) -> C_(p, q - 1) (overline(G))$ is
  continuous, and
  $
    dbar tau_(p, q) f = f.
  $ <eq:khenkin-polyakov-dbar>
] <th:khenkin-polyakov>

Theorem~@th:dbar-domain-holomorphy follows at once from
Theorem~@th:khenkin-polyakov.

#proof(title: [Proof of Theorem~@th:khenkin-polyakov.])[
  The first integral in @eq:khenkin-polyakov-operator is proper for $z in G$,
  and the second converges uniformly; therefore, only @eq:khenkin-polyakov-dbar
  needs to be checked. By Stokes' formula,
  $
    & integral_(Gamma_(zeta, lambda))
      d_(zeta, lambda) (f(zeta) and tilde(W)_(p, q) (eta, zeta, z, lambda))
      = integral_((Gamma inter {lambda_0 = 1})_(zeta, lambda))
      f(zeta) and tilde(W)_(p, q) (eta, zeta, z, lambda) \
    & quad - integral_((Gamma inter {lambda_0 = 0})_(zeta, lambda))
      f(zeta) and tilde(W)_(p, q) (eta, zeta, z, lambda)
      = integral_(partial Delta_zeta) f(zeta) and U_(p, q) (zeta, z) \
    & quad - sum_(k = 1)^N sum_(1 <= j_1 < dots.c < j_k <= N)
      integral_(zeta in sigma_(j_1, ..., j_k) \
      lambda_(j_1) >= 0, ..., lambda_(j_k) >= 0 \
      lambda_(j_1) + dots.c + lambda_(j_k) = 1)
      f(zeta) and tilde(W)_(p, q)
      (sum_(m = 1)^k lambda_(j_m) u^(j_m), zeta, z, lambda).
  $
  Since the $u^j$ are holomorphic in $z in D$, it follows that
  $
    tilde(W)_(p, q) (sum_(m = 1)^k lambda_(j_m) u^(j_m), zeta, z, lambda) = 0
  $
  for $q >= 1$. Consequently,
  $
    integral_(partial Delta_zeta) f(zeta) and U_(p, q) (zeta, z)
    & = (-1)^(p + q) integral_(Gamma_(zeta, lambda))
    f(zeta) and (dbar_zeta + d_lambda) tilde(W)_(p, q) (eta, zeta, z, lambda) \
    & = dbar_z integral_(Gamma_(zeta, lambda))
    f(zeta) and tilde(W)_(p, q - 1) (eta, zeta, z, lambda).
  $
  Now @eq:khenkin-polyakov-dbar follows from the Martinelli-Bochner-Koppelman
  formula @eq:martinelli-bochner-koppelman, applied to $Delta$.
]

#small-print[
  #source(232)
  #point <pt:dbar-estimates> In this subsection we give some estimates for the
  solution of the $dbar$-equation and applications of them. Let
  $f in L_(p, q)^1 (D)$. We say that $u in L_(p, q - 1)^1 (D)$ and
  $g in L_(p, q - 1)^1 (partial D)$ have the properties that $dbar u = f$ and
  $u|_(partial D) = g$ if for any smooth form $phi$ of type $(n - p, n - q)$ on
  $overline(D)$
  $
    integral_(partial D) g and phi
    = integral_D f and phi + (-1)^(p + q) integral_D u and dbar phi.
  $

  #theorem(title: [Khenkin and Skoda])[
    Suppose that $D$ is a strictly convex domain in $CC^n$ and
    $f in L_(p, q)^1 (D)$, $0 <= p <= n$, $1 <= q <= n$. If $dbar f = 0$ and
    $|f(z)| + |rho(z)|^(-1\/2) |f(z) and dbar rho(z)| in L^1 (D)$, then there
    exist forms $u in L_(p, q - 1)^1 (D)$ and $g in L_(p, q - 1)^1 (partial D)$
    with the properties that $dbar u = f$ and $u|_(partial D) = g$.
  ] <th:khenkin-skoda>

  As usual, the #index-mark("Modulus of a form")_modulus of a form_ is
  understood to be the sum of the moduli of its coefficients.

  Theorem~@th:khenkin-skoda enables us to describe the set of zeros of functions
  in the #index-mark("Class", sub: "Nevanlinna")_Nevanlinna class_, i.e., the
  functions $f$ holomorphic in $D$ such that
  $
    sup_(epsilon > 0) integral_(zeta in partial D)
    log^+ |f(zeta - epsilon nu(zeta))| d sigma_(2n - 1) (zeta) < infinity.
  $
  Here $log^+ t = max(0, log t)$, $t > 0$, $nu(zeta)$ is the outward unit vector
  normal to the boundary of $D$ at the point $zeta$, and $d sigma_k$ is the
  $k$-dimensional Lebesgue volume element.

  #theorem(title: [Khenkin-Skoda])[
    Suppose that $D$ is a strictly convex domain in $CC^n$. An
    $(n - 1)$-dimensional analytic subset $M$ of $D$ is the set of zeros of a
    function in the Nevanlinna class $N(D)$ if and only if $M$ satisfies the
    Blaschke condition
    $
      integral_M |rho(z)| d sigma_(2n - 2) (z)
      = sum_j gamma_j integral_(M_j) |rho(z)| d sigma_(2n - 2) (z) < infinity,
    $
    where the $M_j$ are the irreducible components of the set $M$, and $gamma_j$
    is the multiplicity of the component $M_j$.
  ] <th:khenkin-skoda-zeros>

  From the form of the function $alpha_k$ (see @eq:alpha-k) it follows that the
  operator $G_(p, q)^k$ defined by @eq:dbar-solution-operator can be applied to
  forms $f$ such that $f(z) rho^(k - 1) (z) in L_(p, q)^1 (D)$. Using
  Theorem~@th:dbar-solution and Lemmas~@lem:kernel-difference
  and~@lem:model-integral, we can prove the following result.

  #theorem(title: [Dautov and Khenkin])[
    Suppose that $D$ is a strictly convex domain in $CC^n$, and
    $f in L_(p, q)^1 (D, "loc")$. If $dbar f = 0$ and the number $alpha > 0$ is
    such that
    $
      |rho(z)|^alpha (|f(z)| + |rho(z)|^(-1\/2) |f(z) and dbar rho(z)|)
      in L^1 (D),
    $
    then the form $u_k = G_(p, q)^k f$ satisfies for any $k > alpha + 1/2$ the
    equation $dbar u = f$ in $D$, and
    $
      |(G_(p, q)^k f)(z)| |rho(z)|^(alpha - 1) in L^1 (D).
    $
  ] <th:dautov-khenkin>

  A #index-mark(
    "Function of Nevanlinna-Dzhrbashyan class",
  )#index-mark(
    "Class",
    sub: "Nevanlinna-Dzhrbashyan",
  )function $f$ holomorphic in a bounded domain $D subset CC^n$ is called a
  function of _Nevanlinna-Dzhrbashyan class $N_alpha (D)$_ ($alpha > 0$) if
  $
    integral_D |rho(z)|^(alpha - 1) ln^+ |f(z)| d sigma_(2n) (z) < infinity.
  $

  #theorem(title: [Dautov and Khenkin])[
    Suppose that $D$ is a strictly convex domain in $CC^n$. An
    $(n - 1)$-dimensional analytic subset $M$ of $D$ is the set of zeros of a
    function of Nevanlinna-Dzhrbashjan class $N_alpha (D)$, $alpha > 0$, if and
    only if
    $
      integral_M |rho(z)|^(alpha + 1) d sigma_(2n - 2) (z) < infinity.
    $
  ] <th:dautov-khenkin-zeros>

  Theorems~@th:khenkin-skoda and~@th:khenkin-skoda-zeros are limiting cases (as
  $alpha -> 0$) of Theorems~@th:dautov-khenkin and~@th:dautov-khenkin-zeros.
]
