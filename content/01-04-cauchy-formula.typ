#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[The Cauchy formula. The logarithmic residue with respect to
  the skeleton#translation-note[_Editor's note._ "Skeleton" is a literal
    rendering of "остов", but "distinguished boundary" is common in the English
    literature.]] <sec:cauchy-formula>

#point <pt:cauchy-formula> Let $D_i subset CC_(z_i)^1$ be a domain with
piecewise smooth boundary, $i = 1, ..., n$. The domain
$D = D_1 times dots.c times D_n subset CC^n$ is called a #index-mark(
  "Domain",
  sub: "polycylinder",
)_polycylinder domain_ (in particular, a _polydisk_ if all the $D_i$ are disks).
The set $Gamma = partial D_1 times dots.c times partial D_n$, provided with the
natural orientation induced by the orientation of $D$, is called the
#index-mark("Skeleton")_skeleton_ of $D$.

#theorem[
  Let $D$ be a polycylinder domain and $a$ any point of $D$, and suppose that
  $phi in A_C (D)$. Then the #index-mark(
    "Formula",
    sub: "Cauchy",
    target: <th:cauchy-formula>,
  )Cauchy formula is valid:
  $
    phi(a) = 1 / (2 pi i)^n integral_Gamma (phi(z) d z) / (z - a) .
  $ <eq:cauchy-formula>
] <th:cauchy-formula>

#source(45)
Note that the skeleton $Gamma$ plays the same role in the Cauchy formula
@eq:cauchy-formula as the whole boundary of the domain plays in the classical
Cauchy formula for $n = 1$. The existence of the integral representation over
the skeleton implies that the functions in $A_C (D)$ satisfy the maximum modulus
principle with respect to the skeleton (see
Theorem~@th:shilov-boundary-converse).

The Cauchy formula @eq:cauchy-formula is an example of a formula with a
holomorphic kernel that is not universal (it is true only for polycylinder
domains).

