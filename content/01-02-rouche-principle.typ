#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Multiplicity of a zero of a holomorphic mapping. The Rouché principle
<sec:rouche-principle>

Suppose that the mapping
$
  w = f(z)
$ <eq:holomorphic-mapping>
is holomorphic in the domain $D subset CC^n$, where $w = (w_1, ..., w_n)$ and
$f = (f_1, ..., f_n)$. A point $a in D$ is called a #index-mark(
  "Zero of a mapping",
)_zero of the mapping_ @eq:holomorphic-mapping if $f(a) = 0$. Let #source(33)
$E_f$ denote the set of zeros of $f$. If the Jacobian of @eq:holomorphic-mapping
satisfies $(partial f \/ partial z)|_a != 0$ at an isolated point $a$ of $E_f$,
then $a$ is called a #index-mark("Zero of a mapping", sub: "simple")_simple zero
of the mapping_.

We have the following statement, which we prove a little later.

#proposition[
  If the closure of a neighborhood $U_a$ of a zero $a$ of the mapping
  @eq:holomorphic-mapping does not contain other zeros, then there exists an
  $epsilon > 0$ such that for almost all $zeta in B_epsilon$ the mapping
  $
    w = f(z) - zeta
  $ <eq:shifted-mapping>
  has only simple zeros in $U_a$, and their number depends neither on $zeta$ nor
  on the choice of the neighborhood $U_a$.
] <prop:multiplicity-well-defined>

The number of zeros of @eq:shifted-mapping in $U_a$ indicated in this
proposition is called the #index-mark(
  "Multiplicity of a zero of a holomorphic mapping",
)_multiplicity of the zero $a$ of the mapping_ @eq:holomorphic-mapping, and
denoted by $mu_a (f)$#notation-mark($mu_a (f)$, sort: "mu").#footnote[This is
  the so-called dynamic definition of multiplicity. See @sec:multiplicity about
  the connection of $mu_a (f)$ with the coefficients of the Taylor expansion of
  @eq:holomorphic-mapping at the point $a$.]

#example[
  The point $(0, 0)$ is a zero of multiplicity 2 for the mapping $w_1 = z_1$,
  $w_2 = z_2^2 + z_1^2$. Indeed, if $|zeta|$ is small and $zeta_1^2 != zeta_2$,
  then the mapping $w_1 = z_1 - zeta_1, w_2 = z_2^2 + z_1^2 - zeta_2$ has the
  two simple zeros $(zeta_1, sqrt(zeta_2 - zeta_1^2))$ and
  $(zeta_1, -sqrt(zeta_2 - zeta_1^2))$ in a neighborhood of this point.
]

The next result follows from the local invertibility of a holomorphic mapping at
points where $partial f \/ partial z != 0$.

#proposition[
  The multiplicity of a simple zero is equal to 1.
] <prop:simple-zero-multiplicity>

We pass to the case of a zero that is not simple.

#proposition[
  If $a$ is an isolated zero of @eq:holomorphic-mapping and
  $(partial f \/ partial z)|_a = 0$, then its multiplicity $mu_a (f)$ is greater
  than 1.
] <prop:multiple-zero>

This statement justifies calling an isolated zero of @eq:holomorphic-mapping
#index-mark("Zero of a mapping", sub: "multiple")_multiple_ if
$(partial f \/ partial z)|_a = 0$.

Just as the logarithmic residue expresses the number of zeros of a holomorphic
function in the theory of functions of a single complex variable, its
multidimensional analogues are connected with the number of zeros of a
holomorphic mapping. The following multidimensional analogue of the classical
logarithmic residue of Cauchy was constructed with the help of the
Martinelli-Bochner integral representation @eq:martinelli-bochner.

#theorem[
  Let $f in A^n (overline(D))$, where the domain $D$ is bounded, and its
  boundary $partial D$ is piecewise smooth and does not contain zeros of $f$.
  Then $f$ has only #source(34) isolated zeros in $D$, and their number, with
  each zero counted as many times as its multiplicity,#footnote[Henceforth we
    adhere to this convention wherever the number of zeros is concerned.] is
  expressed by the formula
  $
    N = N(f, D) = integral_(partial D) omega(f(z), overline(f(z))),
  $ <eq:logarithmic-residue>
  where
  $
    omega(f, overline(f)) = (n - 1)! / (2 pi i)^n 1 / (|f|^(2n))
    sum_(j = 1)^n (-1)^(j - 1) overline(f)_j d overline(f)_([j]) and d f.
  $
] <th:logarithmic-residue>

