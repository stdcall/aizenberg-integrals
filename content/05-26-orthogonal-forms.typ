#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[Forms orthogonal to holomorphic functions. Lewy's equation.
  General form of integral representation formulas for holomorphic functions]
<sec:orthogonal-forms>

#source(233)
#point <pt:orthogonal-forms-intro> Let $D$ be a bounded domain with smooth
boundary in $CC^n$. We are interested in #index-mark(
  "Form",
  sub: "differential",
  subsub: "orthogonal to holomorphic forms",
)forms $alpha in C_(p, n - 1) (partial D)$ orthogonal to holomorphic forms in
the sense that
$
  integral_(partial D) f and alpha = 0,
$ <eq:orthogonality>
for all $f in A_(n - p) (overline(D))$ ($A_(n - p) (overline(D))$ is the space
of forms of type $(n - p, 0)$ with coefficients holomorphic on $overline(D)$).

For $n = 1$ a function $alpha in C(partial D)$ satisfying condition
@eq:orthogonality for all forms $f(z) d z$ with $f in A(overline(D))$ extends to
a function $alpha in A_C (D)$ (see @bib:Muskhelishvili1962, §29.3).

In this section we present an analogue of this assertion for $n > 1$ along with
a consequence of it that gives a general form for the logarithmic residue
formula, in particular, a general form for integral representations of
holomorphic functions of several complex variables. At the end of the section a
necessary and sufficient condition is given for the (local) solvability of
Lewy's equation.

#point <pt:modulus-of-continuity> We need some notation and definitions for what
follows. A #index-mark("Modulus of continuity")_modulus of continuity_ is
defined to be a continuous increasing concave function $theta$ on
$[0, infinity)$ that equals 0 at 0.

Let $F$ be a compact subset of $RR^n$, and $m$ an integer, $m >= 0$. If
$g in C^((m)) (F)$, then a modulus of continuity $theta$ is called #index-mark(
  "Modulus of continuity",
  sub: "of a function in $C^((m)) (F)$",
)_a modulus of continuity of the function_ $g$ if for $x, y in F$ and
$|J| <= m$
$
  |D^J g(x) - D^J g(y)| = O(1) theta(|x - y|).
$
Here $J = (i_1, ..., i_n)$ is a multi-index, and
$
  D^J = (partial^(|J|)) / (partial x_1^(i_1) dots.c partial x_n^(i_n)).
$
#new-par
If $D$ is a bounded domain in $RR^n$ and $m$ is an integer, then
$tilde(C)^((m)) (D)$#notation-mark($tilde(C)^((m)) (D)$, sort: "C~m D") denotes
the space of complex-valued infinitely differentiable functions $g$ on $D$ for
which there exists a modulus of continuity $theta$ such that for
$x, y in D$
$
  |D^J g(x) - D^J g(y)| = O(1) theta(|x - y|) quad "for" |J| <= m
$ <eq:modulus-derivatives>
and
$
  |D^J g(x)| <= (O(1) theta(rho(x, partial D))) / (rho(x, partial D)^(|J| - m))
  quad "for" |J| > m.
$ <eq:boundary-growth>
Here $rho(x, partial D) = inf_(xi in partial D) |xi - x|$ is the Euclidean
distance from $x$ to $partial D$.

#source(234)
A modulus of continuity $theta$ appearing in @eq:modulus-derivatives and
@eq:boundary-growth is called #index-mark(
  "Modulus of continuity",
  sub: "of a function in $tilde(C)^((m)) (D)$",
)_a modulus of continuity of the function_ $g in tilde(C)^((m)) (D)$. It is not
hard to show that for $m >= 0$ any function $g in tilde(C)^((m)) (D)$ extends to
a function $g_1 in tilde(C)^((m)) (overline(D))$ with the same modulus of
continuity as $g$. We regard $tilde(C)^((m)) (D)$ as imbedded in
$C^((m)) (overline(D))$ if $m >= 0$. If $D subset CC^n$, then
$tilde(C)_(p, q)^((m)) (D)$#notation-mark(
  $tilde(C)_(p, q)^((m)) (D)$,
  sort: "C~m p q D",
) denotes the space of forms of type $(p, q)$ with coefficients in
$tilde(C)^((m)) (D)$. #index-mark(
  "Modulus of continuity",
  sub: "of a form in $tilde(C)_(p, q)^((m)) (D)$",
)#index-mark(
  "Modulus of continuity",
  sub: "of a form in $C_(p, q)^((m)) (F)$",
)_A modulus of continuity of a form_ in $tilde(C)_(p, q)^((m)) (D)$ or
$C_(p, q)^((m)) (F)$ is defined to be a common modulus of continuity for its
coefficients. Since for any finite set ${theta_1, ..., theta_k}$ of moduli of
continuity there is a modulus of continuity $theta$ (see @bib:Malgrange1967,
Chapter~I, §2) such that $theta_j = O(1) dot.c theta$, any form in
$tilde(C)_(p, q)^((m)) (D)$ or $C_(p, q)^((m)) (F)$ has a modulus of continuity.

If $m = 0$ and a form has modulus of continuity $t^tau$, where $0 < tau <= 1$,
then we say that #index-mark(
  "Form",
  sub: "differential",
  subsub: "satisfying a Hölder condition",
)_the form satisfies a Hölder condition with exponent_ $tau$.

Let $D$ be a domain in $RR^n$ with boundary of class $C^((l))$, $l >= 1$, i.e.,
$D = {x in Omega: rho(x) < 0}$, where $overline(D) relcomp Omega$,
$rho in tilde(C)^((l)) (Omega)$, and $grad rho|_(partial D) != 0$. By Whitney's
theorem (see Theorem~3.2 and @bib:Malgrange1967, Supplement~3.3 to Chapter~I),
there is a function $tilde(rho) in C^((l)) (Omega) inter tilde(C)^((l)) (D)$
coinciding with $rho$ on $partial D$ up to derivatives of order $l$; therefore,
we assume in what follows that $D$ is given by a function
$rho in C^((l)) (Omega) inter tilde(C)^((l)) (D)$.

Since $grad rho|_(partial D) != 0$, we have
$rho(x, partial D) = O(1) |rho(x)| = O(1) rho(x, partial D)$, so
@eq:boundary-growth is equivalent to the condition #tagged-equation(
  [26.3$'$],
  $
    |D^J g(x)| <= (O(1) theta(|rho(x)|)) / (|rho(x)|^(|J| - m))
    quad "for" |J| > m.
  $,
) <eq:boundary-growth-rho>
#new-par
#point <pt:orthogonal-description> *Description of forms orthogonal to
holomorphic forms.*

#theorem(title: [Dautov])[
  Suppose that $D = {z: rho(z) < 0}$ is a strictly pseudoconvex domain in $CC^n$
  ($n >= 2$) with boundary of class $C^(m + 2)$ ($m >= 0$), and
  $alpha in C_(p, n - 1) (partial D)$ satisfies @eq:orthogonality. Suppose also
  that
  #enum(numbering: "1)")[
    $alpha in C_(p, n - 1)^((m)) (partial D)$ for $m >= 1$, or
  ][
    $alpha$ satisfies a Hölder condition of order $tau$, $0 < tau <= 1$, for
    $m = 0$.
  ]
  #new-par
  Then there exists a form $beta = beta_1 + dbar rho and sqrt(|rho|) beta_2$,
  with $beta_1 in tilde(C)_(p, n - 1)^((m)) (D)$ and
  $beta_2 in tilde(C)_(p, n - 2)^((m - 1)) (D)$, such that $dbar beta = 0$ and
  $beta_1|_(partial D) = alpha$. Here a modulus of continuity of the form
  $alpha$ is also a modulus of continuity of the forms $beta_1$ and $beta_2$.
] <th:dautov-extension>

#remark[
  If $m >= 1$, then $beta_2 in C_(p, n - 2) (overline(D))$ and, therefore,
  $beta|_(partial D) = beta_1|_(partial D) = alpha$. But if $m = 0$ and
  $tau > 1/2$, then it follows from @eq:boundary-growth-rho that
  $
    sqrt(|rho(z)|) |beta_2 (z)|
    = O(1) (|rho(z)|^(1\/2 + tau)) / (|rho(z)|)
    = O(1) |rho(z)|^(tau - 1\/2).
  $
  Therefore, $sqrt(|rho|) beta_2$ extends continuously to $overline(D)$ and
  $sqrt(|rho|) beta_2|_(partial D) = 0$; consequently,
  $beta|_(partial D) = alpha$ also in this case. Thus, the form $alpha$ is the
  restriction to $partial D$ of a #source(235) continuous $dbar$-closed form
  when $m >= 1$ or when $m = 0$ and $tau > 1/2$. In the general case, for any
  $f in C_(n - p, 0)^((1)) (overline(D))$ we have
  $
    (-1)^(p + n - 1) integral_D beta and dbar f
    & = lim_(delta -> 0) integral_(D_(-delta)) d(beta and f)
    = lim_(delta -> 0) integral_(partial D_(-delta)) beta and f \
    & = integral_(partial D) beta_1 and f + lim_(delta -> 0)
    integral_(partial D_(-delta)) dbar rho and sqrt(|rho|) beta_2 and f \
    & = integral_(partial D) beta_1 and f - lim_(delta -> 0)
    integral_(partial D_(-delta)) partial rho and sqrt(|rho|) beta_2 and f \
    & = integral_(partial D) alpha and f.
  $ <eq:generalized-extension>
  Here $D_(-delta) = {z: rho(z) < -delta}$. We have used the equality
  $dbar rho|_(partial D) + partial rho|_(partial D) = d rho|_(partial D) = 0$
  and the fact that the form $partial rho and beta_2 and f$ has type
  $(n + 1, n - 2)$; consequently, it vanishes.

  Equality @eq:generalized-extension can be taken as the definition of the
  $dbar$-closed extension of a form $alpha$ in the case when this extension
  cannot be made a continuous form on $D$. Hence, in the general case as well
  $alpha$ is the restriction (in the generalized sense) of the form $beta$ to
  $partial D$.
]

We give without proof an assertion containing information about $dbar$-closed
extension of forms in the case $m = 0$ and $tau = 0$. Some needed definitions
are considered first. Let $alpha in L_(p, n - 1)^1 (partial D)$. Represent
$alpha$ in the form
$
  alpha = sum'_(J, frak(J)) alpha_(J, frak(J)) (z)
  d z_J and d overline(z)_frak(J)
$
and let
$
  |alpha(z)| = sum'_(J, frak(J)) |alpha_(J, frak(J)) (z)|, wide
  tilde(f)(z, t) = sum'_(J, frak(J)) tilde(f)_(J, frak(J)) (z, t),
$
where $tilde(f)_(J, frak(J)) (z, t)$ is the #index-mark(
  "Function",
  sub: "maximal",
  subsub: "Hörmander",
)_Hörmander maximal function_:
$
  tilde(f)_(J, frak(J)) (z, t) = sup_(delta >= t)
  1 / (sigma_(2n - 1) (B_(z, delta))) integral_(B_(z, delta))
  |alpha_(J, frak(J)) (zeta)| d sigma_(2n - 1) (zeta).
