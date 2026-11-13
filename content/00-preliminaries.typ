#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(numbering: none)[Preliminaries] <front:preliminaries>

#source(15)
#point <pt:integration-of-forms> *Integration of differential forms. Stokes'
formula.* We assume that the reader is acquainted with the concepts of a
differentiable manifold and a complex analytic manifold (see, for example,
@bib:Narasimhan1968, @bib:DeRham1955 or @bib:Hormander1966). A #index-mark(
  "Form",
  sub: "differential",
  subsub: "(exterior)",
)_differential form $omega$ of degree $p$_ (a _$p$-form_) _on a differentiable
manifold_#footnote[The exact definition of a differential form, along with a
  more detailed presentation of the material in this section, can be found in
  the books @bib:Cartan1967a, @bib:Narasimhan1968, @bib:Spivak1965,
  @bib:Sternberg1964 and @bib:Yuzhakov1975c.] $X$ can in a neighborhood of each
point $a in X$ be represented in local coordinates $x = (x_1, ..., x_n)$ in the
form
$
  omega(x) = sum_J a_J (x) d x_(i_1) and dots.c and d x_(i_p),
$ <eq:form-in-coordinates>
where $J = (i_1, ..., i_p)$, $1 <= i_j <= n$, the $a_J (x)$ are real or complex
functions of $x$, and $and$ is the symbol for exterior multiplication, which
satisfies the anticommutation condition
$
  d x_i and d x_j = -d x_j and d x_i, quad i != j, wide
  d x_i and d x_i = 0.
$ <eq:anticommutation>
The representation @eq:form-in-coordinates of a $p$-form $omega$ as given is
unique if $1 <= i_1 < i_2 < dots.c < i_p <= n$. In passing to other local
coordinates $y = (y_1, ..., y_n)$ the expression @eq:form-in-coordinates is
transformed to
$
  sum_(1 <= j_1 < dots.c < j_p <= n) [sum_J a_J (x(y))
    (partial (x_(i_1), ..., x_(i_p)))/(partial (y_(j_1), ..., y_(j_p)))]
  d y_(j_1) and dots.c and d y_(j_p).
$
Differential forms can be added and multiplied by functions. The operation of
#index-mark("Multiplication", sub: "exterior")_exterior multiplication_ is
defined for them; in local coordinates it is realized according to the rule for
multiplying polynomials, with the condition @eq:anticommutation taken into
account. This condition implies the following property of the exterior product:
$omega and phi = (-1)^(p q) phi and omega$, where $p$ and $q$ are the degrees of
$omega$ and $phi$. We say that $omega$ is a #index-mark(
  "Form",
  sub: "differential",
  subsub: "of class $C^((r))$",
)_differential form of class $C^((r))$_#notation-mark($C^((r))$) if its
coefficients $a_J (x)$ in the given local representation @eq:form-in-coordinates
are $r$ times continuously differentiable.
#source(16)
The form $omega$ is said to be #index-mark(
  "Form",
  sub: "differential",
  subsub: "regular",
)_regular_ if $r = infinity$. The _linear space of $p$-forms of class $C^((r))$
on the manifold $X$_ is denoted by $C_p^((r)) (X)$#notation-mark(
  $C_p^((r)) (X)$,
). Following Leray's book @bib:Leray1959, we often denote the _space
$C_p^((infinity)) (X)$#notation-mark($C_p^((infinity)) (X)$) of regular
$p$-forms_ also by $Omega^p (X)$#notation-mark($Omega^p (X)$, sort: "Omega").

The operator $d$ of #index-mark("Differentiation", sub: "exterior")_exterior
differentiation_ assigns to each form $omega in C_p^((r)) (X)$ the form
$d omega in C_(p + 1)^((r - 1)) (X)$ determined in local coordinates by the
formula
$
  d omega = sum_J d a_J (x) and d x_J,
$ <eq:exterior-differential>
where
$
  d a_J = sum_(i = 1)^n (partial a_J)/(partial x_i) d x_i, wide
  d x_J = d x_(i_1) and dots.c and d x_(i_p).
$
#new-par
The exterior differential has the following properties: 1)
$d(omega_1 + omega_2) = d omega_1 + d omega_2$; 2)
$d(omega and phi) = d omega and phi + (-1)^p omega and d phi$, where $p$ is the
degree of the form $omega$; 3) $d d omega = 0$. A differential form $omega$ is
said to be #index-mark("Form", sub: "differential", subsub: "closed")_closed_ if
$d omega = 0$, and #index-mark(
  "Form",
  sub: "differential",
  subsub: "exact",
)_exact_ if $omega = d phi$ for some form $phi$. The set of closed regular
$p$-forms is denoted by $Z^p (X)$#notation-mark($Z^p (X)$), and the set of exact
regular $p$-forms by $B^p (X)$#notation-mark($B^p (X)$). The properties 1)--3)
of the exterior differential imply the inclusions of groups (vector spaces)
$B^p (X) subset Z^p (X) subset Omega^p (X)$.

The factor group $H^p (X) = Z^p (X) \/ B^p (X)$#notation-mark($H^p (X)$) is
called the #index-mark("Group", sub: "de Rham cohomology")_$p$-dimensional de
Rham cohomology group of the manifold $X$_. Its elements are called #index-mark(
  "Class",
  sub: "cohomology",
)_cohomology classes_. Two forms $omega_1$ and $omega_2$ that belong to the same
cohomology class are said to be #index-mark(
  "Forms",
  sub: "cohomologous",
)_cohomologous_ ($omega_1 approx omega_2$).

An infinitely differentiable mapping of manifolds
$
  f: X -> Y
$ <eq:mapping>
induces group homomorphisms
$
  tilde(f): Omega^p (Y) -> Omega^p (X), wide f^*: H^p (Y) -> H^p (X)
$
defined as follows. Let $x = (x_1, ..., x_n)$ and $y = (y_1, ..., y_n)$ be local
coordinates in neighborhoods $U_a$ and $V_b$ of the points $a in X$ and
$b = f(a) in Y$, and suppose that the form $omega in Omega^p (Y)$ is represented
as $omega(y) = sum_J a_J (y) d y_(i_1) and dots.c and d y_(i_p)$. Then in $U_a$
$
  tilde(f) (omega) (x) = omega(f(x))
  = sum_J a_J (y(x)) d y_(i_1) (x) and dots.c and d y_(i_p) (x),
