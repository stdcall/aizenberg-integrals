#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Residues of rational functions of two variables <sec:two-variables>

#point <pt:two-variables-problem> Let us apply the method described in
@sec:alexander-pontryagin to integrals of the form
$
  integral.double_gamma (P(w, z)) / (Q(w, z)) d w and d z,
$ <eq:two-variable-integral>
where $P$ and $Q$ are polynomials in two variables (it can be assumed that $P$
is an entire function), $gamma in Z_2 (CC^2 without T)$, and
$T = {(w, z) in CC^2: Q(w, z) = 0}$. We
#source(134)
find the dimension of the isomorphic homology groups
$H_2 (CC^2 without T) tilde.eq H_1 (dot(T))$, where
$dot(T) = T union {infinity}$ is the closure of the singular set $T$ in the
space $CC^2$, completed to form the sphere
$S^4 = dot(CC)^2 = CC^2 union {infinity}$ by adding a single point $infinity$ at
infinity (see @sec:alexander-pontryagin), and we determine dual (in the
Alexander-Pontryagin sense) bases for these groups. We also compute the residues
(periods) of the form $P d w and d z \/ Q$ with respect to the basis cycles.

#point <pt:riemann-surface-genus> *The genus of a Riemann surface.* Let us first
recall some facts about Riemann surfaces of algebraic functions (see
@bib:Chebotarev1948 and @bib:Hurwitz1929). Suppose that
$Q(w, z) = a_0 (z) w^n + a_1 (z) w^(n - 1) + dots.c + a_n (z)$ is an irreducible
polynomial of degree $n$ with respect to the variable $w$. Its discriminant is
$D(z) = R(Q, Q'_w) equiv.not 0$. The equation
$
  Q(w, z) = 0
$ <eq:algebraic-equation>
determines in the domain $G = {z in CC^1: D(z) != 0}$ an $n$-valued analytic
function $w = phi(z)$, called an _algebraic function_. At the points of the set
$frak(S) = {z: D(z) = 0} union {infinity} = {z_1, ..., z_N, infinity}
subset overline(CC)$ (where $overline(CC)$ is the Riemann sphere) this function
can only have poles or algebraic branch points.

We take an arbitrary point $z_0 in G$ and make cuts on $overline(CC)$ along
segments joining $z_0$ to the points of $frak(S)$ (it can be assumed that no two
points of $frak(S) without {infinity}$ lie on a single ray emanating from
$z_0$). This gives a simply connected domain $D$. Adjoining to it the sides of
the cuts, we get a simply connected closed $2(N + 1)$-gon $overline(D)$. The
algebraic function $w = phi(z)$ splits into $n$ branches
$phi_1 (z), ..., phi_n (z)$, each holomorphic and single-valued in $D$ and
continuously extendible to $overline(D)$ if its values are taken in
$overline(CC)$. We assign to each branch $phi_j$ its own copy $overline(D)_j$
($j = 1, ..., n$) of the polygon $overline(D)$ and identify pairwise the sides
(edges of the cuts) of these copies on which the values of the corresponding
branches coincide. This gives an $n$-sheeted Riemann surface $S$ that is a
2-dimensional compact connected orientable manifold on which $w = phi(z)$ is
single-valued.

A point of the Riemann surface $S$ lying over a point $a in frak(S)$ is called a
_branch point of order $k$_ if vertices of $k$ distinct polygons $overline(D)_j$
are identified there. In a neighborhood of such a point the algebraic function
$w = phi(z)$ can be represented as a series
$
  w = sum_(m = m_0)^infinity c_m (z - a)^(m \/ k),
$
where $m_0$ is an integer, positive or negative. This expansion can be found
with the help of a Newton diagram (see @bib:Chebotarev1948).

We determine the genus of $S$. The polygons $overline(D)_j$ ($j = 1, ..., n$)
form a cell complex of the manifold $S$. There are $alpha_2 = n$ two-dimensional
cells, $alpha_1 = n(N + 1)$ one-dimensional cells, and $alpha_0 = r + n$
zero-dimensional cells, where
#source(135)
$r$ is the number of points of $S$ lying over points of $frak(S)$ (exactly $n$
points of $S$ correspond to $z_0$). Since the zero-dimensional and
two-dimensional Betti numbers of $S$ satisfy $p_0 = p_2 = 1$, the
one-dimensional Betti number of $S$, which is twice its genus, can be found from
the Euler-Poincaré formula @eq:euler-poincare:
$
  p_1 = 2 rho & = p_0 + p_2 - alpha_0 + alpha_1 - alpha_2 \
              & = 2 - r + (N + 1) n - 2 n.
$ <eq:surface-betti-number>
Taking into account that the sum of the orders of the branch points of $S$ lying
over a single point of $frak(S)$ is equal to $n$, we get that
$
  n(N + 1) - r = sum_(j = 1)^r (k_j - 1),
$ <eq:branching-sum>
where the $k_j$ are the orders of the corresponding branch points. From
@eq:surface-betti-number and @eq:branching-sum we get

#theorem(title: [Riemann])[
  The genus of the Riemann surface of an algebraic function is given by the
  formula
  $
    rho = omega / 2 - n + 1,
  $ <eq:riemann-genus>
  where $n$ is the number of sheets, and $omega = sum_(j = 1)^r (k_j - 1)$ is
  the ramification index of the Riemann surface.
] <th:riemann-genus>