#theorem(title: [#index-mark(
    "Principle",
    sub: "Rouché",
    target: <th:rouche-principle>,
  )The Rouché principle])[
  Suppose that the mapping @eq:holomorphic-mapping and the domain $D$ satisfy
  the conditions of Theorem~@th:logarithmic-residue, and let
  $g in A^n (overline(D))$. If for each point $z in partial D$ there is at least
  one index $j$ ($j = 1, ..., n$) such that
  $
    |g_j (z)| < |f_j (z)|,
  $ <eq:rouche-condition>
  then @eq:holomorphic-mapping and the mapping
  $
    w = f(z) + g(z)
  $ <eq:perturbed-mapping>
  have the same number of zeros in $D$.
] <th:rouche-principle>

#remark[
  Condition @eq:rouche-condition holds, for example, if $|g| < |f|$ or
  $norm(g) < norm(f)$ on $partial D$. This condition can be relaxed. In fact, we
  can require only that $f(z) + t g(z) != 0$ for $z in partial D$ and
  $0 <= t <= 1$. It suffices that at each point $z in partial D$ there is at
  least one index $j$ such that $|Re g_j (z)| < |Re f_j (z)|$ or
  $|Im g_j (z)| < |Im f_j (z)|$.
]

We need some lemmas to prove these assertions.

#lemma[
  If $f in A^n (D)$, then for any piecewise smooth cycle
  $
    gamma in Z_(2n - 1) (D without E_f)
  $
  the integral $integral_gamma omega(f, overline(f))$ is an integer.
] <lem:integer-integral>

#proof[
  Since @eq:holomorphic-mapping maps the domain $D without E_f$ into
  $CC^n without {0}$, and the sphere $partial B_r$ forms a basis for the
  $(2n - 1)$-dimensional homology, the image of the cycle $gamma$ under the
  mapping @eq:holomorphic-mapping is homologous to $N dot.c partial B_r$, where
  $N$ is an integer. Using Theorem~@th:change-of-variables,
  Corollary~@cor:cohomologous-forms-over-cycles, and the Martinelli-Bochner
  formula @eq:martinelli-bochner, we get that
  $
    integral_gamma omega(f, overline(f))
    = integral_(utilde(f) (gamma)) omega(zeta, overline(zeta))
    = N integral_(partial B_r) omega(zeta, overline(zeta)) = N.
  $
]

#source(35)
#lemma[
  Suppose that the mapping @eq:holomorphic-mapping and the domain $D$ satisfy
  the conditions of Theorem~@th:logarithmic-residue. If, moreover, all the zeros
  of @eq:holomorphic-mapping in $D$ are simple, then for any function
  $phi in A_C (D)$
  $
    integral_(partial D) phi omega(f, overline(f)) = sum_(a in E_f) phi(a).
  $ <eq:simple-zeros-sum>
  In particular (for $phi equiv 1$), @eq:logarithmic-residue holds.
] <lem:simple-zeros-sum>

#proof[
  The form $phi omega(f, overline(f))$ is closed in $overline(D) without E_f$;
  this can be verified directly as in the proof that the Martinelli-Bochner form
  @eq:martinelli-bochner-kernel is closed. According to
  Corollary~@cor:cohomologous-forms-over-cycles,
  $
    integral_(partial D) phi omega(f, overline(f))
    = sum_(a in E_f) integral_(partial U_a) phi omega(f, overline(f)),
  $ <eq:sum-over-zeros>
  where $U_a$ is a sufficiently small neighborhood of $a$. We take $U_a$ to be
  the connected component of the set ${z: z in D, |f(z)| < epsilon}$ containing
  $a$. Since $(partial f \/ partial z)|_a != 0$, $f$ is biholomorphic in
  $overline(U)_a$ for sufficiently small $epsilon$; therefore, by
  Theorem~@th:change-of-variables and the Martinelli-Bochner formula
  @eq:martinelli-bochner,
  $
    integral_(partial U_a) phi omega(f, overline(f))
    = integral_(partial B_epsilon) phi(f^(-1) (zeta))
    omega(zeta, overline(zeta)) = phi(f^(-1) (0)) = phi(a).
  $
  From this and @eq:sum-over-zeros we get @eq:simple-zeros-sum.
]

#lemma[
  If the conditions of Theorem~@th:rouche-principle hold, then
  $
    integral_(partial D) omega(f, overline(f))
    = integral_(partial D) omega(f + g, overline(f + g)).
  $ <eq:rouche-integrals>
] <lem:rouche-integrals>

