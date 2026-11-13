#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[The Schwarz kernel and integral representations of
  holomorphic functions with nonnegative real part] <sec:schwarz-kernel>

The classical #index-mark(
  "Representation",
  sub: "integral",
  subsub: "Riesz-Herglotz",
)_Riesz-Herglotz theorem_ (see, for example, @bib:Nevanlinna1936, Chapter~VII,
§2) asserts that a function $f(z_1)$ holomorphic in the unit disk
${z_1: |z_1| < 1}$ has a nonnegative real part in it if and only if there exists
a nonnegative measure $nu$ on the circle ${z_1: |z_1| = 1}$ such that for
$|z_1| < 1$
$
  f(z_1) = 1 / (2 pi) integral_(|zeta_1| = 1) (zeta_1 + z_1) / (zeta_1 - z_1)
  d nu_(zeta_1) + i Im f(0).
$ <eq:riesz-herglotz>
#source(95)
In this section the _Riesz-Herglotz representation_ @eq:riesz-herglotz is
generalized to the multidimensional case.

Let $D$ be a bounded domain in $CC^n$. Denote by $R(D)$ the class of functions
in $A(D)$ with nonnegative real part, and let
$R_C (D) = R(D) inter C(overline(D))$. We consider the following two conditions
on $D$.

A. _For every $f in R(D)$ there exist a point $z' in D$, a neighborhood
$U(z') subset D$ of it, and a sequence $f_m in R_C (D)$, $m = 1, 2, ...$, such
that $f(z) = lim_(m -> infinity) f_m (z)$ for $z in U(z')$._

This condition is satisfied, for example, by _strongly starlike domains $D$_
(i.e., domains such that $D_r = r D supset overline(D)$ for $r > 1$), or, more
generally, by domains $D$ for which there exist biholomorphic mappings $g_m$
with $g_m (D) supset overline(D)$, $m = 1, 2, ...$, and
$lim_(m -> infinity) g_m (z) = z$ for $z in U(z')$ (for example, a topological
product of annuli), or, finally, by domains that are biholomorphically
equivalent to the indicated domains, provided that the corresponding
biholomorphic mapping extends to a homeomorphism of the closed domains. It can
be shown that condition A holds for strictly pseudoconvex domains (see the
theorem of Cole and Range in @bib:Cole1972 or @bib:Khenkin1975a, Chapter~VI,
Theorem~8). At the same time, we do not know any examples of domains that are
the interiors of their closures and do not satisfy condition A.

B. _There exist a closed set $M subset partial D$, a nonnegative measure $mu$ on
subsets of $M$, and a function
$h(overline(zeta), z) in C{(zeta, z): zeta in overline(D), z in D}$ holomorphic
with respect to $z$ in $D$ and having the property that
$h(overline(z), zeta) = overline(h(overline(zeta), z))$ on $D times D$, such
that for every $f in A_C (D)$ and $z in D$ the integral representation with
Szegö kernel $h$_
$
  f(z) = integral_M f(zeta) h(overline(zeta), z) d mu_zeta
$ <eq:szego-condition-b>
_is valid and, moreover, $mu$ is a representing measure for a point $z^0 in D$,
i.e., for any $f in A_C (D)$_
$
  f(z^0) = integral_M f(zeta) d mu.
$ <eq:representing-measure>
#new-par
If we do not require that $h$ be continuous with respect to $zeta$ in the closed
domain $overline(D)$ but instead restrict ourselves to the condition
$h in H_mu^2 (D)$, then the Szegö kernel exists in a very general situation (see
Theorem~@th:bungart-szego). Our more stringent requirement of continuity is
realized under these conditions if $D$ is circular and strongly starlike, and
certainly always when the Szegö kernel is found in finite form (see
@bib:Aizenberg1964b, @bib:Egorychev1975, @bib:Egorychev1977, @bib:Zinovev1973
and @bib:Hua1958).

In the case of an $n$-circular domain $D$ it is convenient to consider a measure
that is the product of a measure depending only on $(|zeta_1|, ..., |zeta_n|)$
and the measure corresponding to the exterior differential form
$d arg zeta_1 and dots.c and d arg zeta_n$ #source(96) (see @sec:n-circular).
Then a Szegö kernel with the properties we want exists if and only if
$M supset S(D)$ and the measure $mu$ is massive on $S(D)$ (i.e.,
$overline(partial D without E) supset S(D)$ for every $E subset partial D$ of
zero $mu$-measure; see @sec:n-circular). Here the Szegö kernel is
$h = h(z_1 overline(zeta)_1, ..., z_n overline(zeta)_n)$. For a number of
$n$-circular domains the Szegö kernel has been found in finite form (see
@sec:n-circular, as well as @bib:Aizenberg1964b, @bib:Egorychev1975,
@bib:Egorychev1977 and @bib:Zinovev1973).

Finally, these kernels have been explicitly written out also for symmetric
domains (see @bib:Hua1958).

The relation @eq:representing-measure is valid for $z^0 = 0$ in the cases
mentioned where the Szegö kernel is written out explicitly.

The requirement B implies the existence of a function
$
  Q(zeta, z) in C{(zeta, z): zeta in overline(D), z in D}
$
that is holomorphic with respect to $z$ in $D$ for fixed $zeta in overline(D)$,
has the property that $Q(zeta, z^0) equiv 1$, and is such that the #index-mark(
  "Representation",
  sub: "integral",
  subsub: "Schwarz",
)_Schwarz integral representation_
$
  f(z) = integral_M [Re f(zeta)] Q(zeta, z) d mu_zeta + i Im f(z^0)
$ <eq:schwarz-representation>
holds for $f in A_C (D)$ and $z in D$.

#proposition[
  Relation @eq:representing-measure is equivalent to the equality
  $
    h(overline(zeta), z^0) equiv 1.
  $ <eq:szego-at-center>
  The Schwarz kernel can be given by the formula
  $
    Q(zeta, z) = 2 h(overline(zeta), z) - 1.
  $ <eq:schwarz-kernel>
] <prop:schwarz-kernel>