#proof[
  Formula @eq:cauchy-formula is easy to get by repeated application of the
  classical Cauchy formula for $n = 1$, but we give another proof by showing
  that @eq:cauchy-formula follows from the Cauchy-Fantappiè formula
  @eq:cauchy-fantappie-cycle for a suitable choice of the cycle of integration
  $beta$. The same method is used later in deriving Weil's formula.

  Let us represent $partial D$ in the form $union.big_1^n gamma_i$, where
  $gamma_i = {z: z in overline(D), z_i in partial D_i}$. On each face $gamma_i$
  we consider the vector-valued function
  $u^((i)) = (u_1^((i)), ..., u_n^((i)))$, where
  $u_k^((i)) = delta_(i k) (z_i - a_i)^(-1)$, $i, k = 1, ..., n$. Obviously, the
  $u^((i))$ satisfy condition @eq:cauchy-fantappie-condition. Now consider the
  oriented surface $beta_i = {(z, u^((i))), z in gamma_i}$ in $CC^(2n)$. The
  union $union.big_1^n beta_i$ is not a cycle, since each face $gamma_i$ has its
  own vector-valued function $u^((i))$. At the same time, $partial D$ is a
  cycle, and the set ${(z, u), z in partial D}$ also would be a cycle if $u$
  were continuous in $z in partial D$. The set $union.big_1^n beta_i$ has
  "holes" located over the points where the faces $gamma_i$ intersect, i.e.,
  over the edges. We "stop up" these "holes" as follows: if the $k$ faces
  $gamma_(i_1), ..., gamma_(i_k)$ meet at the edge $gamma_(i_1 dots.c i_k)$,
  then we construct the set
  $
    beta_(i_1 dots.c i_k) = {(z, u): z in gamma_(i_1 dots.c i_k),
      u = sum_(l = 1)^k lambda_l u^((i_l)), lambda_l >= 0,
      sum_(l = 1)^k lambda_l = 1}.
  $
  We add all the surfaces $beta_(i_1 dots.c i_k)$ to $union.big_1^n beta_i$; the
  resulting (oriented) surface $beta$ is a cycle. We apply
  @eq:cauchy-fantappie-cycle to $beta$. All the $u^((i))$ are holomorphic in
  $z$; therefore, $d u_([k])^((i)) and d z = 0$, $i, k = 1, ..., n$, and, hence,
  the integral in @eq:cauchy-fantappie-cycle over each $beta_i$ is equal to
  zero. If $k < n$, then all the $d u_([j]) and d z$ are 0 on
  $beta_(i_1 dots.c i_k)$, because $u$ depends holomorphically on $z$ and on the
  $k - 1$ independent parameters $lambda$, i.e., there are $n + k - 1 < 2n - 1$
  independent differentials in all. Therefore, the integral in
  @eq:cauchy-fantappie-cycle over $beta_(i_1 dots.c i_k)$ is also equal to zero.
  It remains to compute this integral over $beta_(i_1 dots.c i_n)$. On
  $Gamma = gamma_(1 dots.c n)$ the components $u_k$ of the vector-valued
  function $u$ have the form
  $
    u_k = sum_(l = 1)^n lambda_l u_k^((l)) = lambda_k / (z_k - a_k), quad
    k = 1, ..., n,
  $
  #source(46)
  and so
  $
    & ((n - 1)!) / (2 pi i)^n integral_(beta_(1 dots.c n)) phi(z)
      sum_(k = 1)^n (-1)^(k - 1) u_k d u_([k]) and d z \
    & quad = ((n - 1)!) / (2 pi i)^n integral_Gamma phi(z) (d z) / (z - a)
      integral_(lambda_1 + dots.c + lambda_n = 1 \ lambda_i >= 0)
      sum_(k = 1)^n (-1)^(k - 1) lambda_k d lambda_([k]) \
    & quad = 1 / (2 pi i)^n integral_Gamma phi(z) (d z) / (z - a),
  $
  where we have used the elementary equality
  $
    integral_(lambda_1 + dots.c + lambda_n = 1 \ lambda_i >= 0)
    sum_(k = 1)^n (-1)^(k - 1) lambda_k d lambda_([k]) = 1 / ((n - 1)!) .
  $ <eq:simplex-integral>
  To verify @eq:simplex-integral it suffices to observe that, by Stokes'
  formula, the left-hand side of @eq:simplex-integral is equal to
  $
    n integral_(lambda_1 + dots.c + lambda_n <= 1, lambda_i >= 0) d lambda
    = n 1 / (n!) .
  $
]

#corollary[
  #index-mark(
    "Formula",
    sub: "Cauchy",
    subsub: "for derivatives",
    target: <cor:cauchy-derivatives>,
  )
  Under the conditions of Theorem~@th:cauchy-formula,
  $
    D^alpha phi(a) = (alpha!) / (2 pi i)^n integral_Gamma
    (phi(z) d z) / ((z - a)^(alpha + upright(I))) .
  $
] <cor:cauchy-derivatives>

#point <pt:logarithmic-residue-skeleton> The logarithmic residue formulas
considered in @sec:rouche-principle[§§2] and @sec:leray-koppelman[3] for a
holomorphic mapping involve integration over the whole boundary of a domain. We
now investigate logarithmic residue formulas in which the integration is over an
$n$-dimensional cycle. The logarithmic residue formulas in
@sec:rouche-principle[§§2] and @sec:leray-koppelman[3] are essentially based on
the Martinelli-Bochner formula @eq:martinelli-bochner, and the formulas of the
present subsection are based on the Cauchy formula @eq:cauchy-formula. The
results here can, as a rule, be derived from the general formulas
@eq:fundamental-integral-formula or @eq:cauchy-fantappie-mapping in the same way
as we just obtained @eq:cauchy-formula from @eq:cauchy-fantappie-cycle, but we
shall give simpler proofs based on the Cauchy formula @eq:cauchy-formula. The
form
$
  (d f(z)) / f(z) = ((partial f) / (partial z) \/ f) d z
  = (partial ln f(z)) / (partial z) d z