$
where $d y_i (x) = sum_(j = 1)^n (partial y_i \/ partial x_j) d x_j$. Since
$d compose tilde(f) = tilde(f) compose d$, $tilde(f)$ induces a factor
homomorphism $f^*$.

If $Z$ is a complex analytic manifold with local coordinates
$z_j = x_j + i y_j$, $j = 1, ..., n$, then instead of $d x_j$ and $d y_j$ we
take the linear combinations $d z_j = d x_j + i d y_j$ and
$d overline(z)_j = d x_j - i d y_j$ of them as basis differentials. A form
$omega in C_(p + q)^((infinity)) (Z)$ is said to be a #index-mark(
  "Form",
  sub: "differential",
  subsub: "of type $(p, q)$",
)_form of type $(p, q)$_ if in an arbitrary local system
#source(17)
of coordinates $z = (z_1, ..., z_n)$ it looks like
$omega = sum_(J, frak(J)) a_(J, frak(J)) (z) d z_J and d overline(z)_frak(J)$,
where $d z_J = d z_(i_1) and dots.c and d z_(i_p)$ and $d overline(z)_frak(J)
= d overline(z)_(j_1) and dots.c and d overline(z)_(j_q)$. The class of these
forms is denoted by $C_(p, q)^((infinity)) (Z)$. The class $C_(p, q)^((r)) (Z)$
is introduced similarly. If $r = 0$, then we write simply $C_(p, q) (Z)$. A form
is said to be #index-mark(
  "Form",
  sub: "differential",
  subsub: "holomorphic",
)_holomorphic_ if it is of type $(p, 0)$ and its coefficients are holomorphic
functions.

We shall consider integrals of differential forms over piecewise smooth oriented
surfaces on a manifold $X$. In order that the apparatus of algebraic topology
can be applied, the surface is assumed to be broken up into parts: #index-mark(
  "Simplex",
  sub: "singular",
)singular simplexes. A #index-mark(
  "Simplex",
  sub: "singular",
  subsub: "smooth",
)_$p$-dimensional smooth singular simplex_ (a _$p$-simplex_) _on a differential
manifold $X$_ is defined to be a pair $sigma_p = (Delta_p, g)$, where $Delta_p$
is a rectilinear simplex in $RR^p$ (for example,
$Delta_p = {t = (t_1, ..., t_p) in RR^p: t_j >= 0, t_1 + dots.c + t_p <= 1}$),
and $g: Delta_p -> X$ is a continuously differentiable mapping. Moreover, the
simplex is assigned some #index-mark(
  "Orientation",
  sub: "of a simplex",
)_orientation_, determined by the order of the coordinates $t_1, ..., t_p$. If
other coordinates $tau_1, ..., tau_p$ are chosen in a neighborhood of $Delta_p$,
then they determine the same orientation if $partial t \/ partial tau
= partial (t_1, ..., t_p) \/ partial (tau_1, ..., tau_p) > 0$, and the opposite
orientation if $partial t \/ partial tau < 0$.

The simplex $sigma_p$ taken with the opposite orientation is denoted by
$-sigma_p$. A finite linear combination
$
  c_p = sum_i m_i sigma_p^((i))
$ <eq:chain>
of oriented smooth singular $p$-simplexes, where the $m_i$ are
integers#footnote[It is sometimes convenient to consider chains with real or
  complex coefficients (see @sec:de-rham).], is called a #index-mark(
  "Chain (singular)",
)_smooth singular $p$-chain_. The set of $p$-chains on a manifold $X$ forms an
abelian group $C_p (X)$#notation-mark($C_p (X)$). The #index-mark(
  "Support",
  sub: "of a simplex",
)_carrier of the simplex_ $sigma_p = (Delta_p, g)$ is defined to be the set
$|sigma_p| = g(Delta_p)$, and the #index-mark(
  "Support",
  sub: "of a chain",
)_carrier of the chain_ @eq:chain is the set
$
  |c_p| = union.big_(m_i != 0) |sigma_p^((i))|.
$
The $(p - 1)$-simplex
$sigma_(p - 1)^((i)) = (Delta_(p - 1)^((i)), g|_(Delta_(p - 1)^((i))))$, where
$Delta_(p - 1)^((i))$ is a $(p - 1)$-dimensional face of the rectilinear simplex
$Delta_p$, is called a #index-mark("Face of a simplex")_face of the singular
$p$-simplex $sigma_p$_. We choose a system of coordinates $t_1, ..., t_p$ in
$RR^p supset Delta_p$ determining the orientation of $sigma_p$ in such a way
that the face $Delta_(p - 1)^((i))$ lies in the plane $t_1 = 0$, and $t_1 <= 0$
at the points $t in Delta_p$. Then the parameters $t_2, ..., t_p$ determine the
#index-mark("Orientation", sub: "coherent, of a face")_orientation of the face
$sigma_(p - 1)^((i))$ coherent with that of $sigma_p$_. The #index-mark(
  "Boundary",
  sub: "of an oriented simplex",
)_boundary of an oriented simplex $sigma_p$_ is defined to be the
$(p - 1)$-chain formed by summing its coherently oriented faces:
$partial sigma_p = sum_(i = 0)^p sigma_(p - 1)^((i))$. The #index-mark(
  "Boundary",
  sub: "of a chain",
)_boundary of the chain_ @eq:chain is defined by the formula
$partial c_p = sum_i m_i partial sigma_p^((i))$. The following property holds:
$
  partial partial c_p = 0.
