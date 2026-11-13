#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Application of Alexander-Pontryagin duality <sec:alexander-pontryagin>

#point <pt:intersection-index> We first present some concepts and facts from
combinatorial topology (see @bib:Aleksandrov1947 and @bib:Aleksandrov1955). Let
$X$ be an $n$-dimensional orientable differentiable manifold with a fixed
orientation. If the smooth nondegenerate simplexes $U_r = {Delta_r, phi}$ and
$V_q = (Delta_q, psi)$, $r + q = n$, in $X$ intersect transversally at some
point $a$ that is interior for both of them, then the #index-mark(
  "Index",
  sub: "intersection of two simplexes",
)_intersection index_ of these simplexes is defined to be
$
  chi(U_r, V_q) = sgn lr(
    (partial(x_1, ..., x_n)) / (partial(t_1, ..., t_r, tau_1, ..., tau_q)) |
  )_a,
$ <eq:intersection-index>
where $(x_1, ..., x_n)$ are local coordinates in a neighborhood of $a$ that
determine the orientation of $X$, and $(t_1, ..., t_r)$ and
$(tau_1, ..., tau_q)$ are the coordinates in $Delta_r$ and $Delta_q$ determining
the orientation of the simplexes $U_r$ and $V_q$. Transversality means that the
Jacobian in @eq:intersection-index is nonzero. If $U_r$ and $V_q$ do not
intersect, then let $chi(U_r, V_q) = 0$. The #index-mark(
  "Index",
  sub: "intersection of two chains",
)_intersection index of two chains_ $c_r = sum_i m_i U_r^((i))$ and
#source(109)
$l_q = sum_j n_j V_q^((j))$, $r + q = n$, whose simplexes are nondegenerate and
intersect pairwise at no more than one point, and then transversally, is defined
by the formula
$
  chi(c_r, l_q)#notation-mark($chi(..., ...)$, sort: "chi")
  = sum_(i, j) m_i n_j chi(U_r^((i)), V_q^((j))).
$
The definition of the intersection index leads immediately to the following
properties of it:
#enum(numbering: "1)")[
  $chi(lambda_1 c_r^((1)) + lambda_2 c_r^((2)), l_q)
  = lambda_1 chi(c_r^((1)), l_q) + lambda_2 chi(c_r^((2)), l_q)$;
][
  $chi(c_r, l_q) = (-1)^(r q) chi(l_q, c_r)$;
][
  $chi(c_r, partial l_(q + 1)) = (-1)^r chi(partial c_r, l_(q + 1))$ (this is
  less obvious, and has the next properties as consequences);
][
  if $sigma_r$ and $gamma_q$ are cycles in $X$ and $gamma_q approx 0$, then
  $chi(sigma_r, gamma_q) = 0$; and
][
  if the chains $c'_r$ and $c''_r$ have a common boundary
  ($partial c'_r = partial c''_r$) and $gamma_q approx 0$, then
  $chi(c'_r, gamma_q) = chi(c''_r, gamma_q)$.
]
#new-par
The #index-mark("Coefficient", sub: "linking")_linking coefficient_ of two
cycles $sigma_(r - 1) in B_(r - 1) (X)$ and $gamma_q in B_q (X)$ such that
$r + q = n$ and $|sigma_(r - 1)| inter |gamma_q| = emptyset$ is defined by
$
  frak(v)#notation-mark($frak(v) (..., ...)$, sort: "zz frak v")
  (sigma_(r - 1), gamma_q) = chi(c_r, gamma_q),
$ <eq:linking-coefficient>
where $c_r$ is a chain in $X$ that is transversal to $gamma_q$ and satisfies
$partial c_r = sigma_(r - 1)$. Property 5) of the intersection index implies
that the linking coefficient is independent of the choice of the chain $c_r$.
The following properties of the linking coefficient are consequences of
@eq:linking-coefficient and the properties of the intersection index:
#enum(numbering: "1)")[
  $frak(v) (lambda_1 sigma'_(r - 1) + lambda_2 sigma''_(r - 1), gamma_q)
  = lambda_1 frak(v) (sigma'_(r - 1), gamma_q)
  + lambda_2 frak(v) (sigma''_(r - 1), gamma_q)$;
][
  $frak(v) (sigma_(r - 1), gamma_q) = (-1)^r chi(sigma_(r - 1), b_(q + 1))$,
  where $partial b_(q + 1) = gamma_q$;
][
  $frak(v) (sigma_(r - 1), gamma_q)
  = (-1)^((r - 1) q - 1) frak(v) (gamma_q, sigma_(r - 1))$.
]

#theorem(
  title: [#index-mark(
      "Duality",
      sub: "Alexander-Pontryagin",
      target: <th:alexander-pontryagin>,
    )Alexander-Pontryagin duality],
  note: [See @bib:Aleksandrov1947 or @bib:Aleksandrov1955 for a proof.],
)[
  Let $S^n$ be a manifold homeomorphic to the $n$-dimensional sphere and $T$ a
  polyhedron in it. Then for $r + q = n$ ($r = 0, 1, ..., n$) the weak homology
  groups $H_(r - 1) (T)$ and $H_q (S^n without T)$ are isomorphic. Moreover, for
  every $(r - 1)$-dimensional homology basis $sigma_1, ..., sigma_p$ of $T$
  there exists a corresponding #index-mark(
    "Bases",
    sub: "homology and cohomology",
    subsub: "dual in the Alexander-Pontryagin sense",
  )dual $q$-dimensional homology basis $gamma_1, ..., gamma_p$ of the open set
  $S^n without T$ such that $frak(v) (sigma_i, gamma_j) = delta_(i j)$,
  $i, j = 1, ..., p$.
] <th:alexander-pontryagin>