$
appears here as an analogue of the logarithmic differential for a holomorphic
mapping.

We need the concept of an #index-mark(
  "Polyhedron",
  sub: "analytic",
)_analytic polyhedron_. This is defined to be an open set of the form
$D = D_rho = {z: z in G, |f_i (z)| < rho_i, i = 1, ..., k}$, where $f_i in A(G)$
($i = 1, ..., k$) and $G$ is a domain in $CC^n$, $D relcomp G$. If $k = n$, then
$D$ is called a #source(47) #index-mark(
  "Polyhedron",
  sub: "analytic",
  subsub: "special",
)_special analytic polyhedron_. The latter polyhedra play an important role in
this subsection. We first mention the following facts about them.

#lemma[
  Every special analytic polyhedron $D$ consists of finitely many connected
  components.
] <lem:polyhedron-components>

#proof[
  Every (bounded) domain $tilde(D)$ can be approximated by domains with
  piecewise smooth boundaries in such a way that the conditions of
  Theorem~@th:rouche-principle hold on the boundaries of the approximating
  domains if they hold on the boundary of $tilde(D)$; therefore, the Rouché
  principle is applicable to $tilde(D)$. It follows from the definition of $D$
  that for each connected component $D' subset D$ there exists a point $a in D'$
  such that $f(a) = zeta$, $|zeta_i| < rho_i$, $i = 1, ..., n$. Hence, the
  mapping $f(z) - zeta$ has zeros in $D'$. On the other hand, by the Rouché
  principle (Theorem~@th:rouche-principle) the mappings $f(z)$ and $f(z) - zeta$
  have the same number of zeros in $D'$, so $f(z)$ has zeros in $D'$. Thus,
  $f(z)$ has zeros in each connected component $D'$ of the special analytic
  polyhedron $D$. We conclude from Theorem~@th:logarithmic-residue that the
  number of connected components of $D$ is finite.
]

#lemma[
  The skeleton
  $Gamma = Gamma_rho = {z: z in overline(D), |f_i (z)| = rho_i, i = 1, ..., n}$
  of a special analytic polyhedron $D$ is smooth for almost all
  $rho = (rho_1, ..., rho_n)$, $rho_i > 0$, $i = 1, ..., n$.
] <lem:skeleton-smooth>

#ends-with-square[A proof is obtained immediately by applying Sard's theorem
  (Theorem~@th:sard) to the mapping $z -> (|f_1 (z)|^2, ..., |f_n (z)|^2)$.]

In all the results below concerning integration over the skeleton $Gamma_rho$ it
is assumed that $Gamma_rho$ is smooth. By Lemma~@lem:skeleton-smooth, this
situation can always be achieved by varying $rho$ by an arbitrarily small
amount.

#theorem(title: [Caccioppoli, Martinelli, and Sorani])[
  Let $D$ be a special analytic polyhedron given with the help of a
  vector-valued function $f in A^n (overline(D))$. Then any $phi in A_C (D)$
  satisfies the formula
  $
    1 / (2 pi i)^n integral_Gamma phi(z) (d f(z)) / f(z)
    = sum_(a in E_f) mu_a (f) phi(a),
  $ <eq:skeleton-residue>
  where $E_f = {z: z in D, f(z) = 0}$, and $Gamma$ is the skeleton of $D$.
] <th:caccioppoli-martinelli-sorani>