$ <eq:boundary-of-boundary>
#source(18)
A chain $gamma in C_p (X)$ is called a #index-mark("Cycle")_cycle_ if
$partial gamma = 0$. The property @eq:boundary-of-boundary means that the
boundary of a chain is a cycle. A cycle $gamma$ is said to be #index-mark(
  "Cycle",
  sub: "homologous to zero",
)_homologous to zero_ ($gamma tilde.op#notation-mark($tilde.op$, sort: "~1") 0$)
if there exists a chain $c$ such that $partial c = gamma$. Let
$Z_p (X) = {gamma in C_p (X): partial gamma = 0}$#notation-mark($Z_p (X)$) and
$B_p (X) = {partial c: c in C_(p + 1) (X)}$. The factor group
$H_p (X) = Z_p (X) \/ B_p (X)$#notation-mark($H_p (X)$) is called the
#index-mark("Group", sub: "homology")_$p$-dimensional smooth singular homology
group of the manifold $X$_. For differentiable manifolds the smooth singular
homology groups are isomorphic to homology groups defined in other ways (see
@bib:Lefschetz1942, Appendix~A). The definition of smooth singular homology
given here is also suitable for a piecewise smooth manifold. A cycle $gamma$ is
said to be #index-mark(
  "Cycle",
  sub: "weakly homologous to zero",
)_weakly homologous to zero_
($gamma approx#notation-mark($approx$, sort: "~2") 0$) if $k gamma tilde.op 0$
for some integer $k$. The factor group of $Z_p (X)$ by the subgroup of cycles
weakly homologous to zero is called a #index-mark(
  "Group",
  sub: "weak homology",
)_weak homology group_. It coincides with $H_p (X)$ in the cases of interest to
us. We denote it too by $H_p (X)$. If $H_p (X)$ is a group with finitely many
generators, then its dimension is called the #index-mark(
  "Number",
  sub: "Betti",
)_$p$-dimensional Betti number of the manifold $X$_. A system
${gamma_j} subset Z_p (X)$ of cycles is called a #index-mark(
  "Basis",
  sub: "homology",
)_$p$-dimensional homology basis_ if any cycle $gamma in Z_p (X)$ can be
uniquely represented in the form $gamma approx sum_j m_j gamma_j$, where the
$m_j$ are integers. A mapping @eq:mapping of manifolds assigns to each simplex
$sigma_p = (Delta_p, g)$ in $X$ a simplex
$utilde(f) (sigma_p) = (Delta_p, f compose g)$ in $Y$. This determines a
homomorphism $utilde(f): C_p (X) -> C_p (Y)$ and, since
$utilde(f) compose partial = partial compose utilde(f)$, also a homomorphism
$f_*: H_p (X) -> H_p (Y)$.

The #index-mark("Integral", sub: "of a form over a simplex")_integral of a
$p$-form $omega$ of class $C^((0))$ over a smooth $p$-simplex
$sigma_p = (Delta_p, g)$_ is defined by the equality
$
  integral_(sigma_p) omega = integral_(Delta_p) tilde(g) (omega)
  = integral_(|Delta_p|) A(t) d t_1 dots.c d t_p,
$ <eq:integral-over-simplex>
where $A(t) d t_1 and dots.c and d t_p = tilde(g) (omega)$ is a form on
$Delta_p subset RR^p$. If the form is represented as in @eq:form-in-coordinates,
then
$
  A(t) = sum_J a_J (x(t))
  (partial (x_(i_1), ..., x_(i_p)))/(partial (t_1, ..., t_p)).
$
The last integral in @eq:integral-over-simplex is understood as an ordinary
$p$-fold integral in $RR^p$. Obviously, the definition @eq:integral-over-simplex
is invariant with respect to the choice of local coordinates on the manifold and
the parametrization of the simplex $sigma_p$. The #index-mark(
  "Integral",
  sub: "of a form over a chain",
)_integral of a form $omega$ over the chain_ @eq:chain is defined by the
equality
$
  integral_(c_p) omega = sum_i m_i integral_(sigma_p^((i))) omega.
$ <eq:integral-over-chain>
We remark that every piecewise smooth oriented compact surface on $X$ can be
broken up into smooth simplexes, i.e., can be represented as a chain
$c_p in C_p (X)$.

#source(19)
From the definition of the homomorphism $tilde(f)$ and $utilde(f)$ and formulas
@eq:integral-over-simplex and @eq:integral-over-chain we get

#theorem(title: [#index-mark(
    "Formula",
    sub: "change of variables",
    target: <th:change-of-variables>,
  )Change-of-variables formula])[
  If $f: X -> Y$ is a mapping of manifolds and $gamma in C_p (X)$, then for
  every form $omega$ of class $C^((0))$ on $Y$
  $
    integral_gamma tilde(f) (omega)
    = integral_(utilde(f) (gamma)) omega.
  $
] <th:change-of-variables>

Thus, the homomorphisms $tilde(f)$ and $utilde(f)$ are dual with respect to
integration. The duality of the homomorphisms $d$ and $partial$ is established
by

#theorem(title: [#index-mark(
    "Formula",
    sub: "Stokes'",
    target: <th:stokes>,
  )Stokes' formula])[
  If $omega$ is a $p$-form of class $C^((1))$ on the manifold $X$ and
  $c in C_(p + 1) (X)$, then
  $
    integral_(partial c) omega = integral_c d omega.
  $
] <th:stokes>

#corollary[
  The integral of an exact form over a cycle is equal to zero.
] <cor:exact-form-over-cycle>

#corollary[
  The integral of a closed form over a cycle that is weakly homologous to zero
  is equal to zero.
] <cor:closed-form-over-null-cycle>

#corollary[
  If $gamma_1 approx gamma_2$ and $omega_1 = omega_2 + d phi$, where $omega_2$
  is a closed form, then
  $integral_(gamma_1) omega_1 = integral_(gamma_2) omega_2$.
] <cor:cohomologous-forms-over-cycles>

Corollary~@cor:cohomologous-forms-over-cycles enables us to define the
#index-mark(
  "Integral",
  sub: "of a cohomology class over a homology class",
)integral of a cohomology class $h^* = {omega} in H^p (X)$ over a homology class
$h_* = {gamma} in H_p (X)$ by the equality
$
  integral_(h_*) h^* = integral_gamma omega.
$
#new-par
In what follows we shall often have to consider bounded domains $D$ in the
complex space $CC^n$ of variables $z = (z_1, ..., z_n)$, where
$z_k = x_k + i y_k$, $k = 1, ..., n$. We assume that $CC^n$ is #index-mark(
  "Orientation",
  sub: "of the space $upright(bold(C))^n$",
)oriented in such a way that
$
  & integral_D d x_1 and dots.c and d x_n and d y_1 and dots.c and d y_n \
  & quad = (- i/2)^n integral_D d overline(z)_1 and dots.c and d overline(z)_n
    and d z_1 and dots.c and d z_n > 0.
$
The boundary $partial D$ of $D$ is assigned the orientation induced by that of
$D$. If $D = {z: rho(z) < 0}$, where $rho$ is a real-valued function of class
$C^((r))$ in a neighborhood of $partial D$ such that
$grad rho = (rho'_(z_1), ..., rho'_(z_n)) != 0$ on $partial D$, then we write
$partial D in C^((r))$. According to Stokes' formula,
$
  (-i)^n integral_(partial D) sum_(k = 1)^n (-1)^(k - 1) overline(zeta)_k
  d overline(zeta)_1 and dots.c and d overline(zeta)_(k - 1)
  and d overline(zeta)_(k + 1) \
  and dots.c and d overline(zeta)_n and d zeta_1 and dots.c and d zeta_n
  > 0.
