#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== The Leray theory of residues <sec:leray-residues>

#point <pt:general-position> Suppose that $X$ is a complex analytic manifold
with complex dimension $n$, and that $S_1, ..., S_m$ are complex analytic
submanifolds of it with dimension $n - 1$ (codimension 1) which intersect at
common points _transversally_, or, in other words, are "_in general position_".
This means that if $U_a$ is a neighborhood of an arbitrary point
$a in S_(i_1) inter dots.c inter S_(i_k)$ and $S_j (z, a)$ are holomorphic
functions determining in $U_a$ the submanifolds $S_j$:
$S_j inter U_a = {z: S_j (z, a) = 0}$, then the vectors $grad S_j (z, a)
= (partial S_j \/ partial z_1, ..., partial S_j \/ partial z_n)$,
$j = i_1, ..., i_k$, are linearly independent. Here $z = (z_1, ..., z_n)$ are
local coordinates in $U_a$. We consider integrals of the form
$
  integral_gamma phi,
$ <eq:residue-integral>
where $gamma in Z_p (X without S_1 union dots.c union S_m)$ and
$phi in Z^p (X without S_1 union dots.c union S_m)$.

In this section the main points are the concepts of the Leray coboundary,
residue forms, and residue classes, which generalize the concept of the residue
of a holomorphic function of one variable, along with the Leray residue
theorems, which enable us to reduce the integral @eq:residue-integral to an
integral of lower dimension of a residue form over a cycle lying on a singular
submanifold in the case when $gamma$ is a coboundary cycle.

#point <pt:leray-coboundary> *An exact sequence and the Leray coboundary.* Let
us first consider the case $m = 1$, with the notation $S_1 = S$. Since $S$ has
real codimension 2, we can construct for $S$ a neighborhood $V$ with smooth
boundary $partial V$ in such a way that $V$ is a _locally trivial bundle_ with
base $S$ and fiber $V_a$ ($a in S$) homeomorphic to a disk, while $partial V$ is
a bundle with base $S$ and fiber $delta_a = partial V_a$ homeomorphic to a
circle. The last part means that $V = union.big_(a in S) V_a$ and
$partial V = union.big_(a in S) delta_a$, where $V_a inter V_b = emptyset$ for
$a != b$, and any point $a$ has a neighborhood $U_a$ such that $V inter U_a$ is
homeomorphic to $(S inter U_a) times V_a$ and $partial V inter U_a$ is
homeomorphic to $(S inter U_a) times delta_a$. To construct such a bundle we
choose a Riemannian metric on
#source(116)
$X$ and take $V_a$ to be the union of the geodesic segments issuing from $a$
that are orthogonal to $S$ and of length $rho(a)$, where $rho(a)$ is
sufficiently small, and the function $rho(a)$ is assumed to be of class
$C^((1))$.

We define the mappings
$
  mu: overline(V) -> S, quad nu: X without S -> X without V
$
as follows. If $z in V_a$, then $mu(z) = a$. If $z in X without V$, then
$nu(z) = z$, and if $z in V without S$, then $nu(z)$ is the point where the
geodesic passing through $z$ and orthogonal to $S$ intersects $partial V$.
Obviously, $mu$ and $nu$ are deformation retracts. By
Corollary~@cor:deformation-retract,
$
  nu_*: H_p (X without S) -> H_p (X without V)
$
is an isomorphism. We define a homomorphism
$
  tilde(mu): C_p (S) -> C_(p + 2) (X, X without V)
$ <eq:mu-tilde>
as follows. If $sigma$ is a $p$-dimensional simplex in $S$, then
$mu^(-1) (sigma)$ is a $(p + 2)$-dimensional cell in $overline(V)$. If we assume
that $sigma$ is a sufficiently small simplex, then $mu^(-1) (sigma)$ is
homeomorphic to $V_a times sigma$. The orientation of the cell $mu^(-1) (sigma)$
is determined in the natural way by the orientations of $V_a$ and $sigma$. We
take $tilde(mu) (sigma) = {mu^(-1) (sigma)} in C_(p + 2) (X, X without V)$.
Obviously, $partial compose tilde(mu) = tilde(mu) compose partial$. Indeed,
$
  partial mu^(-1) (sigma) = partial (V_a times sigma)
  = partial V_a times sigma + V_a times partial sigma
  in tilde(mu) (partial sigma)
$
since $partial V_a times sigma in C_(p + 1) (X without V)$. Thus, @eq:mu-tilde
induces a homomorphism
$
  mu_*: H_p (S) -> H_(p + 2) (X, X without V).
$ <eq:mu-star>
This homomorphism is an isomorphism, because it has an inverse homomorphism
induced by intersection of the chains in $C_(p + 2) (X)$ with the submanifold
$S$ (it is assumed that the chains intersect $S$ transversally). Here the
intersection of a $(p + 2)$-dimensional cycle with $S$ is a $p$-dimensional
cycle, and the intersection of the boundary of a chain is the boundary of the
intersection of this chain. According to Theorem~@th:exact-homology-sequence, we
have the exact sequence
$
  stretch(->)^(i_*) H_(p + 2) (X) stretch(->)^(j_*) H_(p + 2) (X, X without V)
  stretch(->)^(partial_*) H_(p + 1) (X without V) stretch(->)^(i_*)
  H_(p + 1) (X) -> dots.c .
$ <eq:pair-exact-sequence>
If in @eq:pair-exact-sequence we replace the groups $H_(p + 1) (X without V)$
and $H_(p + 2) (X, X without V)$ by the groups $H_(p + 1) (X without S)$ and
$H_p (S)$ isomorphic to them, then we get