$
Here $B_(z, delta)$ is a #index-mark(
  "\"Ellipsoid\"",
  sub: "Hörmander",
)_Hörmander "ellipsoid"_, i.e., the set of points $zeta in partial D$ whose
distance to the complex plane through $z$ tangent to $partial D$ is at most
$delta$.

#theorem(title: [Khenkin])[
  Suppose that $D$ is a strictly pseudoconvex domain in $CC^n$, and
  $alpha in L_(p, n - 1)^1 (partial D)$ satisfies condition @eq:orthogonality.
  Then there exists a form $beta in C_(p, n - 1) (D)$, that is a $dbar$-closed
  extension of the form $alpha$ and has the property that
  $
    lim_(epsilon -> 0) integral_(partial D_(-epsilon)) beta(z) and phi(z)
    = integral_(partial D) alpha(z) and phi(z)
  $
  #source(236)
  for all $phi in C_(n - p, 0) (overline(D))$. Moreover,
  $
    integral_(partial D_(-epsilon))
    (|beta(z) and dbar rho(z)| + |rho(z)|^(1\/2) |beta(z)|)
    d sigma_(2n - 1) (z)
    = O(1) norm(alpha)_(L^1 (partial D))
  $
  and
  $
    |beta(z) and dbar rho(z)| + |rho(z)|^(1\/2) |beta(z)|
    = O(1) tilde(f)(tilde(z)(z), |rho(z)|),
  $
  where $tilde(z)(z)$ is a point of $partial D$ closest to $z$.
] <th:khenkin-extension>

Let us prove Theorem~@th:dautov-extension for strictly convex domains. In the
general case there are additional technical difficulties which we discuss at the
end of this subsection.

#lemma[
  If $D$ is a domain in $RR^n$ with boundary of class $C^((l))$, $l >= 1$, and
  $g in tilde(C)^((m)) (D)$, $m <= l - 2$, then
  $rho g in tilde(C)^((m + 1)) (D)$. If $m >= -1$, then
  $rho g|_(partial D) = 0$. Moreover, a modulus of continuity of $g$ is a
  modulus of continuity of $rho g$.
] <lem:rho-times-g>

#proof[
  Condition @eq:modulus-derivatives for $|J| <= m$ and condition
  @eq:boundary-growth for $|J| > m + 1$ follow at once for $rho g$ from the
  Leibniz formula and conditions @eq:modulus-derivatives and @eq:boundary-growth
  for the functions $g$ and $rho$. Suppose that $|J| = m + 1$. By the Leibniz
  formula,
  $
    D^J (g rho)(x) = sum_(frak(J) <= J) binom(J, frak(J))
    D^frak(J) rho(x) dot.c D^(J - frak(J)) g(x).
  $
  Here, as usual, $frak(J) <= J$ means that $j_m <= i_m$ for all
  $m = 1, ..., n$, and
  $binom(J, frak(J)) = binom(i_1, j_1) dots.c binom(i_n, j_n)$.

  For terms with index $frak(J) != 0$ condition @eq:modulus-derivatives for $g$
  and $rho$ gives an estimate of the type @eq:modulus-derivatives. It remains to
  prove that
  $
    |rho(x) h(x) - rho(y) h(y)| = O(1) theta(|x - y|),
  $ <eq:rho-h-continuity>
  where $theta$ is a modulus of continuity of $g$, and $h = D^J g$. It can be
  assumed that $rho(x, partial D) >= rho(y, partial D)$. Denote
  $rho(x, partial D)$ by $d$. Assume first that $d <= 2|x - y|$. We note that
  the concavity of $theta$ and the equality $theta(0) = 0$ imply that
  $theta(lambda t) <= lambda theta(t)$ for $lambda >= 1$. Since $theta$ is
  monotone and concave, @eq:boundary-growth and @eq:boundary-growth-rho imply
  that
  $
    |rho(x) h(x) - rho(y) h(y)|
    & = O(1) (theta(d) + theta(rho(y, partial D))) \
    & = O(1) theta(d) = O(1) theta(2|x - y|) = O(1) theta(|x - y|),
  $
  i.e., @eq:rho-h-continuity holds in this case.

  If $d > 2|x - y|$, then the segment $Gamma$ joining $x$ and $y$ lies in the
  ball $B_(d\/2) (x)$; hence, $3/2 d >= rho(tilde(x), partial D) >= 1/2 d$ for
  any $tilde(x) in Gamma$. From @eq:boundary-growth for $tilde(x) in Gamma$ and
  from #source(237) the monotonicity of $theta$ we get
  $
    lr(|grad(rho h)(tilde(x))|)
    & = |rho(tilde(x)) grad h(tilde(x)) + h(tilde(x)) grad rho(tilde(x))| \
    & = O(1) (theta(rho(tilde(x), partial D))) / (rho(tilde(x), partial D))
    = O(1) (theta(d)) / d.
  $
  Furthermore,
  $
    |rho(x) h(x) - rho(y) h(y)|
    & = lr(|integral_0^1 d / (d t) [(rho h)(y + t(x - y))] d t|) \
    & = lr(|integral_0^1 (grad(rho h)(y + t(x - y)), (x - y)) d t|) \
    & = O(1) (|x - y|) / d theta(d) = O(1) theta(|x - y|).
  $
  At the last step we used the inequality $theta(lambda t) <= lambda theta(t)$
  for $t = |x - y|$ and $lambda = d \/ |x - y| >= 2$.
]

#lemma[
  Suppose that $D$ is a bounded domain in $CC^n$ with boundary of class
  $C^((l))$, $l >= 1$, and $alpha in C_(p, n - 1)^((m)) (partial D)$,
  $0 <= m < l$. Then there exists a form
  $tilde(alpha) in tilde(C)_(p, n - 1)^((m)) (D)$, such that
  $tilde(alpha)|_(partial D) = alpha$,
  $dbar tilde(alpha)(zeta) = rho^(m - 1) (zeta) dot.c kappa(zeta)$,
  $kappa in tilde(C)_(p, n)^((0)) (D)$, and $kappa(zeta) = 0$ for
  $zeta in partial D$. Moreover, a modulus of continuity of $alpha$ is a modulus
  of continuity of the forms $tilde(alpha)$ and $kappa$.
] <lem:boundary-form-extension>

#proof[
  Since $dbar rho in tilde(C)_(0, 1)^((l - 1)) (D)$ and $dbar rho != 0$ on
  $partial D$, there is a $delta > 0$ such that any form
  $mu in tilde(C)_(p, n)^((m - 1)) (overline(D))$ vanishing for
  $rho(zeta) < -delta$ satisfies $mu(zeta) = dbar rho(zeta) and nu(zeta)$, for
  some #room[$nu in tilde(C)_(p, n - 1)^((m - 1)) (D)$].

  By Whitney's theorem (see Theorem~3.2 and @bib:Malgrange1967, Supplement~3.3
  to Chapter~I), there is a form
  $alpha_0 in tilde(C)_(p, n - 1)^((m)) (overline(D))$ with the same modulus of
  continuity as $alpha$ such that $alpha_0|_(partial D) = alpha$. Multiplying
  (if necessary) by an infinitely differentiable function identically equal to 1
  in a neighborhood of $partial D$ and identically equal to 0 for
  $rho(zeta) <= -delta$, we obtain the equality $alpha_0 equiv 0$ for
  $rho(zeta) < -delta$.

  Lemma~@lem:rho-times-g and the equality
  $dbar alpha_0 (zeta) = rho^(-1) (zeta) kappa$, where
  $kappa(zeta) = rho(zeta) dbar alpha_0 (zeta)$, conclude the proof of the lemma
  when $m = 0$.

  Suppose that $m >= 1$. Then $dbar alpha_0 = dbar rho(zeta) and kappa_0 (zeta)$
  for $zeta in overline(D)$ and
  $kappa_0 in tilde(C)_(p, n - 1)^((m - 1)) (overline(D))$. Let
  $alpha_1 = alpha_0 - rho kappa_0$. By Lemma~@lem:rho-times-g,
  $alpha_1 in tilde(C)_(p, n - 1)^((m)) (D)$. We have
  $
    dbar alpha_1 = dbar alpha_0 - dbar rho and kappa_0 (zeta)
    - rho dbar kappa_0 = -rho dbar kappa_0.
  $
  By Lemma~@lem:rho-times-g again,
  $rho dbar kappa_0 in tilde(C)_(p, n)^((0)) (D)$ and
  $rho(zeta) dbar kappa_0 (zeta) = 0$ for $zeta in partial D$. For $m = 1$ the
  proof is finished. If $m >= 2$, we represent $dbar kappa_0$ in the form
  $dbar rho and kappa_1$ and set $alpha_2 = alpha_1 + 1/2 rho^2 kappa_1$.
  Application of this device $m$ times gives us the lemma.
]

#source(238)
Suppose now that $D$ is a strictly convex domain with boundary of class
$C^((m + 2))$ ($m >= 0$), and the functions $P_j$ ($j = 1, ..., n$), $Phi$,
$tilde(Phi)$, and $alpha_k$ are those defined in @sec:dbar-problem. We introduce
the functions
$
  Phi^* (zeta, z) = -Phi(z, zeta), wide
  tilde(Phi)^* (zeta, z) = -tilde(Phi)(z, zeta), \
  alpha_k^* (zeta, z) = alpha_k (z, zeta),
$
and the vector-valued functions
$
  u^* (zeta, z) = (P(z)) / (Phi^* (zeta, z)), \
  eta^* (zeta, z, lambda) = -eta(z, zeta, lambda)
  = (1 - lambda) t + lambda u^*,
$
where, as earlier,
$t(zeta, z) = (overline(zeta) - overline(z)) \/ |zeta - z|^2$.

Consider the following operators for $mu in L_(p, n)^1 (D)$:
$
  (G_p^(* k) mu)(z) = & -integral_(D_zeta) mu(zeta) and alpha_k^* (zeta, z)
                        U_(p, n - 1) (zeta, z) \
                      & + (-1)^(p + n)
                        integral_(D_zeta times [0, 1]_lambda) mu(zeta)
                        and dbar_z alpha_k^*
                        and tilde(W)_(p, n - 2) (eta^*, zeta, z, lambda).
$ <eq:operator-g-star>
The kernel $U_(p, n - 1)$ was defined in @sec:martinelli-bochner-koppelman, and
$tilde(W)_(p, n - 2)$ in @sec:dbar-problem.

It follows from Lemma~@lem:kernel-difference that the form
$
  dbar_z alpha_k^* and (tilde(W)_(p, n - 2) (eta^*, zeta, z, lambda)
    - W_(p, n - 2) (eta^*, zeta, z))
$
is a linear combination of forms like
$
  dbar rho and rho^(k - 1) (z) (Phi^* / tilde(Phi)^*)^s
  ((overline(zeta)_j - overline(z)_j) phi(zeta, z, lambda))
  / (|zeta - z|^(2r) (tilde(Phi)^*)^(n - r + k))
$ <eq:kernel-terms-first>
and
$
  rho^k (z) (Phi^* / tilde(Phi)^*)^s
  ((overline(zeta)_j - overline(z)_j)(zeta_i - z_i) Psi(zeta, z, lambda))
  / (|zeta - z|^(2r) (tilde(Phi)^*)^(n - r + k + 1)),