$
#source(20)
We remark that the orientation of $CC^n$ adopted in @bib:Vladimirov1964 and
@bib:Pham1967 is such that
$
  & integral_D d x_1 and d y_1 and dots.c and d x_n and d y_n \
  & quad = (- i/2)^n integral_D d overline(z)_1 and d z_1 and dots.c
    and d overline(z)_n and d z_n > 0.
$
It is easy to see that the integrals computed with this orientation differ from
those computed with our orientation by the factor $(-1)^(n(n - 1) \/ 2)$. A
particular case of Corollary~@cor:closed-form-over-null-cycle is

#theorem(title: [#index-mark(
    "Theorem",
    sub: "Cauchy-Poincaré",
    target: <th:cauchy-poincare>,
  )Cauchy-Poincaré])[
  Suppose that the function $f(z)$ is holomorphic in a domain $D subset CC^n$.
  Then for any $(n + 1)$-chain $sigma$ in $D$
  $
    integral_(partial sigma) f(z) d z
    = integral_(partial sigma) f(z_1, ..., z_n) d z_1 and dots.c and d z_n
    = 0.
  $
] <th:cauchy-poincare>

From Stokes' formula and a property of the exterior differential we get the
following #index-mark(
  "Formula",
  sub: "integration by parts",
)_formulas for integration by parts_.

#proposition[
  Suppose that $phi in Omega^p (X)$, $psi in Omega^q (X)$, and
  $gamma in C_(p + q + 1) (X)$. Then
  $
    integral_gamma d phi and psi
    = integral_(partial gamma) phi and psi
    - (-1)^p integral_gamma phi and d psi.
  $
  If $gamma in Z_(p + q + 1) (X)$, then
  $integral_gamma d phi and psi = (-1)^(p - 1) integral_gamma phi and d psi$.
] <prop:integration-by-parts>

#proposition[
  Suppose that the functions $f(z)$ and $phi(z)$ are holomorphic in a domain
  $D subset CC^n$ and $gamma in Z_n (D)$. Then
  $
    integral_gamma (partial f)/(partial z_j) phi d z
    = -integral_gamma f (partial phi)/(partial z_j) d z, wide
    integral_gamma (partial^(|alpha|) f)/(partial z^alpha) phi d z
    = (-1)^(|alpha|) integral_gamma f
    (partial^(|alpha|) phi)/(partial z^alpha) d z,
  $
  where $alpha = (alpha_1, ..., alpha_n)$,
  $|alpha| = alpha_1 + dots.c + alpha_n$, and
  $partial^(|alpha|) f \/ partial z^alpha
  = partial^(alpha_1 + dots.c + alpha_n) f
  \/ partial z_1^(alpha_1)$#sym.zws$dots.c partial z_n^(alpha_n)$.
] <prop:integration-by-parts-holomorphic>

Let $D$ be a bounded domain in $CC^n$ with piecewise smooth boundary
$partial D$, and let the domains $D_1$ and $D'_1$ be such that
$D'_1 relcomp D_1 relcomp D$ (see @pt:main-notation for the notation). On
$overline(D) without overline(D')_1$ we are given an exterior differential form
$alpha$ of dimension $2n - 1$ that is continuous in
$overline(D) without overline(D')_1$ and closed in $D without overline(D')_1$.
The domain $D$ can be approximated from the inside by polyhedrons $D_m$
($m = 2, 3, ...$), $D_1 subset D_m$, such that
$
  lim_(m -> infinity) integral_(partial D_m) beta
  = integral_(partial D) beta,
$
#source(21)
for every form $beta$ of degree $2n - 1$ that is continuous in
$overline(D) without overline(D')_1$. On the other hand,
$integral_(partial D_m) alpha = integral_(partial D_1) alpha$ by
Corollary~@cor:cohomologous-forms-over-cycles, and so we have

#corollary[
  Under the above assumptions,
  $integral_(partial D_1) alpha = integral_(partial D) alpha$.
] <cor:boundary-replacement>

This corollary is frequently used below for proving the validity of various
integral representations.

We shall sometimes encounter #index-mark("Forms", sub: "double")double forms
$omega(zeta, z)$, i.e., forms in $z$ whose coefficients are (ordinary) forms in
$zeta$, or forms in $zeta$ whose coefficients are forms in $z$. In this
connection it is assumed that the differentials of the variables $z$ commute
with those of the variables $zeta$. See @bib:DeRham1955 for more details on
double forms.

#point <pt:analysis-and-algebra> *Some propositions from analysis and algebra.*
Let $C^((m, lambda))$ be the class of $m$ times continuously differentiable
functions whose derivatives of order $m$ all satisfy a Hölder condition with
exponent $lambda$. The condition $partial D in C^((m, lambda))$ is defined
analogously, where $partial D$ is the boundary of a bounded domain in $CC^n$.

#proposition[
  Suppose that $partial D in C^((m + 1, lambda))$ and that
  $f in C^((m, lambda)) partial D$, $m >= 0$ and $0 < lambda <= 1$. Then the
  functions defined by the integral
  $
    integral_(partial D_zeta) (f(zeta) d overline(zeta)_1 and dots.c
    and d overline(zeta)_(k - 1) and d overline(zeta)_(k + 1) and dots.c
    and d overline(zeta)_n and d zeta_1 and dots.c and d zeta_n)
    / ((|zeta_1 - z_1|^2 + dots.c + |zeta_n - z_n|^2)^(n - 1))
  $
  inside and outside the domain can be extended to the closures of the
  corresponding open sets as functions of class $C^((m + 1, lambda'))$, and the
  functions defined by the integral
  $
    integral_(D_zeta) (f(zeta) d overline(zeta)_1 and dots.c
    and d overline(zeta)_n and d zeta_1 and dots.c and d zeta_n)
    / ((|zeta_1 - z_1|^2 + dots.c + |zeta_n - z_n|^2)^(n - 1))
  $
  can be extended as functions of class $C^((m + 2, lambda'))$, where
  $0 < lambda' < lambda$ (see, for example, @bib:Gunther1934, Chapter~II, §19,
  Theorem~4, §20, Theorem~2).
] <prop:potentials-holder>

Let $X$ and $Y$ be differentiable manifolds and $f: X -> Y$ a mapping of class
$C^((1))$. A point $p in X$ is called a #index-mark(
  "Point",
  sub: "critical, of a mapping",
)_critical point of $f$_ if $min(dim X, dim Y) > rank(d f)_p$, where $(d f)_p$
is the differential of $f$ at $p$. The range of $f$ on the critical points is
called the #index-mark("Wrinkle of a mapping")_wrinkle_ and denoted by
$op("wr") (f)$.

#theorem(title: [#index-mark(
    "Theorem",
    sub: "Sard's",
    target: <th:sard>,
  )Sard])[
  If $dim X = dim Y$, then the Lebesgue measure of $op("wr") (f)$ in $Y$ is
  zero. The Lebesgue measure of $op("wr") (f)$ in $Y$ is also zero if
  $X, Y in C^infinity$ and $f in C^((infinity))$.
] <th:sard>