#theorem(title: [Leray])[
  The sequence of homomorphisms
  $
    -> H_(p + 2) (X) stretch(->)^(overline(omega)) H_p (S)
    stretch(->)^delta H_(p + 1) (X without S) stretch(->)^i H_(p + 1) (X)
    -> dots.c,
  $ <eq:leray-exact-sequence>
  where $i = i_* compose nu_*$, $overline(omega) = mu_*^(-1) compose j_*$ and
  $delta = nu_*^(-1) compose partial_* compose mu_*$, is exact.
] <th:leray-exact-sequence>

#source(117)
This sequence is called a #index-mark(
  "Sequence",
  sub: "Leray exact homology",
)_Leray exact homology sequence_. The homomorphisms $i$, $overline(omega)$, and
$delta$ in it can be interpreted as homomorphisms induced as follows: $i$ is
induced by the imbedding $X without S subset X$; $overline(omega)$ is induced by
intersection of chains in $X$ with the submanifold $S$; $delta$ is induced by
replacing each simplex $sigma in C_p (S)$ by the cell
$delta sigma = mu^(-1) (sigma) inter partial V
= union.big_(z in sigma) delta z$. Most interesting is the homomorphism $delta$,
called the #index-mark(
  "Coboundary",
  sub: "Leray",
)_Leray coboundary_. A cycle $gamma in Z_(p + 1) (X without S)$ is called a
_coboundary cycle_ if ${gamma} = delta h in delta H_p (S)$, i.e., if it is the
boundary of a chain in $X$ that is transversal to $S$ and whose intersection
with $S$ is a cycle $gamma_0 in h in H_p (S)$.

#point <pt:residue-forms> *Residue forms. The #index-mark(
  "Formula",
  sub: "Leray residue",
)Leray residue formula.* A form
$
  phi in Omega^p (X without S_1 union dots.c union S_m)
$
is said to have poles of orders $r_1, ..., r_m$ on $S_1, ..., S_m$ if for any
point $a in S_(i_1) inter dots.c inter S_(i_k)$,
${i_1, ..., i_k} subset {1, ..., m}$, $a in.not S_j$, $j != i_1, ..., i_k$, the
form
$phi(z) S_(i_1)^(r_(i_1)) lr((z, a)) dots.c S_(i_k)^(r_(i_k)) lr((z, a))$
extends to some neighborhood $U_a$ of $a$ as a $C^((infinity))$-form. Such a
form is said to be #index-mark(
  "Form",
  sub: "differential",
  subsub: "semimeromorphic",
)_semimeromorphic_ in $X without S_1 union dots.c union S_m$. Again we set
$m = 1$ and $S_1 = S$.

#theorem(title: [existence of the residue form; Leray])[
  Suppose that $phi(z)$ is a closed regular form on $X without S$ that has on
  $S$ a polar singularity of first order. Then in some neighborhood $U_a$ of an
  arbitrary point $a in S$ there exist regular forms $psi(z, a)$ and
  $theta(z, a)$ such that in $U_a$
  $
    phi(z) = (d s(z, a)) / (s(z, a)) and psi(z, a) + theta(z, a),
  $ <eq:residue-form-decomposition>
  where $s(z, a) in A(U_a)$, $grad s(z, a) != 0$, and
  $S inter U_a = {z: s(z, a) = 0}$. Moreover, the form $psi(z, a)|_S$ is closed
  and uniquely determined by $phi$. If $phi$ is holomorphic in $X without S$,
  then the form $psi(z, a)|_S$ is holomorphic in $U_a inter S$.
] <th:residue-form>

The closed form on $S$ defined in a neighborhood of each point $a in S$ by the
restriction $psi(z, a)|_S$ is called #index-mark(
  "Form",
  sub: "residue",
)_the residue form of the form $phi$_ and denoted by $res[phi]$.

#lemma(title: [on division of forms])[
  A form $phi$ that is regular on $X$ can be represented in some neighborhood
  $U_a$ of a point $a in S$ as
  $
    phi(z) = d s(z, a) and psi(z, a),
  $
  where $psi(z, a)$ is a form that is regular in $U_a$, if and only if
  $
    d s(z, a) and phi(z) = 0
  $
  in $U_a$. Moreover, $psi(z, a)|_S$ depends only on $phi$ and $s(z, a)$. If
  $phi$ is a holomorphic form, then the form $psi(z, a)$ can be chosen to be
  holomorphic.
] <lem:division-of-forms>

#source(118)
#proof[
  We choose a local system of coordinates $z_1, ..., z_n$ in some neighborhood
  $U_a$ in such a way that $s(z, a) = z_1$. Then the form $phi$ can be
  represented in $U_a$ as $phi(z) = d z_1 and psi(z, a) + theta(z, a)$, where
  $psi$ and $theta$ are forms that are regular in $U_a$.

  Here it can be assumed that $psi$ and $theta$ do not contain $d z_1$, and
  $d z_1 and phi = d z_1 and theta$. Hence, $d z_1 and phi = 0$ if and only if
  $theta = 0$, i.e., $phi = d z_1 and psi$. If $phi = 0$, then
  $psi = d z_1 and psi_1$ by the preceding. Then $psi|_(z_1 = 0) = 0$, i.e., the
  form $psi|_S$ is unique.
]