#point <pt:complement-dimension> *The dimension of the two-dimensional homology
group of the complement of an algebraic curve in $CC^2$.* We return to the
integral @eq:two-variable-integral. The denominator $Q$ can be represented in
the form $Q = Q_1^(r_1) dots.c Q_m^(r_m)$, where the $Q_1, ..., Q_m$ are
irreducible polynomials.

#theorem(title: [Yuzhakov])[
  The dimension of the groups $H_1 (dot(T))$ and $H_2 (CC^2 without T)$ is given
  by
  $
    p = sum_(j = 1)^m 2 rho_j + sum_(i = 1)^s (q_i - 1) + l - m,
  $ <eq:complement-dimension>
  where $rho_j$ is the genus of the Riemann surface of the algebraic function
  determined by the equation $Q_j (w, z) = 0$, $j = 1, ..., m$, $q_i$ is the
  number of irreducible components of the analytic set $T$ at the
  self-intersection point $A_i$ of it, $s$ is the number of self-intersection
  points of $T$, and $l$ is the number of elements of $T$ at infinity (the
  number of connected components of the set $T inter {|z|^2 + |w|^2 > R}$ for
  $R$ sufficiently large).
] <th:complement-dimension>

#proof[
  The set $dot(T) = {z: Q(z) = 0} union {infinity}$ is homeomorphic to the
  topological sum $S$ of the Riemann surfaces $S_j$ of the algebraic functions
  $w = phi_j (z)$
  #source(136)
  determined by the equations#footnote[It can be assumed that
    $Q_j (w, z) equiv.not z$. Otherwise, we make a linear change of variables.]
  $Q_j (w, z) = 0$, $j = 1, ..., m$, with certain points identified. Namely: 1)
  the points of the Riemann surfaces $S_j$ that have a common projection on the
  $z$-plane and at which the functions $w = phi_j (z)$ take a single value
  $!= infinity$ are identified with a single self-intersection point ($A_i$) of
  $dot(T)$, with $q_i$ points of $S$ identified at the point $A_i in dot(T)$;
  and 2) the points of the surfaces $S_j$ ($j = 1, ..., m$) lying over the point
  $z = infinity$ of the Riemann sphere, along with the poles of the functions
  $phi_j (z)$ ($l$ points in all) are identified with the single point
  $infinity in dot(T)$. In an arbitrary triangulation of the polyhedra $S$ and
  $dot(T)$ that includes the identified points as vertices, the numbers
  $alpha_2$ and $alpha_1$ of two-dimensional and one-dimensional simplexes do
  not change in passing from $S$ to $dot(T)$, and the number $alpha_0$ of
  vertices decreases by $sum_(i = 1)^s (q_i - 1) + l - 1$. The Betti numbers of
  $S$ are $p_0 = m$ (the number of connected components of $S$),
  $p_1 = sum_(j = 1)^m 2 rho_j$, and $p_2 = m$. For $dot(T)$ we have $p_0 = 1$,
  because all the components $T_j = {(w, z): Q_j (w, z) = 0} union {infinity}$,
  $j = 1, ..., m$, have the common point $infinity in dot(CC)^2$, and $p_2 = m$.
  From this we get formula @eq:complement-dimension for the one-dimensional
  Betti number of $dot(T)$ from the Euler-Poincaré formula @eq:euler-poincare.
  According to Theorem~@th:alexander-pontryagin, the two-dimensional Betti
  number of the domain $CC^2 without T = dot(CC)^2 without dot(T)$ is also equal
  to @eq:complement-dimension.
]