#point <pt:alexander-pontryagin-residues> We shall apply
Theorem~@th:alexander-pontryagin and Proposition~@prop:period-expansion to the
following case. Let $X = CC^n$, and suppose that the form $omega$ is regular in
the domain $D = CC^n without T$ ($T$ is a singular set of $omega$). Since $CC^n$
is homeomorphic to the $2n$-dimensional sphere with a "puncture," it can be
assumed that $CC^n$ is imbedded in the
#source(110)
spherical space $S^(2n) = dot(CC)^n = CC^n union {infinity}$. We regard the
exterior of an arbitrary ball in $CC^n$ as a neighborhood of the point
$infinity$ at infinity. If $S^(2n)$ admits a triangulation in which the set
$dot(T) = T union {infinity}$ is a subpolyhedron of $S^(2n)$, then
Theorem~@th:alexander-pontryagin can be applied to $dot(T)$ and
$S^(2n) without dot(T) = CC^n without T = D$. To find the $q$-dimensional Betti
number of $D$ (the dimension of the group $H_q (D)$) it suffices in this case to
find the $(r - 1)$-dimensional Betti number $p$ of the singular set $dot(T)$ for
$r = 2n - q$. Instead of a $q$-dimensional homology basis ${gamma_j}_1^p$ of $D$
it suffices to construct an $(r - 1)$-dimensional homology basis ${sigma_j}_1^p$
of the singular set $dot(T)$. The expansion coefficients of the integration
cycle $gamma in Z_q (D)$ in the basis ${gamma_j}$ dual to the basis ${sigma_j}$
are found as the linking coefficients:
$
  frak(v) (sigma_j, gamma) & = frak(v) (sigma_j, sum_i k_i gamma_i)
                             = sum_(i = 1)^p k_i frak(v) (sigma_j, gamma_i) \
                           & = sum_(i = 1)^p k_i delta_(i j) = k_j.
$
To compute the integral of the form $omega$ over the basis cycles $gamma_j$ it
is also unnecessary to determine directly the basis ${gamma_j}$. To do this it
suffices to choose $p$ homologically independent $q$-dimensional cycles
$Gamma_1, ..., Gamma_p$ in $D$ such that the integrals over them are
sufficiently simple. Then the integrals over the basis cycles are found from the
system of linear equations
$
  integral_(Gamma_j) omega = sum_(i = 1)^p k_(j i) integral_(gamma_i) omega,
  quad j = 1, ..., p,
$
where $k_(j i) = frak(v) (sigma_i, Gamma_j)$. Here the inequality
$det norm(k_(j i)) != 0$ is a condition for the cycles $Gamma_1, ..., Gamma_p$
to be homologically independent.

If the form $omega$ is regular in the domain $D = G without T$, where $G$ is a
domain in $CC^n$ that is homeomorphic to a ball, then $G$ can be complemented to
form a spherical space $S^(2n)$ by identifying its boundary $partial G$ with a
single ideal point ($infinity$). Instead of the group $H_(r - 1) (dot(T))$ we
can consider the relative homology group $H_(r - 1) (T, partial G)$ isomorphic
to it. Now let $r = q = n$ and $omega = f(z) d z$, where $f in A(D)$. The
preceding arguments and Proposition~@prop:period-expansion then give us

#theorem(title: [#index-mark(
    "Theorem",
    sub: "on residues",
    target: <th:on-residues>,
  )on residues])[
  Suppose that $f in A(D)$ and that the singular set
  $dot(T) = T union {infinity}$, where $T = CC^n without D$, is a subpolyhedron
  of the spherical compactification $S^(2n) = CC^n union {infinity}$ of $CC^n$.
  If ${sigma_j}_1^p$ is an $(n - 1)$-dimensional homology basis of the singular
  set $dot(T)$ and ${gamma_j}_1^p$ is a corresponding dual $n$-dimensional
  homology basis of $D$, then for any cycle $gamma in Z_n (D)$
  $
    integral_gamma f(z) d z = (2 pi i)^n sum_(j = 1)^p k_j R_j,
  $
  #source(111)
  where $k_j = frak(v) (sigma_j, gamma)$, and
  $
    R_j = 1 / (2 pi i)^n integral_(gamma_j) f(z) d z.
  $
] <th:on-residues>