Only the operations of addition and multiplication appear in a numerical
determinant; therefore, we can introduce a determinant whose elements are
members of an arbitrary ring. Such a determinant can be expanded according
#source(22)
to the usual rules, with the place of each factor in the terms of the sum fixed
by the number of the column to which this factor belongs. It is convenient to
introduce the following notation in connection with the way in which a
determinant is expanded: if $theta^1, ..., theta^m$ are $n$-dimensional vectors,
then $D_(nu_1, ..., nu_m) (theta^1, ..., theta^m)$#notation-mark(
  $D_(nu_1, ..., nu_m) (theta^1, ..., theta^m)$,
) is the $n$th-order determinant with the vector $theta^1$ in the first $nu_1$
columns, the vector $theta^2$ in the next $nu_2$ columns, …, and the vector
$theta^m$ in the last $nu_m$ columns, where $nu_1 + dots.c + nu_m = n$.

We give some properties of determinants needed for what follows.

#property[
  If two rows are interchanged, then the determinant changes sign. If all the
  elements in some column commute with all the elements in a neighboring column,
  then the determinant changes sign when these columns are interchanged, but if
  the corresponding elements anticommute, then the determinant does not change.
] <st:determinant-interchange>

Suppose now that the determinant is composed of elements of a ring of double
exterior differential forms. Its rows are said to be _linearly dependent_ if
some linear combination of them with function coefficients vanishes, and for
each point of the domain in which the determinant is defined at least one
coefficient does not vanish.

#property[
  If all the elements of some column (row) are multiplied by one and the same
  function, then the determinant is multiplied by this function. If the rows of
  the determinant are linearly dependent, then it is equal to 0.
] <st:determinant-factor>

If the forms $alpha_i$ ($i = 1, ..., m$) are of class $C^((1))$ and degree $q_i$
in $z$, then
$
  & dbar_z (alpha_1 and dots.c and alpha_m) \
  & quad = sum_(i = 1)^m (-1)^(q_1 + dots.c + q_(i - 1)) alpha_1 and dots.c
    and alpha_(i - 1) and dbar_z alpha_i and alpha_(i + 1) and dots.c
    and alpha_m.
$
A consequence of this is (here and below,
$dbar_z theta = (dbar_z theta_1, ..., dbar_z theta_n)$)

#property[
  If the elements of the columns $theta^i$ ($i = 1, ..., n$) of a determinant
  are double forms of class $C^((1))$ and degree $q_i$ in $z$, then
  $
    & dbar_z D_(1, ..., 1) (theta^1, ..., theta^n) \
    & quad = sum_(i = 1)^n (-1)^(q_1 + dots.c + q_(i - 1))
      D_(1, ..., 1) (theta^1, ..., theta^(i - 1), dbar_z theta^i,
        theta^(i + 1), ..., theta^n).
  $
] <st:determinant-dbar>

In what follows we shall use elementary concepts from measure theory without
explaining, for example, the words "finite Borel measure" or "sup with respect
to a given measure $mu$" (denoted by $op("ess sup")_mu$). We also use the
concept of a partition of unity subordinate to a given cover
@bib:Narasimhan1968.

#source(23)
#point <pt:function-theory> *Some facts from function theory.* It is assumed
that the reader is familiar with the elementary properties of holomorphic
functions of several complex variables. They can be found in the first chapters
of the textbooks @bib:Vladimirov1964, @bib:Gunning1965, @bib:Ronkin1977,
@bib:Fuks1962, @bib:Hormander1966, @bib:Shabat1976b and @bib:Aizenberg1975b. For
example, it is assumed known that a function holomorphic in a domain can be
expanded in a multiple power series in a neighborhood of each point of the
domain, and that a holomorphic mapping with nonzero Jacobian is locally
invertible. It is assumed also that the reader is acquainted with such concepts
as the envelope of holomorphy $cal(H) (D)$#notation-mark($cal(H) (D)$) of a
domain $D$, a complex line, a complex hyperplane, a circular domain, and an
$n$-circular domain.

Recall that if $f(z_1, ..., z_n)$ is a holomorphic mapping of a domain
$D subset CC^n$ into a space of the same complex dimension,
$f = (f_1, ..., f_n)$, $f_k = u_k + i v_k$, $z_k = x_k + i y_k$,
$k = 1, ..., n$, then
$
  abs((partial (f_1, ..., f_n))/(partial (z_1, ..., z_n)))^2
  = (partial (u_1, ..., u_n, v_1, ..., v_n))
  /(partial (x_1, ..., x_n, y_1, ..., y_n)).
$
If the boundary $partial D$ is piecewise smooth, the form
$alpha in C_(n, n - 1) (partial D)$ is $dbar$-exact, i.e., $alpha = dbar beta$
on $partial D$ for some $beta in C_(n, n - 2)^((1)) (partial D)$, and $f$ is
holomorphic on $overline(D)$, then by Stokes' formula (see
Corollary~@cor:exact-form-over-cycle)
$
  integral_(partial D) f alpha = integral_(partial D) f dbar beta
  = integral_(partial D) dbar (f beta) = integral_(partial D) d(f beta) = 0.
$
#new-par
Suppose that $f$ is holomorphic in a neighborhood of a point $a$. The
#index-mark("Order of a zero", sub: "of a function at a point")_order
$d_a (f)$#notation-mark($d_a (f)$) of a zero of $f$ at $a$_ is defined to be the
smallest degree (in the variables jointly) of the terms with nonzero
coefficients in the Taylor series of this function at the given point.

#point <pt:algebraic-topology> *Some concepts and facts from algebraic
topology*#footnote[See, for example @bib:Aleksandrov1947, @bib:Lefschetz1942,
  @bib:Spanier1966, @bib:Teleman1964 or @bib:Fuks1969.] will be needed in