#proof[
  Obviously, @eq:representing-measure follows from @eq:szego-condition-b and
  @eq:szego-at-center. Suppose now that @eq:representing-measure holds, and
  consider
  $
    integral_M h(overline(zeta), z) d mu_zeta.
  $ <eq:szego-integral>
  Since $mu$ is a real measure, it has the reproducing property also for
  antiholomorphic functions. Therefore, the integral @eq:szego-integral is equal
  to $h(overline(z)^0, z)$; but, by @eq:szego-condition-b, the same integral is
  equal to $1$. Hence, $h(overline(z)^0, z) equiv 1$, which leads to
  @eq:szego-at-center if we take into account the property
  $h(overline(z), zeta) = overline(h(overline(zeta), z))$ of the Szegö kernel.

  Further, it follows from @eq:szego-at-center and @eq:schwarz-kernel that
  $Q(zeta, z^0) equiv 1$. It remains to show that @eq:schwarz-representation
  holds. Indeed, @eq:szego-condition-b, @eq:representing-measure, and
  @eq:szego-at-center give us that
  $
    & integral_M (f(zeta) + overline(f(zeta))) / 2
      [2 h(overline(zeta), z) - 1] d mu_zeta \
    & quad = f(z) + overline(f(z^0) h(overline(z)^0, z))
      - (f(z^0) + overline(f(z^0))) / 2 \
    & quad = f(z) - i Im f(z^0).
  $
]

#source(97)
We remark that the Schwarz formula can also be constructed in other ways, as can
a formula recovering $f$ from $Im f$. For example,
$
  f(z) = 2 i integral_M [Im f(zeta)] h(overline(zeta), z) d mu_zeta
  + overline(f(z^0)).
$
#new-par
In the cases where it is not possible to find the Szegö kernel in finite form
for an $n$-circular domain, we can consider the generalized Szegö kernel
@eq:extended-szego-kernel, which can be written out explicitly for a large class
of $n$-circular domains (see @bib:Aizenberg1964b, @bib:Aizenberg1973a,
@bib:Borodin1969 or @bib:Zinovev1974). And in this case we can find the Schwarz
kernel from the generalized Szegö kernel by using a formula analogous to
@eq:schwarz-kernel.

Observe that, for example, circular strongly starlike domains satisfy
requirements A and B.

An important role in what follows is played by the class $[Re A_C (D)]_mu^perp$.
If $D$ is such that for every real $u in P h_C (D)$ there is a sequence $u_m$,
$m = 1, 2, ...$, $u_m in Re A_C (D)$, that converges uniformly to $u$ on $M$,
then $[Re A_C (D)]_mu^perp = [P h_C (D)]_mu^perp$ (for example, $D$ strongly
starlike).