Formula @eq:complement-dimension can be given another form convenient for
computations. Let $Q_* (w, z) = Q_1 (w, z) dots.c Q_m (w, z)$. Then
$T = {Q(w, z) = 0} = {Q_* (w, z) = 0}$. Let $n$ be the degree of the polynomial
$Q_*$ in the variable $w$; the roots of the discriminant
$D_* = R(Q_*, partial Q_* \/ partial w)$ of $Q_*$ are denoted by
$z_1, ..., z_N$; $r_j$ is the number of distinct finite roots of the equation
$Q_* (w, z_j) = 0$, $j = 1, ..., N$.

#proposition[
  The dimension of the homology groups
  $H_1 (dot(T)) tilde.eq H_2 (CC^2 without T)$ is determined by the formula
  $
    p = (N - 1) n - sum_(j = 1)^N r_j + m.
  $ <eq:complement-dimension-discriminant>
] <prop:complement-dimension-discriminant>

#proof[
  Let us represent the $rho_j$ ($j = 1, ..., m$) in @eq:complement-dimension by
  @eq:riemann-genus. This gives
  $
    p = sum_r (k_r - 1) - 2 sum_(j = 1)^m n_j + 2 m + sum_(i = 1)^s (q_i - 1)
    + l - m,
  $
  or
  $
    p = sum_r (k_r - 1) + sum_(i = 1)^s (q_i - 1) + l - 2 n + m,
  $ <eq:complement-dimension-branching>
  #source(137)
  where $n_j$ is the degree of the polynomial $Q_j (w, z)$ in the variable $w$,
  $sum_1^m n_j = n$, the $k_r$ are the orders of the branch points of the
  Riemann surfaces $S_j$ ($j = 1, ..., m$), and the summation in $sum_r$ is over
  all branch points. The branch points of the surfaces $S_j$, the
  self-intersection points of the algebraic curve $T$, and the poles of the
  functions $w = phi_j (z)$ can lie only over those points of the $z$-plane at
  which $D_* (z) = 0$. If $q$ ($q >= 1$) points of the set
  $S = union.big_1^m S_j$ with orders $k_(r_1), ..., k_(r_q)$ are identified at
  the point $(z_j, w_(j i))$, then $w_(j i)$ is a root of the equation
  $Q_* (w, z_j) = 0$ with multiplicity $beta_(j i) = sum_(t = 1)^q k_(r_t)$. To
  it corresponds the term
  $
    sum_(t = 1)^q (k_(r_t) - 1) + (q - 1) = beta_(j i) - 1
  $
  in the sum @eq:complement-dimension-branching. To the point at infinity
  $(infinity) in dot(T) subset dot(CC)^2$ there corresponds the term
  $
    sum_(t = 1)^l (k_(s_t) - 1) + l = sum_(t = 1)^l k_(s_t)
    = sum_(j = 1)^N delta_j + n
  $
  in the sum @eq:complement-dimension-branching, where the $k_(s_t)$ are the
  orders of branching of the poles and of the points of the surfaces $S_j$
  ($j = 1, ..., m$) lying over the point $z = infinity in overline(CC)$,
  $delta_j$ is the multiplicity of the infinite root of the equation
  $Q_* (w, z_j) = 0$, i.e., the difference between $n$ and the degree of
  $Q_* (w, z_j)$, which difference is equal to the sum of the orders of
  branching of the poles lying over $z_j$, and $n$ is the sum of the orders of
  the branch points lying over the point $z = infinity$, with the first-order
  branch points included. Thus,
  $
    p = sum_(j = 1)^N sum_(i = 1)^(r_j) (beta_(j i) - 1)
    + sum_(j = 1)^N delta_j - n + m.
  $
  Taking into account that $sum_(i = 1)^(r_j) beta_(j i) + delta_j = n$, we get
  @eq:complement-dimension-discriminant.
]

#point <pt:dual-homology-bases> *Dual homology bases.* We construct a
two-dimensional homology basis for a domain $CC^2 without T$ that is a domain of
regularity of the form $P d w and d z \/ Q$, along with a one-dimensional
homology basis dual to it in the Alexander-Pontryagin sense for the singular set
$dot(T)$.