§@sec:alexander-pontryagin, @sec:leray-residues[16], and @sec:two-variables[18]
of Chapter~@ch:residues. The _singular homology groups_ are defined in topology
for arbitrary topological spaces in exactly the same way as the smooth singular
homology groups were defined in @pt:integration-of-forms, with only the
difference that in the definition of a singular simplex $sigma_p = (Delta_p, g)$
the mapping $g$ is assumed to be continuous, and the orientation of $sigma_p$ is
given by the order of the vertices of the simplex $Delta_p$.

A topological space $X$ is said to be a #index-mark("Polyhedron")_polyhedron_ if
it admits a #index-mark("Triangulation")_triangulation_, i.e., it can be broken
up into nondegenerate simplexes#footnote[A simplex $sigma_p = (Delta_p, g)$ is
  nondegenerate if $g: Delta_p -> X$ is a homeomorphism.] $sigma_p^((i))$
($i = 1, 2, ..., p = 0, 1, ...$) with disjoint interiors. The family
$K(X) = {sigma_p^((i))}$ is called a #index-mark(
  "Complex",
  sub: "simplicial",
)_simplicial
#source(24)
complex of the polyhedron $X$_. For a polyhedron we introduce the concept of a
#index-mark("Group", sub: "homology")_homology group of a simplicial complex_,
defined in the usual way, but only on the simplexes appearing in $K(X)$. The
homology groups of a simplicial complex of a polyhedron are isomorphic to the
singular homology groups of the polyhedron and, consequently, are invariant with
respect to triangulation. A differentiable manifold admits a smooth
triangulation, so all three definitions given above for the homology groups are
equivalent for it. Instead of a simplicial complex it is sometimes more
convenient to consider a #index-mark("Complex", sub: "cell")_cell complex_: a
partition of the polyhedron into cells $sigma_p = (M_p, g)$, where $M_p$ is a
polytope in $RR^p$, and $g: M_p -> X$ is a continuous mapping that is a
homeomorphism interior to $M_p$.

For a simplicial complex and a cell complex of a compact polyhedron $X$ we have
the #index-mark("Formula", sub: "Euler-Poincaré")_Euler-Poincaré formula_
$
  sum_(q = 0)^n (-1)^q alpha_q = sum_(q = 0)^n (-1)^q beta_q,
$ <eq:euler-poincare>
where $alpha_q$ is the number of $q$-dimensional simplexes (cells of the complex
$K(X)$), $beta_q$ is the $q$-dimensional Betti number of $X$, and
$n = max{q: alpha_q != 0}$ is the dimension of $X$.

From the definition of homology groups it is easy to get the following
propositions.

#proposition[
  If $X$ is an arcwise connected space, then $H_0 (X) tilde.eq ZZ$, where $ZZ$
  is the group of integers.
] <prop:zero-dimensional-homology>

#proposition[
  If $X = union.big_(alpha in A) X_alpha$, where the $X_alpha$ ($alpha in A$)
  are the arcwise connected components of $X$, then
  $H_p (X) = plus.o.big_(alpha in A) H_p (X_alpha)$.
] <prop:homology-of-components>

#proposition[
  The homology groups for the $n$-dimensional sphere
  $S^n = {x in RR^(n + 1): |x| = 1}$ are
  $
    H_p (S^n) = cases(ZZ quad & "if" p = 0\, n\,, 0 & "if" p != 0\, n.)
  $
] <prop:homology-of-sphere>

It can be shown that a 2-dimensional orientable manifold $S$ is homeomorphic to
some $4 rho$-gon
$sigma_2 = a_1 b_1 a_1^(-1) b_1^(-1) dots.c a_rho b_rho a_rho^(-1)
b_rho^(-1)$ in which the first and third and the second and fourth sides in each
quadruple are identified pairwise, with the opposite orientation with respect to
a circuit along the boundary of $sigma_2$ (a sphere with $rho$ "handles"). The
integer $rho$ is called the #index-mark("Genus of a manifold")_genus of the
manifold_ (surface).

#source(25)
#proposition[
  The homology groups of a 2-dimensional orientable manifold $S$ of genus $rho$
  are
  $
    H_0 (S) tilde.eq H_2 (S) tilde.eq ZZ, wide
    H_1 (S) tilde.eq underbrace(ZZ plus.o dots.c plus.o ZZ, 2 rho);
  $
  the 1-dimensional cells $a_1, b_1, ..., a_rho, b_rho$ form a basis for the
  1-dimensional homology of $S$, and are called "#index-mark(
    "Cuts",
    sub: "canonical",
  )canonical cuts" of $S$.
] <prop:homology-of-surface>

Continuous mappings $f, g: X -> Y$ are said to be #index-mark(
  "Homotopic mappings",
)_homotopic_, $f approx g$, if there exists a continuous mapping
$F(x, t): X times [0, 1] -> Y$, such that $F(x, 0) = f(x)$ and $F(x, 1) = g(x)$.

A subset $A$ of $X$ is called a #index-mark("Retract")_retract_ of $X$ if there
exists a continuous mapping $f: X -> A$ such that $f|_A = 1_A$ (the identity
mapping). The set $A$ is called a #index-mark(
  "Retract",
  sub: "deformation",
)_deformation retract_ of $X$ if $i compose f approx 1_X: X -> X$, where $i$ is
the imbedding $A subset X$.

#theorem[
  If $f approx g: X -> Y$, then $f_* = g_*: H_p (X) -> H_p (Y)$.
] <th:homotopy-invariance>

#corollary[
  If $A$ is a deformation retract of $X$, then $H_p (A) tilde.eq H_p (X)$.
] <cor:deformation-retract>

Let $A$ be a subspace of $X$. The factor group $C_p (X, A) = C_p (X) \/ C_p (A)$
is called the #index-mark("Group", sub: "of relative chains")_group of relative
chains of the pair $(X, A)$_. The boundary homomorphism
$partial: C_p (X) -> C_(p - 1) (X)$ induces a homomorphism
$partial: C_p (X, A) -> C_(p - 1) (X, A)$ in the natural way. Consequently, the
#index-mark("Group", sub: "homology")_relative homology group_ $H_p (X, A)$ is
defined. We define a homomorphism $partial_*: H_p (X, A) -> H_(p - 1) (A)$ that
assigns to each class ${c_p} in H_p (X, A)$ the class
${partial c_p} in H_(p - 1) (A)$. Observe that $c_p in C_p (X)$ determines a
relative cycle if $partial c_p in A$.