#proof[
  According to @eq:rouche-condition, $f(z) + t g(z) != 0$ for $z in partial D$
  and $0 <= t <= 1$. Consequently, the integral
  $
    J(t) = integral_(partial D) omega(f + t g, overline(f + t g))
  $
  is a continuous function of $t$ on $[0, 1]$, and, by
  Lemma~@lem:integer-integral, its values are integers. Therefore, $J(t)$ is
  constant, and so $J(0) = J(1)$, i.e., @eq:rouche-integrals is valid.
]

#proof(title: [Proof of Proposition~@prop:multiplicity-well-defined.])[
  Let $epsilon > 0$ be such that $epsilon < min_(z in partial U_a) |f(z)|$.
  Then, by Lemma~@lem:rouche-integrals,
  $
    integral_(partial U_a) omega(f, overline(f))
    = integral_(partial U_a) omega(f - zeta, overline(f - zeta))
  $ <eq:shifted-integral>
  for $zeta in B_epsilon$. By Sard's Theorem~@th:sard,
  $meas f({z: z in D, partial f \/ partial z = 0}) = 0$; consequently, for
  almost all $zeta in B_epsilon$ the mapping @eq:shifted-mapping has only simple
  zeros. According to Lemma~@lem:simple-zeros-sum, the integral on the
  right-hand side of @eq:shifted-integral is equal to #source(36)
  $N(f - zeta, U_a)$ for such $zeta$. The equality @eq:shifted-integral implies
  that
  $
    N(f - zeta, U_a) = integral_(partial U_a) omega(f, overline(f));
  $
  hence, $N(f - zeta, U_a)$ does not depend on the choice of
  $zeta in B_epsilon$. If $U'_a$ is another neighborhood of $a$, then, by
  Corollary~@cor:cohomologous-forms-over-cycles,
  $
    integral_(partial U'_a) omega(f, overline(f))
    = integral_(partial U_a) omega(f, overline(f)).
  $
]

#ends-with-square[In passing we have proved that the multiplicity of an isolated
  zero of a holomorphic mapping @eq:holomorphic-mapping can be expressed by the
  formula
  $
    mu_a (f) = integral_(partial U_a) omega(f, overline(f)).
  $ <eq:multiplicity-integral>
]

