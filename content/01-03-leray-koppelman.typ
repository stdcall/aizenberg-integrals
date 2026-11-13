#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== The fundamental integral formula of Leray and Koppelman
<sec:leray-koppelman>

#theorem(title: [Yuzhakov and Roos])[#point <pt:yuzhakov-roos>
  #index-mark(
    "Theorem",
    sub: "generalized, on the multiple logarithmic residue",
    target: <th:yuzhakov-roos>,
  )
  Suppose that $D$ is a bounded domain with piecewise smooth boundary, and that
  $f$ is in $A^n (overline(D))$ and does not have zeros on $partial D$. Then for
  any $phi in A_C (D)$
  $
    integral_(partial D) phi omega(f, overline(f))
    = sum_(a in E_f) mu_a (f) dot.c phi(a).
  $ <eq:yuzhakov-roos>
] <th:yuzhakov-roos>

#proof[
  Choose $epsilon > 0$ such that $epsilon < min_(partial D) |f|$. For almost all
  $zeta in B_epsilon$ the mapping @eq:shifted-mapping has only simple zeros in
  $D$, and, by Lemma~@lem:simple-zeros-sum,
  $
    integral_(partial D) phi omega(f - zeta, overline(f - zeta))
    = sum_(a_zeta in E_(f - zeta)) phi(a_zeta).
  $ <eq:yuzhakov-roos-simple>
  If we now let $zeta$ tend to zero, then (see part 1 of the proof of
  Theorem~@th:logarithmic-residue) the zeros of @eq:shifted-mapping tend to the
  zeros of @eq:holomorphic-mapping, and, moreover, the number of simple zeros of
  $f - zeta$ tending to any particular zero of $f$ is equal to its multiplicity.
  If we pass to the limit in @eq:yuzhakov-roos-simple as $zeta -> 0$, we get
  @eq:yuzhakov-roos.
]

#point <pt:leray-koppelman-kernel> Let us consider the following exterior
differential form (important for what follows), which depends on a holomorphic
mapping $f$, a continuous vector-valued function $w^((0))$, and continuously
differentiable vector-valued functions
$w^((1)), ..., w^((n - 1))$:#notation-mark(
  // Wider than a column of the index: it may break after "...,".
  [$Omega paren.l w^((0)), w^((1)), ...,$ $w^((n - 1)), f paren.r$],
  sort: "Omega",
)
$
  & Omega(w^((0)), w^((1)), ..., w^((n - 1)), f) \
  & quad = (-1)^(n(n - 1)\/2) / (2 pi i)^n
    (chevron.l w^((0)), d f chevron.r) / (chevron.l w^((0)), f chevron.r)
    and d (chevron.l w^((1)), d f chevron.r) / (chevron.l w^((1)), f chevron.r)
    and dots.c and d (chevron.l w^((n - 1)), d f chevron.r)
    / (chevron.l w^((n - 1)), f chevron.r).
$ <eq:leray-koppelman-kernel>

#theorem(title: [#index-mark(
    "Formula",
    sub: "fundamental integral",
    target: <th:fundamental-integral-formula>,
  )Fundamental integral formula])[
  Let $D$ be a bounded domain with piecewise smooth boundary, and suppose that
  the mapping $f in A^n (overline(D))$ does not have zeros on $partial D$ and
  that the vector-valued functions $w^((0)) in C(partial D)$ and #source(40)
  $w^((j)) in C^((1)) (partial D)$, $j = 1, ..., n - 1$, satisfy the condition
  $
    chevron.l w^((j)) (z), f(z) chevron.r != 0, quad
    z in partial D, j = 0, 1, ..., n - 1.
  $ <eq:fundamental-condition>
  Then any function $phi in A_C (D)$ satisfies the formula
  $
    integral_(partial D) phi Omega(w^((0)), w^((1)), ..., w^((n - 1)), f)
    = sum_(a in E_f) mu_a (f) dot.c phi(a).
  $ <eq:fundamental-integral-formula>
] <th:fundamental-integral-formula>