#theorem(title: [Aĭzenberg and Dautov])[
  $f in R(D)$ if and only if the integral representation
  $
    f(z) = integral_M Q(zeta, z) d nu_zeta + i Im f(z^0)
  $ <eq:riesz-herglotz-generalized>
  holds for $z in D$ with a nonnegative measure $nu$ such that
  $
    integral_M phi d nu = 0
  $ <eq:measure-orthogonality>
  for all $phi in [Re A_C (D)]_mu^perp$.
] <th:riesz-herglotz-generalized>

In the case where $n = 1$, $D$ is the unit disk, and @eq:schwarz-representation
is the classical Schwarz formula, Theorem~@th:riesz-herglotz-generalized gives
us the Riesz-Herglotz theorem, since $[Re A_C (D)]_mu^perp$ contains only the
zero function under these conditions.

#proof[
  _Necessity._ Suppose that $f in R(D)$ and $f_m in R_C (D)$, $m = 1, 2, ...$,
  is a sequence of functions as in condition A. This sequence forms a normal
  family of holomorphic functions (see @bib:Montel1927, §119); therefore, it
  contains a subsequence converging uniformly to $f$ on compact subsets of $D$.
  Let us denote this subsequence again by $f_m$ ($m = 1, 2, ...$). We represent
  each $f_m$ by formula @eq:schwarz-representation,
  $
    f_m (z) = integral_M Q(zeta, z) d nu_(m, zeta) + i Im f_m (z^0),
  $ <eq:schwarz-approximants>
  where $d nu_m = Re f_m d mu$, and then we get from the condition
  $Q(zeta, z^0) equiv 1$ that
  $
    Re f_m (z^0) = integral_M d nu_m.
  $ <eq:approximants-mass>
  #source(98)
  #new-par
  The measures $nu_m$ are nonnegative. From @eq:approximants-mass and the
  equality $lim_(m -> infinity) Re f_m (z^0) = Re f(z^0)$ it follows that the
  total variations of these measures are bounded; therefore, ${nu_m}$ contains a
  subsequence that converges to some nonnegative measure $nu$ in the weak
  topology (i.e., in the $C$-topology of the space $C^* (M)$; see
  @bib:Dunford1958, Chapter~V, §4). Denote such a subsequence again by $nu_m$
  ($m = 1, 2, ...$). We now pass to the limit in @eq:schwarz-approximants as
  $m -> infinity$ and get @eq:riesz-herglotz-generalized.

  From the way in which the measures $nu_m$ are specified it follows that each
  of them satisfies condition @eq:measure-orthogonality; hence, the limit
  measure also satisfies this condition.

  _Sufficiency._ Consider the function $f$ representable in $D$ by
  @eq:riesz-herglotz-generalized under condition @eq:measure-orthogonality.
  Obviously, $f in A(D)$. For $z in D$
  $
    Re f(z) = integral_M [Re Q(zeta, z)] d nu_zeta.
  $ <eq:real-part-representation>
  Further, for every $psi in Re A_C (D)$ we have the Poisson formula (see
  Proposition~@prop:poisson-representation)
  $
    psi(z) = integral_M psi(zeta) cal(P)(zeta, z) d mu_zeta,
  $
  and this together with @eq:schwarz-representation implies that the difference
  $Re Q(zeta, z) - cal(P)(zeta, z)$ is in $[Re A_C (D)]_mu^perp$; therefore,
  @eq:real-part-representation and @eq:measure-orthogonality give us that for
  $z in D$
  $
    Re f(z) = integral_M cal(P)(zeta, z) d nu_zeta.
  $
  Since the Poisson kernel $cal(P)$ and the measure $nu$ are nonnegative, we
  have that $f in R(D)$.
]

#proposition[
  For $f in A_C (D)$ and $z in D$ the #index-mark(
    "Representation",
    sub: "integral",
    subsub: "Poisson",
  )Poisson integral representation
  $
    f(z) = integral_M f(zeta) cal(P)(zeta, z) d mu_zeta
  $ <eq:poisson-representation>
  is valid, where the Poisson kernel is
  $
    cal(P)(zeta, z) = (|h(overline(zeta), z)|^2) / h(overline(z), z).
  $
  Here for $z in D$
  $
    h(overline(z), z) > 0.
  $ <eq:szego-diagonal-positive>
] <prop:poisson-representation>