#proof[
  Since
  $partial D = union.big_(j = 1)^n {z: z in overline(D), |f_j (z)| = rho_j}$,
  $f$ does not have zeros on $partial D$, and, by
  Theorem~@th:logarithmic-residue, it has only isolated zeros in $D$. We
  surround each zero $a in E_f$ with a neighborhood $U_a relcomp D$ in such a
  way that $overline(U)_a inter overline(U)_b = emptyset$ for $a != b$,
  $a, b in E_f$. Let $delta > 0$ be such that
  $delta < min{norm(f(z)), z in overline(D) without union.big_(a in E_f) U_a}$.
  Then each connected component of the cycle
  $gamma = {z: z in D, |f_1 (z)| = dots.c = |f_n (z)| = delta}$ falls in one of
  the neighborhoods $U_a$, $a in E_f$. Let $gamma_a = gamma inter U_a$.
  #source(48)
  Note that $Gamma - gamma = partial Q$, where
  $Q = {z: z in overline(D), |f_j (z)| = delta t + rho_j (1 - t),
    j = 1, ..., n, 0 <= t <= 1}$, i.e., $Gamma tilde.op gamma$ in
  $D_f = D without {z: f_1 (z) dots.c f_n (z) = 0}$. The form $phi(d f \/ f)$ is
  holomorphic in $D_f$; therefore, by the Cauchy-Poincaré theorem,
  $
    1 / (2 pi i)^n integral_Gamma phi (d f) / f
    = sum_(a in E_f) 1 / (2 pi i)^n integral_(gamma_a) phi (d f) / f .
  $ <eq:skeleton-sum>
  #new-par
  If $a$ is a simple zero of $f$, then $U_a$ can be chosen small enough that $f$
  is biholomorphic in it. Making the change of variables $w = f(z)$ and applying
  the Cauchy formula @eq:cauchy-formula, we get that
  $
    & 1 / (2 pi i)^n integral_(gamma_a) phi (d f) / f
      = 1 / (2 pi i)^n integral_(|w_i| = delta \ i = 1, ..., n)
      phi(f|_(overline(U)_a)^(-1) (w)) (d w) / w \
    & quad = phi(f|_(overline(U)_a)^(-1) (0)) = phi(a).
  $ <eq:simple-zero-skeleton>
  #new-par
  Suppose now that $a$ is a multiple zero of $f$. By
  Proposition~@prop:multiplicity-well-defined, for almost all sufficiently small
  (in modulus) $zeta$ the mapping $f(z) - zeta$ has simple zeros
  $a^((1)), ..., a^((k))$ in $U_a$, where $k = mu_a (f)$. For
  $norm(zeta) < min{delta, min_(partial U_a) norm(f(z)) - delta}$ the set
  $gamma_(a, zeta) = {z: z in U_a, |f_1 (z) - zeta_1| = dots.c
    = |f_n (z) - zeta_n| = delta}$ forms a cycle in $U_a$, because
  $gamma_(a, zeta) inter partial U_a = emptyset$. The cycle $gamma_(a, zeta)$ is
  obtained from $gamma_a$ by the homotopy
  $gamma_(a, t zeta) = {z: z in U_a, |f_j (z) - t zeta_j| = delta,
    j = 1, ..., n}$, $0 <= t <= 1$, in the domain
  $U_a without {z: product_(j = 1)^n (f_j (z) - zeta_j) = 0}$. Applying the
  Cauchy-Poincaré theorem once again along with formula @eq:simple-zero-skeleton
  for the simple zeros, we have that
  $
    1 / (2 pi i)^n integral_(gamma_a) phi (d(f - zeta)) / (f - zeta)
    = 1 / (2 pi i)^n integral_(gamma_(a, zeta)) phi
    (d(f - zeta)) / (f - zeta) = sum_(j = 1)^k phi(a^((j))),
  $
  and, passing to the limit as $zeta -> 0$,
  $
    1 / (2 pi i)^n integral_(gamma_a) phi (d f) / f = mu_a (f) phi(a).
  $ <eq:multiple-zero-skeleton>
  Now @eq:skeleton-residue follows from
  @eq:skeleton-sum–@eq:multiple-zero-skeleton.
]