We indicate other ways of writing the kernel $Omega$. Let
$
  u^((j)) = w^((j)) / (chevron.l w^((j)), f chevron.r), quad
  j = 0, 1, ..., n - 1;
$
then @eq:leray-koppelman-kernel gives us
$
  Omega = (-1)^(n(n - 1)\/2) / (2 pi i)^n chevron.l u^((0)), d f chevron.r
  and d chevron.l u^((1)), d f chevron.r and dots.c
  and d chevron.l u^((n - 1)), d f chevron.r,
$ <eq:kernel-normalized>
and @eq:fundamental-condition becomes
$
  chevron.l u^((j)) (z, overline(z)), f(z) chevron.r = 1, quad
  z in partial D, j = 0, 1, ..., n - 1.
$ <eq:normalized-condition>
Further, @eq:kernel-normalized leads to
$
  Omega = 1 / (2 pi i)^n sum_((i_1, ..., i_(n - 1)))
  mat(
    delim: "|",
    u_1^((0)), u_(1 i_1)^((1)), dots.c, u_(1 i_(n - 1))^((n - 1));
    dots, dots, dots, dots;
    dots, dots, dots, dots;
    dots, dots, dots, dots;
    u_n^((0)), u_(n i_1)^((1)), dots.c, u_(n i_(n - 1))^((n - 1))
  )
  d overline(z)_(i_1) and dots.c and d overline(z)_(i_(n - 1)) and d f,
$ <eq:kernel-determinant>
where $u_(j i_l)^((k)) = partial u_j^((k)) \/ partial overline(z)_(i_l)$, and
the summation is over all possible $(n - 1)$-tuples $(i_1, ..., i_(n - 1))$ of
numbers taken from the set ${1, 2, ..., n}$.

We mention also that
$Omega(overline(f), ..., overline(f), f) = omega(f, overline(f))$, i.e.,
@eq:yuzhakov-roos is a particular case of @eq:fundamental-integral-formula, and
condition @eq:fundamental-condition means that $|f|^2 != 0$ on $partial D$.

To prove Theorem~@th:fundamental-integral-formula we need some simple properties
of the kernel $Omega$.

#lemma[
  $Omega(w^((0)), w^((1)), ..., w^((n - 1)), f)$ does not depend on the
  vector-valued function $w^((0))$.
] <lem:kernel-first-argument>

#proof[
  Let $Omega_1$ and $Omega_2$ be two forms @eq:kernel-normalized depending on
  $u^((0)), u^((1)), ..., u^((n - 1))$ and $v^((0)), u^((1)), ..., u^((n - 1))$,
  respectively. We must show that $Omega_1 = Omega_2$. Let
  $s^((0)) = u^((0)) - v^((0))$. Then
  $
    chevron.l s^((0)) (z, overline(z)), f(z) chevron.r = 0, quad
    z in partial D.
  $ <eq:first-difference-orthogonal>
  #source(41)
  Using the representation of $Omega_1$ and $Omega_2$ in the form
  @eq:kernel-determinant, we get that the form $Omega_1 - Omega_2$ has the
  determinants
  $
    mat(
      delim: "|",
      s_1^((0)), u_(1 i_1)^((1)), dots.c, u_(1 i_(n - 1))^((n - 1));
      dots, dots, dots, dots;
      dots, dots, dots, dots;
      dots, dots, dots, dots;
      s_n^((0)), u_(n i_1)^((1)), dots.c, u_(n i_(n - 1))^((n - 1))
    ),
  $ <eq:difference-determinants>
  as coefficients. Further, @eq:normalized-condition gives us that
  $
    lr(
      chevron.l (partial u^((j)) (z, overline(z)))
      / (partial overline(z)_(i_k)), f(z) chevron.r
    )
    = 0, quad z in partial D, j = 1, ..., n - 1,
  $
  and this and @eq:first-difference-orthogonal imply that the determinants
  @eq:difference-determinants vanish.
]