#proof[
  Application of @eq:szego-condition-b gives
  $
    h(overline(z), z)
    = integral_M h(overline(z), zeta) h(overline(zeta), z) d mu_zeta
    = integral_M |h(overline(zeta), z)|^2 d mu_zeta.
  $ <eq:szego-diagonal>
  #source(99)
  For every $z in D$ we have $op("Ess sup")_M |h(overline(zeta), z)| > 0$, for
  otherwise @eq:szego-condition-b would imply that $f(z) = 0$ for all
  $f in A_C (D)$. Therefore, @eq:szego-diagonal gives us
  @eq:szego-diagonal-positive. Moreover,
  $
    integral_M f(zeta) cal(P)(zeta, z) d mu_zeta
    & = 1 / h(overline(z), z) integral_M f(zeta) |h(overline(zeta), z)|^2
    d mu_zeta \
    & = 1 / h(overline(z), z) f(z) h(overline(z), z) = f(z).
  $
]

In order to make the generalization of the Riesz-Herglotz theorem given in
Theorem~@th:riesz-herglotz-generalized clearer for a concrete strongly starlike
domain $D$, we must find a family of functions (for example, polynomials) in
$[P h_C (D)]_mu^perp$ such that 1) they can be written out explicitly, and 2)
their linear span is dense in $[P h_C (D)]_mu^perp$ in the $C(M)$-metric; and
then we must replace condition @eq:measure-orthogonality by the requirement that
$nu$ is orthogonal to the elements of this family.

Let $D_0$ be a bounded circular strongly starlike domain, and $mu$ a nonnegative
measure on $M$ that is massive on the Shilov boundary $S(D)$, with $M$ and $mu$
invariant with respect to the _rotations_ $z -> e^(i theta) z$,
$0 <= theta <= 2 pi$. Then we can choose a complete orthonormal system
${phi_l^k (z)}$ of homogeneous polynomials in $H_mu^2 (D)$ (with respect to the
measure $mu$), where $l$ is the degree of the polynomial and $k$ is its index
among the homogeneous polynomials of given degree $l$. Let
$phi_(-l)^k (z) = overline(phi_l^k (z))$, $l = 1, 2, ...$, and let
$
  P_(J frak(J)) (z, overline(z))
  = sum_k a_(J frak(J) k) phi_(|J| - |frak(J)|)^k (z),
$
where $J = (i_1, ..., i_n)$, $frak(J) = (j_1, ..., j_n)$, with nonnegative
integers $i_l$, $j_l$ ($l = 1, ..., n$), and $|J| = i_1 + dots.c + i_n$. Define
$
  a_(J frak(J) k)
  = integral_M z^J overline(z)^frak(J) overline(phi_(|J| - |frak(J)|)^k (z))
  d mu.
$

#proposition[
  Any polynomial $P in [P h_C (D_0)]_mu^perp$ can be represented as a linear
  combination of the polynomials
  $
    z^J overline(z)^frak(J) - P_(J frak(J)) (z, overline(z)),
  $ <eq:orthogonal-polynomials-circular>
  each of which is in $[P h_C (D_0)]_mu^perp$.
] <prop:orthogonal-polynomials-circular>

#lemma[
  Any polynomial of the form @eq:orthogonal-polynomials-circular is in
  $[P h_C (D_0)]_mu^perp$.
] <lem:orthogonal-polynomials-circular>

#proof[
  Since $D_0$ is strongly starlike, every $f in P h_C (D_0)$ can be approximated
  uniformly on $D_0$ by functions pluriharmonic in a neighborhood of
  $overline(D)_0$, and each function holomorphic on $overline(D)_0$ can be
  approximated uniformly by linear combinations of the homogeneous polynomials
  $phi_l^k (z)$, $l = 0, 1, 2, ...$, (since $D_0$ is circular); therefore, $f$
  can be approximated uniformly on $overline(D)_0$ by #source(100) linear
  combinations of the polynomials $phi_l^k (z)$,
  $l = 0, plus.minus 1, plus.minus 2, ...$. Thus, it suffices to show that
  $
    integral_M [z^J overline(z)^frak(J) - P_(J frak(J)) (z, overline(z))]
    overline(phi_l^k (z)) d mu = 0, quad l = 0, plus.minus 1, plus.minus 2, ....
  $ <eq:orthogonality-to-basis>
  The invariance of $mu$ with respect to rotations implies (as in the proof of
  Theorem~@th:martinelli-bochner) that for $|N| != |L|$
  $
    integral_M z^N overline(z)^L d mu = 0.
  $ <eq:rotation-invariance>
  Hence, @eq:orthogonality-to-basis is valid for $l != |J| - |frak(J)|$. But if
  $l = |J| - |frak(J)|$, then @eq:orthogonality-to-basis holds because of the
  form of the coefficients $a_(J frak(J) k)$.
]