1\. On each irreducible component $T_j = {Q_j (w, z) = 0}$ of the algebraic
curve $T$ we construct $2 rho_j$ one-dimensional cycles $sigma_(j s)^1$,
$s = 1, ..., 2 rho_j$, $j = 1, ..., m$, corresponding to the "canonical" cuts of
the two-dimensional manifold $S_j$ (see Proposition~@prop:homology-of-surface
about the parallels and meridians of the handles). Here it can be assumed that
the cycles $sigma_(j, 2k - 1)^1$ and $sigma_(j, 2k)^1$ have a single common
point and do not intersect the remaining cycles $sigma_(j s)^1$, and also that
they do not pass through self-intersection points of $dot(T)$. We take
$gamma_(j s)^1 = delta_epsilon omega_(j s)^1$, where $omega_(j s)^1$ is obtained
from $sigma_(j r)^1$
#source(138)
by a slight shift, $r = s - (-1)^s$, $delta_epsilon$ is the Leray coboundary
operator (see @sec:leray-residues), and $epsilon > 0$ is sufficiently small.
This gives $sum_1^m 2 rho_j$ cycles $sigma_(j s)^1 in Z_1 (dot(T))$, and
accordingly the same number of cycles $gamma_(j s)^1 in Z_2 (CC^2 without T)$,
$s = 1, ..., 2 rho_j$, $j = 1, ..., m$; such cycles are called #index-mark(
  "Cycle",
  sub: "canonical",
)_canonical_.

2\. Suppose that $q_j$ irreducible elements (germs) $S_(j i)$
($i = 1, ..., q_j$) of the algebraic curve $T$ intersect at the point
$A_j in T$. In $dot(T)$ we construct a closed oriented curve (one-dimensional
cycle) $sigma_(j i)^2$ that goes out from $A_j$ along the element $S_(j q_j)$
and goes into $A_j$ along the element $S_(j i)$ ($i = 1, ..., q_j - 1$). If the
elements $S_(j i)$ and $S_(j q_j)$ belong to different irreducible components
$T_s$, $s = 1, ..., m$, of $T$, then the passage of the curve $sigma_(j i)^2$
from one component to another takes place through the point $infinity$. Since
the canonical cuts $sigma_(j s)^1$ and $omega_(j s)^1$ do not decompose the
surface $dot(T)_j$ and do not pass through self-intersection points nor the
point $infinity$, it can be assumed that $sigma_(j i)^2$ and $omega_(j r)^1$ do
not have common points. We construct the two-dimensional cycles
$gamma_(j i)^2 = delta_epsilon omega_(j i)^2 in Z_2 (CC^2 without T)$, where
$omega_(j i)^2$ is a simple closed curve on $S_(j i)$ that encircles the point
$A_j$ (note that $S_(j i) without {A_j}$ is homeomorphic to a punctured disk).
Obviously, the cycles $sigma_(j i)^2$ and $omega_(s r)^2$ do not have common
points if $(j, i) != (s, r)$. The cycles $sigma_(j i)^2$ and $omega_(j i)^2$ can
be constructed in such a way that they intersect in a single point.

Thus, we get $sum_(j = 1)^k (q_j - 1)$ cycles
$gamma_(j i)^2 in Z_2 (CC^2 without T)$ and accordingly the same number of
cycles $sigma_(j i)^2 in Z_1 (dot(T))$; these are called #index-mark(
  "Cycle",
  sub: "intersection",
)_intersection cycles_.