#theorem[
  If $f$ and $D$ satisfy the conditions of Theorem~@th:logarithmic-residue, then
  @eq:skeleton-residue holds for any $phi in A_C (D)$, where
  $Gamma = {z: z in partial D, |f_2 (z)| = dots.c = |f_n (z)| = epsilon}$, and
  $epsilon < min_(partial D) norm(f(z))$.
] <th:skeleton-boundary>

#proof[
  Since $epsilon < min_(partial D) norm(f)$, it follows that
  $|Gamma| subset D_f$. Note that if $D inter E_f != emptyset$, then
  $|Gamma| != emptyset$. Indeed, by the Rouché principle
  (Theorem~@th:rouche-principle), the mapping
  $f_1 (z) - epsilon, ..., f_n (z) - epsilon$ has zeros in $D$. According to the
  second part of the proof of Theorem~@th:logarithmic-residue, this implies that
  the mapping $0, f_2 (z) - epsilon, ..., f_n (z) - epsilon$ has zeros on
  $partial D$, i.e., $|Gamma|$ is not empty. The cycle $Gamma$ is homologous to
  $gamma = {z: z in D, |f_1 (z)| = epsilon, ..., |f_n (z)| = epsilon}$ in
  $D_f = overline(D) without {z: product_(j = 1)^n f_j (z) = 0}$, #source(49)
  since $Gamma - gamma = partial Q$, where
  $Q = {z: z in overline(D), |f_1 (z)| >= epsilon,
    |f_2 (z)| = dots.c = |f_n (z)| = epsilon}$, $Q subset D_f$. By the
  Cauchy-Poincaré theorem and Theorem~@th:caccioppoli-martinelli-sorani, applied
  to the domain $tilde(D) = {z: z in D, |f_j (z)| < epsilon, j = 1, ..., n}$, we
  get that
  $
    1 / (2 pi i)^n integral_Gamma phi (d f) / f
    = 1 / (2 pi i)^n integral_gamma phi (d f) / f
    = sum_(a in E_f) mu_a (f) phi(a).
  $
]

#corollary[
  Under the conditions of Theorems~@th:caccioppoli-martinelli-sorani
  and~@th:skeleton-boundary, the number $N$ of zeros of $f$ in $D$ is expressed
  by the formula
  $
    N = N(f, D) = 1 / (2 pi i)^n integral_Gamma (d f) / f .
  $
] <cor:skeleton-zeros>

The next theorem, which includes a variant of the Rouché principle and the
logarithmic residue theorems, is useful for applications.

#theorem(title: [Yuzhakov])[
  Let $f$, $phi$, $D$, and $Gamma$ be the same as in
  Theorem~@th:caccioppoli-martinelli-sorani, and suppose that the mapping
  $g in A^n (overline(D))$ satisfies on $Gamma$ the inequality
  $
    |g_j (z)| < |f_j (z)|, quad j = 1, ..., n.
  $ <eq:yuzhakov-condition>
  Then: #roman-text[a)] the mappings $f$ and $f + g$ have the same number of
  zeros in $D$; and #roman-text[b)]
  $
    1 / (2 pi i)^n integral_Gamma phi (d(f + g)) / (f + g)
    = sum_(a in E_(f + g)) mu_a (f + g) phi(a).
  $ <eq:yuzhakov>
] <th:yuzhakov>

#lemma[
  Under the conditions of Theorem~@th:yuzhakov there exists a number
  $delta_0 > 0$ such that for $0 < delta < delta_0$ the cycle $Gamma$ is
  homologous to the cycle
  $gamma = {z: z in D, |f_j (z) + g_j (z)| = delta, j = 1, ..., n}$ in
  $D_(f + g) = overline(D) without {z: product_(j = 1)^n [f_j (z) + g_j (z)]
    = 0}$.
] <lem:yuzhakov-homology>