#lemma[
  Any polynomial $P(z, overline(z))$ can be represented in the form
  $
    P(z, overline(z)) = P_1 (z, overline(z)) + P_2 (z, overline(z)),
  $ <eq:polynomial-decomposition>
  where $P_1$ is a linear combination of the polynomials
  @eq:orthogonal-polynomials-circular, and $P_2$ is pluriharmonic.
] <lem:polynomial-decomposition>

#proof[
  Write $P$ in the form
  $
    P(z, overline(z)) = sum_(J, frak(J)) b_(J frak(J)) z^J overline(z)^frak(J),
  $
  where only finitely many of the coefficients $b_(J frak(J))$ are nonzero.
  Further,
  $
    P(z, overline(z))
    = sum_(J, frak(J)) b_(J frak(J))
    [z^J overline(z)^frak(J) - P_(J frak(J)) (z, overline(z))]
    + sum_(J, frak(J)) b_(J frak(J)) P_(J frak(J)) (z, overline(z)).
  $
  It remains to observe that $P_(J frak(J))$ is a holomorphic polynomial for
  $|J| >= |frak(J)|$ and antiholomorphic for $|J| <= |frak(J)|$.
]

#proof(title: [Proof of Proposition~@prop:orthogonal-polynomials-circular.])[
  We represent the polynomial $P in [P h_C (D_0)]_mu^perp$ by
  @eq:polynomial-decomposition. It must be shown that $P_2 equiv 0$. Note that
  $overline(P)_2 in P h_C (D_0)$ and $P_2 in [P h_C (D_0)]_mu^perp$; therefore,
  $
    integral_M |P_2|^2 d mu = 0,
  $
  so that $P_2 = 0$ on $S(D)$, i.e., $P_2 equiv 0$.
]

We next consider an $n$-circular strongly starlike domain $D_1$ and assume that
$M$ and $mu$ are invariant with respect to the _$n$-rotations_
$z -> (z_1 e^(i theta_1), ..., z_n e^(i theta_n))$, $0 <= theta_j <= 2 pi$, and
that the nonnegative measure $mu$ is massive on $S(D)$. Under these conditions
we can take the system of monomials ${alpha_J z^J}$ as a complete orthonormal
system, where
$
  alpha_J = [integral_M z^J overline(z)^J d mu]^(-1 \/ 2).
$
#source(101)
#new-par
The next assertion can be proved similarly to the way
Proposition~@prop:orthogonal-polynomials-circular was proved.

#proposition[
  Every polynomial $P in [P h_C (D_1)]_mu^perp$ can be represented as a linear
  combination of the polynomials
  $
    z^J overline(z)^frak(J), quad J lt.eq.not frak(J), quad
    J gt.eq.not frak(J), \
    z^J overline(z)^(J + frak(J))
    (alpha_(J + frak(J))^2 - alpha_(J + frak(J) + l_k)^2 |z_k|^2), quad
    z^(J + frak(J)) overline(z)^J
    (alpha_(J + frak(J))^2 - alpha_(J + frak(J) + l_k)^2 |z_k|^2),
  $ <eq:orthogonal-polynomials-n-circular>
  each of which is in $[P h_C (D_1)]_mu^perp$.
] <prop:orthogonal-polynomials-n-circular>

We again return to a circular domain $D_0$ and consider an arbitrary measure
$nu$ on $M$. For $z in D_0$ let
$
  F_nu (z) = integral_M cal(P)(zeta, z) d nu_zeta.
$

#lemma[
  If $nu$ is orthogonal to the polynomials @eq:orthogonal-polynomials-circular,
  then $F_nu (z) in P h (D_0)$.
] <lem:poisson-integral-pluriharmonic>