#proof(title: [Proof of Theorem~@th:residue-form.])[
  Since $d phi = 0$ and the form $s(z, a) phi(z)$ is regular in $U_a$, the form
  $
    d(s phi) = d s and phi
  $ <eq:d-s-phi>
  is regular in $U_a$. Multiplication by $d s$ takes this form to zero.
  According to Lemma~@lem:division-of-forms, there is a form $theta(z, a)$ which
  is regular in $U_a$ and such that $d s and phi = d s and theta$. Hence,
  $d s and (s phi - s theta) = 0$. But since the form $s phi - s theta$ is
  regular in $U_a$, Lemma~@lem:division-of-forms gives us the existence of a
  form $psi(z, a)$ that is regular in $U_a$ and such that the equality
  $s phi - s theta = d s and psi$, or @eq:residue-form-decomposition, holds.

  If the form $phi$ is holomorphic, then the form @eq:d-s-phi, being holomorphic
  in $U_a without S$ and regular in $U_a$, extends holomorphically to $U_a$.
  According to Lemma~@lem:division-of-forms, the forms $theta$ and $psi$ can
  then be chosen to be holomorphic.

  The form $psi(z, a)$ is uniquely determined by the form $phi$ and the function
  $s(z, a)$. Indeed, suppose that $phi = 0$. Then
  $d s \/ s and psi + theta = 0$, or $d s and psi + s theta = 0$. Therefore,
  $d s and theta = 0$ and $theta = d s and omega$, where $omega$ is a form that
  is regular in $U_a$. Consequently, $d s and (psi + s omega) = 0$, and
  $psi + s omega = d s and omega_1$, where the form $omega_1$ is regular in
  $U_a$. Thus, the restriction $psi|_S$ is 0.

  Suppose that $s_1 (z, a) = 0$ is another equation for $S inter U_a$. Then
  $phi = d s_1 \/ s_1 and psi + theta_1$, where
  $theta_1 = theta + d ln(s \/ s_1) and psi$ is a regular form in $U_a$, because
  $s \/ s_1 in A(U_a)$ and $s \/ s_1 != 0$. Thus, $psi|_S$ does not depend on
  the choice of $s(z, a)$.

  Finally, we prove that the form $psi|_S$ is closed. Taking the exterior
  differential in @eq:residue-form-decomposition, we get that
  $0 = -d s \/ s and d psi + d theta$. In view of the proved uniqueness, this
  gives us that $d(psi|_S) = d psi|_S = 0$.
]

#eg[
  Suppose that $X = CC^n$, $S = {z: z in CC^n: s(z) = 0}$ and
  $phi(z) = (f(z) \/ s(z)) d z$, where $f, s in A(CC^n)$, $grad s|_S != 0$. Then
  $
    res[phi] = (-1)^(j - 1) (f \/ s'_(z_j))|_S d z_([j])
  $
  at the points where $s'_(z_j) != 0$.
] <exm:simple-pole-residue>

#eg[
  Let $X$ be an analytic manifold of complex dimension 1, $phi$ a meromorphic
  form of degree 1 having only poles of first order, and $S = {a_1, ..., a_N}$
  its set of poles. Then $res[phi] = {res_a phi, a in S}$ is a set of
  #source(119)
  numbers that are ordinary residues of the form $phi$:
  $res_a phi = res_a f(z)$, where $phi = f(z) d z$ is the representation of
  $phi$ in terms of the local parameter $z$ in a neighborhood of $a$.
] <exm:one-dimensional-residues>

The following _Leray residue formula_ is valid for a closed form having a pole
of first order on $S$ and for a coboundary cycle.

#theorem(title: [Leray])[
  Suppose that the form $phi in Z^(p + 1) (X without S)$ has a first-order pole
  on $S$, and that $gamma in Z_p (S)$. Then
  $
    integral_(delta gamma) phi = 2 pi i integral_gamma res[phi].
  $ <eq:leray-residue-formula>
] <th:leray-residue-formula>

#proof[
  We consider a family of neighborhoods $V_epsilon$ of $S$ that depends
  continuously on $epsilon$ ($0 < epsilon <= 1$) and is such that $V_1 = V$ and
  $V_epsilon -> S$ as $epsilon -> 0$. For this we take
  $V_epsilon = union.big_(a in S) V_(epsilon, a)$, where $V_(epsilon, a)$ is the
  union of the geodesic segments of length $epsilon rho(a)$ issuing from the
  point $a$ and orthogonal to $S$. To each $epsilon$ there corresponds a
  coboundary operator $delta_epsilon$ which assigns to each $a in S$ the closed
  curve $delta_epsilon a = partial V_(epsilon, a)$, which is homeomorphic to a
  circle. Since $delta_epsilon a$ can be obtained from $delta_a$ by a continuous
  deformation in $V_a without {a} subset X without S$, it follows that
  $delta gamma tilde.op delta_epsilon gamma$ in $X without S$ for any cycle
  $gamma in Z_p (S)$. Consequently,
  $
    integral_(delta gamma) phi = integral_(delta_epsilon gamma) phi.
  $
  It remains to show that
  $
    lim_(epsilon -> 0) integral_(delta_epsilon gamma) phi
    = 2 pi i integral_gamma res[phi].
  $
  It suffices to prove this equality for small simplexes making up $gamma$. We
  may assume that the simplex $sigma$ lies in the coordinate neighborhood $U_a$.
  According to Theorem~@th:residue-form, $phi$ can be represented in the form
  @eq:residue-form-decomposition in $U_a$. Choose a local system of coordinates
  $z_1, ..., z_n$ in $U_a$ in such a way that $z_1 = s(z, a)$ and the length of
  the vector $d z$ is expressed by the formula
  $
    |d z| = (|d z_1|^2 + dots.c + |d z_n|^2)^(1 \/ 2).
  $
  Then $delta_epsilon sigma$ can be represented in the form
  $
    delta_epsilon sigma = {z: attach(z, tl: ') = (z_2, ..., z_n) in sigma,
      |z_1| = epsilon rho(attach(z, tl: '))}
  $
  to within small quantities of second order. Since the forms $psi$ and $theta$
  are continuous in $U_a$, $meas |delta_epsilon sigma| -> 0$ as $epsilon -> 0$,
  and $meas delta_epsilon sigma \/ |z_1|$ is bounded above,
  #source(120)
  it follows that
  $
    lim_(epsilon -> 0) integral_(delta_epsilon sigma) phi(z)
    & = lim_(epsilon -> 0) integral_(delta_epsilon sigma)
    [(d z_1) / z_1 and psi(z, a) + theta(z, a)] \
    & = integral_(delta_epsilon sigma) (d z_1) / z_1 and psi(mu_epsilon (z), a)
    = integral.cont (d z_1) / z_1 integral_sigma psi(z, a)|_S
    = 2 pi i integral_sigma res[phi],
  $
  where $mu_epsilon (z)$ is the projection of a point $z in delta_epsilon sigma$
  on $S inter U_a = {z: z_1 = 0}$.
]

#point <pt:residue-classes> *Residue classes.* For arbitrary closed regular
forms in $X without S$ we have

#theorem(title: [existence of the residue class; Leray])[
  For every form $phi in Z^(p + 1) (X without S)$, $p = 1, 2, ...$, there exist
  forms cohomologous to it in $X without S$ that have a first-order pole on $S$.
  The residue forms of such forms belong to a single cohomology class on $S$.
] <th:residue-class>

This cohomology class is called #index-mark(
  "Class",
  sub: "residue",
)_the residue class of the form $phi$_ and denoted by $Res[phi]$. Since the
operator $res$ is linear, $Res$ gives rise to a homomorphism
$
  Res: H^(p + 1) (X without S) -> H^p (S).
$ <eq:residue-class-homomorphism>

#remark[
  It is not possible to restrict oneself to holomorphic forms in
  Theorem~@th:residue-class. For a holomorphic form $phi$ the residue class
  $Res[phi]$ may not contain holomorphic forms (see @bib:Leray1959, §59, for a
  counterexample). However, Theorem~@th:residue-class is valid in the class of
  holomorphic forms for Stein manifolds. This follows from Serre's
  Theorem~@th:serre.
]