$ <eq:kernel-terms-second>
where $s = 0, 1, ..., j = 1, ..., n$, $r = 0, ..., n - 1$, and $phi$ and $Psi$
are forms whose coefficients are derivatives of $rho(z)$ of order at most two,
multiplied by a polynomial in $lambda$.

Just as in the remark after @eq:dbar-solution-operator, we get that the second
integral in @eq:operator-g-star is proper.

#lemma[
  Suppose that $mu in L_(p, n)^1 (D)$ and
  $
    integral_D mu and f = 0
  $ <eq:mu-orthogonality>
  #source(239)
  for any $f in A_(n - p) (overline(D))$. Then $gamma_k = G_p^(* k) mu$ is a
  solution of the equation $dbar gamma_k = mu$ for any $k >= 0$.
] <lem:dbar-solution-orthogonal>

#proof[
  Using @eq:koppelman-weighted with $phi = alpha_k^*$, we get
  $
    mu(z) = & -dbar_z integral_(D_zeta) mu(zeta) and alpha_k^*
              U_(p, n - 1) (zeta, z) \
            & + (-1)^(p + n) integral_(D_zeta) mu(zeta) and dbar_z alpha_k^*
              and U_(p, n - 1) (zeta, z).
  $ <eq:koppelman-alpha-star>
  By Stokes' formula,
  $
    & integral_(D_zeta times [0, 1]_lambda) d_(zeta, lambda) (mu(zeta)
        and dbar_z alpha_k^* and tilde(W)_(p, n - 1) (eta^*, zeta, z, lambda)) \
    & quad = -integral_(D_zeta) mu(zeta) and dbar_z alpha_k^* (zeta, z)
      and U_(p, n - 1) (zeta, z) \
    & quad + integral_(D_zeta) mu(zeta) and dbar_z alpha_k^*
      and W_(p, n - 1) (u^*, zeta, z).
  $ <eq:stokes-w-tilde>
  It is not hard to see that
  $dbar_z alpha_k^* (zeta, z) and W_(p, n - 1) (u^*, zeta, z)$ is holomorphic in
  $zeta in overline(D)$ for $z in D$; therefore, @eq:mu-orthogonality implies
  that the last integral in @eq:stokes-w-tilde is equal to 0. Then
  $
    & integral_(D_zeta) mu(zeta) and dbar_z alpha_k^*
      and U_(p, n - 1) (zeta, z) \
    & quad = (-1)^(p + n) integral_(D_zeta times [0, 1]_lambda) mu(zeta)
      and dbar_z alpha_k^* and (dbar_zeta + d lambda)
      tilde(W)_(p, n - 1) (eta^*, zeta, z, lambda) \
    & quad = dbar_z integral_(D_zeta times [0, 1]_lambda) mu(zeta)
      and dbar_z alpha_k^* and tilde(W)_(p, n - 2) (eta^*, zeta, z, lambda).
  $
  #new-par
  Here, as in the proof of Theorem~@th:dbar-solution, we have used the equality
  $
    dbar_z tilde(W)_(p, q) = (-1)^(p + q) (dbar_zeta + d_lambda)
    tilde(W)_(p, q + 1).
  $
  It now follows from @eq:koppelman-alpha-star that $dbar G_p^(* k) mu = mu$.
]

#lemma[
  Suppose that $h in tilde(C)^((0)) (D)$, $h|_(partial D) = 0$; $m$, $k$, $r$,
  and $s$ are nonnegative integers with $r <= n - 1$, the function $phi(z)$ is a
  product of derivatives of $rho(z)$ of order at most two, and for $m = 0$ the
  function $h$ satisfies a Hölder condition of order $tau$ for some $tau$,
  $0 < tau <= 1$. Let
  $
    H_1 (z) = rho^k (z) integral_(D_zeta) rho^(m - 1) (zeta) h(zeta)
    (overline(zeta)_j - overline(z)_j)
    / (|zeta - z|^(2n) (tilde(Phi)^*)^k) (Phi^* / tilde(Phi)^*)^s d v(zeta);
  $
  #source(240)
  $
    H_2 (z) = rho^k (z) integral_(D_zeta) rho^(m - 1) (zeta) h(zeta)
    ((overline(zeta)_j - overline(z)_j)(zeta_l - z_l) phi(z))
    / (|zeta - z|^(2r) (tilde(Phi)^*)^(n - r + k + 1))
    (Phi^* / tilde(Phi)^*)^s d v(zeta);
  $
  $
    H_3 (z) = |rho(z)|^(k - 3\/2) integral_(D_zeta) rho^(m - 1) (zeta) h(zeta)
    ((overline(zeta)_j - overline(z)_j) phi(z))
    / (|zeta - z|^(2r) (tilde(Phi)^*)^(n - r + k))
    times (Phi^* / tilde(Phi)^*)^s d v(zeta).
  $
  If $k > m + 2$, then $H_1, H_2 in tilde(C)^((m)) (D)$,
  $H_1|_(partial D) = H_2|_(partial D) = 0$ and $H_3 in tilde(C)^((m - 1)) (D)$.
  Moreover, a modulus of continuity of $h$ is a modulus of continuity of $H_1$,
  $H_2$, and $H_3$.
] <lem:h-integrals>

