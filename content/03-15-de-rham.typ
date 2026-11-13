#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Application of de Rham duality <sec:de-rham>

The following result establishes a duality between the homology groups and the
cohomology groups of a differentiable manifold $X$.

#theorem(
  title: [#index-mark(
      "Duality",
      sub: "de Rham",
      target: <th:de-rham>,
    )de Rham],
  note: [See @bib:DeRham1955 for a proof.],
)[
  For any homomorphism $lambda: H_p (X) -> CC^1$, or $RR^1$ there exists a
  unique element ${omega} = h^* in H^p (X)$ such that
  $
    lambda(h) = integral_h h^* = integral_gamma omega
  $
  for any $h = {gamma} in H_p (X)$.
] <th:de-rham>

Here $H_p (X)$ and $H^p (X)$ are understood to be the homology and cohomology
groups with real or complex coefficients. We remark that every closed
#source(113)
form $omega in Z^p (X)$, or rather its class ${omega} in H^p (X)$, gives a
homomorphism $lambda: H_p (X) -> CC^1$, or $RR^1$ defined by
$lambda(h) = integral_h {omega}$.

#corollary[
  A form $omega in Z^p (X)$ is exact if and only if $integral_gamma omega = 0$
  for any cycle $gamma in Z_p (X)$.
] <cor:exact-form-criterion>

#proof(title: none)[
  The necessity coincides with the assertion of
  Corollary~@cor:exact-form-over-cycle. Let us prove the sufficiency. Suppose
  that $integral_gamma omega = integral_h {omega} = 0$ for any class
  ${gamma} = h in H_p (X)$ for some form $omega in h^* in H^p (X)$. This means
  that $omega$ determines the zero homomorphism $0: H_p (X) -> CC^1$. The
  uniqueness assertion in the de Rham theorem implies that ${omega} = h^* = 0$.
]

#corollary[
  A cycle $gamma in Z_p (X)$ is weakly homologous to zero if and only if
  $integral_gamma omega = 0$ for any form $omega in Z^p (X)$.
] <cor:weakly-null-cycle-criterion>

#proof(title: none)[
  The necessity is Corollary~@cor:closed-form-over-null-cycle. We prove the
  sufficiency. If $gamma_0 approx.not 0$, then $h_0 = {gamma_0} != 0$. Since
  $H_p (X)$ is a torsion-free group in the case of real or complex coefficients,
  for any nonzero $h_0 in H_p (X)$ there is a homomorphism
  $lambda: H_p (X) -> CC^1$ such that $lambda(h_0) != 0$. By
  Theorem~@th:de-rham, there exists a class $h^* = {omega} in H^p (X)$ such that
  $lambda(h) = integral_h {omega}$. Then
  $integral_(gamma_0) omega = integral_(h_0) {omega} != 0$.
]

The next result is useful for applications to multidimensional residues.

#proposition[
  If for the cycles $gamma_j in Z_p (X)$, $j = 1, ..., q$, and the forms
  $omega_j in Z^p (X)$, $j = 1, ..., q$, the condition $det norm(a_(i j)) != 0$
  holds, where $a_(i j) = integral_(gamma_i) omega_j$, and any form
  $omega in Z^p (X)$ has a representation
  $omega approx c_1 omega_1 + dots.c + c_q omega_q$ for some complex numbers
  $c_j$, then the cycles ${gamma_j}_1^q$ make up a $p$-dimensional homology
  basis, and the forms ${omega_j}_1^q$ make up a $p$-dimensional cohomology
  basis for the manifold $X$.
] <prop:dual-bases>

#proof[
  The condition $det norm(a_(i j)) != 0$ implies immediately that the cycles
  ${gamma_j}$ are homologically independent and the forms ${omega_j}$ are
  cohomologically independent. Then it follows from the hypotheses that
  ${omega_j}$ is a $p$-dimensional cohomology basis. Let us show that the cycles
  ${gamma_j}$ form a $p$-dimensional homology basis. Using linear
  transformations, we can choose the cycles ${gamma_j}$ and the forms
  ${omega_j}$ in such a way that
  $
    integral_(gamma_i) omega_j = delta_(i j), quad i, j = 1, ..., q.
  $ <eq:dual-bases>
  We take an arbitrary cycle $gamma in Z_p (X)$ and consider the cycle
  $
    gamma_0 = gamma - sum_(j = 1)^q k_j gamma_j,
    quad "where" k_j = integral_gamma omega_j.
  $
  #source(114)
  Obviously, $integral_(gamma_0) omega_j = 0$, $j = 1, ..., q$. But since
  ${omega_j}$ is a cohomology basis, $integral_(gamma_0) omega = 0$ for any form
  $omega in Z^p (X)$. By Corollary~@cor:weakly-null-cycle-criterion,
  $gamma_0 approx 0$. Thus, $gamma approx sum_1^q k_j gamma_j$, i.e.,
  ${gamma_j}$ is a homology basis.
]