See @sec:cohomological-reduction about a constructive determination of the
residue class for semimeromorphic and rational forms.

We precede the proof of Theorem~@th:residue-class by some lemmas.

#lemma[
  For every form $chi(z) in Z^p (S)$ there exists a form
  $omega(z) in Omega^(p + 1) (X without S)$ such that 1)
  $omega(z)|_(X without V) = 0$, and 2) for any $a in S$ there is a neighborhood
  $U_a$ in which
  $
    omega(z) = (d s(z, a)) / (s(z, a)) and psi(z, a) + theta(z, a),
  $ <eq:form-with-residue>
  where $psi$ and $theta$ are regular forms in $U_a$, $psi(z, a)|_S = chi(z)$,
  and $d psi(z, a) = 0$ near $S$.
] <lem:form-with-residue>

#proof[
  The form $chi(mu(z))$, where $mu: overline(V) -> S$ is the retraction defined
  in @pt:leray-coboundary, is closed in $overline(V)$. Let $f: X -> RR^1$ be a
  $C^((infinity))$-function that equals 0 on $X without V$ and 1 in a
  neighborhood of $S$. Such a function exists as a consequence of the
  "partition-of-unity" theorem. Let $psi(z) = f(z) chi(mu(z))$. Obviously,
  $d psi = 0$ in a neighborhood of $S$, and $psi|_S = chi$. We take a "partition
  of unity" ${phi_a}_(a in X)$ subordinate to
  #source(121)
  a covering ${U_a}_(a in X)$ of $X$ by coordinate neighborhoods in which local
  equations exist: $S inter U_a = {z: s(z, a) = 0}$. Then the form
  $
    omega(z) = sum_(a in X) phi_a (z) (d s(z, a)) / (s(z, a)) and psi(z)
  $
  satisfies the conditions of the lemma. Moreover, $psi(z, a) = psi(z)$, and
  $
    theta(z, a) = sum_(b != a) phi_b (z) d log (s(z, b)) / (s(z, a))
    and psi(z).
  $
]

According to Theorems~@th:dual-exact-sequence and~@th:de-rham, to the exact
sequence @eq:leray-exact-sequence there corresponds the exact sequence of dual
homomorphisms
$
  dots.c -> H^(p + 1) (X) stretch(->)^(i^*) H^(p + 1) (X without S)
  stretch(->)^(delta^*) H^p (S) stretch(->)^(overline(omega)^*)
  H^(p + 2) (X) -> dots.c .
$ <eq:dual-leray-sequence>

#lemma[
  For the forms $chi$ and $omega$ considered in Lemma~@lem:form-with-residue
  $
    overline(omega)^* {chi} = -1 / (2 pi i) {d omega},
  $ <eq:omega-bar-star>
  where ${chi}$ and ${d omega}$ are the cohomology classes of the forms $chi$
  and $d omega$.
] <lem:omega-bar-star>

#proof[
  We take an arbitrary homology class ${gamma} in H_(p + 2) (X)$ and consider
  the integral
  $
    J = integral_gamma d omega = integral_({gamma}) {d omega}.
  $ <eq:integral-j>
  Since $omega = 0$ outside $V$, the integral @eq:integral-j depends only on the
  class $h in H_(p + 2) (X, X without V)$ determined by the cycle $gamma$. But
  since @eq:mu-star is an isomorphism, there is a cycle $sigma in Z_p (S)$ such
  that $tilde(mu) sigma in h$. Then
  $J = integral_gamma d omega = integral_h d omega
  = integral_(tilde(mu) sigma) d omega$. As in the proof of
  Theorem~@th:leray-residue-formula, we consider a neighborhood $V_epsilon$ of
  $S$ and operators $tilde(mu)_epsilon$ and $delta_epsilon$. The form $d omega$
  is regular in $X$, so, by Stokes' formula
  $
    J = integral_(tilde(mu) sigma) d omega
    = lim_(epsilon -> 0) integral_(tilde(mu) sigma - tilde(mu)_epsilon sigma)
    d omega
    = integral_(delta sigma) omega
    - lim_(epsilon -> 0) integral_(delta_epsilon sigma) omega.
  $
  Since $omega|_(X - V) = 0$, it follows that
  $integral_(delta sigma) omega = 0$. Taking @eq:form-with-residue into account,
  we get exactly as in the proof of Theorem~@th:leray-residue-formula that
  $
    J = -lim_(epsilon -> 0) integral_(delta_epsilon sigma) omega
    = -2 pi i integral_sigma chi.
  $
  By construction, ${sigma} = overline(omega) {gamma}$. Thus,
  $
    integral_({gamma}) {d omega}
    = -2 pi i integral_(overline(omega) {gamma}) {chi}
    = -2 pi i integral_({gamma}) overline(omega)^* {chi}.
  $
  By Corollary~@cor:exact-form-criterion, the equality @eq:omega-bar-star holds.
]