#lemma[
  If the vector-valued functions $w^((1)), ..., w^((n - 1))$ and
  $p^((1)), ..., p^((n - 1))$ are in the class $C^((2)) (partial D)$, then the
  difference
  $
    Omega(w^((0)), w^((1)), ..., w^((n - 1)), f)
    - Omega(p^((0)), p^((1)), ..., p^((n - 1)), f)
  $ <eq:kernel-difference>
  is a $dbar$-exact form.
] <lem:kernel-dbar-exact>

#proof[
  The difference @eq:kernel-difference can be represented as a sum of analogous
  differences of forms that differ only in one argument, so it suffices to prove
  that the difference
  $
    Omega(w^((0)), w^((1)), ..., w^((n - 1)), f)
    - Omega(w^((0)), p^((1)), w^((2)), ..., w^((n - 1)), f)
  $
  is $dbar$-exact. Indeed,
  $
    & dbar {(-1)^(n(n - 1)\/2) / (2 pi i)^n
      (chevron.l w^((1)), d f chevron.r) / (chevron.l w^((1)), f chevron.r)
      and (chevron.l p^((1)), d f chevron.r) / (chevron.l p^((1)), f chevron.r)
      and d (chevron.l w^((2)), d f chevron.r)
      / (chevron.l w^((2)), f chevron.r) \
    & quad quad and dots.c and d (chevron.l w^((n - 1)), d f chevron.r)
      / (chevron.l w^((n - 1)), f chevron.r)} \
    & quad = (-1)^(n(n - 1)\/2) / (2 pi i)^n
      {(d (chevron.l w^((1)), d f chevron.r) / (chevron.l w^((1)), f chevron.r))
      and (chevron.l p^((1)), d f chevron.r)
      / (chevron.l p^((1)), f chevron.r) \
    & quad quad and dots.c - (chevron.l w^((1)), d f chevron.r)
      / (chevron.l w^((1)), f chevron.r)
      and d (chevron.l p^((1)), d f chevron.r)
      / (chevron.l p^((1)), f chevron.r) and dots.c} \
    & quad = Omega(p^((1)), w^((1)), w^((2)), ..., w^((n - 1)), f)
      - Omega(w^((1)), p^((1)), w^((2)), ..., w^((n - 1)), f) \
    & quad = Omega(w^((0)), w^((1)), w^((2)), ..., w^((n - 1)), f)
      - Omega(w^((0)), p^((1)), w^((2)), ..., w^((n - 1)), f),
  $
  where Lemma~@lem:kernel-first-argument was used in passing to the last
  equality.
]

#source(42)
#proof(title: [Proof of Theorem~@th:fundamental-integral-formula.])[
  If $w^((1)), ..., w^((n - 1))$ belong to the class $C^((2)) (partial D)$, then
  the difference of the kernels in @eq:yuzhakov-roos and
  @eq:fundamental-integral-formula is a $dbar$-exact form, by
  Lemma~@lem:kernel-dbar-exact, i.e., this difference is orthogonal to
  holomorphic functions when integration is considered over $partial D$ (see
  Corollary~@cor:exact-form-over-cycle). Therefore,
  @eq:fundamental-integral-formula follows from @eq:yuzhakov-roos. But if
  $w^((j)) in.not C^((2)) (partial D)$, then we can approximate them on
  $partial D$ by smoother vector-valued functions with preservation of the
  condition @eq:fundamental-condition, write the formula
  @eq:fundamental-integral-formula for the approximating functions, and pass to
  the limit.
]

We mention some immediate corollaries of @eq:fundamental-integral-formula.