Bases ${gamma_j}_1^q$ and ${omega_j}_1^q$ satisfying condition @eq:dual-bases
are said to be #index-mark(
  "Bases",
  sub: "homology and cohomology",
  subsub: "dual in the de Rham sense",
)_dual in the de Rham sense_.

With the help of Corollary~@cor:cohomologous-forms-over-cycles we can get the
following theorem, which is analogous to Theorem~@th:on-residues.

#theorem[
  If ${gamma_j}_1^q$ is a $p$-dimensional homology basis and ${omega_j}_1^q$ is
  a $p$-dimensional cohomology basis dual to it, then for any cycle
  $gamma in Z_p (X)$ and any form $omega in Z^p (X)$
  $
    integral_gamma omega = sum_(j = 1)^q N_j R_j,
  $ <eq:de-rham-residues>
  where the $N_j = integral_gamma omega_j$ are the expansion coefficients of the
  cycle $gamma$ in the basis ${gamma_j}$: $gamma approx sum_1^q N_j gamma_j$,
  and the $R_j = integral_(gamma_j) omega$ are the expansion coefficients of the
  form $omega$ in the basis ${omega_j}$: $omega approx sum R_j omega_j$.
] <th:de-rham-residues>

It will be useful for us to have a theorem of Serre establishing an isomorphism
between the de Rham cohomology and the cohomology of holomorphic forms for a
Stein manifold.#footnote[See @bib:Hormander1966 or @bib:Shabat1976b for the
  definitions and properties of a Stein manifold, or a holomorphically complete
  complex analytic manifold.] We note that a domain of holomorphy in $CC^n$ is a
particular case of a Stein manifold.

#theorem(title: [#index-mark(
    "Theorem",
    sub: "Serre's",
    target: <th:serre>,
  )Serre])[
  If $X$ is a Stein manifold, then for any closed form $omega in Z^p (X)$ there
  exists a holomorphic form $omega' in Z^p (X)$ cohomologous to it.
] <th:serre>

On a complex analytic manifold $X$ of complex dimension $n$ any holomorphic form
of degree $p > n$ is identically equal to zero, so Theorems~@th:de-rham
and~@th:serre give us

#corollary[
  If $X$ is a Stein manifold of complex dimension $n$, then
  $H^p (X) tilde.eq H_p (X) tilde.eq 0$ for $p > n$.
] <cor:stein-vanishing>

#numbered-statement([Example], slant: false)[
  We show that in the domain $D = CC^n without {z: z_1 dots.c z_n = 0}$ the
  cycle $gamma_0 = {z: |z_1| = dots.c = |z_n| = 1}$ and the form
  $omega_0 = (2 pi i)^(-n) (d z \/ z)$ make up dual $n$-dimensional homology and
  cohomology bases. Indeed, since $D$ is a domain of holomorphy, any form
  $omega in Z^n (D)$ is cohomologous to a holomorphic form
  #source(115)
  of degree $n$ that has the form $f(z) d z$, where $f in A(D)$. The function
  $f(z)$ can be expanded in $D$ in a multiple Laurent series:
  $
    f(z) = sum_alpha c_alpha z^alpha
    = sum_(alpha_1, ..., alpha_n = -infinity)^infinity
    c_(alpha_1 dots.c alpha_n) z_1^(alpha_1) dots.c z_n^(alpha_n).
  $
  If $alpha != -upright(I) = (-1, ..., -1)$, for example, if $alpha_j != -1$,
  then
  $
    c_alpha z^alpha d z = (-1)^(j - 1) c_alpha (alpha_j + 1)^(-1)
    d(z_1^(alpha_1) dots.c z_j^(alpha_j + 1) dots.c z_n^(alpha_n)
      d z_([j])) approx 0.
  $
  Thus, $omega approx f(z) d z approx c_(-upright(I)) d z \/ z$. Obviously,
  $integral_(gamma_0) omega_0 = 1$. It remains to apply
  Proposition~@prop:dual-bases.
] <st:monomial-duality>