#proof(title: none)[
  The proof is carried out for $H_3$; the arguments are similar in the remaining
  cases. The fact that $h|_(partial D) = 0$ and condition
  @eq:modulus-derivatives give us that
  $
    |h(zeta)| = O(1) theta(|rho(zeta)|),
  $
  where $theta$ is a modulus of continuity of $h$. By assumption,
  $theta(t) = t^tau$ when $m = 0$; therefore, the integral defining $H_3$
  converges.

  Suppose that $chi in C^((infinity)) (CC^n)$, $supp chi subset B_2 (0)$, and
  $chi(zeta) equiv 1$ in $B_1 (0)$. Fix $z^0 in D$, let
  $a = rho(z^0, partial D) \/ 3$, and let $H'$ and $H''$ be defined in the same
  way as $H_3$, except that the integrand must be multiplied by
  $chi(a^(-1) (zeta - z^0))$ and $1 - chi(a^(-1) (zeta - z^0))$, respectively.
  It is clear that $H = H' + H''$. Moreover, $a = O(1) rho(z^0) = O(1) a$.

  In the integral defining $H''$ we can differentiate under the integral sign
  for $z in B_a (z^0)$, because $1 - chi(a^(-1) (zeta - z^0)) equiv 0$ for
  $zeta in B_a (z^0)$. Let $D$ be a linear differential operator of order
  $s >= 0$ with constant coefficients. Using Leibniz' formula, inequalities
  @eq:distance-estimate and @eq:phi-tilde-bound, and conditions
  @eq:modulus-derivatives and @eq:boundary-growth for the function $rho$, we get
  $
    lr(D((H''(z)) / (|rho(z)|^(k - 3\/2))) |)_(z = z^0)
    = & O(1) integral_(D_zeta without B_a (z^0))
        |rho(zeta)|^(m - 1) |h(zeta)| \
      & times sum_(i_1 + i_2 + i_3 = s) (d v(zeta))
        / (|zeta - z^0|^(2n - 3 + i_1)
        |tilde(Phi)^* (zeta, z^0)|^(k + 1 + i_2) a^(i_3)) \
    = & O(1) sum_(i_1 + i_2 + i_3 = s) 1 / a^(i_1 + i_3)
        integral_(D_zeta) (|rho(zeta)|^(m - 1) theta(|rho(zeta)|) d v(zeta))
        / (|zeta - z^0|^(2n - 3) |tilde(Phi)^* (zeta, z^0)|^(k + 1 + i_2)).
  $
  #new-par
  Let $m >= 1$. From the fact that $theta$ is monotone and concave and from the
  equality $theta(0) = 0$ we get
  $
    theta(|rho(zeta)|)
    & <= (|rho(zeta)| dot.c |rho(z^0)|^(-1) + 1) dot.c theta(|rho(z^0)|) \
    & = O(1) (|rho(zeta)| a^(-1) + 1) dot.c theta(a).
  $
  #source(241)
  #new-par
  Therefore,
  $
    lr(D((H''(z)) / (|rho(z)|^(k - 3\/2))) |)_(z = z^0)
    = O(1) sum_(i_1 + i_2 = s) (theta(a)) / a^(i_1 + 1) integral_(D_zeta)
    ((|rho(zeta)|^m + a |rho(zeta)|^(m - 1)) d v(zeta))
    / (|zeta - z^0|^(2n - 3) |tilde(Phi)^* (zeta, z^0)|^(k + 1 + i_2)).
  $
  Just as in the proof of Theorem~@th:dbar-holder, we break up each integral
  into two parts: over $D_zeta without B_delta (z^0)$ and over
  $D inter B_delta (z^0)$, where $delta$ is chosen according to
  Lemma~@lem:eta-coordinates. In the integral over $D inter B_delta (z^0)$ we
  make a change of variables (see Lemma~@lem:eta-coordinates) and use
  @eq:phi-tilde-estimate. By Lemma~@lem:model-integral,
  $
    & lr(D((H''(z)) / (|rho(z)|^(k - 3\/2))) |)_(z = z^0) \
    & quad = O(1) sum_(i_1 + i_2 = s) (theta(a)) / a^(i_1 + 1)
      (J_(m, k + 1 + i_2, 2n - 3) (|rho(z^0)|) \
    & quad quad + a J_(m - 1, k + 1 + i_2, 2n - 3) (|rho(z^0)|) + O(1)) \
    & quad = O(1) sum_(i_1 + i_2 = s) (theta(a)) / a^(i_1 + 1)
      (|rho(z^0)|^(m - k - 1 - i_2 + 5\/2) \
    & quad quad + a |rho(z^0)|^(m - 1 - k - 1 - i_2 + 5\/2) + O(1))
      = O(1) (theta(a)) / a^(s + k - m - 1\/2).
  $
  We have $theta(t) = t^tau$ for $m = 0$; therefore,
  $
    & lr(D((H''(z)) / (|rho(z)|^(k - 3\/2))) |)_(z = z^0)
      = O(1) sum_(i_1 + i_2 = s) 1 / a^(i_1) integral_(D_zeta)
      (|rho(zeta)|^(tau - 1) d v(zeta))
      / (|zeta - z^0|^(2n - 3) |tilde(Phi)^* (zeta, z)|^(k + 1 + i_2)) \
    & quad = O(1) sum_(i_1 + i_2 = s) 1 / a^(i_1)
      J_(tau - 1, k + 1 + i_2, 2n - 3) (|rho(z^0)|) + O(1)
      = O(1) (a^tau) / a^(s + k - 1\/2).
  $
  #new-par
  The change of variables $zeta' = zeta - z$ in the integral defining $H'$ gives
  us that
  $
    H'(z) = & |rho(z)|^(k - 3\/2) integral_(B_(2a) (z^0 - z))
              rho^(m - 1) (zeta + z) h(zeta + z)
              chi(a^(-1) (zeta + z - z^0)) \
            & times (overline(zeta)_j phi(z))
              / (|zeta|^(2r) [tilde(Phi)^* (zeta + z, z)]^(n - r + k))
              ((Phi^* (zeta + z, z)) / (tilde(Phi)^* (zeta + z, z)))^s
              d v(zeta).
  $
  Differentiating under the integral sign, we have
  $
    D((H'(z)) / (|rho(z)|^(k - 3\/2)))
    = & O(1) integral_(B_(2a) (z^0 - z)) sum_(i_1 + dots.c + i_4 = s)
        rho^(m - i_1 - 1) (zeta + z) \
      & times (theta(rho(zeta + z))) / (|rho(zeta + z)|^(i_2))
        dot.c 1 / a^(i_3) dot.c (d v(zeta))
        / (|zeta|^(2n - 3) |tilde(Phi)^* (zeta + z, z)|^(k + 1 + i_4)).
  $
  #source(242)
  Here we have used Leibniz' formula, inequalities @eq:distance-estimate and
  @eq:phi-tilde-bound, and conditions @eq:modulus-derivatives and
  @eq:boundary-growth for the functions $rho$ and $h$. Let us make the inverse
  substitution:
  $
    & lr(D((H'(z)) / (|rho(z)|^(k - 3\/2))) |)_(z = z_0) \
    & quad = O(1) integral_(B_(2a) (z^0)) sum_(i_1 + dots.c + i_4 = s)
      (|rho(zeta)|^(m - 1 - i_1 - i_2) theta(|rho(zeta)|) d v(zeta))
      / (a^(i_3) |zeta - z^0|^(2n - 3)
      |tilde(Phi)^* (zeta, z^0)|^(k + 1 + i_4)).
  $
  Since $rho(z^0, partial D) = 3a$, it follows that
  $a <= rho(zeta, partial D) <= 5a$ for $zeta in B_(2a) (z^0)$; therefore,
  $
    |rho(zeta)|^(m - 1 - i_1 - i_2) theta(|rho(zeta)|)
    = O(1) a^(m - 1 - i_1 - i_2) theta(a),
  $
  and so
  $
    lr(D((H'(z)) / (|rho(z)|^(k - 3\/2))) |)_(z = z_0)
    & = sum_(i_1 + i_2 = s) theta(a) a^(m - i_1 - 1) integral_(D_zeta)
    (d v(zeta))
    / (|zeta - z^0|^(2n - 3) |tilde(Phi)^* (zeta, z^0)|^(k + 1 + i_2)) \
    & = O(1) theta(a) sum_(i_1 + i_2 = s) a^(m - 1 - i_1)
    J_(0, k + 1 + i_2, 2n - 3) (|rho(z^0)|) \
    & = O(1) (theta(a)) / a^(s + k - m - 1\/2).
  $
  Thus, for any $z^0 in D$
  $
    lr(D((H_3 (z)) / (|rho(z)|^(k - 3\/2))) |)_(z = z_0)
    & = lr(D((H'(z)) / (|rho(z)|^(k - 3\/2))) |)_(z = z_0)
    + lr(D((H''(z)) / (|rho(z)|^(k - 3\/2))) |)_(z = z_0) \
    & = O(1) (theta(a)) / a^(s + k - m - 1\/2)
    = O(1) (theta(|rho(z^0)|)) / (|rho(z^0)|^(s + k - m - 1\/2)).
  $
  This and Leibniz' formula give us that
  $
    D((H_3 (z)) / (|rho(z)|^(k - 1)))
    = D(|rho(z)|^(-1\/2) (H_3 (z)) / (|rho(z)|^(k - 3\/2)))
    = O(1) (theta(|rho(z)|)) / (|rho(z)|^(s + k - m)),
  $
  i.e. (compare with @eq:boundary-growth-rho),
  $H_3 dot.c |rho|^(1 - k) in tilde(C)^((m - k)) (D)$, and $theta$ is a modulus
  of continuity of $H_3 dot.c |rho|^(1 - k)$; applying @lem:rho-times-g $k - 1$
  times, we now get that $H_3 in tilde(C)^((m - 1)) (D)$, and $theta$ is a
  modulus of continuity of $H_3$.
]

#proof(title: [Proof of Theorem~@th:dautov-extension.])[
  Suppose that $D$ is a strictly convex domain and $alpha$ satisfies the
  conditions of the theorem. By Lemma~@lem:boundary-form-extension,
  $alpha = tilde(alpha)|_(partial D)$, where #source(243)
  $tilde(alpha) in tilde(C)_(p, n - 1)^((m)) (D)$ and
  $dbar tilde(alpha)(zeta) = rho^(m - 1) (zeta) kappa(zeta)$,
  $kappa in tilde(C)_(p, n)^((0)) (D)$, $kappa(zeta) = 0$ for
  $zeta in partial D$, and a modulus of continuity of $alpha$ is a modulus of
  continuity of the forms $tilde(alpha)$ and $kappa$. As in the proof of
  Lemma~@lem:h-integrals, we get that $dbar tilde(alpha) in L_(p, n)^1 (D)$. By
  @eq:orthogonality,
  $
    integral_D dbar tilde(alpha) and f = integral_D d(tilde(alpha) and f)
    = integral_(partial D) alpha and f = 0
  $ <eq:dbar-alpha-orthogonal>
  for all $f in A_(n - p) (overline(D))$. Lemma~@lem:dbar-solution-orthogonal
  gives us that $dbar tilde(alpha) = dbar gamma_k$, where
  $gamma_k = G_p^(* k) (dbar tilde(alpha))$ for any $k >= 0$. From the
  definition of the operator $G_p^(* k)$ (see @eq:operator-g-star), the
  definitions of $U_(p, n - 1)$ and the function $alpha_k^*$, and from
  @eq:kernel-terms-first and @eq:kernel-terms-second it follows that
  $gamma_k = gamma'_k + dbar rho and sqrt(|rho|) dot.c gamma''_k$, where
  $gamma'_k$ and $gamma''_k$ are forms of type $(p, n - 1)$ and $(p, n - 2)$,
  respectively, the coefficients of $gamma'_k$ are linear combinations of
  functions of the kind $H_1$ and $H_2$ in Lemma~@lem:h-integrals, and the
  coefficients of $gamma''_k$ are linear combinations of functions of the kind
  $H_3$. By Lemma~@lem:h-integrals,
  $
    gamma'_k in tilde(C)_(p, n - 1)^((m)) (D), wide
    gamma''_k in tilde(C)_(p, n - 2)^((m - 1)) (D)
  $
  and $gamma'_k|_(partial D) = 0$ for $k > m + 2$. Any form of the kind
  $tilde(alpha) - gamma_k$ for $k > m + 2$ can now be taken as $beta$, with
  $beta_1 = tilde(alpha) - gamma'_k$ and $beta_2 = -gamma''_k$, since
  $dbar beta = dbar(tilde(alpha) - gamma_k)
  = dbar tilde(alpha) - dbar gamma_k = 0$ and
  $beta_1|_(partial D) = tilde(alpha)|_(partial D) - gamma'_k|_(partial D)
  = alpha$.
]

#small-print[
  To prove the theorem in the general case it is necessary to construct an
  operator analogous to $G_p^(* k)$. It can be constructed just as $G_p^(* k)$
  was, except that as $P_j$ and $Phi$ we must take the functions obtained in
  Lemmas~@lem:support-function and @lem:hefer-decomposition, and as
  $tilde(Phi)(zeta, z)$ the function $(F(zeta, z) - rho(zeta)) G(zeta, z)$. The
  functions $P_j$, $tilde(Phi)$, and $Phi$ are defined for
  $(zeta, z) in U_(epsilon, delta)
  = {(zeta, z): |rho(zeta)| < delta; rho(z) < delta; |zeta - z| < epsilon}$
  for some $epsilon > 0$ and $delta > 0$. Repeating the arguments of
  Lemmas~@lem:dbar-solution-orthogonal and @lem:h-integrals, we find a
  $dbar$-closed form $tilde(beta)$ defined in $U inter D$, where $U$ is a
  neighborhood of $partial D$ satisfying the conditions of the theorem. We
  smooth out $tilde(beta)$ near the boundary of $U$ and get a form, again
  denoted by $tilde(beta)$, defined in $D$ and satisfying all the conditions of
  the theorem, except that $dbar tilde(beta) = 0$ in some (one-sided)
  neighborhood of $partial D$. It is then necessary to modify $tilde(beta)$ in
  roughly the same way the form $tilde(alpha)$ was modified in the proof of the
  theorem to get the form $beta$. This is done as follows.

  In some neighborhood $U_1$ of $partial D$ the form
  $
    tau(z) & = integral_(D_zeta times [0, 1]_lambda) dbar tilde(beta)(zeta)
             and tilde(W)_(p, n - 2) (eta^*, zeta, z, lambda) \
           & = integral_((D without U)_zeta times [0, 1]_lambda)
             dbar tilde(beta)(zeta)
             and tilde(W)_(p, n - 2) (eta^*, zeta, z, lambda)
  $ <eq:tau-form>
  is defined, where, as before
  $
    eta^* (zeta, z) = (1 - lambda) t + lambda u^* quad "and" quad
    u^* = P^* (zeta, z) \/ Phi^* (zeta, z).
  $
  Since $rho in C^((infinity)) (D)$, it follows from the proofs of
  Lemmas~@lem:support-function and @lem:hefer-decomposition that
  $tilde(W)_(p, n - 1) (eta^*, zeta, z, lambda)$ is infinitely differentiable
  for $(zeta, z, lambda) in (D without U) times U_1 times [0, 1]$; therefore,
  $tau in C_(p, n - 2)^((infinity)) (U_1 inter D)$. Smoothing out $tau$ near the
  boundary of $U_1$, we find a form, again denoted by $tau$, that is in
  $C_(p, n - 2)^((infinity)) (D)$ and is given by @eq:tau-form in some
  neighborhood $U_2$ of $partial D$.

  #source(244)
  For $z in U_2 inter D$
  $
    dbar tau(z)
    & = integral_(D_zeta times [0, 1]_lambda) dbar tilde(beta)(zeta)
    and dbar_z tilde(W)_(p, n - 2) (eta^*, zeta, z, lambda) \
    & = (-1)^(p + n - 1) integral_(D_zeta times [0, 1]_lambda)
    dbar tilde(beta)(zeta) and (dbar_zeta + d_lambda)
    tilde(W)_(p, n - 1) (eta^*, zeta, z, lambda) \
    & = -integral_(D_zeta times [0, 1]_lambda)
    d_(zeta, lambda) (dbar tilde(beta)(zeta)
      and tilde(W)_(p, n - 1) (eta^*, zeta, z, lambda)) \
    & = integral_(D_zeta) dbar tilde(beta)(zeta) and U_(p, n - 1) (zeta, z)
    - integral_(D_zeta) dbar tilde(beta) and W_(p, n - 1) (u^*, zeta, z).
  $
  #new-par
  If $z$ is close to $partial D$, then the vector-valued function
  $u^* (zeta, z)$ is holomorphic in $zeta in D_(rho(z)) = {w: rho(w) < rho(z)}$.
  It can be shown that the functions in $A(D_(rho(z)))$ can be uniformly
  approximated on $D without U$ by functions in $A(overline(D))$. From this and
  from the equality for $dbar tilde(beta)$ analogous to
  @eq:dbar-alpha-orthogonal, we get that
  $
    integral_(D_zeta) dbar tilde(beta) and W_(p, n - 1) (u^*, zeta, z) = 0
  $
  for $z$ close to $partial D$. Therefore, the form
  $
    tilde(gamma)(z) = integral_(D_zeta) dbar tilde(beta)(zeta)
    and U_(p, n - 1) (zeta, z) - dbar tau(z)
  $
  is in $C_(p, n - 1)^((infinity)) (D)$ and vanishes near $partial D$. The
  Martinelli-Bochner-Koppelman formula @eq:martinelli-bochner-koppelman now
  gives us that $beta = tilde(beta) - tilde(gamma)$ is the desired form.
]

#point <pt:dbar-exact-extension> It was shown in the preceding subsection that
any form orthogonal to holomorphic forms when integrated over the boundary of a
strictly pseudoconvex domain $D$ can be extended to a form that is $dbar$-closed
in $D$. Since the $dbar$-problem is solvable in a strictly pseudoconvex domain
(see Theorem~@th:finite-codimension), the following result looks natural.

#theorem[
  Suppose that $D$ is a strictly pseudoconvex domain in $CC^n$ and
  @eq:orthogonality holds for the form $alpha in C_(p, n - 1) (partial D)$. If
  $alpha$ satisfies a Hölder condition with exponent $tau > 1/2$, then
  $alpha = dbar gamma|_(partial D)$, where
  $gamma in C_(p, n - 2)^((1)) (overline(D))$.
] <th:dbar-exact-extension>

#proof(title: none)[
  The proof will be carried out for strictly convex domains. To do this it
  suffices to solve the equation $dbar gamma = beta$, where
  $beta = beta_1 + dbar rho and sqrt(|rho|) dot.c beta_2$ in
  Theorem~@th:dautov-extension. The solution of this equation gives the operator
  $G_(p, n - 1)^k$ (see @eq:dbar-solution-operator), but significant
  difficulties arise in estimating the derivatives. Therefore, we construct
  another solution.

  Let $Omega$ be a domain containing $D$ in which the estimates
  @eq:support-function-estimates–@eq:phi-tilde-estimate are valid. Using
  Lemma~@lem:boundary-form-extension, we find a form
  $tilde(beta)_1 in tilde(C)_(p, n - 1)^((0)) (Omega without D)$ such that
  $tilde(beta)_1|_(partial D) = beta_1|_(partial D)$ and
  $dbar tilde(beta)_1 = rho^(-1) (zeta) kappa(zeta)$, where
  $kappa in tilde(C)_(p, n)^((0)) (Omega without D)$ and $kappa(zeta) = 0$ for
  $zeta in partial D$. By Theorem~@th:dautov-extension, $theta(t) = t^tau$ is a
  modulus of continuity of the form $beta_1$ for some $tau$; consequently, the
  forms $tilde(beta)_1$ and $kappa$ also have this function as a modulus of
  continuity. It can be assumed that $tilde(beta)_1|_(partial Omega) = 0$.

  #source(245)
  From the Martinelli-Bochner-Koppelman formula @eq:martinelli-bochner-koppelman
  and the remark after Theorem~@th:dautov-extension, for $z in D$ we get
  $
    beta(z) = & integral_(partial D_zeta) beta_1 (zeta)
                and U_(p, n - 1) (zeta, z)
                - dbar_z integral_(D_zeta) beta(zeta)
                and U_(p, n - 2) (zeta, z), \
          0 = & -integral_(partial D_zeta) tilde(beta)_1 (zeta)
                and U_(p, n - 1) (zeta, z)
                - dbar_z integral_((Omega without D)_zeta)
                tilde(beta)_1 (zeta) and U_(p, n - 2) (zeta, z) \
              & - integral_((Omega without D)_zeta) dbar tilde(beta)_1 (zeta)
                and U_(p, n - 1) (zeta, z).
  $
  Adding these equalities and taking the equality
  $beta_1|_(partial D) = tilde(beta)_1|_(partial D)$ into account, we get that
  for $z in D$
  $
    & beta(z) = -integral_((Omega without D)_zeta) dbar tilde(beta)_1 (zeta)
      and U_(p, n - 1) (zeta, z) \
    & quad - dbar_z [integral_(D_zeta) beta(zeta) and U_(p, n - 2) (zeta, z)
        + integral_((Omega without D)_zeta) tilde(beta)_1 (zeta)
        and U_(p, n - 2) (zeta, z)].
  $ <eq:beta-representation>
  A transformation of the first integral in @eq:beta-representation gives us
  $
    & integral_((Omega without D)_zeta) dbar tilde(beta)_1 (zeta)
      and U_(p, n - 1) (zeta, z) \
    & quad = -integral_((Omega without D)_zeta times [0, 1]_lambda)
      d_(zeta, lambda) (dbar tilde(beta)_1 (zeta)
        and tilde(W)_(p, n - 1) (eta, zeta, z, lambda)) \
    & quad + integral_((Omega without D)_zeta) dbar tilde(beta)_1 (zeta)
      and W_(p, n - 1) (u, zeta, z).
  $
  Here, as before, $u(zeta, z) = P(zeta) \/ Phi(zeta, z)$; and
  $eta = (1 - lambda) t + lambda u$.

  Since $u$ is holomorphic in $z in D$ for $zeta in.not D$,
  $W_(p, n - 1) (u, zeta, z) = 0$. Further,
  $
    & integral_((Omega without D)_zeta) dbar tilde(beta)_1 (zeta)
      and U_(p, n - 1) (zeta, z) \
    & quad = (-1)^(p + n + 1)
      integral_((Omega without D)_zeta times [0, 1]_lambda)
      dbar tilde(beta)_1 (zeta) and (dbar_zeta + d_lambda)
      tilde(W)_(p, n - 1) (eta, zeta, z, lambda) \
    & quad = dbar_z integral_((Omega without D)_zeta times [0, 1]_lambda)
      dbar tilde(beta)_1 (zeta)
      and tilde(W)_(p, n - 2) (eta, zeta, z, lambda).
  $
  #source(246)
  This and @eq:beta-representation give us that $dbar gamma(z) = beta$ for
  $z in D$, where
  $
    gamma(z) = & -integral_(D_zeta) beta(zeta) and U_(p, n - 2) (zeta, z)
                 - integral_((Omega without D)_zeta) tilde(beta)_1 (zeta)
                 and U_(p, n - 2) (zeta, z) \
               & - integral_((Omega without D)_zeta times [0, 1]_lambda)
                 dbar tilde(beta)_1 (zeta)
                 and tilde(W)_(p, n - 2) (eta, zeta, z, lambda).
  $ <eq:gamma-solution>
  #new-par
  We show that $gamma$ is the desired form. In the first two integrals in
  @eq:gamma-solution the coefficients of the kernel are of the kind
  $(overline(zeta)_j - overline(z)_j) \/ |zeta - z|^(2n)$, while the forms
  $beta$ and $beta_1$ satisfy a Hölder condition; therefore, the forms defined
  by these integrals are in $C_(p, n - 2)^((1)) (overline(D))$ (see
  Proposition~@prop:potentials-holder).

  Consider the third integral in @eq:gamma-solution. Using
  @eq:kernel-difference-forms, we integrate with respect to $lambda in [0, 1]$
  and get that this integral is a linear combination of forms with coefficients
  like
  $
    F(z) = integral_((Omega without D)_zeta)
    ((overline(zeta)_j - overline(z)_j) phi(zeta))
    / (|zeta - z|^(2(n - 1)) Phi(zeta, z)) dot.c (kappa(zeta)) / (rho(zeta)),
    quad z in D,
  $
  where $1 <= j <= n$, and $phi(z)$ is a product of derivatives of $rho(zeta)$
  of order at most two. Note that
  $|kappa(zeta)| = O(1) theta(|rho(zeta)|) = O(1) |rho(zeta)|^tau$ (compare with
  the proof of Lemma~@lem:h-integrals).

  Let $D$ be a second-order differential operator with constant coefficients.
  Differentiation under the integral sign gives us that for $z in D$
  $
    |D F(z)| = & O(1) [integral_((Omega without D)_zeta)
                 (|rho(zeta)|^(tau - 1) d v(zeta))
                 / (|zeta - z|^(2n - 1) |Phi(zeta, z)|) \
               & + integral_((Omega without D)_zeta)
                 (|rho(zeta)|^(tau - 1) d v(zeta))
                 / (|zeta - z|^(2n - 2) |Phi(zeta, z)|^2)
                 + integral_((Omega without D)_zeta)
                 (|rho(zeta)|^(tau - 1) d v(zeta))
                 / (|zeta - z|^(2n - 3) |Phi(zeta, z)|^3)].
  $
  #new-par
  After using @eq:support-function-estimates and the change of variables
  mentioned in Lemma~@lem:eta-coordinates just as in the proof of
  Theorem~@th:dbar-holder (and Lemma~@lem:h-integrals), we get from
  Lemma~@lem:model-integral that
  $
    & |D F(z)| \
    & quad = O(1) [J_(tau - 1, 1, 2n - 1) (|rho(z)|)
        + J_(tau - 1, 3\/2, 2n - 1) (|rho(z)|)
        + J_(tau - 1, 3, 2n - 3) (|rho(z)|)] \
    & quad = O(1) (|rho(z)|^(tau - 1) + |rho(z)|^(tau - 3\/2)
        + |rho(z)|^(tau - 3\/2)) = O(1) |rho(z)|^(-1 + (tau - 1\/2)).
  $
  #new-par
  Since $tau > 1/2$, the first derivatives of $F$ satisfy a Hölder condition
  with exponent $tau - 1/2$, by Lemma~@lem:hardy-littlewood. Thus, the third
  integral in @eq:gamma-solution also belongs to
  $C_(p, n - 2)^((1)) (overline(D))$.
]

#small-print[
  #source(247)
  #point <pt:orthogonal-more-results> We present without proof some more results
  on forms orthogonal to holomorphic forms.

  #theorem(title: [Dautov])[
    If $D = Omega without union.big_1^k Omega_j$, where $Omega$ and the
    $Omega_j$ are strictly pseudoconvex domains in $CC^n$ such that
    $Omega_j relcomp Omega$ and
    $overline(Omega)_j inter overline(Omega)_l = emptyset$ for $j != l$, and if
    $alpha in C_((p, n - 1))^((tau)) (partial D)$, $1/2 < tau <= 1$, then
    $alpha$ satisfies @eq:orthogonality if and only if there exists a
    $dbar$-closed form
    $
      beta = beta_1 + dbar rho and sqrt(|rho|) dot.c beta_2, wide
      beta_1 in tilde(C)_(p, n - 1)^((0)) (D), wide
      beta_2 in tilde(C)_(p, n - 2)^((-1)) (D),
    $
    such that $beta_1|_(partial D) = alpha$ and $t^tau$ is a modulus of
    continuity of the form $beta_2$.
  ] <th:dautov-multiply-connected>

  As in the remark after Theorem~@th:dautov-extension, it can be shown that
  $beta$ extends to a continuous form on $overline(D)$.

  #theorem(title: [Khenkin])[
    If $D = Omega without union.big_1^n Omega_j$, where $Omega$ and the
    $Omega_j$ are pseudoconvex domains in $CC^n$ with boundaries of class
    $C^((infinity))$ such that $Omega_j relcomp Omega$ and
    $overline(Omega)_j inter overline(Omega)_l = emptyset$ for $j != l$, and if
    $alpha in C_(p, n - 1)^((infinity)) (partial D)$, then $alpha$ satisfies
    @eq:orthogonality if and only if there exists a $dbar$-closed form
    $beta in C_(p, n - 1)^((infinity)) (overline(D))$ such that
    $beta|_(partial D) = alpha$.
  ] <th:khenkin-multiply-connected>

  The "exotic" shape of the domain in which this description is given is to a
  certain extent (and almost completely when $n = 2$) justified by the essence
  of the matter. The next result has to do with this.

  #theorem(title: [Dautov])[
    Let $D$ be a bounded domain in $CC^2$ with boundary of class $C^((2))$. If
    for any form $alpha in C_(p, n - 1)^((infinity)) (partial D)$ satisfying
    @eq:orthogonality there exists a $dbar$-closed form
    $beta in C_(p, n - 1) (overline(D))$ such that $beta|_(partial D) = alpha$,
    then $D = Omega without union.big_1^k Omega_j$, where $Omega$ and the
    $Omega_j$ are pseudoconvex domains, $Omega_j relcomp Omega$, and
    $overline(Omega)_j inter overline(Omega)_l = emptyset$ for $j != l$. And if
    $beta = dbar gamma$, where $gamma in C_(p, n - 2) (overline(D))$, then $D$
    is pseudoconvex.
  ] <th:dautov-c2>

  In the general case we have

  #theorem(title: [Aĭzenberg])[
    If $D$ is a bounded domain in $CC^n$ with boundary of class $C^((2))$, the
    compact set $overline(D)$ has a one-sheeted envelope of
    holomorphy#footnote[See @sec:hartogs-bochner for the definition of the
      envelope of holomorphy of a compact set.] $cal(H) (overline(D))$, and
    $alpha in C_(p, n - 1)^((tau)) (partial D)$, $0 < tau <= 1$, then $alpha$
    satisfies @eq:orthogonality if and only if there exist $dbar$-closed forms
    $alpha_1 in tilde(C)_(p, n - 1)^((0)) (overline(D))$ and
    $alpha_2 in tilde(C)_((p, n - 1))^((0)) (CC^n without D)$ such that
    $alpha = alpha_1|_(partial D) + alpha_2|_(partial D)$, where
    $alpha_2 = O(|z|^(1 - 2n))$ as $z -> infinity$ and $alpha_2$ is $dbar$-exact
    in $CC^n without cal(H) (overline(D))$.
  ] <th:aizenberg-envelope>

  #point <pt:logarithmic-residue-formulas> Forms orthogonal to holomorphic
  functions are closely connected with logarithmic residue formulas and, in
  particular, with integral representations.

  Let $D$ be a bounded domain in $CC^n$ with smooth boundary, and suppose that
  the mapping $f: overline(D) -> CC^n$ belongs to $A^n (overline(D))$ and does
  not have zeros on $partial D$. Then (see Theorem~@th:logarithmic-residue) $f$
  has finitely many zeros in $D$. Recall that $E_f$ is the set of zeros of $f$,
  and $mu_a (f)$ is the multiplicity of the zero $a in E_f$. A #index-mark(
    "Formula",
    sub: "logarithmic residue",
  )_logarithmic residue formula_ is understood to be a formula of the form
  $
    integral_(partial D_zeta) phi(zeta) kappa(zeta)
    = sum_(a in E_f) mu_a (f) phi(a),
  $ <eq:logarithmic-residue-formula>
  valid for all $phi in A_C (D)$. Here $kappa in C_(2n - 1) (partial D)$. An
  example of such a formula is @eq:fundamental-integral-formula. If $f$ has a
  single zero in $D$ of multiplicity 1, then the logarithmic residue formula
  becomes an #index-mark(
    "Representation",
    sub: "integral",
    subsub: "for holomorphic functions",
  )_integral representation for holomorphic functions_. Note that a form $kappa$
  satisfying @eq:logarithmic-residue-formula is a solution of a nonhomogeneous
  system of equations of the form @eq:logarithmic-residue-formula, while forms
  orthogonal to holomorphic functions are solutions of the corresponding
  homogeneous system of equations. Therefore, any form $kappa$ satisfying
  @eq:logarithmic-residue-formula can be obtained from a fixed form by adding a
  form orthogonal to the holomorphic functions, and, conversely, any form
  orthogonal to the holomorphic functions can be obtained as the difference
  between a fixed form $kappa_0$ and some suitable form $kappa$ if $kappa_0$ and
  $kappa$ satisfy @eq:logarithmic-residue-formula. #source(248) As an example of
  a form $kappa$ such that @eq:logarithmic-residue-formula holds in the case
  $n = 1$ is
  $
    1 / (2 pi i) d ln f = 1 / (2 pi i) (d f) / f,
  $
  where $f in A(overline(D))$. From the classical result mentioned in
  @pt:orthogonal-forms-intro it is possible to prove that any form $kappa$ such
  that @eq:logarithmic-residue-formula holds differs from
  $(2 pi i)^(-1) d(ln f)$ by a term of the kind $g d z$, with $g in A_C (D)$.

  It is assumed that $n > 1$ in what follows. We determine conditions under
  which any form satisfying @eq:logarithmic-residue-formula looks like
  $Omega(w^((0)), w^((1)), ..., w^((n - 1)), f)$ (see
  @eq:leray-koppelman-kernel) for suitable $w^((0)), w^((1)), ..., w^((n - 1))$.

  The product $d f_1 and dots.c and d f_n$ is a factor in the form
  $Omega(w^((0)), ..., w^((n - 1)), f)$. Therefore, if the Jacobian
  $partial f \/ partial z$ of $f$ is degenerate at a point $z^0 in partial D$,
  then all forms of the kind @eq:leray-koppelman-kernel are degenerate at this
  point. By adding a $dbar$-exact term of type $(n, n - 1)$ to the form
  $Omega(w^((0)), w^((1)), ..., w^((n - 1)), f)$, we can always find a $kappa$
  satisfying @eq:logarithmic-residue-formula and nondegenerate at $z^0$.
  Therefore, it is natural to require that $partial f \/ partial z != 0$ on
  $partial D$.

  Any two forms of the kind @eq:leray-koppelman-kernel for one and the same
  mapping $f$ differ by a $dbar$-exact term (see Lemma~@lem:kernel-dbar-exact).
  This implies that if any form satisfying @eq:logarithmic-residue-formula is of
  the kind @eq:leray-koppelman-kernel, then any form orthogonal to the
  holomorphic functions when integrated over the boundary of the domain extends
  to $D$ as a $dbar$-exact form. For $n = 2$, Theorem~@th:dautov-c2 gives us
  that $D$ is a pseudoconvex domain. We require somewhat more, namely, that $D$
  is strictly pseudoconvex.

  #theorem(title: [Dautov])[
    Suppose that $D$ is a strictly pseudoconvex domain in $CC^n$ ($n >= 2$), and
    $f in A^n (overline(D))$ is such that $partial f \/ partial z != 0$ on
    $partial D$. Then any form $kappa$ of degree $2n - 1$ on $partial D$ that
    satisfies a Hölder condition with exponent $tau > 1/2$ and the condition
    @eq:logarithmic-residue-formula is of the kind
    $Omega(w^((0)), w^((1)), ..., w^((n - 1)), f)$ for suitable vector-valued
    functions $w^((j)) in C^((1)) (partial D)$, $j = 0, 1, ..., n - 1$, in the
    following cases:
    #enum(numbering: "1)")[
      $n = 2$;
    ][
      $n >= 3$, and the complex tangents to the surface#footnote[$f(partial D)$
        is a smooth surface (possibly with selfintersections), because
        $partial D$ is smooth and $partial f \/ partial z != 0$ on $partial D$.]
      $f(partial D)$ do not go through the origin.
    ]
  ] <th:dautov-logarithmic-residue>

  Condition 2) can be relaxed, namely, it can be required that there be a
  vector-valued function $u^((0))$ that is smooth on $partial D$ and such that
  $chevron.l u^0, f chevron.r = 1$ and any smooth form of type $(n, n - 2)$ on
  $partial D$ looks like
  $
    sum_(k < l) a_(k l) d u_([k, l])^((0)) and d f
  $
  for some smooth functions $a_(k l)$. Condition 2) or this relaxed condition
  most likely come from the method of proof.

  We actually prove that $kappa$ has the form
  $
    Omega(overline(f), w, underbrace(overline(f)\, ...\, overline(f), n - 2), f)
  $
  for suitable $w$.

  #proof[
    Let $u^((0)) = overline(f) \/ |f|^2$. It is clear that
    $chevron.l u^((0)), f chevron.r = 1$; therefore, the form
    $Omega(u^((0)), ..., u^((0)), f)$ satisfies @eq:logarithmic-residue-formula.
    Consequently, if $alpha = kappa - Omega(u^((0)), ..., u^((0)), f)$, then
    @eq:orthogonality holds for $alpha$. By Theorem~@th:dbar-exact-extension,
    $alpha = dbar gamma|_(partial D)$, where
    $gamma in C_(n, n - 2)^((1)) (overline(D))$. We show that
    $
      gamma|_(partial D) = (n - 2)! / (2 pi i)^n
      sum_(k < l) (-1)^(k + l) a_(k l) d u_([k, l])^((0)) and d f,
    $ <eq:gamma-boundary>
    where $a_(k l) in C^((1)) (partial D)$.

    #source(249)
    For $n = 2$, @eq:gamma-boundary is trivial. If $n >= 3$, it suffices to
    prove @eq:gamma-boundary locally; the global expansion of $gamma$ can be
    obtained from the local expansions by using a partition of unity. Suppose
    that $zeta^0$ is a fixed point of $partial D$, and let $z^0 = f(zeta^0)$.
    Consider the surface $S = f(U inter partial D)$, where $U$ is a neighborhood
    of $zeta^0$. Then $S$ is a smooth surface given by the equation
    $rho_1 (z) = 0$, where $rho_1 (z) = rho(f^(-1) (z))$, and $rho$ is a
    function defining the domain $D$. It can be assumed that
    $(partial rho_1 \/ partial z_1)(z) != 0$ and $z_1 != 0$ for $z in S$. This
    situation can always be attained by rotating the coordinate system and
    making $U$ smaller, because $z^0 = f(zeta^0) != 0$ and $grad rho_1|_S != 0$.
    A direct computation yields
    $
      lr(
        overline(
          (z_1 (partial rho_1) / (partial z_1) + dots.c
            + z_n (partial rho_1) / (partial z_n))
        )
        (d overline(z)_([1]) and d z)
        / (|z|^(2n) (partial rho_1 \/ partial overline(z)_1)) |
      )_S
      = lr((2 pi i)^n / (n - 1)! Omega(overline(z), ..., overline(z), z) |)_S
      = lr(1 / z_1 d(overline(z) / (|z|^2))_([1]) and d z |)_S.
    $
    The first equality shows that $Omega(overline(z), ..., overline(z), z)|_S$
    is not degenerate, since the complex tangents to $S = f(U inter partial D)$
    do not go through 0 by hypothesis. The second equality means that the
    differentials
    $
      d(overline(z)_2 / (|z|^2)), ..., d(overline(z)_n / (|z|^2)),
      d z_1, ..., d z_n
    $
    are linearly independent on $S$; consequently, the differentials
    $
      d u_2^((0)) = d overline(f)_2 / (|f|^2), ...,
      d u_n^((0)) = d overline(f)_n / (|f|^2), d f_1, ..., d f_n
    $
    are linearly independent on $partial D inter U$. This gives us
    @eq:gamma-boundary on $partial D inter U$.

    Let $eta_(k l) = f_l e_k - f_k e_l$, where $e_k$ and $e_l$ are the vectors
    with $k$th and $l$th coordinates, respectively, equal to 1 and other
    coordinates equal to 0, and let
    $
      w = u^((0)) + sum_(k < l) a_(k l) eta_(k l).
    $
    We have
    $
      chevron.l w, f chevron.r = chevron.l u^((0)), f chevron.r
      + sum_(k < l) a_(k l) chevron.l eta_(k l), f chevron.r = 1
    $
    and
    $
      & Omega(
          u^((0)), w,
          underbrace(u^((0))\, ...\, u^((0)), n - 2), f
        )
        - Omega(underbrace(u^((0))\, ...\, u^((0)), n), f) \
      & quad = (-1)^(n(n - 1)\/2) / (2 pi i)^n
        chevron.l u^((0)), d f chevron.r
        and d chevron.l w - u^((0)), d f chevron.r
        and (d chevron.l u^((0)), d f chevron.r)^(n - 2) \
      & quad = (-1)^(n(n - 1)\/2) / (2 pi i)^n sum_(k < l)
        chevron.l u^((0)), d f chevron.r and dbar a_(k l)
        chevron.l eta_(k l), d f chevron.r
        and (chevron.l dbar u^((0)), d f chevron.r)^(n - 2).
    $ <eq:omega-difference>
    Consider the expression
    $
      chevron.l theta^1, d f chevron.r and chevron.l theta^2, d f chevron.r
      and dots.c and chevron.l theta^n, d f chevron.r,
    $ <eq:theta-product>
    where $theta^1$ is a vector-valued function such that
    $chevron.l theta^1, f chevron.r = 1$, and $theta^2, ..., theta^n$ are
    vector-valued functions or forms such that
    $chevron.l theta^2, f chevron.r = dots.c = chevron.l theta^n, f chevron.r
    = 0$. Just as in Lemma~@lem:kernel-first-argument we can see that
    @eq:theta-product does not change if $theta^1$ is replaced by any
    vector-valued function $theta$ with $chevron.l theta, f chevron.r = 1$.
    Clearly, $chevron.l eta_(k l), f chevron.r = 0$ and
    $chevron.l dbar u^((0)), f chevron.r
    = dbar chevron.l u^((0)), f chevron.r = dbar 1 = 0$. Therefore,
    $chevron.l u^((0)), d f chevron.r$ can be replaced by #source(250)
    $chevron.l f_k^(-1) e_k, d f chevron.r = f_k^(-1) d f_k$ in each term of
    @eq:omega-difference. If $f_1 dots.c f_n != 0$, then
    $
      & Omega(
          u^((0)), w,
          underbrace(u^((0))\, ...\, u^((0)), n - 2), f
        )
        - Omega(underbrace(u^((0))\, ...\, u^((0)), n), f) \
      & quad = (-1)^(n(n - 1)\/2) / (2 pi i)^n sum_(k < l) 1 / f_k d f_k
        and dbar a_(k l) and (f_l d f_k - f_k d f_l)
        and (chevron.l d u^((0)), d f chevron.r)^(n - 2) \
      & quad = (-1)^(n(n - 1)\/2) / (2 pi i)^n sum_(k < l) dbar a_(k l)
        and d f_k and d f_l and (n - 2)!
        and.big_(m = 1 \ m != k, l)^n d u_m^((0)) and d f_m \
      & quad = (n - 2)! / (2 pi i)^n sum_(k < l) (-1)^(k + l) dbar a_(k l)
        and d u_([k, l])^((0)) and d f
        = dbar gamma|_(partial D) = alpha.
    $
    #new-par
    Consequently, if $f_1 dots.c f_n != 0$, then
    $
      kappa = alpha + Omega(underbrace(u^((0))\, ...\, u^((0)), n), f)
      = Omega(u^((0)), w, underbrace(u^((0))\, ...\, u^((0)), n - 2), f).
    $ <eq:kappa-omega>
    The set $partial D inter {f_1, ..., f_n != 0}$ is dense in $partial D$;
    therefore, @eq:kappa-omega holds on the whole boundary.
  ]

  #corollary[
    Suppose that $D$ is a strictly pseudoconvex domain in $CC^2$ or a strictly
    pseudoconvex and linearly convex#footnote[See @sec:hartogs-bochner for the
      definition of a linearly convex domain.] domain in $CC^n$, $n >= 3$, and
    $kappa_a (z)$ is a form in $z in partial D$ of degree $2n - 1$ that
    satisfies a Hölder condition with exponent $tau > 1/2$ and is such that for
    all $a in D$ and all $phi in A_C (D)$
    $
      phi(a) = integral_(partial D) phi(z) kappa_a (z).
    $
    Then there exists a vector-valued function $w_a (z)$, smooth with respect to
    $z in partial D$, such that $chevron.l w_a (z), z - a chevron.r != 0$ on
    $partial D$ and
    $
      kappa_a (z) = Omega(
        overline(z) - overline(a), w_a (z),
        overline(z) - overline(a), ..., overline(z) - overline(a), z - a
      ).
    $
  ] <cor:cauchy-fantappie-kernels>

  The corollary asserts that for the indicated class of domains with $n > 1$ any
  integral representation for holomorphic functions with kernel satisfying a
  Hölder condition with exponent $tau > 1/2$ is a generalized Cauchy-Fantappiè
  formula (formula @eq:generalized-cauchy-fantappie).
]