By analogy with the one-variable case, $R_j$ can be called #index-mark(
  "Residue",
  sub: "of a function with respect to a basis cycle",
)_the residue of the function $f(z)$ with respect to the basis cycle $gamma_j$_.
The integral $integral_gamma f(z) d z$ is also called the #index-mark(
  "Period of a form",
)_period_ of the form $f(z) d z$ with respect to the cycle $gamma$.

#corollary[
  If $f in A(CC^n without T)$ and $H_(n - 1) (dot(T)) tilde.eq 0$, where
  $dot(T) = T union {infinity}$, then $integral_gamma f(z) d z = 0$ for any
  cycle $gamma in Z_n (CC^n without T)$.
] <cor:vanishing-periods>

#eg[
  Let $f(w, z)$ be an entire function of two complex variables, and let $k$ and
  $m$ be relatively prime positive integers. Then
  $
    integral_gamma (f(w, z) d w and d z) / (w^k - z^m) = 0
  $
  for any cycle $gamma in Z_2 (CC^2 without T)$, where
  $T = {(w, z): w^k - z^m = 0}$. Indeed, the set $dot(T) = T union {infinity}$
  is topologically equivalent to the Riemann surface of the function
  $w = z^(m \/ k)$, which is homeomorphic to the 2-dimensional sphere $S^2$, and
  $H_1 (S^2) tilde.eq 0$.
] <exm:relatively-prime-powers>

#eg[
  If $f(z)$ is an entire function on $CC^n$, $n >= 2$, then
  $
    integral_gamma (f(z) d z)
    / (product_(j = 1)^N (sum_(k = 1)^n a_k z_k + b_j)^(m_j)) = 0
  $
  for any cycle $gamma in Z_n (CC^n without T)$, where
  $
    T = {z in CC^n: product_(j = 1)^N (sum_(k = 1)^n a_k z_k + b_j) = 0}.
  $
  Indeed, since $T$ is a family of $N$ parallel analytic planes of complex
  dimension $n - 1$, the set $dot(T)$ is homeomorphic to $N$ spheres of
  dimension $2n - 2$ that have the single common point $infinity$ (a bouquet of
  spheres). Consequently, $H_(n - 1) (dot(T)) tilde.eq 0$.
] <exm:entire-function-periods>

#eg[
  Let $T = {(w, z) in CC^2: w z = 1}$. Then $dot(T) = T union {infinity}$ is
  homeomorphic to the two-dimensional sphere with two points identified (the
  point $z = 0$ of the Riemann sphere, where $w = 1 \/ z = infinity$, and the
  point $z = infinity$ are identified with the point $infinity in dot(T)$).
  Consequently, the dimension of the groups
  $H_1 (dot(T)) tilde.eq H_2 (CC^2 without T)$ is equal to 1. As dual basis
  cycles we can take
  $
    sigma = {(w, z): y = v = 0, u = 1 \/ x, 0 <= x < infinity}
    in Z_1 (dot(T)),
  $
  where $x = Re z$, $y = Im z$, $u = Re w$, $v = Im w$, and
  $
    gamma = {(w, z): w = 2 e^(i t), z = 2 e^(i tau), 0 <= t, tau <= 2 pi}
    in Z_2 (CC^2 without T).
  $
  #source(112)
  Obviously, $frak(v) (sigma, gamma) = chi(c, gamma) = 1$, where
  $c = {(w, z): y = v = 0, x u >= 1, x >= 0, u >= 0}$, because
  $partial c = sigma$ and $|gamma| inter |c|$ consists of a single point
  $(2, 2)$ at which
  $
    sgn (partial(u, v, x, y)) / (partial(x, u, t, tau)) = 1
  $
  (we can take $frak(v) (sigma, gamma) = chi(sigma, b)$, where
  $b = {(w, z): w = r e^(i t), z = 2 e^(i tau), 0 <= r <= 2, 0 <= t,
    tau <= 2 pi}$ and $partial b = gamma$). Theorem~@th:on-residues gives us
  that for an entire function $f(w, z)$ and a cycle
  $Gamma in Z_2 (CC^2 without T)$
  $
    integral_Gamma (f(w, z) d w and d z) / (w z - 1) = (2 pi i)^2 m R,
  $
  where $m = frak(v) (sigma, Gamma)$, and
  $
    R & = 1 / (2 pi i)^2 integral_gamma (f(w, z) d w and d z) / (w z - 1) \
      & = sum_(k = 0)^infinity 1 / (2 pi i)^2
        integral_gamma (f(w, z) d w and d z) / (w z)^(k + 1) \
      & = sum_(k = 0)^infinity 1 / (k!)^2
        (partial^(2k) f(0, 0)) / (partial w^k partial z^k)
  $
  is the #index-mark(
    "Residue",
    sub: "of a function with respect to a cycle",
  )residue of the function $f(w, z) \/ (w z - 1)$ with respect to the cycle
  $gamma$.
] <exm:hyperbola-cycles>

Application of the Alexander-Pontryagin duality is especially efficient when
$n = 2$ and $T$ is an analytic set, because in this case the study of the
two-dimensional homology of a domain in four-dimensional Euclidean space reduces
to the study of the one-dimensional homology group of a surface of real
dimension two (see @sec:two-variables).