#proof[
  Let $r_j = max_(z in overline(D)) |g_j (z)|$, $j = 1, ..., n$. By the maximum
  modulus principle (see Theorem~@th:shilov-boundary-converse), it follows from
  @eq:yuzhakov-condition that $r_j < rho_j$ ($j = 1, ..., n$). Consider
  $delta_0 = min{rho_1 - r_1, ..., rho_n - r_n}$ and the family of cycles
  $Gamma_p = {z: z in overline(D), |f_j (z) + g_j (z)| = delta, j = 1, ..., p,
    |f_k (z)| = rho_k, k = p + 1, ..., n}$, $0 < delta < delta_0$,
  $p = 0, 1, ..., n$. Obviously, $Gamma_0 = Gamma$ and $Gamma_n = gamma$.
  Further, $Gamma_p subset D_(f + g)$, since $f + g != 0$ on $Gamma_p$ by the
  choice of $delta$. Moreover,
  $Gamma = Gamma_0 tilde.op Gamma_1 tilde.op dots.c tilde.op Gamma_n = gamma$
  in $D_(f + g)$. Indeed, $Gamma_(p - 1) - Gamma_p = partial Q_p$, where
  $Q_p = {z: z in overline(D), |f_j (z) + g_j (z)| = delta, j = 1, ..., p - 1,
    |f_p (z) + g_p (z)| >= delta, |f_p (z)| <= rho_p, |f_k (z)| = rho_k,
    k = p + 1, ..., n} subset D_(f + g)$, $p = 1, ..., n$.
]

#proof(title: [Proof of Theorem~@th:yuzhakov.])[
  By the maximum modulus principle for a special analytic polyhedron (see
  Theorem~@th:shilov-boundary-converse), @eq:yuzhakov-condition gives us that
  $|g_j (z)| < rho_j$ in $overline(D)$ for $j = 1, ..., n$. Thus, the inequality
  $|g_j (z)| < |f_j (z)|$, $j = 1, ..., n$, holds on the face
  $Delta_j = {z: z in overline(D), |f_j (z)| = rho_j}$. But since
  $partial D = union.big_1^n Delta_j$, we get assertion a) #source(50) from
  Theorem~@th:rouche-principle. Further, by Lemma~@lem:yuzhakov-homology and
  Theorem~@th:caccioppoli-martinelli-sorani, applied to the mapping $f + g$ and
  the cycle $gamma$,
  $
    1 / (2 pi i)^n integral_Gamma phi (d(f + g)) / (f + g)
    & = 1 / (2 pi i)^n integral_gamma phi (d(f + g)) / (f + g) \
    & = sum_(a in E_(f + g)) mu_a (f + g) phi(a).
  $
]

#example[
  Let $m$ be the multiplicity of the zero of the mapping $w_1 = z_1 - z_2^2$,
  $w_2 = z_1^2 - z_2^3$ at the point $(0, 0)$. Since the inequalities
  $|z_2|^2 < |z_1|$, and $|z_1|^2 < |z_2|^3$, hold on
  $Gamma = {z: |z_1| = epsilon^7, |z_2| = epsilon^4}$, $0 < epsilon < 1$, it
  follows from Theorem~@th:yuzhakov that
  $
    m & = 1 / (2 pi i)^2 integral_Gamma
        (d(z_1 - z_2^2) and d(z_1^2 - z_2^3)) / ((z_1 - z_2^2)(z_1^2 - z_2^3)) \
      & = 1 / (2 pi i)^2 integral_Gamma
        ((-3 z_2^2 + 4 z_1 z_2) d z_1 and d z_2)
        / ((z_1 - z_2^2)(z_1^2 - z_2^3)) \
      & = 1 / (2 pi i) integral_(|z_2| = epsilon^4)
        ((-3 z_2^2 + 4 z_2^3) d z_2) / (z_2^4 - z_2^3) = 3.
  $
]