#point <pt:lewy-equation> We need some notation in order to give a local variant
of Theorem~@th:dbar-exact-extension. If $D$ is a bounded domain in $CC^n$ with
smooth boundary and $alpha in C_(n, q)^((1)) (partial D)$, $0 <= q <= n - 1$,
then $alpha$ can be extended to a form
$tilde(alpha) in C_(n, q)^((1)) (overline(D))$. The form in
$C_(n, q + 1) (partial D)$ obtained by restricting $dbar tilde(alpha)$ to
$partial D$ is denoted by $dbar_b alpha$#notation-mark(
  $dbar_b$,
  sort: "d bar b",
). It is not hard to show that $dbar_b alpha$ does not depend on the extension
$tilde(alpha)$ of $alpha$.

For $p = n$, Theorem~@th:dbar-exact-extension asserts that if $alpha$ is a form
of type $(n, n - 1)$ on $partial D$ satisfying a Hölder condition with exponent
$tau > 1/2$ and condition @eq:orthogonality, then there is a corresponding form
$gamma in C_(n, n - 2)^((1)) (partial D)$, that solves the equation
$
  dbar_b gamma = alpha.
$ <eq:tangential-dbar>
#source(251)
#new-par
For $n = 2$, @eq:tangential-dbar is equivalent to the equation
$
  L g = ((partial rho) / (partial overline(z)_1)
    partial / (partial overline(z)_2)
    - (partial rho) / (partial overline(z)_2)
    partial / (partial overline(z)_1)) g = f, quad z in partial D,