3\. Finally, let $tilde(S)_(j 1), ..., tilde(S)_(j l_j)$ be the elements at
infinity of the irreducible component $T_j$ (the connected components of the set
$T_j inter {|z|^2 + |w|^2 > R^2}$, where $R$ is a sufficiently large positive
number) of the algebraic curve $T$, with $sum_1^m l_j = l$. On
$dot(T)_j = T_j union {infinity}$ we construct a closed oriented curve
$sigma_(j s)^3$ going out from the point $infinity$ along the element
$tilde(S)_(j l_j)$ and returning to the point $infinity$ along the element
$tilde(S)_(j s)$, $s = 1, ..., l_j - 1$, $j = 1, ..., m$. The cycle
$sigma_(j s)^3$ can be constructed in such a way that it does not intersect the
cycles $omega_(j r)^1$ and does not pass through the self-intersection points
$A_j$, i.e., does not intersect the cycles $omega_(j i)^2$. We take cycles
$gamma_(j s)^3 = delta_epsilon omega_(j s)^3 in Z_2 (CC^2 without T)$, where
$omega_(j s)^3$ is a closed curve on $tilde(S)_(j s)$ that encircles the point
$infinity$ (the element $tilde(S)_(j s)$ is homeomorphic to a punctured disk),
$s = 1, ..., l_j - 1$, $j = 1, ..., m$. Then the cycles $sigma_(j s)^3$ and
$omega_(i r)^3$ do not intersect if $(j, s) != (i, r)$. It can be assumed that
$sigma_(j s)^3$ and $omega_(j s)^3$ intersect only in a single point. We also
assume that if $sigma_(i s)^2$ passes from the component $T_j$ to the component
$dot(T)_q$, then this takes place through the elements $tilde(S)_(j l_j)$ and
$tilde(S)_(q l_q)$. Then $sigma_(j s)^2$ does not intersect the cycles
$omega_(j r)^3$. Thus, we get $l - m = sum_(j = 1)^m (l_j - 1)$ cycles
$gamma_(j s)^3 in Z_2 (CC^2 without T)$ and accordingly the same number of
cycles $sigma_(j s)^3 in Z_1 (dot(T))$; these are called #index-mark(
  "Cycle",
  sub: "polar",
)_polar cycles_.

#theorem(title: [Yuzhakov])[
  The canonical cycles $gamma_(j i)^1$, $i = 1, ..., 2 rho_j$, $j = 1, ..., m$,
  the intersection cycles $gamma_(j s)^2$, $s = 1, ..., q_j - 1$,
  $j = 1, ..., k$, and the polar
  #source(139)
  cycles $gamma_(j i)^3$, $i = 1, ..., l_j - 1$, $j = 1, ..., m$, form a basis
  for the two-dimensional homology of the domain $CC^2 without T$, and the
  cycles ${sigma_(j i)^1}$, ${sigma_(j i)^2}$, ${sigma_(j i)^3}$ form a dual (to
  within a sign) basis for the one-dimensional homology of the singular set
  $dot(T)$.
] <th:dual-homology-bases>

#proof[
  Let $V_epsilon$ be the operator analogous to the Leray coboundary operator,
  with the circle $delta_epsilon a$ of radius $epsilon$ replaced by a disk of
  radius $epsilon$ (see @sec:leray-residues). Then
  $partial V_epsilon omega_(j i)^r = delta_epsilon omega_(j i)^r
  = gamma_(j i)^r$. From the construction of the cycles ${sigma_(j i)^r}$ and
  ${gamma_(j i)^r}$ it follows that
  $|sigma_(j i)^r| inter |V_epsilon omega_(s q)^k|
  = |sigma_(j i)^r| inter |omega_(s q)^k|$ consists of a single point if
  $(j, i, r) = (s, q, k)$, and is empty if $(j, i, r) != (s, q, k)$. Thus,
  $
    frak(v) (sigma_(j i)^r, gamma_(s q)^k)
    = chi(sigma_(j i)^r, V_epsilon omega_(s q)^k) = plus.minus 1
  $
  for $(j, i, r) = (s, q, k)$, and it equals zero for $(j, i, r) != (s, q, k)$.
  But since the number of cycles ${gamma_(j i)^r}$ (respectively, of cycles
  ${sigma_(j i)^r}$) is equal to
  $
    sum_(j = 1)^m 2 rho_j + sum_(i = 1)^s (q_i - 1) + l - m
  $
  and, according to Theorem~@th:complement-dimension, coincides with the
  dimension of the groups
  $
    H_2 (CC^2 without T) tilde.eq H_1 (dot(T)),
  $
  these cycles form bases of the homology groups
  $
    H_2 (CC^2 without T) quad "and" quad H_1 (dot(T))
  $
  that are dual in the Alexander-Pontryagin sense.
]

#point <pt:basis-cycle-residues> *Computation of the residues with respect to
the basis cycles.* Let us compute the integral @eq:two-variable-integral over
the basis cycle $gamma_(j q)^r$. It can be assumed that $omega_(j q)^r$ does not
pass through the points $(w, z) in T$ at which $partial Q_* \/ partial w = 0$.
Suppose that $omega_(j q)^r = {(w, z): w = psi(t), z = phi(t), 0 <= t <= 1}$,
$phi(0) = phi(1)$, $psi(0) = psi(1)$, and $Q_s (psi(t), phi(t)) equiv 0$ (for
$r = 1$ or 3, $s = j$). Then we can take
$
  gamma_(j q)^r = delta_epsilon omega_(j q)^r
  = {(w, z): z = phi(t), w = psi(t) + epsilon e^(i tau), 0 < t <= 1,
    0 <= tau <= 2 pi},