#source(122)
#proof(title: [Proof of Theorem~@th:residue-class.])[
  Let $phi in Z^(p + 1) (X without S)$ be an arbitrary form. It determines a
  homomorphism $phi^*: H_(p + 1) (X without S) -> CC^1$ given by
  $phi^* (h) = integral_h {phi} = integral_gamma phi$ for each
  $h = {gamma} in H_(p + 1) (X without S)$. Then the homomorphism
  $delta^* phi^*: H_p (S) -> CC^1$ is determined by
  $
    delta^* phi^* (h_1) = integral_(delta h_1) {phi}
    = integral_(delta gamma_1) phi,
  $
  where $h_1 = {gamma_1} in H_p (S)$. By the de Rham Theorem~@th:de-rham, there
  exists a cohomology class ${chi} = (2 pi i)^(-1) delta^* {phi} in H^p (S)$ for
  which#ed-note[The 1983 edition takes ${chi} = delta^* {phi}$. By the Leray
    residue formula of Theorem~@th:leray-residue-formula that class is $2 pi i$
    times the class of the residue, and the proof, with
    Theorem~@th:residue-class-formula, is off by the factor $2 pi i$. See Vidras
    and Yger @bib:Vidras2023[Proposition~2.14 and formula~(2.24)].]
  $
    delta^* phi^* (h_1) = integral_(h_1) delta^* {phi}
    = 2 pi i integral_(gamma_1) chi.
  $
  For the form $chi$ we construct a form $omega$ according to
  Lemma~@lem:form-with-residue. Since ${chi} = (2 pi i)^(-1) delta^* {phi}$,
  Lemma~@lem:omega-bar-star and the exactness of the sequence
  @eq:dual-leray-sequence give us that
  $
    -1 / (2 pi i) {d omega} = overline(omega)^* {chi}
    = (2 pi i)^(-1) overline(omega)^* delta^* {phi} = 0,
  $
  i.e., the form $d omega$ is cohomologous to zero in $X$. Consequently, there
  exists a form $omega_1 in Omega^(p + 1) (X)$ such that $d omega = d omega_1$.
  Then the form $phi_1 = omega - omega_1$ is closed in $X without S$ and has a
  first-order pole on $S$, and $res phi_1 = chi$. From the definition of the
  class ${chi}$ and Theorem~@th:leray-residue-formula it follows that
  $integral_(delta gamma_1) phi = integral_(delta gamma_1) phi_1$ for any cycle
  $gamma_1 in Z_p (S)$, or
  $
    integral_(delta {gamma_1}) (phi - phi_1)
    = integral_({gamma_1}) delta^* {phi - phi_1} = 0.
  $
  By Corollary~@cor:exact-form-criterion, this gives us that
  $delta^* {phi - phi_1} = 0$. Since the sequence @eq:dual-leray-sequence is
  exact, ${phi - phi_1} in i^* H^(p + 1) (X)$, i.e., there exists a form
  $phi_2 in Z^(p + 1) (X)$ such that $phi - phi_1 tilde.op phi_2$ in
  $X without S$. Hence, the form $phi$ is cohomologous in $X without S$ to the
  closed form $phi_3 = phi_1 + phi_2$, which has a first-order pole on $S$.
  Moreover, $res[phi_3] = chi$. Let $phi_4$ be another form that is cohomologous
  to $phi$ and has a first-order pole on $S$. Then
  $
    integral_(delta gamma_1) phi = integral_(delta gamma_1) phi_3
    = integral_(delta gamma_1) phi_4 = 2 pi i integral_(gamma_1) res[phi_3]
    = 2 pi i integral_(gamma_1) res[phi_4]
  $
  for any cycle $gamma_1 in Z_p (S)$. By Corollary~@cor:exact-form-criterion,
  this gives us that $res[phi_3] tilde.op res[phi_4]$.
]

The next result follows from Theorems~@th:leray-residue-formula
and~@th:residue-class and the definition of a residue class.

#source(123)
#theorem[
  Suppose that $phi in Z^(p + 1) (X without S)$ and $h in H_p (S)$. Then
  $
    integral_(delta h) {phi} = 2 pi i integral_h Res[phi].
  $ <eq:residue-class-formula>
] <th:residue-class-formula>

#point <pt:composite-residues> *Composite residues.* Let us now pass to the case
$m > 1$. The manifold $X$ and the submanifolds $S_1, ..., S_m$ of it give rise
to the following consecutive pairs of complex analytic manifolds and
submanifolds of them with codimension 1:
$
  S_1 inter dots.c inter S_(m - 1) supset S_1 inter dots.c inter S_m; \
  (S_1 inter dots.c inter S_(m - 2)) without S_m
  supset (S_1 inter dots.c inter S_(m - 1)) without S_m; \
  dots.c dots.c dots.c dots.c dots.c dots.c dots.c \
  S_1 without (S_3 union dots.c union S_m)
  supset (S_1 inter S_2) without (S_3 union dots.c union S_m); \
  X without (S_2 union dots.c union S_m)
  supset S_1 without (S_2 union dots.c union S_m).