A sequence of group homomorphisms
$
  dots.c -> A_(k - 1) stretch(->)^(f_(k - 1)) A_k stretch(->)^(f_k) A_(k + 1)
  -> dots.c
$
is said to be #index-mark("Sequence", sub: "exact, of homomorphisms")_exact_ if
the kernel of each homomorphism coincides with the image of the preceding
homomorphism ($Ker f_k = Im f_(k - 1)$).

#theorem[
  The sequence of homomorphisms
  $
    dots.c stretch(->)^(partial_*) H_p (A) stretch(->)^(i_*) H_p (X)
    stretch(->)^(j_*) H_p (X, A) stretch(->)^(partial_*) H_(p - 1) (A)
    stretch(->)^(i_*) dots.c,
  $
  where $i_*$ and $j_*$ are the homomorphisms induced by the imbedding
  $i: A -> X$ and the factor mapping $j: C_p (X) -> C_p (X, A)$, is exact.
] <th:exact-homology-sequence>

Let $A$ be an abelian group. We denote the group of homomorphisms from $A$ to
$CC^1$ (the group of complex-valued linear functions on $A$) by
$A^* = {lambda: A -> CC^1}$. A homomorphism $lambda: A -> B$ of abelian groups
induces a dual homomorphism $lambda^*: B^* -> A^*$, defined as follows: if
$b^* in B^*$, then $lambda^* b^* (a) = b^* (lambda(a))$ for any $a in A$.

#source(26)
#theorem[
  If a sequence of homomorphisms
  $
    dots.c -> A_(k - 1) stretch(->)^(phi_(k - 1)) A_k stretch(->)^(phi_k)
    A_(k + 1) -> dots.c
  $
  of abelian groups is exact, then the sequence of dual homomorphisms
  $
    dots.c <- A_(k - 1)^* stretch(<-)^(phi_(k - 1)^*) A_k^*
    stretch(<-)^(phi_k^*) A_(k + 1)^* <- dots.c
  $
  is also exact.
] <th:dual-exact-sequence>

#point <pt:main-notation> *Main notation.* The space of $n$ complex variables is
denoted by $CC^n$, and its points are denoted by $z, zeta, z^0, zeta^0$, etc. If
$z = (z_1, ..., z_n)$, then $overline(z) = (overline(z)_1, ..., overline(z)_n)$.
For $z, zeta in CC^n$ let
$chevron.l z, zeta chevron.r#notation-mark($chevron.l z, zeta chevron.r$)
= z_1 zeta_1 + dots.c + z_n zeta_n$,
$|z|#notation-mark($|z|$) = sqrt(chevron.l z\, overline(z) chevron.r)$, and
$norm(z)#notation-mark($norm(z)$) = max_(1 <= i <= n) |z_i|$. We introduce
notation for the ball
$B_r#notation-mark($B_r$) = B_r (z^0)#notation-mark($B_r (z^0)$)
= B(z^0, r) = {z: |z - z^0| < r}$, the polydisk
$U = U(z^0, r) = {z: |z_i - z_i^0| < r, i = 1, ..., n}$, and the generalized
ball $B_r^k (z^0)#notation-mark($B_r^((k)) (z^0)$)
= {z: |z_1 - z_1^0|^(2k_1) + dots.c + |z_n - z_n^0|^(2k_n) < r^2}$, where
$k = (k_1, ..., k_n)$. In general, the expression ${z: dots.c}$ denotes a set in
$CC^n$, with other cases stipulated in special ways. The space of $n$ real
variables is denoted by $RR^n$, and its points are denoted by $x, y$, etc.

If $J$ and $frak(J)$ are vectors with nonnegative integer coordinates
(multi-indices), then $|J|#notation-mark($|J|$) = i_1 + dots.c + i_n$; the
inequality $J <= frak(J)$ means that $i_k <= j_k$, $k = 1, ..., n$ where
$J = (i_1, ..., i_n)$ and $frak(J) = (j_1, ..., j_n)$. The expression
$k in.not J$ means that $k != i_l$, $l = 1, ..., n$. Further,
$J!#notation-mark($J!$) = i_1 ! dots.c i_n !$,
$
  z^J#notation-mark($z^J$) = z_1^(i_1) dots.c z_n^(i_n), wide
  D^J#notation-mark($D^J$)
  = (partial^(|J|))/(partial z_1^(i_1) dots.c partial z_n^(i_n)),
$
$
  D_(w, z)^(J, frak(J))#notation-mark($D_(w, z)^(J, frak(J))$)
  = (partial^(|J| + |frak(J)|))
  /(partial w_1^(i_1) dots.c partial w_n^(i_n) partial z_1^(j_1) dots.c
  partial z_n^(j_n)),
$
$
  d z#notation-mark($d z$) = d z_1 and dots.c and d z_n, wide
  d z_J#notation-mark($d z_J$) = d z_(i_1) and dots.c and d z_(i_p),
$
where $J = (i_1, ..., i_p)$; and $d z_([J])#notation-mark($d z_([J])$)
= d z_(j_1) and dots.c and d z_(j_(n - p))$. The notation $[thin]$ will often be
used in the same sense; for example, $a_1, ..., [j_1, ..., j_k], ..., a_n$ means
that the elements $a_(j_1), ..., a_(j_k)$ are omitted, and
$d z_([k])^((alpha))#notation-mark($d z_([k])^((alpha))$)
= d z_1^(alpha_1) and dots.c [k] dots.c and d z_n^(alpha_n)$.

A neighborhood of a point $a in CC^n$ is denoted by $U = U_a$#notation-mark(
  $U_a$,
) (sometimes by other letters).

Let $M$ and $N$ be subsets of $CC^n$; then $partial M$ is the boundary of $M$,
$
  rho(z, M)#notation-mark($rho(z, M)$, sort: "rho z M")
  = inf_(zeta in M) |zeta - z|, wide
  rho(M, N)#notation-mark($rho(M, N)$, sort: "rho M N")
  = inf_(zeta in M \ z in N) |zeta - z|,
$
$overline(M)$ is the closure of $M$, $interior M$#notation-mark(
  $interior M$,
  sort: "int M",
) is the interior of $M$, and $M relcomp N$#notation-mark($M relcomp N$) means
that $overline(M)$ is compact and $overline(M) subset interior N$. If
$w = (w_1, ..., w_n)$, and $phi = (phi_1, ..., phi_n)$, then
$
  chevron.l w, d phi chevron.r#notation-mark($chevron.l w, d phi chevron.r$)
  = w_1 d phi_1 + dots.c + w_n d phi_n,