$
where $epsilon$ is a sufficiently small positive number. Since the cycle
$omega_(j q)^r$ does not pass through the singular points of the algebraic curve
$
  T = {(w, z): Q_* (w, z) = 0},
$
Theorem~@th:leray-composite-residue-formula can be applied to the integral
@eq:two-variable-integral with $gamma = gamma_(j q)^r$. The result is
$
  integral.double_(gamma_(j q)^r) (P(w, z)) / (Q(w, z)) d w and d z
  = 2 pi i integral_(omega_(j q)^r) Res[P / Q d w and d z].
$ <eq:basis-cycle-residue>
The residue class
$
  Res[P / Q d w and d z]
$
#source(140)
can be found by the method described in @sec:cohomological-reduction,
@pt:lowering-pole-order. It can also be computed directly as follows.

Since $partial Q_s \/ partial w != 0$ on $|omega_(j q)^r|$, we can choose the
system of coordinates $(zeta, omega)$: $zeta = z$,
$omega = Q_s (w, z)$#footnote[Although this substitution may not be one-to-one
  in the large in a neighborhood of the curve $omega_(j q)^r$, it is locally
  one-to-one. And since the local coordinate systems coincide in the
  intersection of two coordinate neighborhoods, it is not necessary to use a
  partition of unity (cf. @sec:cohomological-reduction,
  Lemma~@lem:lowering-pole-order).] in a neighborhood of $|omega_(j q)^r|$. Then
$
  Res[P / Q d w and d z] & = Res[F / omega^(r_s) d omega and d zeta]
                           in.rev 1 / ((r_s - 1)!) lr(
                             (partial^(r_s - 1) F)
                             / (partial omega^(r_s - 1)) |
                           )_(omega = 0) d zeta \
                         & = 1 / ((r_s - 1)!) lr(
                             (partial^(r_s - 1) F)
                             / (partial Q_s^(r_s - 1)) |
                           )_(Q_s (w, z) = 0) d z,
$
where $F = P Q_s^(r_s) \/ (Q partial Q_s \/ partial w)$. Since
$partial^(r_s - 1) F \/ partial Q_s^(r_s - 1)$ is a rational function of $w$ and
$z$, this gives us the following result, according to Theorem~@th:on-residues
(on residues).

#theorem(title: [Poincaré])[
  The integral @eq:two-variable-integral over an arbitrary cycle
  $gamma in Z_2 (CC^2 without T)$ can be expressed in terms of periods of
  abelian integrals#footnote[An integral of the form
    $integral_gamma R(w, z) d z$, where $R$ is a rational function of $w$ and
    $z$, and $w$ and $z$ are connected by the relation $Q(w, z) = 0$ for some
    irreducible polynomial $Q$, is called an _abelian integral_. The value of an
    abelian integral over a cycle on a Riemann surface is called its _period_.]
  on the Riemann surfaces of the algebraic functions determined by the equations
  $Q_j (w, z) = 0$, $j = 1, ..., m$, where the $Q_j$ are the irreducible factors
  of the polynomial $Q$.
] <th:poincare-abelian-integrals>

In the case where $gamma_(j q)^r$ is an intersection cycle or a polar cycle the
integral @eq:basis-cycle-residue can be completely computed. Let $gamma_(j q)^2$
be an intersection cycle. Assume that the self-intersection point $A_j$
coincides with the origin. Then in a neighborhood of $A_j$ the element $S_(j q)$
can be given by an equation
$
  w = g(z) = sum_(r = 0)^infinity c_r z^(r \/ k).
$
The cycle $omega_(j q)^2$ is equal to
${(w, z): w = g(z), z = delta e^(i t), 0 <= t <= 2 pi k_q}$. The integral
@eq:basis-cycle-residue then takes the form
$
  integral.double_(gamma_(j q)^2) P / Q d w and d z
  = k (2 pi i)^2 limits(res)_(z = 0) [Phi(z)],
$
where
$
  Phi(z) = 1 / ((r_s - 1)!) partial^(r_s - 1) / (partial Q_s^(r_s - 1))
  F(w, z)|_(w = g(z)).
$
Obviously, $Phi(z)$ has a pole at $z = 0$.