$
Applying the results of @pt:leray-coboundary to these pairs and taking account
of the fact that
$
  [(S_1 inter dots.c inter S_(j - 1)) without
    (S_(j + 1) union dots.c union S_m)] \
  & without [(S_1 inter dots.c inter S_j) without
    (S_(j + 1) union dots.c union S_m)] \
  & = (S_1 inter dots.c inter S_(j - 1)) without (S_j union dots.c union S_m),
$
we get the sequence of Leray coboundary homomorphisms
$
  H_p (S_1 inter dots.c inter S_m)
  & stretch(->)^(delta_m)
  H_(p + 1) (S_1 inter dots.c inter S_(m - 1) without S_m) \
  & stretch(->)^(delta_(m - 1)) dots.c
  H_(p + m - j) ((S_1 inter dots.c inter S_j) without
    (S_(j + 1) union dots.c union S_m)) \
  & -> dots.c stretch(->)^(delta_2)
  H_(p + m - 1) (S_1 without (S_2 union dots.c union S_m)) \
  & stretch(->)^(delta_1)
  H_(p + m) (X without S_1 union dots.c union S_m),
$
whose composition determines the #index-mark(
  "Coboundary",
  sub: "Leray",
  subsub: "composite",
)_composite Leray coboundary_
$
  H_p (S_1 inter dots.c inter S_m) stretch(->)^(delta^m)
  H_(p + m) (X without S_1 union dots.c union S_m).
$
Since the coboundary operator $delta$ is defined also for simplexes and chains,
$delta^m$ extends also to simplexes and chains. The composite Leray coboundary
$delta^m$ assigns to each simplex a cell $delta^m sigma$ which is a bundle with
base $sigma$ and fiber $delta^m a = delta_m a times dots.c times delta_1 a$,
homeomorphic to the topological product of $m$ circles and is taken with the
natural orientation. If the submanifolds $S_1, ..., S_m$ are
#source(124)
taken in another order $S_(j_1), ..., S_(j_m)$, then the cell $delta^m sigma$
changes orientation by $-1$ raised to a power equal to the parity of the
permutation $(j_1, ..., j_m)$.

In exactly the same way we define the #index-mark(
  "Class",
  sub: "residue",
  subsub: "composite",
)_composite residue class_
$
  Res^m: H^(p + m) (X without S_1 union dots.c union S_m)
  -> H^p (S_1 inter dots.c inter S_m)
$
to be the composition of the homomorphisms
$
  H^(p + m) (X without S_1 union dots.c union S_m)
  & stretch(->)^(Res_1)
  H^(p + m - 1) (S_1 without S_2 union dots.c union S_m) \
  & stretch(->)^(Res_2) dots.c stretch(->)^(Res_(m - 1))
  H^(p + 1) (S_1 inter dots.c inter S_(m - 1) without S_m) \
  & stretch(->)^(Res_m) H^p (S_1 inter dots.c inter S_m).
$ <eq:composite-residue-class>
If the form $phi in Z^(p + m) (X without S_1 union dots.c union S_m)$ has
first-order poles on $S_1, ..., S_m$, then repeated application of
Theorem~@th:residue-form enables us to define the form
$
  res^m [phi] = res_m compose dots.c compose res_1 [phi] in Res^m [phi],
$
called the #index-mark(
  "Form",
  sub: "residue",
  subsub: "composite",
)_composite residue form_. The possibility of repeated application of
Theorem~@th:residue-form is ensured by

#lemma[
  If the form $phi$ is closed on $X without S_1 union dots.c union S_m$ and has
  first-order poles on $S_1, ..., S_m$, then the form $res_1 [phi]$ is closed on
  $S_1 without (S_2 union dots.c union S_m)$ and has first-order poles on
  $S_1 inter S_2, ..., S_1 inter S_m$.
] <lem:repeated-residues>

#proof[
  The fact that the form $res_1 [phi]$ is closed follows from
  Theorem~@th:residue-form. Suppose that
  $a in S_1 inter S_(i_1) inter dots.c inter S_(i_k)$,
  ${i_1, ..., i_k} subset {2, ..., m}$, and $a in.not S_j$ for
  $j != i_1, ..., i_k, 1$. We choose local coordinates $z_1, ..., z_n$ in some
  neighborhood $U_a$ of $a$ in such a way that $S_j inter U_a = {z_j = 0}$,
  $j = i_1, ..., i_k$. In a neighborhood of an arbitrary point
  $b in S_1 without (S_(i_1) union dots.c union S_(i_k))$ the form $phi$ can, by
  Theorem~@th:residue-form, be represented as
  $
    phi = (d z_1) / z_1 and psi + theta,
  $
  where $psi$ and $theta$ are regular forms in
  $U_b without (S_(i_1) union dots.c union S_(i_k))$. The forms $psi$ and
  $theta$ can be chosen to be independent of $d z_1$. Then any coefficient
  $c_1 (z)$ of $psi$ looks like $z_1 dot.c c(z)$, where $c(z)$ is a coefficient
  of $phi$. The corresponding coefficient of
  $res_1 [phi] = psi|_(S_1 without S_(i_1) union dots.c union S_(i_k))$ is the
  restriction of $c_1 (z) = z_1 dot.c c(z)$ to
  $S_1 without S_(i_1) union dots.c union S_(i_k)$ and does not depend on the
  point $b$. By assumption, the form $phi z_1 z_(i_1) dots.c z_(i_k)$ and,
  consequently, its coefficient
  $z_1 z_(i_1) dots.c z_(i_k) c(z) = z_(i_1) dots.c z_(i_k) c_1 (z)$ are regular
  in $U_a$. But then the restriction $z_(i_1) dots.c z_(i_k) c_1 (z)|_(S_1)$
  and, hence, the form $z_(i_1) dots.c z_(i_k) res_1 [phi]$ are regular at the
  point $a$.
]