#proof[
  Formula @eq:poisson-representation is valid for $f in A_C (D)$ and $z in D_0$.
  By using the facts that $D_0$ is strongly starlike and the Poisson kernel
  $cal(P)(zeta, z)$ is real, it is not hard to show that
  @eq:poisson-representation holds also for $f in P h_C (D_0)$. Let
  $
    H_a (f) = sum_(i, j = 1)^n
    (partial^2 f) / (partial z_i partial overline(z)_j) a_i overline(a)_j,
    quad a in CC^n,
  $
  and let $T$ be any differential operator with constant coefficients. From
  @eq:poisson-representation it follows that for every $f in P h_C (D_0)$
  $
    integral_M f(zeta) T_z [H_(a, z) (cal(P)(zeta, z))] d mu_zeta = 0,
  $
  where the index $z$ on the operators $T$ and $H_a$ means that they must be
  used with respect to $z$. In particular,
  $
    T_z [H_(a, z) (cal(P)(zeta, z))]|_(z = 0) in [P h_C (D_0)]_mu^perp.
  $
  We observe that in our case
  $
    h(overline(zeta), z)
    = sum_(l = 0)^infinity sum_k phi_l^k (z) overline(phi_l^k (zeta)),
  $
  since, by @eq:szego-condition-b,
  $
    integral_M phi_l^k (zeta) h(overline(zeta), z) d mu_zeta = phi_l^k (z);
  $
  #source(102)
  from this and the form of $cal(P)(zeta, z)$ it follows that
  $T_z [H_(a, z) (cal(P)(zeta, z))]|_(z = 0)$ is a polynomial in $zeta$ and
  $overline(zeta)$. Therefore,
  $
    T[H_a (F_nu (z))]|_(z = 0)
    = integral_M T_z [H_(a, z) (cal(P)(zeta, z))]|_(z = 0) d nu_zeta = 0,
  $
  i.e., $H_a (F_nu (z))$ and all its derivatives at $0$ vanish. The function
  $F_nu (z)$ is real-analytic; consequently, $H_a (F_nu (z))$ is also
  real-analytic in $D_0$, and so it is identically equal to zero, which means
  that $F_nu (z) in P h (D_0)$.
]

Suppose now that $D$ is a bounded symmetric domain (see @bib:Fuks1963, §24).
Such domains can be described in a nice way. For simplicity we consider
classical symmetric domains or topological products of them. These domains are
circular and strongly starlike (see @bib:Hua1958), and on their Shilov
boundaries there exist nonnegative rotation-invariant measures $mu$ that are
massive on $S(D)$ and such that the Szegö kernels can be explicitly written out.
(For example, this kernel can be given by @eq:schwarz-kernel.) If $D$ is also
$n$-circular, then $mu$ is invariant with respect to $n$-rotations.

#theorem(title: [Aĭzenberg and Dautov])[
  If $D$ is a classical symmetric domain or a topological product of such
  domains, then $f in R(D)$ if and only if there exists a representation
  $
    f(z) = integral_(S(D)) Q(zeta, z) d nu_zeta + i Im f(0),
  $
  where $z in D$, $nu$ is a nonnegative measure, and
  $
    integral_(S(D)) P d nu = 0
  $ <eq:symmetric-orthogonality>
  for all polynomials of the form @eq:orthogonal-polynomials-circular. If $D$ is
  also $n$-circular, then @eq:orthogonal-polynomials-circular can be replaced by
  @eq:orthogonal-polynomials-n-circular.
] <th:riesz-herglotz-symmetric>

#proof[
  By Theorem~@th:riesz-herglotz-generalized, it suffices to show that
  @eq:symmetric-orthogonality implies @eq:measure-orthogonality. By
  Lemma~@lem:poisson-integral-pluriharmonic, @eq:symmetric-orthogonality gives
  us that $F_nu (z) in P h (D)$. Moreover (see @bib:Koranyi1965),
  $F_nu (r z) d mu$ converges weakly to $nu$ as $r -> 1 - 0$, i.e., for any
  $phi in C(S(D))$
  $
    lim_(r -> 1 - 0) integral_(S(D)) phi(z) F_nu (r z) d mu
    = integral_(S(D)) phi(z) d nu.
  $ <eq:weak-convergence>
  #new-par
  If $phi in [P h_C (D)]_mu^perp$, then the integral in @eq:weak-convergence is
  equal to zero, since $F_nu (r z) in P h_C (D)$, $0 < r < 1$.
]

We give three typical examples.

#eg(title: [a polydisk])[
  Take
  $
    D = U(0, 1) = {z: |z_k| < 1, k = 1, ..., n}, \
    S(D) = {z: |z_k| = 1, k = 1, ..., n};
  $
  #source(103)
  the measure $mu$ is generated by the differential form
  $
    d arg zeta_1 and dots.c and d arg zeta_n,
  $
  and the Szegö kernel has the form
  $
    h(overline(zeta), z)
    = (1 - z_1 overline(zeta)_1)^(-1) dots.c (1 - z_n overline(zeta)_n)^(-1).
  $
  In this case the polynomials of the second and third type in
  @eq:orthogonal-polynomials-n-circular are equal to zero, and we get the
  #index-mark(
    "Formula",
    sub: "Korányi-Pukánszky",
  )_Korányi-Pukánszky formula_ for a characterization of $f in R(D)$:
  $
    f(z) = integral_(S(D))
    [2 / ((1 - z_1 overline(zeta)_1) dots.c (1 - z_n overline(zeta)_n)) - 1]
    d nu_zeta + i Im f(0),
  $
  where $z in D$, the measure $nu$ is nonnegative, and
  $
    integral_(S(D)) z^J overline(z)^frak(J) d nu = 0
  $
  if $J lt.eq.not frak(J)$ and $J gt.eq.not frak(J)$.
] <exm:polydisk>