#source(141)
The residues with respect to the polar cycles can be computed similarly. If the
element $tilde(S)_(j q)$ corresponds to a finite pole $z = z_0$ of the algebraic
function $w = phi_j (z)$, then $tilde(S)_(j q)$ is given by an equation
$
  w = g(z) = sum_(r = -n_0)^infinity c_r (z - z_0)^(r \/ k_q).
$
If $tilde(S)_(j q)$ corresponds to the point $z = infinity$, then its equation
has the form
$
  w = sum_(r = n_0)^(-infinity) c_r z^(r \/ k_q), quad |z| > R.
$
#new-par
Thus, computation of the residue of a rational function with respect to an
intersection cycle or a polar cycle reduces to iterated computation of the
simple residue with respect to a pole, i.e., it reduces to differentiation.

#example[
  Consider the integral
  $
    J = integral.double_gamma (P(w, z) d w and d z)
    / (w (w^2 - z^3)(w^2 - z^3 - z^4)),
  $ <eq:example-integral>
  where $gamma in Z_2 (CC^2 without T)$, $T = {Q(w, z) = 0}$, and
  $
    Q(w, z) = w (w^2 - z^3)(w^2 - z^3 - z^4).
  $
  Each irreducible factor in the denominator determines a Riemann surface of
  genus zero. The surface $T$ has two self-intersection points: $(0, 0)$ and
  $(0, -1)$. Three irreducible elements (germs) of the algebraic curve $T$
  intersect at the point $(0, 0)$, and two intersect at $(0, -1)$. The connected
  components ${w = 0}$ and ${w^2 - z^3 = 0}$ each have one element at infinity,
  and the component ${w^2 - z^3 - z^4 = 0}$ has two of them. Thus, the dimension
  of the group $H_2 (CC^2 without T)$ is equal to four, by
  @eq:complement-dimension. There are three intersection basis cycles, of which
  two,
  $
    gamma_1 & = {z = epsilon e^(i t), w = delta e^(i tau),
                0 <= t, tau <= 2 pi}, \
    gamma_2 & = {z = epsilon e^(i t),
                w = epsilon^(3 \/ 2) e^(3 i t \/ 2) + delta e^(i tau),
                0 <= t <= 4 pi, 0 <= tau <= 2 pi},
  $
  correspond to the point $(0, 0)$, and one,
  $
    gamma_3 = {z = -1 + epsilon e^(i t), w = delta e^(i tau),
      0 <= t, tau <= 2 pi},
  $
  corresponds to the point $(0, -1)$, and there is one polar cycle
  $
    gamma_4 = {z = R e^(i t), w = R^2 e^(2 i t) sqrt(1 + R^(-1) e^(-i t))
      + delta e^(i tau), 0 <= t, tau <= 2 pi}.
  $
  Here $epsilon$ and $delta$ are sufficiently small numbers, $delta << epsilon$,
  and $R > 1$.

  #source(142)
  We compute the residues with respect to the basis cycles:
  $
    R_1 & = 1 / (2 pi i)^2 integral.double_(gamma_1) P / Q d w and d z
          = 1 / (2 pi i) integral_(|z| = epsilon)
          (P(0, z) d z) / (z^3 (z^3 + z^4)) \
        & = sum_(k = 0)^5 (-1)^(k + 1) / (k!) (partial^k P(0, 0))
          / (partial z^k); \
    R_2 & = 1 / (2 pi i)^2 integral.double_(gamma_2) P / Q d w and d z
          = -1 / (2 pi i) integral_(z = e^(i t) \ 0 <= t <= 4 pi)
          (P(z^(3 \/ 2), z) d z) / (z^(3 \/ 2) 2 z^(3 \/ 2) z^4) \
        & = -1 / (6!) (partial^6 P(0, 0)) / (partial z^6)
          - 1 / (2! 3!) (partial^5 P(0, 0)) / (partial w^2 partial z^3)
          - 1 / (4!) (partial^4 P(0, 0)) / (partial w^4); \
    R_3 & = 1 / (2 pi i)^2 integral.double_(gamma_3) P / Q d w and d z
          = 1 / (2 pi i) integral_(|z + 1| = epsilon)
          (P(0, z) d z) / (z^3 (z^3 + z^4)) = P(0, -1); \
    R_4 & = 1 / (2 pi i)^2 integral.double_(gamma_4) P / Q d w and d z
          = 1 / (2 pi i) integral_(|z| = R)
          (P(sqrt(z^3 + z^4), z)) / (2 (z^3 + z^4) z^4) d z \
        & = limits(res)_(zeta = 0)
          P(sqrt(1 + zeta) \/ zeta^2, 1 \/ zeta) zeta^6 \/ 2 (zeta + 1).
  $
  The last residue is easy to compute for a concrete choice of the polynomial
  $P$. By Theorem~@th:on-residues, the integral @eq:two-variable-integral over
  an arbitrary cycle $gamma$ is equal to $J = (2 pi i)^2 sum_1^4 n_j R_j$, where
  the $n_j$ are integers.
]