#proof(title: [Proof of Theorem~@th:logarithmic-residue.])[
  1\. Assume first that $partial f \/ partial z equiv.not 0$. We show first of
  all that @eq:holomorphic-mapping can have only isolated zeros in $D$. Take
  $epsilon$ such that $0 < epsilon <= min_(partial D) |f|$. From Sard's theorem
  and Lemma~@lem:rouche-integrals it follows that for almost all
  $zeta in B_epsilon$ the system @eq:shifted-mapping has only simple zeros in
  $D$, and their number $k >= 0$ does not depend on $zeta in B_epsilon$.

  If $E_f != emptyset$, then for any point $a^((1)) in E_f$ we can choose a
  sequence of points $zeta^((m)) -> 0$, $zeta^((m)) in B_epsilon$, such that for
  $zeta = zeta^((m))$ the mapping @eq:shifted-mapping has the simple zeros
  ${z^(m,1), ..., z^(m,k)}$, $k >= 1$, and $z^(m,1) -> a^((1))$ as
  $m -> infinity$. Indeed, since $partial f \/ partial z equiv.not 0$, there is
  a point $z^(m,1)$ at which $partial f \/ partial z != 0$ in any neighborhood
  of $a^((1))$. Take $zeta^((m)) = f(z^(m,1))$; then $z^(m,1)$ is a simple zero
  of @eq:shifted-mapping for $zeta = zeta^((m))$. According to Sard's theorem,
  by varying $zeta^((m))$ slightly we can make the remaining zeros of this
  mapping also simple. It is clear that $zeta^((m)) -> 0$ as
  $z^(m,1) -> a^((1))$.

  On the other hand, we show that for any choice of $zeta^((m)) -> 0$ the simple
  zeros ${z^(m,1), ..., z^(m,k)}$ have a single finite set#footnote[Here some of
    the points $a^((1)), ..., a^((k))$ may coincide.]
  ${a^((1)), ..., a^((k))} subset D$ of limit points; consequently,
  $E_f = {a^((1)), ..., a^((k))}$. Indeed, replacing the sequences
  ${z^((m,j))}_(m=1)^infinity$, $j = 1, ..., k$, by subsequences, we can make
  them converge to some points $a^((j)) in D$, $j = 1, ..., k$ (because there
  are no zeros on $partial D$). The set $E_f$ consists of these points alone.
  Suppose not: suppose that there exists a point $b^((1)) in E_f$ with
  $b^((1)) != a^((j))$, $j = 1, ..., k$. Then just as before we get a sequence
  of points $xi^((m)) -> 0$ such that for $zeta = xi^((m))$ the system
  @eq:shifted-mapping has only simple zeros ${w^(m,1), ..., w^(m,k)}$, and
  $w^(m,j) -> b^((j))$, $j = 1, ..., k$, as $m -> infinity$. We choose a
  $phi in A_C (D)$ such that
  $phi(a^((1))) = dots.c = phi(a^((k))) = phi(b^((2))) = dots.c
  = phi(b^((k))) = 0$, and #source(37) $phi(b^((1))) = 1$. By
  Lemma~@lem:simple-zeros-sum,
  $
    integral_(partial D) phi omega(f - zeta^((m)), overline(f - zeta^((m))))
    = sum_(j = 1)^k phi(z^(m,j)); \
    integral_(partial D) phi omega(f - xi^((m)), overline(f - xi^((m))))
    = sum_(j = 1)^k phi(w^(m,j)).
  $
  Passing to the limit as $m -> infinity$, we get a contradiction:
  $
    integral_(partial D) phi omega(f, overline(f))
    = sum_(j = 1)^k phi(a^((j))) = 0; \
    integral_(partial D) phi omega(f, overline(f))
    = sum_(j = 1)^k phi(b^((j))) = 1.
  $
  Thus, $E_f$ is finite.

  Let us prove @eq:logarithmic-residue. We enclose each point $a in E_f$ in a
  neighborhood $U_a$ in such a way that $overline(U)_a subset D$ and
  $overline(U)_a inter overline(U)_b = emptyset$ for $a != b$, $a, b in E_f$.
  Since the form $omega(f, overline(f))$ is closed in $D without E_f$,
  Corollary~@cor:cohomologous-forms-over-cycles and @eq:multiplicity-integral
  give us that
  $
    integral_(partial D) omega(f, overline(f))
    = sum_(a in E_f) integral_(partial U_a) omega(f, overline(f))
    = sum_(a in E_f) mu_a (f) = N(f, D).
  $
  Moreover, if $E_f != emptyset$, then $N(f, D) = k > 0$.

  2\. Suppose now that $partial f \/ partial z equiv 0$. In this case the
  integral on the right-hand side of @eq:logarithmic-residue is equal to zero,
  since $d f = (partial f \/ partial z) d z$ appears in the form
  $omega(f, overline(f))$. We show that $N(f, D)$ is also equal to zero, i.e.,
  $f$ has no zeros in $D$. Suppose the opposite: $f(a) = 0$ for some point
  $a in D$. Since $f|_(partial D) != 0$, there is a holomorphic mapping
  $g: overline(D) -> CC^n$ such that $g(a) = 0$, $|g| < |f|$ on $partial D$, and
  $partial (f + g) \/ partial z equiv.not 0$ (for example, we can take the
  linear mapping $g(z) = lambda(z - a)$, where $lambda = norm(lambda_(j k))$ is
  a matrix with sufficiently small elements such that
  $rank norm(partial f_j (a) \/ partial z_k + lambda_(j k)) = n$).
  $
    integral_(partial D) omega(f, overline(f))
    = integral_(partial D) omega(f + g, overline(f + g)) >= 1.
  $
  This is a contradiction.
]

#ends-with-square[The proof of Theorem~@th:rouche-principle follows from
  Theorem~@th:logarithmic-residue and Lemma~@lem:rouche-integrals.]

#proof(title: [Proof of Proposition~@prop:multiple-zero.])[
  By the definition of the multiplicity of an isolated zero, $mu_a (f) >= 0$.
  Observe that $partial f \/ partial z equiv.not 0$, for otherwise there would
  not be any isolated zeros at all (see part 2 of the proof of
  Theorem~@th:logarithmic-residue). There is a point $z_0 in U_a$ such that
  $(partial f \/ partial z)|_(z_0) != 0$ and $|f(z_0)| < min_(partial U_a) |f|$.
  It now follows from Proposition~@prop:simple-zero-multiplicity and
  Theorem~@th:rouche-principle that $mu_a (f) >= 1$. If $mu_a (f) = 1$, then for
  any $zeta in B_epsilon$, where $epsilon$ is sufficiently small,
  @eq:shifted-mapping has exactly one zero in #source(38) $U_a$, i.e.,
  @eq:holomorphic-mapping is one-to-one in a neighborhood of $a$. Then Osgood's
  theorem (see Proposition~@prop:osgood below) gives us that this mapping is
  biholomorphic in a neighborhood of $a$, and
  $(partial f \/ partial z)|_a != 0$.
]