$ <eq:lewy-equation>
where $g$ is the coefficient of the form $gamma$, while $f$ is constructed from
the form $alpha$, and $rho$ is a function defining $D$. The
operator#footnote[Note that the condition $L g = 0$ means precisely that $g$
  satisfies the tangential Cauchy-Riemann conditions (see
  @sec:hartogs-bochner).] $L$ was introduced by Lewy. He found that if $D$ is a
strictly convex domain in $CC^2$, then, generally speaking, the equation
$L g = f$ is not even locally solvable. More precisely, the set of functions
such that $L g = f$ is solvable is not a closed subspace of any natural function
space.

We give a condition on the form $alpha$ (and, consequently, also on $f$) that is
necessary and sufficient for @eq:tangential-dbar (respectively,
@eq:lewy-equation) to have local solutions. Let $D$ be a bounded strictly convex
domain in $CC^n$ with $0 in D$, and
$tilde(overline(D)) = {w: chevron.l w, z chevron.r != 1, z in overline(D)}$ the
domain conjugate to the compact set $overline(D)$ (see @sec:hartogs-bochner,
@pt:partial-fractions). Since $D$ has a smooth boundary, to each point
$z in partial D$ there corresponds a unique point
$w(z) in partial tilde(overline(D))$ such that
$chevron.l w(z), z chevron.r = 1$. The strict convexity of $D$ gives us that the
mapping $z |-> w(z)$ is one-to-one on $partial D$. The point $w(z)$ is
determined by the equality
$
  w(z) = (P(z)) / (chevron.l P(z), z chevron.r),