$
#source(27)
and #notation-mark($chevron.l w, phi^((alpha + upright(I))) chevron.r$)
$
  chevron.l w, phi^((alpha + upright(I))) chevron.r
  = w_1 phi_1^(alpha_1 + 1) + dots.c + w_n phi_n^(alpha_n + 1),
$
where $alpha = (alpha_1, ..., alpha_n)$ and
$upright(I)#notation-mark($upright(I)$) = (1, ..., 1)$. Further,
$0 = (0, ..., 0)$ is the origin of coordinates, and
$d phi \/ phi#notation-mark($d phi \/ phi$, sort: "d phi / phi")
= d phi_1 \/ phi_1 and dots.c and d phi_n \/ phi_n$. The Jacobian of a mapping
$f = f(z) = (f_1, ..., f_n)$ is denoted by
$
  (partial (f_1, ..., f_n))/(partial (z_1, ..., z_n))
  = (partial f)/(partial z)#notation-mark(
    $(partial f) / (partial z)$,
    sort: "d f / d z",
  ),
$
$(partial f \/ partial z)|_a$ is the value of this Jacobian at a point $a$, and
$grad Phi = (Phi'_(z_1), ..., Phi'_(z_n))$. We frequently write $psi(z)$ in
place of $psi(z, overline(z))$ for a function. The symbol
$plus.o$#notation-mark($plus.o$, sort: "~0") denotes a direct sum, $delta_(i k)$
is the Kronecker symbol, $norm(g_(i j))$ is the matrix with elements $g_(i j)$,
$det norm(g_(i j))$#notation-mark($det norm(g_(i j))$, sort: "det g") is the
determinant of this matrix, and
$partial z#notation-mark($partial z$, sort: "d z partial")
= (d z_1, ..., d z_n)$.

Let $F$ be a closed subset of $CC^n$ and $Omega$ an open subset. Then
$C_r^((m)) (F)$ ($m = 0, 1, 2, ..., infinity$) is the class of $r$-dimensional
forms#footnote[The word "form" is used instead of "exterior differential form"
  here and frequently below.] whose coefficients can be extended to a
neighborhood of $F$ as $m$ times continuously differentiable functions. The
subclass of $C_(p + q)^((m)) (F)$ consisting of forms of type $(p, q)$ is
denoted by $C_(p, q)^((m)) (F)$. When $m = 0$, this index will be omitted. The
projective limit of the classes $C_(p, q)^((m)) (F)$, $F relcomp Omega$, is
denoted by $C_(p, q)^((m)) (Omega)$. For
$
  alpha = sum'_(J, frak(J)) a_(J frak(J)) d z_J and d overline(z)_frak(J)
  in C_(p, q)^((m)) (Omega),
$
we set
$
  dbar alpha#notation-mark($dbar alpha$, sort: "d bar alpha")
  = sum'_(J, frak(J)) sum_(k = 1)^n
  (partial a_(J frak(J)))/(partial overline(z)_k)
  d overline(z)_k and d z_J and d overline(z)_frak(J)
$
(for $m = 0$ the differentiation is understood as differentiation in the space
of generalized functions). Here the prime on the summation sign indicates
summation over $1 <= i_1 < dots.c < i_p <= n$, $1 <= j_1 < dots.c < j_q <= n$,
where $J = (i_1, ..., i_p)$ and $frak(J) = (j_1, ..., j_q)$.

The class of functions holomorphic in a domain $D$ (on a compact set $K$) is
denoted by $A(D)$#notation-mark($A(D)$) (by $A(K)$#notation-mark(
  $A(overline(D))$,
)). Furthermore, $A_C (D)#notation-mark($A_C (D)$) = A(D) inter C(overline(D))$,
and $A^n (D)$#notation-mark($A^n (D)$) is the class of mappings
$f = (f_1, ..., f_n)$ that are holomorphic in $D$. Moreover,
$Re A_C (D)$#notation-mark($Re A_C (D)$, sort: "Re A C D") is the class of
functions that are real parts of functions in $A_C (D)$. Let
$P h (D)$#notation-mark($P h (D)$) be the class of pluriharmonic functions in
$D$, and $R(D)$#notation-mark($R(D)$) the class of holomorphic functions in $D$
with nonnegative real part. Finally,
$P h_C (D)#notation-mark($P h_C (D)$) = P h (D) inter C(overline(D))$, and
$R_C (D)#notation-mark($R_C (D)$) = R(D) inter C(overline(D))$. If a measure
$mu$ is given on $partial D$, then $[Re A_C (D)]_mu^perp$#notation-mark(
  $[Re A_C (D)]_mu^perp$,
  sort: "Re A C D perp",
) is the set of $phi in C(partial D)$ such that
$integral_(partial D) f phi d mu = 0$
#source(28)
for all $f in Re A_C (D)$. The closure of $A_C (D)$ in the metric of
$L_(d mu)^2$ is denoted by $H_(d mu)^2$#notation-mark($H_(d mu)^2$).

// The last page of the Preliminaries holds more than its last line.
#pagebreak()
#new-par
An index $zeta$ (or $z$) on a domain of integration indicates that $zeta$
(respectively, $z$) is the variable of integration; $|partial D|$#notation-mark(
  $|partial D|$,
  sort: "partial D",
) is the image of $partial D$ under the mapping $z -> (|z_1|, ..., |z_n|)$, and
$Delta_zeta#notation-mark($Delta_zeta$, sort: "Delta zeta")
= {z: |z_i| = |zeta_i|, i = 1, ..., n}$. Finally, $A times B$ denotes the
topological product of sets $A$ and $B$. Some other notation was introduced in
@pt:integration-of-forms–@pt:algebraic-topology.

If $alpha in C_(p, q) (Omega)$, then
$supp alpha#notation-mark($supp alpha$, sort: "supp alpha")
= overline({z in Omega: alpha(z) != 0})$. Suppose that the form $alpha$ is
defined in some set $U subset X$, and that a function $chi$ is defined on the
manifold $X$ and has $supp chi relcomp U$; then, as is common, we regard
$psi = chi alpha$ as defined on $X$ by the equalities $psi = chi alpha$ for
$x in U$ and $psi = 0$ for $x in.not U$.

The symbol #qed-mark#notation-mark($#qed-mark$, sort: "~3") marks the end of a
proof.