#small-print[
  #theorem(title: [Caccioppoli, Martinelli, and Sorani])[
    Suppose that $f in A^n (D)$, $phi in A(D)$, and that the cycle $Gamma$
    satisfies the weak homology relation
    $
      Gamma approx sum_(a in E_f) n_a gamma_a
    $ <eq:weak-homology>
    in $D_f = D without {z: f_1 (z) dots.c f_n (z) = 0}$, where
    $gamma_a = {z: |f_1 (z)| = dots.c = |f_n (z)| = epsilon} inter U_a$; here
    $U_a$ is a neighborhood of a zero $a in E_f$ and $epsilon$ is sufficiently
    small. Then
    $
      1 / (2 pi i)^n integral_Gamma phi (d f) / f
      = sum_(a in E_f) n_a mu_a (f) phi(a).
    $
  ] <th:separating-cycle-residue>

  #ends-with-square[The proof follows at once from
    Corollary~@cor:cohomologous-forms-over-cycles and
    @eq:multiple-zero-skeleton.]

  In connection with this theorem the problem arises of a topological
  description of cycles of the form @eq:weak-homology. Let
  $F_j = {z: z in D, f_j (z) = 0}$, $j = 1, ..., n$ and
  $F = F_1 union dots.c union F_n$. Then $D_f = D without F$. The cycle
  $gamma_a$ is said to be #index-mark(
    "Cycle",
    sub: "locally separating",
  )_locally separating_ for the analytic sets $F_1, ..., F_n$ at the point $a$
  of their intersection. The subgroup of $H_n (D without F)$ generated by the
  locally separating cycles is called the (globally) #index-mark(
    "Subgroup",
    sub: "separating",
  )_separating subgroup_, and accordingly a cycle of the form @eq:weak-homology
  is called a #index-mark("Cycle", sub: "separating")_separating cycle_.

  #proposition(title: [Martinelli and Sorani])[
    A separating cycle satisfies the condition
    $
      Gamma tilde.op 0 quad "in" D without F_([j]), quad j = 1, ..., n,
    $ <eq:separating-condition>
    where $F_([j]) = F_1 union dots.c [j] dots.c union F_n$.
  ] <prop:martinelli-sorani>

  #proof[
    $gamma_a = partial Q_a$, where
    $Q_a = {z: z in U_a, |f_1 (z)| = dots.c [j] dots.c = |f_n (z)| = epsilon,
      |f_j (z)| <= epsilon}$, $Q_a subset D without F_([j])$.
  ]

  The converse assertion is, in general, false.

  #source(51)
  #example[
    $D = CC^2 without {z: |z_1| <= 1, |z_2| <= 1}$, $f_1 = z_1$, $f_2 = z_2$,
    $Gamma = {z: |z_1| = |z_2| = 2}$. Then the cycle $Gamma$ is not homologous
    to 0 in $D without F$, and it satisfies condition @eq:separating-condition,
    but is not separating, since $E_f = emptyset$.
  ]

  On the other hand, we have

  #theorem(title: [Tsikh])[
    If $D$ is a domain of holomorphy, then a cycle $Gamma in Z_n (D without F)$
    is separating if it satisfies the conditions @eq:separating-condition.
  ] <th:tsikh>

  Above we considered logarithmic residue formulas in $CC^n$ in which the
  integration was over cycles of dimension $n$ or $2n - 1$. It is also possible
  to indicate formulas for cycles of intermediate dimension.

  #theorem(title: [Yuzhakov and Kuprikov])[
    Under the conditions of Theorem~@th:yuzhakov-roos
    $
      integral_(Gamma_(2n - p - 1)) phi K_(2n - p - 1) (f)
      = sum_(a in E_f) mu_a (f) phi(a),
    $
    where#ed-note[The 1983 edition has the factor $(-1)^q$,
      $q = (n - p)(n - p - 1) \/ 2$, in front of the sum. It is the change from
      the orientation of $CC^(n - p)$ used here to the one given by
      $d x_1 and d y_1 and dots.c$ (@pt:integration-of-forms of the
      Preliminaries); with it the case $p = 0$ would contradict
      Theorem~@th:yuzhakov-roos.]
    $
      K_(2n - p - 1) (f) & = ((n - p - 1)!) / (2 pi i)^n \
                         & quad times sum_(alpha_0 < dots.c < alpha_p)
                           ((-1)^(alpha_0 - 1) overline(f)_(alpha_0)
                           dots.c overline(f)_(alpha_p)
                           d overline(f)_([alpha_0, ..., alpha_p]) and d f)
                           / ((f_1 overline(f)_1 + dots.c
                             + f_(n - p - 1) overline(f)_(n - p - 1)
                             + f_(n - p) overline(f)_(n - p)
                             dot.c dots.c dot.c f_n overline(f)_n)^(
                           n - p
                           ));
    $
    with the summation over all ordered subsets $(alpha_0, ..., alpha_p)$ of
    ${1, ..., n}$ such that $1 <= alpha_0 <= n - p$,
    $n - p <= alpha_1 < dots.c < alpha_p <= n$;
    $
      Gamma_(2n - p - 1)
      = {z: z in partial D, |f_(n - p + 1) (z)| = dots.c = |f_n (z)| = epsilon},
    $
    with $epsilon$ sufficiently small.
  ] <th:yuzhakov-kuprikov>

  Theorem~@th:yuzhakov-roos and Theorem~@th:skeleton-boundary are particular
  cases of this theorem (for $p = 0$ and $p = n - 1$ respectively).

  #corollary(title: [Martinelli, Sommer, and Sorani])[
    Let $phi in A_C (D)$, where $D$ is a bounded domain with piecewise smooth
    boundary. Then for $a in D$
    $
      integral_(Gamma_(2n - p - 1)) phi K_(2n - p - 1) (z - a) = phi(a).
    $ <eq:intermediate-dimension>
  ] <cor:martinelli-sommer-sorani>

  This formula generalizes the Martinelli-Bochner formula @eq:martinelli-bochner
  and the Cauchy formula @eq:cauchy-formula to the case of integration over
  cycles of intermediate dimension, but @eq:intermediate-dimension can itself be
  obtained from the Cauchy-Fantappiè formula @eq:cauchy-fantappie-cycle by a
  suitable choice of the cycle $beta$, similarly to the way we obtained the
  Cauchy formula in subsection~@pt:cauchy-formula of this section.
]