$
where
$
  P(z) = (P_1 (z), ..., P_n (z))
  = ((partial rho) / (partial z_1) (z), ..., (partial rho) / (partial z_n) (z))
$
(see @sec:dbar-problem).

To a form $alpha in C_(n, n - 1) (partial D)$, as a functional on the space
$A(overline(D))$, there corresponds a holomorphic function in
$tilde(overline(D))$
$
  alpha^* (w) = integral_(partial D_zeta)
  (alpha(zeta)) / (1 - chevron.l zeta, w chevron.r)^n,
$
called the #index-mark("Indicatrix", sub: "Fantappiè")_Fantappiè indicatrix_ of
the form $alpha$ (compare with @sec:hartogs-bochner, @pt:linear-functionals).

#theorem(title: [Khenkin])[
  Suppose that $D$ is a strictly convex domain in $CC^n$ and
  $alpha in C_(n, n - 1) (partial D)$ satisfies a Hölder condition with exponent
  $tau > 1/2$. Then @eq:tangential-dbar has a solution
  $gamma in C_(n, n - 2)^((1)) (partial D)$ in some neighborhood of a point
  $z^0 in partial D$ if and only if the Fantappiè indicatrix $alpha^*$ of the
  form $alpha$ extends holomorphically to a neighborhood of the point
  $w(z^0) in partial tilde(overline(D))$.
] <th:khenkin-lewy>

#source(252)
To prove this we need an assertion that is also of independent significance.

#proposition[
  Suppose that $D$ is a bounded domain in $CC^n$ with smooth boundary, and
  $alpha in C_(n, n - 1) (partial D)$. If there exists a form
  $tilde(alpha) in C_(n, n - 1) (overline(D))$ such that
  $tilde(alpha)|_(partial D) = alpha$ and $dbar tilde(alpha) in L_(n, n)^1 (D)$,
  then the forms $alpha^+$ and $alpha^-$ defined in $D$ and
  $CC^n without overline(D)$, respectively, by
  $
    alpha^plus.minus (z) = integral_(partial D_zeta) alpha(zeta)
    and U_(n, n - 1) (zeta, z)
    - dbar integral_(D_zeta) tilde(alpha)(zeta) and U_(n, n - 2) (zeta, z)
  $ <eq:alpha-plus-minus>
  are $dbar$-closed, extend continuously to $overline(D)$, and satisfy the
  equation
  $
    alpha = alpha^+|_(partial D) - alpha^-|_(partial D).
  $
] <prop:jump-decomposition>