#eg(title: [a ball])[
  Take $D = B_1 (0) = {z: |z| < 1}$, $S(D) = partial D$,
  $d mu = (n - 1)! (2 pi^n)^(-1) d s$, where $d s$ is the surface element of the
  sphere $partial D$, and the Szegö kernel has the form (see
  @eq:ellipsoid-formula)
  $
    h(overline(zeta), z)
    = (1 - z_1 overline(zeta)_1 - dots.c - z_n overline(zeta)_n)^(-n).
  $
  We arrive at the following characteristic formula for functions $f in R(D)$:
  $
    f(z) = integral_(partial D)
    [2 / (1 - z_1 overline(zeta)_1 - dots.c - z_n overline(zeta)_n)^n - 1]
    d nu_zeta + i Im f(0),
  $
  where $z in D$, the measure $nu$ is nonnegative, and
  $integral_(partial D) P d nu = 0$ for polynomials $P(z, overline(z))$ of the
  form
  $
    z^J overline(z)^frak(J), quad J lt.eq.not frak(J), quad
    J gt.eq.not frak(J), \
    z^J overline(z)^(J + frak(J))
    [i_k + j_k + 1 - (|J| + |frak(J)| + n) |z_k|^2], \
    z^(J + frak(J)) overline(z)^J
    [i_k + j_k + 1 - (|J| + |frak(J)| + n) |z_k|^2].
  $
] <exm:ball>

#eg(title: [“generalized unit disk”])[
  Let $tau_0 = {w: w w^* < upright(I)^((2))} subset CC^4$, where $w$ is a
  $2 times 2$ matrix, $w^* = overline(w)'$ is the adjoint of $w$, and
  $upright(I)^((2))$ is the $2 times 2$ identity matrix. The Shilov boundary of
  $tau_0$ is the set $S(tau_0) = U(2) = {X: X X^* = upright(I)^((2))}$ of all
  $2 times 2$ unitary matrices (see @bib:Vladimirov1969–@bib:Vladimirov1977);
  $S(tau_0)$ admits the parametrization $X = e^(i phi \/ 2) u$, $X in S(tau_0)$,
  $0 <= phi <= 2 pi$, $u in S U(2)$ and the group $S U(2)$ is isomorphic to the
  three-dimensional unit sphere $S_3$. Let $d mu = (4 pi^3)^(-1) d phi and d u$,
  #source(104) where $d u$ is Lebesgue measure on $S_3$. The Szegö kernel with
  respect to this measure has the form (see, for example, @bib:Vladimirov1974a)
  $
    h(X, w) = det^(-2) (upright(I)^((2)) - w X^*).
  $
  The domain $tau_0$ is classical (see @bib:Hua1958); therefore,
  Theorem~@th:riesz-herglotz-symmetric is valid for it. Let
  $
    D_(q_1, q_2)^j (w)
    & = [((j + q_1)! (j - q_1)!) / ((j + q_2)! (j - q_2)!)]^(1 \/ 2) \
    & times sum_s binom(j + q_2, s) binom(j - q_2, s - q_1 - q_2)
    w_11^s w_12^(j + q_1 - s) w_21^(j + q_2 - s) w_22^(s - q_1 - q_2).
  $
  Applying Lemma~@lem:generalized-disk-basis, we then get that the
  characteristic formula for the functions $f in R(D)$ is the #index-mark(
    "Formula",
    sub: "Vladimirov",
  )_Vladimirov formula_
  $
    f(z) = integral_(S(tau_0))
    [2 / (det^2 (upright(I)^((2)) - w X^*)) - 1] d nu_x + i Im f(0),
  $
  where $z in tau_0$, the measure $nu$ is nonnegative, and
  $
    integral_(S(tau_0)) (det X)^m D_(q_1, q_2)^j (X) d nu = 0, \
    2 j = 2, 3, ..., quad m = -2 j + 1, ..., -1, quad
    -j <= q_1, q_2 <= j.
  $
] <exm:generalized-unit-disk>