#source(125)
We remark that if
$
  phi = (d s_1 and dots.c and d s_m and omega) / (s_1 dots.c s_m),
$
then $res^m [phi] = omega|_(S_1 inter dots.c inter S_m)$. Obviously,
$res_(i_1) compose dots.c compose res_(i_m)$ differs from
$res_1 compose dots.c compose res_m$ only by the factor $-1$ raised to a power
equal to the parity of the permutation $(i_1, ..., i_m)$.

Applying the residue formulas @eq:leray-residue-formula and
@eq:residue-class-formula $m$ times in succession, we get the #index-mark(
  "Formula",
  sub: "Leray composite residue",
  target: <th:leray-composite-residue-formula>,
)_Leray composite residue formula_.

#theorem[
  If the form $phi in Z^(p + m) (X without S_1 union dots.c union S_m)$ has
  first-order poles on $S_1, ..., S_m$, then the formula
  $
    integral_(delta^m {gamma}) phi = (2 pi i)^m integral_gamma res^m [phi]
  $ <eq:composite-residue-form-formula>
  holds for any cycle $gamma in Z_p (S_1 inter dots.c inter S_m)$. For an
  arbitrary form
  $
    phi in Z^(p + m) (X without S_1 union dots.c union S_m)
  $
  the following formula holds:
  $
    integral_(delta^m {gamma}) phi = (2 pi i)^m integral_gamma Res^m [phi].
  $ <eq:composite-residue-class-formula>
] <th:leray-composite-residue-formula>