#corollary(title: [Leray and Koppelman])[
  If $w^((0)), ..., w^((n - 1))$ satisfy the condition
  $
    chevron.l w^((j)) (z, a), z - a chevron.r != 0, quad
    z in partial D, a in D, j = 0, 1, ..., n - 1,
  $
  then every $phi in A_C (D)$ satisfies the #index-mark(
    "Formula",
    sub: "Cauchy-Fantappiè",
    subsub: "generalized",
  )generalized Cauchy-Fantappiè formula
  $
    integral_(partial D) phi Omega(w^((0)), w^((1)), ..., w^((n - 1)), z - a)
    = phi(a).
  $ <eq:generalized-cauchy-fantappie>
] <cor:leray-koppelman>

#corollary(title: [Leray])[
  If $w in C^((1)) (partial D)$ and $chevron.l w(z, a), z - a chevron.r != 0$
  for $z in partial D$ and $a in D$, then every $phi in A_C (D)$ can be
  represented by the #index-mark(
    "Formula",
    sub: "Cauchy-Fantappiè",
  )Cauchy-Fantappiè formula
  $
    integral_(partial D) phi omega(z - a, w) = phi(a),
  $ <eq:cauchy-fantappie>
  where
  $
    omega(z - a, w) = (n - 1)! / (2 pi i)^n
    (sum_(k = 1)^n (-1)^(k - 1) w_k d w_([k]) and d z)
    / (chevron.l w, z - a chevron.r^n).
  $
] <cor:cauchy-fantappie>

#proof[
  From @eq:kernel-normalized we get that
  $
    Omega(w, ..., w, z - a) = (n - 1)! / (2 pi i)^n
    sum_(k = 1)^n (-1)^(k - 1) u_k d u_([k]) and d z,
  $
  where
  $
    u = w / (chevron.l w, z - a chevron.r).
  $ <eq:cauchy-fantappie-normalized>
  #source(43)
  #new-par
  Further, taking @eq:kernel-determinant into account, we find
  $
    Omega(w, w, ..., w, z - a) & = (n - 1)! / (2 pi i)^n sum_(k = 1)^n
                                 mat(
                                   delim: "|",
                                   u_1 u'_11, dots.c, u'_(1 n);
                                   dots.c, [k], dots.c;
                                   u_n u'_(n 1), dots.c, u'_(n n)
                                 )
                                 d overline(z)_([k]) and d z \
                               & = (n - 1)!
                                 / ((2 pi i)^n chevron.l w, z - a chevron.r^n)
                                 sum_(k = 1)^n
                                 mat(
                                   delim: "|",
                                   w_1 w'_11, dots.c, w'_(1 n);
                                   dots.c, [k], dots.c;
                                   w_n w'_(n 1), dots.c, w'_(n n)
                                 )
                                 d overline(z)_([k]) and d z \
                               & = omega(z - a, w).
  $
]

Note that the vector-valued function @eq:cauchy-fantappie-normalized satisfies
the condition
$
  chevron.l u, z - a chevron.r = 1, quad z in partial D, a in D.
$ <eq:cauchy-fantappie-condition>
#new-par
We give @eq:cauchy-fantappie a more abstract form. Fix a point $a in D$ and
consider the surface
$M_a = {(z, u): chevron.l u, z - a chevron.r = 1, z in partial D}$ in the space
$CC^(2n)$ of complex variables $(z, u)$.

#corollary(title: [Leray])[
  Suppose that the vector-valued function $u(z, a)$, $z in partial D$, $a in D$,
  belongs to the class $C^((1)) (partial D)$ with respect to $z$ and satisfies
  condition @eq:cauchy-fantappie-condition. Let $alpha$ be the cycle on $M_a$
  described by the point $(z, u)$ as $z$ runs along $partial D$. This cycle is
  in some class $h in H_(2n - 1) (M_a)$. Then any $phi in A_C (D)$ and any cycle
  $beta in h$ satisfy the #index-mark(
    "Formula",
    sub: "Cauchy-Fantappiè",
  )Cauchy-Fantappiè formula
  $
    phi(a) = (n - 1)! / (2 pi i)^n integral_beta phi(z)
    sum_(k = 1)^n (-1)^(k - 1) u_k d u_([k]) and d z.
  $ <eq:cauchy-fantappie-cycle>
] <cor:cauchy-fantappie-cycle>