#proof(qed: false)[
  By the Martinelli-Bochner-Koppelman formula @eq:martinelli-bochner-koppelman,
  $
    alpha^+ (z) = tilde(alpha)(z) + integral_(D_zeta) dbar tilde(alpha)(zeta)
    and U_(n, n - 1) (zeta, z), quad z in D,
  $
  and
  $
    alpha^- (z) = integral_(D_zeta) dbar tilde(alpha)(zeta)
    and U_(n, n - 1) (zeta, z), quad z in CC^n without D.
  $ <eq:alpha-minus>
  It is not hard to see that the integral
  $
    integral_(D_zeta) dbar tilde(alpha)(zeta) and U_(n, n - 1) (zeta, z)
  $
  is uniformly convergent for $z in CC^n$ and thus defines a continuous form on
  $CC^n$. Consequently, $alpha^+$ and $alpha^-$ extend continuously to
  $partial D$, and
  $
    alpha^+|_(partial D) - alpha^-|_(partial D)
    = tilde(alpha)|_(partial D) = alpha.
  $
]

#proof(title: [Proof of Theorem~@th:khenkin-lewy.])[
  _Necessity._ Suppose that @eq:tangential-dbar is solvable in some neighborhood
  $U_(z^0)$ of $z^0$. By Stokes' formula,
  $
    alpha^* (w) & = integral_((partial D without U_(z^0))_zeta)
                  (alpha(zeta)) / (1 - chevron.l w, zeta chevron.r)^n
                  + integral_((U_(z^0) inter partial D)_zeta)
                  (dbar_b gamma(zeta)) / (1 - chevron.l w, zeta chevron.r)^n \
                & = integral_((partial D without U_(z^0))_zeta)
                  (alpha(zeta)) / (1 - chevron.l w, zeta chevron.r)^n
                  + integral_(partial(U_(z^0) inter partial D)_zeta)
                  (gamma(zeta)) / (1 - chevron.l w, zeta chevron.r)^n.
  $
  Since $D$ is strictly convex, the integrals on the right-hand side are defined
  not only in $tilde(overline(D))$ but also in some neighborhood of the point
  $w(z^0)$; therefore, $alpha^*$ extends holomorphically through this point.

  _Sufficiency._ By Lemma~@lem:boundary-form-extension, there is a form
  $tilde(alpha) in tilde(C)_(n, n - 1)^((0)) (D)$ such that
  $tilde(alpha)|_(partial D) = alpha$, and
  $dbar tilde(alpha)(zeta) = rho^(-1) (zeta) kappa(zeta)$, where
  $kappa in tilde(C)_(n, n)^((0)) (D)$, $kappa(zeta) = 0$ for
  $zeta in partial D$, and $theta(t) = t^tau$ is a modulus of continuity of the
  forms $tilde(alpha)$ and $kappa$. As in the proof #source(253) of
  Lemma~@lem:h-integrals, we get that
  $|dbar tilde(alpha)(zeta)| = O(1) [rho(zeta)]^(tau - 1)$. By
  Proposition~@prop:jump-decomposition,
  $alpha = alpha^+|_(partial D) - alpha^-|_(partial D)$, where $alpha^+$ and
  $alpha^-$ are given by @eq:alpha-plus-minus.

  Proposition~@prop:potentials-holder tells us that the first integral in
  @eq:alpha-plus-minus satisfies a Hölder condition in $D$ with exponent $tau'$,
  $1/2 < tau' < tau$. Moreover, $U_(n, n - 1) (zeta, z)$ is a $dbar$-closed form
  with respect to $z$; consequently, the first integral in @eq:alpha-plus-minus
  is a $dbar$-closed form in $D$. Just as in Theorem~@th:dbar-exact-extension we
  can verify that this integral can be represented as $dbar gamma_1$ for some
  $gamma_1 in C_(n, n - 2)^((1)) (overline(D))$. The second term in
  @eq:alpha-plus-minus can be expressed as $dbar gamma_2$, where
  $
    gamma_2 = integral_(D_zeta) tilde(alpha)(zeta) and U_(n, n - 2) (zeta, z).
  $
  From Proposition~@prop:potentials-holder it follows that
  $gamma_2 in C_(n, n - 2)^((1)) (overline(D))$. Thus, $alpha^+ = dbar gamma^+$
  in $D$. Here
  $gamma^+ = gamma_1 + gamma_2 in C_((n, n - 2))^((1)) (overline(D))$.

  It remains to see that the equation $dbar_b gamma^- = alpha^-|_(partial D)$ is
  solvable. Let $Omega$ be a domain containing $overline(D)$ for which
  @eq:support-function-estimates holds. Then
  $
    u^* (zeta, z) = (P(z)) / (Phi^* (zeta, z))
    = (P(z)) / (chevron.l P(z), zeta - z chevron.r)
  $
  is holomorphic in $zeta in overline(D)$ for $z in Omega without overline(D)$,
  so @eq:alpha-minus and Stokes' formula imply (compare with the proof of
  Lemma~@lem:dbar-solution-orthogonal) that for $z in Omega without overline(D)$
  $
    alpha^- (z) & = integral_(D_zeta) dbar tilde(alpha)(zeta)
                  and W_(n, n - 1) (u^*, zeta, z) \
                & quad - dbar_z integral_(D_zeta times [0, 1]_lambda)
                  dbar tilde(alpha)(zeta)
                  and tilde(W)_(n, n - 2) (eta^*, zeta, z, lambda) \
                & = integral_(partial D_zeta) alpha(zeta)
                  and W_(n, n - 1) (u^*, zeta, z) \
                & quad - dbar_z integral_(D_zeta times [0, 1]_lambda)
                  dbar tilde(alpha)(zeta)
                  and tilde(W)_(n, n - 2) (eta^*, zeta, z, lambda).
  $ <eq:alpha-minus-stokes>
  We have
  $
    & W_(n, n - 1) (u^*, zeta, z)
      = ((-1)^n (n - 1)!) / (2 pi i)^n
      (sum_(j = 1)^n (-1)^j P_j (z) d P(z)_([j]) and d z)
      / (chevron.l P(z), zeta - z chevron.r^n) \
    & quad = ((-1)^(n - 1) (n - 1)!) / (2 pi i)^n
      (chevron.l P(z), z chevron.r^n)
      / (chevron.l P(z), zeta chevron.r - chevron.l P(z), z chevron.r)^n
      (sum_(j = 1)^n (-1)^(j - 1) P_j (z) d P(z)_([j]) and d z)
      / (chevron.l P(z), z chevron.r^n) \
    & quad = ((-1)^(n - 1) (n - 1)!) / (2 pi i)^n
      1 / (chevron.l w(z), zeta chevron.r - 1)^n omega(z, w(z)).
  $
  #source(254)
  #new-par
  From this and @eq:alpha-minus-stokes it follows that for
  $z in Omega without overline(D)$
  $
    alpha^- (z) = & -(n - 1)! / (2 pi i)^n alpha^* (w(z)) omega(z, w(z)) \
                  & - dbar_z integral_(D_zeta times [0, 1]_lambda)
                    dbar tilde(alpha)(zeta)
                    and tilde(W)_(n, n - 2) (eta^*, zeta, z, lambda).
  $ <eq:alpha-minus-indicatrix>
  #new-par
  By assumption, $alpha^*$ extends holomorphically to some neighborhood of
  $w(z^0)$. Consequently, the form $alpha^* (w(z)) omega(z, w(z))$ is defined in
  a (convex) neighborhood of $z^0$. Next,
  $
    alpha^* (w) sum_(j = 1)^n (-1)^(j - 1) w_j d w_([j]) and d z
  $
  is a holomorphic form of maximal dimension on the manifold
  ${chevron.l w, z chevron.r = 1} subset CC^(2n)$; therefore, it is closed, and
  hence the form $alpha^* (w(z)) omega(z, w(z))$ is $dbar$-closed. Moreover, it
  is smooth in a neighborhood of $z^0$; also, as in
  Theorem~@th:dbar-exact-extension, it can be proved that
  $alpha^* (w(z)) omega(z, w(z)) = dbar gamma_3$ in a neighborhood of $z^0$,
  where $gamma_3 in C_((n, n - 2))^((1)) (overline(D))$.

  Let $gamma_4$ be the integral in the second term of
  @eq:alpha-minus-indicatrix. Just as in the proof of
  Theorem~@th:dbar-exact-extension we get that $gamma_4$ is a linear combination
  of forms with coefficients of the kind
  $
    F_1 (z) = integral_(D_zeta) ((overline(zeta)_j - overline(z)_j) phi(z))
    / (|zeta - z|^(2(n - 1)) Phi^* (zeta, z)) (kappa(zeta)) / (rho(zeta)),
    quad z in Omega without overline(D).
  $
  Differentiating under the integral sign, we next prove with the help of
  @eq:support-function-estimates and the change of variables in
  Lemmas~@lem:eta-coordinates and @lem:h-integrals that the second derivatives
  of $F_1$ do not grow more rapidly than $|rho(z)|^(-1 + tau - 1\/2)$. From
  Lemma~@lem:hardy-littlewood it follows that the first derivatives of $F_1$ are
  continuous in $Omega without D$, i.e., the form $gamma_4$ extends smoothly to
  $partial D$. From @eq:alpha-minus-indicatrix we get that
  $alpha^-|_(partial D) = dbar gamma^-$ in some neighborhood of $z^0$. Here
  $gamma^- = (gamma_3 - gamma_4)|_(partial D)$.
]

#theorem(title: [Khenkin])[
  Suppose that $D$ is a strictly convex domain and
  $f in A_C (tilde(overline(D)))$, and that $f$ does not extend holomorphically
  through the point $w^0 in partial tilde(overline(D))$. Then the equation
  $dbar_b gamma = alpha$, where
  $
    alpha = (n - 1)! / (2 pi i)^n f(w(z)) and omega(z, w(z)),
  $
  does not have solutions in any neighborhood of the point $z^0 in partial D$
  for which $w^0 = w(z^0)$.
] <th:khenkin-nonsolvable>

#source(255)
#proof[
  Theorem~@th:khenkin-lewy shows that it suffices to prove that $f$ is the
  Fantappiè indicatrix of the form $alpha$, i.e.,
  $
    f(w) = integral_(partial D_zeta)
    (alpha(zeta)) / (1 - chevron.l w, zeta chevron.r)^n
    = (n - 1)! / (2 pi i)^n integral_(partial D_zeta)
    (f(w(zeta)) omega(zeta, w(zeta))) / (1 - chevron.l w, zeta chevron.r)^n.
  $
  This is precisely formula @eq:linearly-convex-formula for the linearly convex
  domain $tilde(overline(D))$.
]