We explain the geometric meaning of formula @eq:logarithmic-residue. Consider
the $(n - 1)$-dimensional closed piecewise smooth surface (cycle)
$S = {x: x = x(t), t in II^(n - 1)}$ in $RR^n without {0}$, where
$
  II^(n - 1)
  = {t: t = (t_1, ..., t_(n - 1)), 0 <= t_j <= 1, j = 1, ..., n - 1}, \
  x(t_1, ..., 0, ..., t_(n - 1)) = x(t_1, ..., 1, ..., t_(n - 1)), \
  j = 1, ..., n - 1.
$
#new-par
The #index-mark("Index of a surface with respect to the origin")_index of the
surface $S$ with respect to the origin_ is defined to be the number
#skipped-formula-number
$
  J_0 (S) & = 1 / Sigma_n integral_S 1 / (|x|^n)
            sum_(j = 1)^n (-1)^(j - 1) x_j d x_([j]) \
          & = 1 / Sigma_n integral_(II^(n - 1))
            1 / (|x(t)|^n)
            mat(
              delim: "|",
              x_1 (t), , x_n (t);
              x'_11 (t), dots.c, x'_(n 1) (t);
              dots, dots, dots;
              x'_(1 n-1), dots.c, x'_(n n-1) (t)
            )
            d t,
$ <eq:surface-index>
where $Sigma_n = n pi^(n\/2) \/ Gamma(n\/2 + 1)$ is the measure (volume) of the
unit sphere in $RR^n$. The integrand form in @eq:surface-index expresses the
measure of the projection of a surface element onto the unit sphere about zero
(the solid angle under which this element is "seen" from the origin). The
integral @eq:logarithmic-residue can be represented in the form
$
  integral_(partial D) omega(f, overline(f))
  & = integral_gamma omega(zeta, overline(zeta))
  = (n - 1)! / (2 pi i)^n integral_gamma 1 / (|zeta|^(2n))
  sum_(j = 1)^n (-1)^(j - 1) overline(zeta)_j d overline(zeta)_([j])
  and d zeta \
  & = 1 / Sigma_(2n) integral_gamma 1 / (|zeta|^(2n))
  [sum_(j = 1)^n (-1)^(j - 1) u_j d u_([j]) and d v
    + sum_(j = 1)^n (-1)^(j + n - 1) v_j d u and d v_([j]) \
    & + i (sum_(j = 1)^n (-1)^j v_j d u_([j]) and d v
      + sum_(j = 1)^n (-1)^(j + n - 1) u_j d u and d v_([j]))]
  = J_0 (S),
$
where $gamma = f(partial D)$ and $zeta_j = u_j + i v_j$, $j = 1, ..., n$; here
$
  & integral_gamma 1 / (|zeta|^(2n))
    (sum_(j = 1)^n (-1)^j v_j d u_([j]) and d v
      + sum_(j = 1)^n (-1)^(j + n - 1) u_j d u and d v_([j])) \
  & quad = (-1)^(n - 1) integral_gamma
    d ((sum_(j = 1)^n d u_([j]) and d v_([j])) / ((2n - 2) |zeta|^(2n - 2)))
    = 0,
$
#source(39)
by Corollary~@cor:exact-form-over-cycle. We can thus formulate the following
statement.

#theorem(title: [#index-mark(
    "Principle",
    sub: "argument",
    target: <th:argument-principle>,
  )The argument principle])[
  If the conditions of Theorem~@th:logarithmic-residue hold, then the number of
  zeros of the mapping $f$ in @eq:holomorphic-mapping in the domain $D$ is equal
  to the index with respect to the origin of the image $f(partial D)$ of the
  boundary of $D$ under $f$ (the number of "circuits" of the surface
  $f(partial D)$ around 0).
] <th:argument-principle>

#ends-with-square[This fact can also be obtained from topological
  considerations. Since the mapping @eq:holomorphic-mapping has no zeros on
  $partial D$, the image $f(partial D)$ of the cycle $partial D$ under this
  mapping is in $Z_(2n - 1) (CC^n without {0})$. Consequently,
  $f(partial D) tilde.op N dot.c partial B_epsilon$, where $N$ is an integer
  indicating how many times the cycle $f(partial D)$ "goes around" zero. From
  @eq:martinelli-bochner, Theorem~@th:change-of-variables, and
  Corollary~@cor:cohomologous-forms-over-cycles it now follows that
  $N = N(f, D)$.]