#small-print[
  #point <pt:projective-plane> In order not to distinguish between intersection
  cycles and polar cycles, the integral @eq:two-variable-integral can be
  considered in the complex projective space $C P^2$. After passage to the
  homogeneous coordinates $(z_0, z_1, z_2)$: $w = z_1 \/ z_0$, $z = z_2 \/ z_0$
  the integral @eq:two-variable-integral takes the form
  $
    integral.double_gamma (P(z_0, z_1, z_2)) / (Q(z_0, z_1, z_2))
    (z_0 d z_1 and d z_2 - z_1 d z_0 and d z_2 + z_2 d z_0 and d z_1),
  $ <eq:projective-integral>
  where $gamma in Z_2 (C P^2 without T)$, with
  $T = {(z_0, z_1, z_2) in C P^2: Q(z_0, z_1, z_2) = 0}$.

  #theorem(title: [Tsikh])[
    $H_2 (C P^2 without T) tilde.eq H_1 (T)$.
  ] <th:tsikh-projective>

  #theorem[
    The one-dimensional Betti number of an algebraic curve $T$ in $C P^2$, i.e.,
    the dimension of the group $H_1 (T)$, is given by
    $
      p = sum_(j = 1)^m 2 rho_j + sum_(i = 1)^k (alpha_i - 1) - m + 1,
    $
    where $m$ is the number of distinct irreducible factors $Q_1, ..., Q_m$ of
    the polynomial $Q$, $rho_j$ is the genus of the algebraic curve determined
    by the equation $Q_j (z_0, z_1, z_2) = 0$, $k$ is the number of
    self-intersection points of $T$, and $alpha_i$ is the number of irreducible
    components (germs) of $T$ in a neighborhood of the self-intersection point
    $A_i$.
  ] <th:projective-curve-betti>

  #source(143)
  A basis for the homology group $H_2 (C P^2 without T)$ can be constructed in
  the same way as in @pt:dual-homology-bases (see @bib:Tsikh1977a). This gives
  $sum_1^m 2 rho_j$ canonical cycles and $sum_1^k (alpha_j - 1) - m + 1$
  intersection cycles.

  We indicate a curious analogue of Theorems~@th:gelfand-shilov-leray and
  @lem:division-by-several for a certain particular case of rational functions
  of $n$ variables. Let $P$ and $Q$ be polynomials in $z = (z_1, ..., z_n)$,
  with
  $
    Q(z) = Q_2^(r_2) (z_1, z_2) dots.c Q_n^(r_n) (z_1, z_n).
  $
  We write $T_j = {z in CC^n: Q_j (z_1, z_j) = 0}$ and
  $dot(T)_j = T_j union {infinity}$, which is the closure of $T_j$ in the
  spherical compactification $dot(CC)^n = CC^n union {infinity}$ of $CC^n$.

  #theorem(title: [Tsikh])[
    $
      H_n (CC^n without (T_2 union dots.c union T_n))
      tilde.eq H_1 (dot(T)_2 inter dots.c inter dot(T)_n).
    $
  ] <th:tsikh-n-variables>

  Here a basis for the group $H_n (CC^n without (T_2 union dots.c union T_n))$
  can be constructed in the same way as in @pt:dual-homology-bases, i.e.,
  one-dimensional cycles are constructed on the complex curve
  $dot(T)_2 inter dots.c inter dot(T)_n$, and then the composite Leray
  coboundary $delta^(n - 1)$ is taken. By applying the Leray composite residue
  formula @eq:composite-residue-class-formula it can be shown that the integral
  $integral_gamma (P \/ Q) d z$, where
  $gamma in Z_n (CC^n without (T_2 union dots.c union T_n))$, can be expressed
  in terms of periods of abelian integrals on the algebraic curve
  $T_2 inter dots.c inter T_n$ (see @bib:Tsikh1973).
]