#small-print[
  #point <pt:coboundary-criteria> The Leray residue formulas
  @eq:leray-residue-formula, @eq:residue-class-formula,
  @eq:composite-residue-form-formula, and @eq:composite-residue-class-formula
  enable us to lower the multiplicity of the integral @eq:residue-integral in
  the case when the cycle $gamma$ is a Leray coboundary. Therefore, the question
  naturally arises of conditions under which a cycle
  $gamma in Z_(p + m) (X without S_1 union dots.c union S_m)$ is a coboundary
  cycle, i.e., ${gamma} in delta^m H_p (S_1 inter dots.c inter S_m)$.

  In the case $m = 1$ a simple criterion for a Leray coboundary follows directly
  from the Leray exact sequence.

  #proposition[
    A cycle $gamma in Z_(p + 1) (X without S)$ belongs to a coboundary class
    ${gamma} in delta H_p (S)$ if and only if it is weakly homologous to zero in
    $X$.
  ] <prop:coboundary-criterion>

  #proof(title: none)[
    Indeed, our assertion is equivalent to the equality
    $
      delta H_p (S) = ker{i: H_(p + 1) (X without S) -> H_(p + 1) (X)},
    $
    which follows from the exactness of @eq:leray-exact-sequence.
  ]

  #corollary[
    If $H_(p + 1) (X) tilde.eq 0$, then any cycle
    $gamma in Z_(p + 1) (X without S)$ is a Leray coboundary. If, moreover,
    $H_(p + 2) (X) tilde.eq 0$, then $delta: H_p (S) -> H_(p + 1) (X without S)$
    is an isomorphism.
  ] <cor:coboundary-isomorphism>

  The last condition holds, for example, in any dimension $p$, when $X = CC^n$.
  If $X = C P^n$ (the complex projective space), then we have

  #proposition(title: [Griffiths])[
    If $S$ is a submanifold (algebraic) of $C P^n$, then the homomorphism
    $
      delta: H_(n - 1) (S) -> H_n (C P^n without S)
    $
    is surjective for any $n$ and injective for even $n$. For odd $n$ the kernel
    of $delta$ is generated by the section $C P^m inter S$, where $C P^m$ is a
    subspace of $C P^n$ of dimension $m = (n + 1) \/ 2$.
  ] <prop:griffiths>

  #source(126)
  In the case $m > 1$ we have

  #proposition[
    If a cycle $gamma in Z_(p + m) (X without S_1 union dots.c union S_m)$ is a
    composite Leray coboundary, i.e.,
    ${gamma} in delta^m H_p (S_1 inter dots.c inter S_m)$, then
    $
      gamma approx 0 quad "in" X without S_1 union dots.c [S_j] dots.c
      union S_m, quad j = 1, ..., m.
    $ <eq:composite-coboundary-condition>
  ] <prop:composite-coboundary-necessary>

  #proof[
    Let $gamma = delta^m gamma_0$, where
    $gamma_0 in Z_p (S_1 inter dots.c inter S_m)$. Then
    $gamma = delta_1 (delta^(m - 1) gamma_0)$, where
    $
      delta_1: H_(p + m - 1) (S_1 without (S_2 union dots.c union S_m))
      -> H_(p + m) (X without (S_1 union dots.c union S_m)).
    $
    By Proposition~@prop:coboundary-criterion, $gamma approx 0$ in
    $X without (S_2 union dots.c union S_m)$. Considering $S_1, ..., S_m$ in
    another order, we get @eq:composite-coboundary-condition for
    $j = 2, ..., m$.
  ]

  In the general case the conditions @eq:composite-coboundary-condition are not
  sufficient for the condition
  $
    {gamma} in delta^m H_p (S_1 inter dots.c inter S_m)
  $
  to hold.

  #eg[
    We take $X = {z in CC^n: |z| > 1}$ and $S_j = {z: z_j = 0}$,
    $j = 1, ..., n$. Then the cycle $gamma = {z: |z_1| = dots.c = |z_n| = 2}$
    satisfies the conditions @eq:composite-coboundary-condition, but
    ${gamma} in.not delta^n H_0 (S_1 inter dots.c inter S_n)$, since
    $S_1 inter dots.c inter S_n = emptyset$, while $gamma approx.not 0$ in
    $X without (S_1 union dots.c union S_n)$.
  ] <exm:coordinate-hyperplanes>

  However, we do have the following result, for example.

  #proposition(title: [Yuzhakov])[
    If $X$ is a Stein manifold of dimension $n$ and
    $
      gamma in Z_(p + m) (X without (S_1 union dots.c union S_m)),
      quad m + p >= n,
    $
    then @eq:composite-coboundary-condition is equivalent to the condition
    $
      {gamma} in delta^m H_p (S_1 inter dots.c inter S_m).
    $
  ] <prop:yuzhakov-coboundary>

  Under certain assumptions on $X$ and $S_1, ..., S_m$ the structure of the
  group
  $
    H_p (X without (S_1 union dots.c union S_m))
  $
  is described by the following _decomposition theorem_.

  #theorem(title: [#index-mark(
      "Theorem",
      sub: "on Froissart's decomposition",
      target: <th:froissart>,
    )Froissart])[
    Let $S_0, ..., S_m$ and $Sigma_1, ..., Sigma_k$ be two families of
    $(n - 1)$-dimensional complex analytic submanifolds in general position in
    the $n$-dimensional complex projective space $C P^n$, where $S_0$ is a
    complex hyperplane in $C P^n$ identified with the hyperplane
    $C P_infinity^(n - 1) = C P^n without CC^n$ at infinity. Let
    $X = Sigma_1 inter dots.c inter Sigma_k$ and $Y = CC^n inter X$. Then
    $
      H_p (X without union.big_(j = 0)^m S_j)
      & = H_p (Y without union.big_(j = 1)^m S_j) \
      & tilde.eq plus.o.big_(h subset {1, ..., m}) delta^(|h|)
      H_(p - |h|) (inter.big_(j in h) S_j inter Y) \
      & = H_p (Y) plus.o sum_(j = 1)^m delta H_(p - 1) (Y inter S_j)
      plus.o sum_(1 <= i < j <= m) delta^2 H_(p - 2) (Y inter S_i inter S_j)
      plus.o dots.c,
    $
    where $|h|$ is the number of elements in a set $h$.
  ] <th:froissart>

  #eg[
    Let $Y = CC^n$, and let
    $
      S_j = {z: phi_j (z) = sum_(k = 1)^n a_(j k) z_k + b_j = 0},
      quad j = 1, ..., m,
    $
    #source(127)
    be analytic hyperplanes in general position in $CC^n$. The last condition
    means that if $S_(j_1) inter dots.c inter S_(j_k) != emptyset$, then the
    functions $phi_(j_1), ..., phi_(j_k)$ are linearly independent. Since
    $H_n (CC^n) tilde.eq 0$
    $
      H_(n - r) (S_(i_1) inter dots.c inter S_(i_r)) tilde.eq 0
      quad "for" r < n
    $
    ($S_(i_1) inter dots.c inter S_(i_r)$ is a plane of real dimension
    $2(n - r)$), and $H_0 (S_(i_1) inter dots.c inter S_(i_n)) tilde.eq ZZ$ if
    $S_(i_1) inter dots.c inter S_(i_n) != emptyset$, it follows from
    Theorem~@th:froissart that the cycles of the form
    $
      delta^n (S_(i_1) inter dots.c inter S_(i_n))
      = {z in CC^n: |phi_(i_1) (z)| = dots.c = |phi_(i_n) (z)| = epsilon}
      = gamma_(i_1 dots.c i_n)
    $
    make up a basis of the group
    $H_n (CC^n without S_1 union dots.c union S_m)$, where $epsilon$ is
    sufficiently small, and ${i_1, ..., i_n}$ is an arbitrary subset of
    ${1, ..., m}$ such that the functions $phi_(i_1), ..., phi_(i_n)$ are
    linearly independent. The forms
    $
      omega_(i_1 dots.c i_n) = 1 / (2 pi i)^n (d phi_(i_1) (z))
      / (phi_(i_1) (z)) and dots.c and (d phi_(i_n) (z)) / (phi_(i_n) (z))
    $
    make up a cohomology basis dual to the above basis in the de Rham sense.
  ] <exm:linear-functions>

  It is of interest to generalize Theorem~@th:froissart to the case when
  $S_1, ..., S_m$ are arbitrary analytic sets in $Y$. One such generalization is
  given by the next theorem (see also @sec:two-variables) for the particular
  case when $Y$ is a domain in $CC^2$. Let $S = union.big_1^m S_j$ be an
  analytic set in $Y subset CC^2$, let the $S_j$ be irreducible components of
  $S$, let $tilde(S)_j$ be the Riemann surface determined by the component $S_j$
  (the Riemann surface of an implicit analytic function whose graph is $S_j$),
  and let $Q$ be the set of points at which $S$ is locally reducible. For each
  point $cal(P) in Q$ we choose a local system of coordinates in such a way that
  in this system the boundary $partial Delta_(cal(P))$ of a sufficiently small
  polycylinder $Delta_(cal(P))$ with center at $cal(P)$ intersects each local
  component of $S$ in a smooth curve that is homeomorphic to a circle. Let
  $A_(cal(P))$ denote the set $partial Delta_(cal(P)) inter S$ with one
  connected component removed, and let $A = union.big_(cal(P) in Q) A_(cal(P))$.

  #theorem(title: [Pedan])[
    If the homomorphisms
    $overline(omega): H_(p + 1) (Y without Q) -> H_(p - 1) (S without Q)$ are
    zero ($overline(omega) H_(p + 1) (Y without Q) = 0$), then
    $
      H_2 (Y without S) = H_2 (Y) plus.o sum_(j = 1)^m delta H_1 (tilde(S)_j)
      plus.o delta H_1 (A), \
      H_1 (Y without S) = H_1 (Y) plus.o sum_(j = 1)^m delta H_0 (S_j).
    $
    Here $overline(omega)$ and $delta$ are the homomorphisms defined in
    @pt:leray-coboundary.
  ] <th:pedan>
]