#proof[
  Observe that @eq:cauchy-fantappie-cycle is @eq:cauchy-fantappie for
  $beta = alpha$. To get @eq:cauchy-fantappie-cycle with any $beta in h$ from
  @eq:cauchy-fantappie it suffices to see that the form
  $phi(z) dot.c omega(z - a, u)$ is closed on $M_a$. Indeed, only $2n - 1$ of
  the differentials $d z_1, ..., d z_n, d u_1, ..., d u_n$ are independent on
  $M_a$, and the form under consideration has maximal dimension $2n - 1$, so it
  is closed.
]

We point out that the Cauchy-Fantappiè formula (all the more so, the generalized
Cauchy-Fantappiè formula) is not a single integral representation for functions
$phi in A_C (D)$, but a whole collection of such representations, depending on
the choice of the vector-valued function $w$. For various classes of domains $D$
it is possible to choose $w$ in such a way that the conditions of
Corollary~@cor:cauchy-fantappie hold and $w$ is holomorphic with respect to $a$
in $D$. We thus obtain integral representations with holomorphic kernels (see
@sec:cauchy-formula[§§4] and @sec:leray-modifications[8]–@sec:n-circular[11]).

The classical Cauchy formula
$
  f(a_1) = 1 / (2 pi i) integral_(partial D) (f(z_1) d z_1) / (z_1 - a_1)
$ <eq:cauchy-formula-one-variable>
#source(44)
for holomorphic functions of a single complex variable has two remarkable
properties which have been responsible for many of its applications:
#enum(numbering: "1)")[It is universal, i.e., true for any domain $D$ with a
  sufficiently nice boundary $partial D$, and the Cauchy kernel
  $1 \/ 2 pi i (z_1 - a_1)$ does not depend on the shape of $D$.][The Cauchy
  kernel is holomorphic in $a_1 in D$ for fixed $z_1 in partial D$.]
#new-par
There is no integral representation with two analogous properties for
holomorphic functions of several complex variables; instead, there exist
formulas that either are universal but have a nonholomorphic kernel (for
example, the Martinelli-Bochner formula @eq:martinelli-bochner) or have
holomorphic kernels but are not universal (see @sec:cauchy-formula[§§4] and
@sec:leray-modifications[8]–@sec:n-circular[11]).

The following assertion can be obtained similarly to the way
Corollary~@cor:cauchy-fantappie was obtained.

#corollary[
  If the domain $D$ and the mapping $f$ satisfy the conditions of
  Theorem~@th:fundamental-integral-formula and the vector-valued function
  $w in C^((1)) (partial D)$ is such that $chevron.l w, f chevron.r != 0$ on
  $partial D$, then for every $phi in A_C (D)$
  $
    integral_(partial D) phi omega(f, w) = sum_(a in E_f) mu_a (f) phi(a),
  $ <eq:cauchy-fantappie-mapping>
  where
  $
    omega(f, w) = (n - 1)! / (2 pi i)^n
    (sum_(k = 1)^n (-1)^(k - 1) w_k d w_([k]) and d f)
    / (chevron.l w, f chevron.r^n).
  $
  #notation-mark($omega(f, w)$, sort: "omega(f, w)")
] <cor:cauchy-fantappie-mapping>

We remark in conclusion that @eq:fundamental-integral-formula,
@eq:generalized-cauchy-fantappie, and @eq:cauchy-fantappie-mapping can be given
a more abstract form similarly to the way @eq:cauchy-fantappie was reduced to
the form @eq:cauchy-fantappie-cycle.