#lemma[
  The functions
  $
    sqrt(2 j + 1) (det X)^m D_(q_1, q_2)^j, quad X in S(tau_0),
  $ <eq:generalized-disk-functions>
  $
    2 j = 2, 3, ..., quad m = -2 j + 1, ..., -1, \
    -j <= q_1, q_2 <= j
  $ <eq:generalized-disk-indices>
  are representable as linear combinations of the polynomials
  @eq:orthogonal-polynomials-circular, and, conversely, the polynomials of the
  form @eq:orthogonal-polynomials-circular are representable as linear
  combinations of the functions @eq:generalized-disk-functions under the
  condition @eq:generalized-disk-indices.
] <lem:generalized-disk-basis>

#proof[
  On $S(tau_0)$ we have (see @bib:Vladimirov1974a)
  $
    overline(D_(q_1, q_2)^j (X))
    = (-1)^(q_1 - q_2) (det X)^(-2 j) D_(-q_1, -q_2)^j (X),
  $ <eq:d-function-conjugate>
  and the functions @eq:generalized-disk-functions form an orthogonal basis in
  $H_mu^2 (tau_0)$ when $m = 0, 1, 2, ...$, $2 j = 0, 1, 2, ...$, and
  $-j <= q_1, q_2 <= j$.

  From @eq:d-function-conjugate and the orthogonality of this basis it follows
  that
  $
    integral_(S(tau_0)) phi(X) u(X) d mu = 0,
  $ <eq:generalized-disk-orthogonality>
  #source(105)
  where $phi$ is a function of the form @eq:generalized-disk-functions under the
  condition @eq:generalized-disk-indices and the $u$ are functions in the basis
  or their conjugates. Therefore, @eq:generalized-disk-orthogonality holds for
  all $u in P h_C (tau_0)$. Thus, under condition @eq:generalized-disk-indices
  the functions @eq:generalized-disk-functions belong to
  $[P h_C (tau_0)]_mu^perp$ and, by
  Proposition~@prop:orthogonal-polynomials-circular, are linear combinations of
  the polynomials @eq:orthogonal-polynomials-circular, since the functions
  @eq:generalized-disk-functions are polynomials in the elements of the matrices
  $X$ and $overline(X)$, due to the fact that
  $(det X)^m = (det overline(X))^(-m)$ on $S(tau_0)$.

  Suppose now that $P(X, overline(X))$ is a polynomial of the form
  @eq:orthogonal-polynomials-circular. It can be expressed as a linear
  combination of the functions
  $
    & (det X)^m D_(q_1, q_2)^j (X) overline((det X)^k D_(p_1, p_2)^l (X)) \
    & quad = (-1)^(p_1 - p_2) (det X)^(m - k - 2 l) D_(q_1, q_2)^j (X)
      D_(-p_1, -p_2)^l (X).
  $
  The homogeneous polynomials $D_(q_1, q_2)^j (X) D_(-p_1, -p_2)^l (X)$ are
  linear combinations of polynomials in the basis; hence,
  $
    P(X, overline(X)) = sum_(m = -infinity \ j, q_1, q_2)^infinity
    a_(q_1, q_2)^(j, m) (det X)^m D_(q_1, q_2)^j (X),
  $ <eq:generalized-disk-expansion>
  and only finitely many of the coefficients $a_(q_1, q_2)^(j, m)$ are nonzero.
  If $m >= 0$ or $m <= -2 j$, then the function @eq:generalized-disk-functions
  is the trace on $S(tau_0)$ of a function in $P h_C (tau_0)$ (for $m <= -2 j$
  this follows from @eq:d-function-conjugate); therefore, from
  @eq:d-function-conjugate, @eq:generalized-disk-expansion, and the fact that
  $P(X, overline(X)) in [P h_C (tau_0)]_mu^perp$ it follows that for $m >= 0$ or
  $m <= -2 j$
  $
    a_(q_1, q_2)^(j, m) = (2 j + 1) integral_(S(tau_0)) P(X, overline(X))
    (det overline(X))^m D_(q_1, q_2)^j (overline(X)) d mu = 0.
  $
  This means that in @eq:generalized-disk-expansion the coefficients
  $a_(q_1, q_2)^(j, m)$ are nonzero only for indices satisfying condition
  @eq:generalized-disk-indices.
]