In conclusion we prove

#proposition(title: [Osgood])[
  If a holomorphic mapping $f: D -> CC^n$, $D subset CC^n$, is one-to-one, then
  it is biholomorphic, i.e., $f^(-1)$ is also holomorphic.
] <prop:osgood>

#proof[
  Take an arbitrary point $a in D$ and a closed neighborhood
  $overline(B)_a subset D$ of it. Since $f$ is one-to-one, it follows that $a$
  is an isolated zero of the mapping $f(z) - f(a)$, and the multiplicity is 1.
  By the Rouché principle (Theorem~@th:rouche-principle), #source(52) for any
  $w in U_epsilon = {w in CC^n: norm(w - f(a)) <= epsilon}$, where
  $epsilon = min_(partial overline(B)_a) norm(f(z) - f(a))$, there exists a
  unique point $z = phi(w) in B_a$ such that $f(z) = w$ (this implies that
  $f(D)$ is a domain), and, by @eq:yuzhakov,
  $
    z_j = phi_j (w) = 1 / (2 pi i)^n integral_Gamma
    (z_j d f(z)) / ([f(z) - w]^upright(I)), quad j = 1, ..., n,
  $ <eq:inverse-mapping>
  where $Gamma = {z in B_a: |f_j (z) - f_j (a)| = epsilon, j = 1, ..., n}$.
  According to Lemma~@lem:skeleton-smooth, $epsilon$ can be chosen in such a way
  that the set $Gamma$ is smooth and has real dimension $n$. Since the form
  under the integral sign in @eq:inverse-mapping is holomorphic with respect to
  $w$, the mapping $f^(-1) (w) = phi(w)$ is holomorphic in
  $overline(U)_epsilon$.
]
