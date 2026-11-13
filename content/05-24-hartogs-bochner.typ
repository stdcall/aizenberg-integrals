#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[The Hartogs-Bochner theorem on required analytic extension.
  Approximation of holomorphic functions on Weil polyhedra and linearly convex
  compact sets] <sec:hartogs-bochner>

#source(209)
#point <pt:boundary-extension> We discuss the question of holomorphic extension
into a domain $D$ of a function given on the boundary $partial D$. Let us
consider first a simple corollary to Theorem~@th:aronov-kytmanov.

#theorem(title: [Aronov and Kytmanov])[
  Let $D$ be a bounded domain with $partial D in C^((3))$, and let
  $f in C^((2)) (partial D)$. A function $F in C^((1)) (overline(D))$
  holomorphic in $D$ and such that $F|_(partial D) = f$ exists if and only if
  $
    integral_(partial D) f(zeta) omega(zeta - z, overline(zeta - z)) = 0
  $ <eq:mb-orthogonality>
  for $z in CC^n without overline(D)$. If $CC^n without overline(D)$ is
  connected, then it suffices that @eq:mb-orthogonality holds for
  $z in {w: |w_i| > R, i = 1, ..., n}$, where $R$ is a sufficiently large
  positive number.
] <th:aronov-kytmanov-extension>

#proof[
  The first part of the theorem follows at once from
  Theorem~@th:aronov-kytmanov, Lemma~@lem:saltus and the fact that
  $
    integral_(partial D) (f(zeta) d overline(zeta)_([k]) and d zeta)
    / (|zeta - z|^(2n - 2)), quad z in D,
  $ <eq:mb-potential>
  extends to $overline(D)$ as a function of class $C^((2)) (overline(D))$ (see
  Proposition~@prop:potentials-holder). It remains only to observe that the
  Martinelli-Bochner type integral of $f$ is a linear combination of derivatives
  of integrals of the form @eq:mb-potential and, consequently, is in the class
  $C^((1)) (overline(D))$. To prove the second assertion of the theorem, recall
  that a Martinelli-Bochner type integral is harmonic outside $partial D$.
]

#source(210)
#theorem(title: [Bochner])[
  Suppose that $D$ is a bounded domain, $partial D in C^((1))$,
  $CC^n without overline(D)$ is connected, $n > 1$, and
  $f in C^((1)) (partial D)$. A function $F in A(D) inter C^((1)) (overline(D))$
  such that $F|_(partial D) = f$ exists if and only if the Severi conditions
  (the #index-mark(
    "Conditions",
    sub: "Cauchy-Riemann tangential",
  )tangential Cauchy-Riemann equations) hold:
  $
    d f and d zeta|_(partial D) = 0.
  $ <eq:severi-conditions>
] <th:bochner>

#proof[
  The necessity follows at once from the Cauchy-Riemann conditions
  $partial F \/ partial overline(zeta)_k = 0$, $k = 1, ..., n$. For simplicity
  we prove the sufficiency under the assumptions that $partial D in C^((3))$ and
  $f in C^((2)) (partial D)$, which enable us to use the preceding theorem. Note
  that
  $
    omega(zeta - z, overline(zeta - z)) = d_zeta Omega(zeta, z),
  $ <eq:mb-kernel-exact>
  where
  $
    Omega(zeta, z) = (n - 2)! / (2 pi i)^n sum_(k = 2)^n
    (-1)^k / (|zeta - z|^(2n - 2))
    (overline(zeta)_k - overline(z)_k) / (zeta_1 - z_1)
    d overline(zeta)_([1, k]) and d zeta.
  $
  Let $R > 0$ be such that $D subset C(0, R)$. For $z in {w: |w_1| > R}$ and
  $zeta in partial D$ the form $Omega$ is regular. By Stokes' formula,
  @eq:severi-conditions and @eq:mb-kernel-exact now give us that
  $
    integral_(partial D) f(zeta) omega
    = integral_(partial D) f(zeta) d_zeta Omega
    = integral_(partial D) d_zeta [f(zeta) Omega] = 0.
  $
  It remains to refer to Theorem~@th:aronov-kytmanov-extension.
]

#theorem(title: [Hartogs, Osgood and Braun])[
  Suppose that $D$ is a bounded domain, $CC^n without overline(D)$ is connected,
  and $n > 1$. Every function $f(z)$ holomorphic on $partial D$ (i.e., in some
  neighborhood $U(partial D)$) extends holomorphically to the whole of $D$.
] <th:hartogs-osgood-braun>

#proof[
  We choose a domain $D'$ such that $partial D' in C^((1))$, $D' subset D$,
  $partial D' subset U(partial D)$ and $CC^n without overline(D)'$ is, as
  before, connected. The function $f(z)$ is holomorphic on $partial D'$;
  therefore, the tangential Cauchy-Riemann conditions hold on $partial D'$. By
  theorem~@th:bochner, there exists a function
  $F in A(D') inter C^((1)) (overline(D)')$ such that $F|_(partial D') = f$. It
  remains to show that $F = f$ in $U(partial D) inter D'$. This follows from the
  fact that they coincide on $partial D'$ and the fact that the zeros of a
  holomorphic function that is not identically zero cannot fill a
  $(2n - 1)$-dimensional continuous real surface (see, for example,
  @bib:Fuks1962, Theorem~4.7).
]

In proving this theorem it can be assumed that $partial D' in C^((3))$ in order
to use only the case of Theorem~@th:bochner we actually proved.

#small-print[
  If Theorem~@th:kytmanov-aizenberg is used instead of
  Theorem~@th:aronov-kytmanov, then the following result can be obtained in a
  way similar to that for Theorem~@th:aronov-kytmanov-extension.

  #source(211)
  #theorem(title: [Kytmanov and Aĭzenberg])[
    In each of the two cases in Theorem~@th:kytmanov-aizenberg condition
    @eq:mb-orthogonality is necessary and sufficient for every
    $f in C(partial D)$ to have an extension $F in A_C (D)$.
  ] <th:kytmanov-aizenberg-extension>

  As a corollary to this assertion we give another criterion for the existence
  of a holomorphic extension. Let $Z_(k, l) (zeta)$ be spherical (homogeneous
  harmonic) polynomials forming an orthonormal basis in the space
  $L^2 (partial B_1 (0))$ on the unit sphere $partial B_1 (0) subset CC^n$. Here
  $k$ is the degree of the polynomial, and $l$ is its index among the
  polynomials of degree $k$ appearing in the basis, $k = 0, 1, ...$,
  $l = 1, ..., sigma(k)$, where
  $
    sigma_k = (2(n + k - 1) (2n + k - 3)!) / (k! (2n - 2)!) .
  $

  #corollary[
    Suppose that $partial D in C^((2))$ is connected and $D$ is bounded. A
    function $f in C(partial D)$ is the trace on $partial D$ of a function in
    $A_C (D)$ if and only if
    $
      integral_(partial D) f(zeta) sum_(j = 1)^n (-1)^(j - 1)
      partial / (partial zeta_j) Z_(k, l) (zeta)
      d overline(zeta)_([j]) and d zeta = 0,
    $
    $l = 1, ..., sigma(k)$, $k = 0, 1, ...$.
  ] <cor:spherical-harmonics-criterion>

  For $n = 1$ this corollary is the familiar classical criterion that $f(zeta)$
  be orthogonal to all the monomials $zeta^k$, $k = 0, 1, ...$.

  We need the following concept to get another corollary to
  Theorem~@th:kytmanov-aizenberg-extension. Suppose that $D$ is bounded,
  $partial D in C^((1))$, and $f in C(partial D)$. We say that $f$ has the
  #index-mark(
    "Property",
    sub: "one-dimensional holomorphic extension",
  )_one-dimensional holomorphic extension property_ if for any complex line $l$
  the restriction $f_l = f|_(partial D inter l)$ has an extension
  $F_l in C(overline(D) inter l)$ that is holomorphic at interior (with respect
  to $l$) points of $overline(D) inter l$.

  #lemma[
    If a function $f$ has the one-dimensional holomorphic extension property,
    then @eq:mb-orthogonality holds for $z in CC^n without overline(D)$.
  ] <lem:one-dimensional-extension>

  #proof[
    Suppose that $z$ belongs to the unbounded component of
    $CC^n without overline(D)$. Let us perform an orthogonal linear
    transformation and a translation in $CC^n$ such that $z = 0$ and the plane
    ${z: z_1 = 0}$ does not intersect $D$. This can be done for points $z$
    sufficiently far from $D$, in which case the kernel
    $omega(zeta - z, overline(zeta - z))$ becomes $omega(zeta, overline(zeta))$.
    Next, we make the change of variables $zeta_1 = v_1^(-1)$,
    $zeta_j = v_j v_1^(-1)$, $j = 2, ..., n$, and get
    $
      d zeta = d zeta_1 and dots.c and d zeta_n
      = mat(
        delim: "|",
        -1 / v_1^2, 0, dots.c, 0;
        -v_2 / v_1^2, 1 / v_1, dots.c, 0;
        dots.v, dots.v, dots.down, dots.v;
        -v_n / v_1^2, 0, dots.c, 1 / v_1
      ) d v = -1 / v_1^(n + 1) d v.
    $
    Then $CC_z^n without {z: z_1 = 0}$ is mapped biholomorphically onto
    $CC_v^n without {v: v_1 = 0}$. Note that
    $
      sum_(k = 1)^n (-1)^(k - 1) overline(zeta)_k d overline(zeta)_([k])
      = sum_(k = 1)^n overline(Delta)_k d overline(v)_([k]),
    $
    #source(212)
    where
    $
      Delta_k = mat(
        delim: "|",
        zeta_1, zeta_2, dots.c, zeta_n;
        zeta'_(1 v_1), zeta'_(2 v_1), dots.c, zeta'_(n v_1);
        dots.v, dots.v, , dots.v;
        zeta'_(1 v_n), zeta'_(2 v_n), dots.c, zeta'_(n v_n)
      )
      = mat(
        delim: "|",
        1 / v_1, v_2 / v_1, dots.c, v_n / v_1;
        -1 / v_1^2, -v_2 / v_1^2, dots.c, -v_n / v_1^2;
        0, 1 / v_1, dots.c, 0;
        [k], , dots.down, dots.v;
        0, 0, dots.c, 1 / v_1
      )
      = cases(1 \/ v_1^n\, quad & k = 1\,, 0\, & k != 1.)
    $
    Therefore,
    $
      omega(zeta, overline(zeta))
      = (-1)^n (d v_1) / v_1
      and (d overline(v)_([1]) and d v_([1]))
      / (1 + |v_2|^2 + dots.c + |v_n|^2)^n
      = (d v_1) / v_1 and lambda(v'),
    $
    where $v' = (v_2, ..., v_n)$. Under our change of variables the lines
    ${zeta: zeta_1 = t, zeta_2 = c_2 t, ..., zeta_n = c_n t}$ pass into the
    lines ${v: v_2 = c_2, ..., v_n = c_n}$, and the boundary $partial D$ passes
    into some cycle $Gamma$. If $f$ has the one-dimensional holomorphic
    extension property, then after the change of variables this function (denote
    it now by $f(v)$) has the one-dimensional holomorphic extension property
    along the complex lines ${v: v_2 = c_2, ..., v_n = c_n}$. Further,
    $
      integral_(partial D) f omega(zeta, overline(zeta))
      = c_n integral_Gamma f(v) (d v_1) / v_1 and lambda(v')
      = c_n integral_(pi(Gamma)) lambda(v')
      integral_(pi^(-1) (v') inter Gamma) f(v) (d v_1) / v_1,
    $
    where $pi$ is the projection $v -> v'$. By Sard's theorem,
    $pi^(-1) (v') inter Gamma$ is a smooth curve for almost all
    $v' in pi(Gamma)$. The point $0$ lies outside the domain bounded by $Gamma$;
    therefore, the inside integral is equal to zero for almost all $v'$, i.e.,
    @eq:mb-orthogonality holds for $z$ sufficiently far from $D$. It is also
    valid for all points in the unbounded component of
    $CC^n without overline(D)$, because an integral of the Martinelli-Bochner
    type in @eq:mb-orthogonality is harmonic.

    Suppose now that $z$ is in a bounded component
    $Q subset CC^n without overline(D)$, and assume that $z = 0$ (this situation
    can always be attained by a translation of the origin). Consider a cone
    $Pi_epsilon$ with center at $0$ formed by complex lines passing through $0$,
    where $epsilon$ is the area of the part of the hypersurface $partial Q$
    interior to $Pi_epsilon$. After the same change of variables the cone passes
    into a cylinder formed by lines ${v: v_2 = c_2, ..., v_n = c_n}$, and
    $Pi_epsilon$ can be chosen so that: 1) the area of
    $partial(Q inter Pi_epsilon) inter partial D$ tends to zero as
    $epsilon -> 0$, whence
    $
      integral_(partial D) f omega(zeta, overline(zeta))
      = lim_(epsilon -> 0)
      integral_(partial D without partial(Q inter Pi_epsilon))
      f omega(zeta, overline(zeta));
    $
    and 2) $partial D without partial(Q inter Pi_epsilon)$ passes into a compact
    set $Gamma_epsilon$ under the change of variables. As above, it can be shown
    that
    $
      integral_(Gamma_epsilon) f(v) (d v_1) / v_1 and lambda(v') = 0,
    $
    consequently, @eq:mb-orthogonality holds also for $z in Q$.
  ]

  This lemma and Theorem~@th:kytmanov-aizenberg-extension give us

  #theorem(title: [Agranovskiĭ, Val'skiĭ and Stout])[
    If the domain $D$ is bounded, $partial D in C^((2))$, and the function
    $f in C(partial D)$ has the one-dimensional holomorphic extension property,
    then $f$ extends holomorphically into $D$.
  ] <th:agranovskii-valskii-stout>

  #source(213)
  We remark that the proof of Theorem~@th:riesz-herglotz-symmetric amounted to
  an application of Theorem~@th:riesz-herglotz-generalized and the fact that in
  the case under consideration linear combinations of polynomials of the form
  @eq:orthogonal-polynomials-circular are dense in $[P h_C (D)]_mu^perp$ in the
  metric of $C(S(D))$. These considerations (and analogous considerations for
  holomorphic functions) led to the following characterization of traces of
  pluriharmonic (respectively, holomorphic) functions on the Shilov boundary.

  #theorem(title: [Aĭzenberg and Dautov])[
    Suppose that $D$ is a circular strongly star-like bounded domain, $mu$ is a
    nonnegative rotation-invariant measure that is massive on $S(D)$ and for
    which there is a Szegö kernel, and each point of $S(D)$ is a peak point for
    the algebra $A_C (D)$. If $phi in C(S(D))$, then:
    #enum(numbering: "1)")[
      $phi = f|_(S(D))$ for some $f in A_C (D)$ if and only if #tagged-equation(
        [24.3$'$],
        $
          integral_(S(D)) phi P d mu = 0
        $,
      ) <eq:trace-orthogonality>
      for every polynomial of the form #tagged-equation(
        [24.4$'$],
        $
          cases(
            z^J overline(z)^frak(J) - P_(J frak(J)) (z)\,
            quad & |J| <= |frak(J)|\,,
            z^J overline(z)^frak(J)\, & |J| > |frak(J)|\,
          )
        $,
      ) <eq:trace-polynomials>
      #v(display-below)
    ][
      $phi = u|_(S(D))$ for some $u in P h_C (D)$ if and only if
      @eq:trace-orthogonality holds for any polynomial of the form
      @eq:orthogonal-polynomials-circular.
    ]
    #new-par
    If, moreover, $D$ is an $n$-circular domain, and the measure is invariant
    with respect to $n$-rotations, then @eq:trace-polynomials can be replaced by
    $
      cases(
        z^J overline(z)^frak(J)\, quad J lt.not frak(J)\,,
        z^J overline(z)^(J + frak(J))
        (a_(J + frak(J) + l_k)^2 - a_(J + frak(J))^2 |z_k|^2)\,,
      )
    $
    and @eq:orthogonal-polynomials-circular by
    @eq:orthogonal-polynomials-n-circular.
  ] <th:aizenberg-dautov>
]

#point <pt:weil-polyhedra> Let us consider a Weil polyhedron
$Delta = {z: z in D, |chi_i (z)| < 1, i = 1, ..., N}$, $chi_i (z) in A(D)$,
$i = 1, ..., N$, $Delta relcomp D$, and a function $f(z) in A(Delta)$. For every
$r$ with $0 < r < 1$ we have $f in A(overline(Delta(r)))$, where
$Delta(r) = {z: z in D, |chi_i (z)| < r, i = 1, ..., N}$. The function $f(z)$
can be represented in $Delta(r)$ by the Bergman-Weil formula @eq:bergman-weil.
Note that if $z in Delta(r)$ and $zeta in gamma_(i_1 dots.c i_n)$, then
$
  (|chi_(i_k) (z)|) / (|chi_(i_k)|) < 1;
$
therefore, @eq:bergman-weil gives us
$
  f(z) & = sum_(i_1 < dots.c < i_n) sum_(k_1, ..., k_n = 0)
         [1 / (2 pi i)^n integral_(gamma_(i_1 dots.c i_n))
           (f(zeta) Omega_(i_1 dots.c i_n) (zeta, z) d zeta)
           / (chi_(i_1)^(k_1 + 1) (zeta) dots.c chi_(i_n)^(k_n + 1) (zeta))] \
       & quad times chi_(i_1)^(k_1) (z) dots.c chi_(i_n)^(k_n) (z).
$ <eq:weil-expansion>
By the Cauchy-Poincaré Theorem~@th:cauchy-poincare, the series
@eq:weil-expansion does not depend on $r < 1$ for $r$ sufficiently close to $1$.
Thus, we have

#theorem(title: [Weil])[
  Every function $f in A(Delta)$ can be expanded for $z in Delta$ in a series
  @eq:weil-expansion uniformly convergent on compact subsets of $Delta$.
] <th:weil-expansion>

#source(214)
A polyhedron $Delta$ is called a #index-mark(
  "Domain",
  sub: "polynomial Weil",
)_polynomial Weil domain_ if all the $chi_i (z)$ are polynomials. A domain $D$
such that every $f in A(D)$ can be approximated uniformly on compact subsets of
$D$ by polynomials is called a #index-mark("Domain", sub: "Runge")_Runge
domain_.

#corollary[
  Every polynomial Weil domain is a Runge domain.
] <cor:polynomial-weil-runge>

The series @eq:weil-expansion is a generalization of a multiple power series. It
differs from a power series not just in the presence of the sum over
$i_1, ..., i_n$, nor just in the fact that the monomials
$z_1^(k_1) dots.c z_n^(k_n)$ are replaced by powers of the functions
$chi_i (z)$, $i = 1, ..., N$, but principally in the fact that the coefficients
of @eq:weil-expansion are functions of $z$ and that an expansion in this series
is, generally speaking, not unique.

#point <pt:partial-fractions> Consider the following problem: find conditions
under which a compact set $M subset CC^n$ has the property that every function
$f in A(M)$ can be represented in some neighborhood (depending on $f$) of $M$ by
a uniformly convergent series of "partial fractions":
$
  f(z) = sum_(p = 1)^infinity A_p
  / (product_(j = 1)^n (a_(p j 1) z_1 + dots.c + a_(p j n) z_n + b_(p j))),
$ <eq:partial-fractions>
where $sum_(m = 1)^n |a_(p j m)|^2 = 1$, $j = 1, ..., n$, $p = 1, 2, ...$, and
$sum_1^infinity |A_p| < infinity$.

Without loss of generality we can assume that the compact set $M$ is connected.
Certain concepts will be needed in what follows. A compact set $M$ is said to be
#index-mark(
  "Approximation of a compact set from the outside",
)_approximated from the outside_ by a sequence of domains $D_p$,
$p = 1, 2, ...$, if $D_(p + 1) relcomp D_p$ and $M = inter_p D_p$. We introduce
the concept of the #index-mark(
  "Envelope of holomorphy of a compact set",
)_envelope of holomorphy of a compact set_. Suppose that there exists a sequence
of domains $D_p$, $p = 1, 2, ...$, approximating $M$ from the outside such that
each $D_p$ has a one-sheeted envelope of holomorphy $cal(H) (D_p)$; then we say
that _the compact set $M$ has a one-sheeted envelope of holomorphy_, and define
$cal(H) (M) = inter_p cal(H) (D_p)$#notation-mark($cal(H) (M)$).

The following assertions are easy to see:

#enum(numbering: "1)")[
  _$cal(H) (M)$ is compact and does not depend on the choice of the sequence
  $D_p$, and each function holomorphic on $M$ is holomorphic also on
  $cal(H) (M)$._
][
  _If every function holomorphic on $M$ is also holomorphic on a set $E$, then
  $E subset cal(H) (M)$._
][
  _On $cal(H) (M)$ each function in $A(M)$ takes only the values it takes on
  $M$._
]
#new-par
In the solution of the problem posed above we assume that $M$ has a one-sheeted
envelope of holomorphy. This restriction seems natural in the case at hand.
Indeed, it is natural to assume that $M$ can be approximated from the outside by
a sequence of domains $D_p$, $p = 1, 2, ...$, such that each $f in A(D_p)$
#source(215) can be approximated uniformly on compact subsets of $D_p$ by
rational functions, and that the domains have one-sheeted envelopes of
holomorphy $cal(H) (D_p)$ (see @bib:Fuks1963, Chapter~I, §3.2).

A #index-mark("Domain", sub: "linearly convex")_domain_ $D subset CC^n$ is said
to be _linearly convex_ if for each $zeta in partial D$ there is an analytic
plane of complex dimension $n - 1$ passing through $zeta$ and not intersecting
$D$. Through each point in a $(2n - 1)$-dimensional hyperplane $alpha$ it is
possible to pass an analytic plane of complex dimension $n - 1$ lying in
$alpha$, so every convex domain in $CC^n$ is also linearly convex. Further, a
topological product $D = D_1 times dots.c times D_n$ of domains in $CC^1$ is a
linearly convex domain, and, in particular, any domain $D subset CC^1$ is
linearly convex.

A #index-mark("Compact set", sub: "linearly convex")_compact set_ $M$ is said to
be _linearly convex_ if there exists a sequence of linearly convex domains
approximating it from the outside.

Suppose that $E subset CC^n$ and $0 in E$. The #index-mark(
  "Conjugate set",
)_conjugate set_ is defined to be
$tilde(E) = {w: chevron.l w, z chevron.r != 1 "for all" z in E}$#notation-mark(
  $tilde(E)$,
). The set conjugate to $tilde(E)$ is denoted by
$tilde(tilde(E))$#notation-mark($tilde(tilde(E))$). We always have
$E subset tilde(tilde(E))$. It is not hard to prove the following properties:

#enum(numbering: "1)", start: 4)[
  _If $E$ is open, then $tilde(E)$ is compact, and, conversely, if $E$ is
  compact, then $tilde(E)$ is open._
][
  _If $E_1 relcomp E$, then $tilde(E) relcomp tilde(E)_1$ and
  $tilde(tilde(E))_1 relcomp tilde(tilde(E))$._
][
  _A domain $D in.rev 0$ is linearly convex if and only if
  $(tilde(tilde(D)))_C = D$, where $(tilde(tilde(D)))_C$ is the connected
  component of $tilde(tilde(D))$ containing $D$._
][
  _A compact set $E$ is linearly convex if and only if there exists a sequence
  of linearly convex Weil polyhedra defined by means of functions of the form_
  $
    c / (a_1 z_1 + dots.c + a_n z_n + b)^m,
  $ <eq:linearly-convex-fractions>
  _and approximating $E$ from the outside (here $a_1, ..., a_n$, $b$, and $c$
  are complex numbers and $m$ is a positive integer)._
]
#new-par
We can now formulate a result solving our problem.

#theorem(title: [Aĭzenberg])[
  Suppose that the compact set $M$ has a one-sheeted envelope of holomorphy
  $cal(H) (M)$. Then every $f in A(M)$ can be represented in some neighborhood
  of $M$ (depending on $f$) by a uniformly convergent series
  @eq:partial-fractions if and only if the envelope of holomorphy $cal(H) (M)$
  is a linearly convex compact set.
] <th:aizenberg-partial-fractions>

If $n = 1$, then $cal(H) (D) = D$ for every domain $D$, and every connected
compact set is linearly convex. Therefore,
Theorem~@th:aizenberg-partial-fractions contains the classical result of Wolff
that the approximation under consideration is always valid when $n = 1$.

Some auxiliary propositions are needed to prove
Theorem~@th:aizenberg-partial-fractions. Let $E(U(M))$ be the set of points
$eta = (eta_1, ..., eta_(n + 1)) in CC^(n + 1)$ such that
$sum_1^n |eta_i|^2 = 1$ #source(216) and the plane
$alpha(eta) = {z: z_1 eta_1 + dots.c + z_n eta_n + eta_(n + 1) = 0}$ does not
intersect the neighborhood $U(M)$ of the compact set $M$, and let
$F = {(z, eta): z in M, eta in E(U(M))} subset CC^(2n + 1)$.

#lemma[
  There exists a constant $delta > 0$ such that for all $(z, eta) in F$
  $
    |z_1 eta_1 + dots.c + z_n eta_n + eta_(n + 1)| >= delta.
  $ <eq:plane-distance>
] <lem:plane-distance>

#proof[
  The function $|z_1 eta_1 + dots.c + z_n eta_n|$ is continuous on the compact
  set $F_1 = {(z, eta_1, ..., eta_n): z in M, sum_1^n |eta_i|^2 = 1}$.
  Therefore, there exists a $delta_1 > 0$ such that
  $|z_1 eta_1 + dots.c + z_n eta_n| <= delta_1$ for all points in $F_1$. We
  break up the set $E(U(M))$ into two parts:
  $E_1 = {eta: eta in E(U(M)), |eta_(n + 1)| > 2 delta_1}$ and
  $E_2 = {eta: eta in E(U(M)), |eta_(n + 1)| <= 2 delta_1}$. For all points
  $(z, eta) in M times E_1$ we get
  $
    |z_1 eta_1 + dots.c + z_n eta_n + eta_(n + 1)|
    >= |eta_(n + 1)| - |z_1 eta_1 + dots.c + z_n eta_n| > delta_1.
  $
  #new-par
  Therefore, it suffices to establish an inequality of the form
  @eq:plane-distance for $eta in E_2$.

  The set $E_2$ is bounded, since it is contained in the compact set
  ${eta: sum_1^n |eta_i|^2 = 1, |eta_(n + 1)| <= 2 delta_1}$. We show that $E_2$
  is closed. Suppose that $eta^((0)) = lim_(p -> infinity) eta^((p))$,
  $eta^((p)) in E_2$, $p = 1, 2, ...$. All the planes $alpha(eta^((p)))$ are
  disjoint from $U(M)$, because $eta^((p)) in E(U(M))$. Obviously, the limit
  plane $alpha(eta^((0)))$ is also disjoint from $U(M)$. Consequently,
  $eta^((0)) in E(U(M))$. Finally, observe that
  $|eta_(n + 1)^((0))| = lim_(p -> infinity) |eta_(n + 1)^((p))| <= 2 delta_1$,
  and so $eta^((0)) in E_2$. The positive continuous function
  $|z_1 eta_1 + dots.c + z_n eta_n + eta_(n + 1)|$ attains its infimum
  $delta_2 > 0$ on the compact set $F_2 = {(z, eta): z in M, eta in E_2}$. Thus,
  an inequality of the form @eq:plane-distance holds also for $(z, eta) in F_2$.
]

#lemma[
  Suppose that a closed bounded domain $overline(D)$ can be approximated from
  the outside by a sequence of Weil polyhedra given by means of functions of the
  form @eq:linearly-convex-fractions. Then every function $f in A(overline(D))$
  can be represented by a series @eq:partial-fractions that converges uniformly
  on compact subsets of $D$.
] <lem:weil-polyhedra-fractions>

The proof of this lemma does not differ in principle from that of the analogous
theorem of Wolff for the case $n = 1$ (see @bib:Walsh1956, Chapter~I,
Theorem~13), but is considerably more cumbersome because the Weil integral is
employed instead of the Cauchy integral, so we omit it.

#proof(title: [Proof of Theorem~@th:aizenberg-partial-fractions.])[
  _Sufficiency._ If $cal(H) (M)$ is a linearly convex compact set, then it can
  be approximated from the outside (see property 7)) by a sequence of linearly
  convex bounded Weil polyhedra $Delta_p$, $p = 1, 2, ...$, given by means of
  functions of the form @eq:linearly-convex-fractions. Every function
  $f in A(M)$ is in $A(cal(H) (M))$, by property 1), so there is a $p_0$ such
  that $f in A(overline(Delta)_(p_0))$. The polyhedron $overline(Delta)_(p_0)$
  can in turn be approximated from the outside by Weil polyhedra of the same
  form. It remains to apply Lemma~@lem:weil-polyhedra-fractions.

  _Necessity._ Without loss of generality it can be assumed that $0 in M$ (this
  situation can always be attained by a translation of the origin, whereupon the
  #source(217) series @eq:partial-fractions passes into a series of the same
  form, the linearly convex compact sets pass into linearly convex compact sets,
  etc.). We take any sequence of domains $D_p$, $p = 1, 2, ...$, that
  approximates $cal(H) (M)$ from the outside and consider the sequence
  $(tilde(tilde(D))_p)_C$, $p = 1, 2, ...$, of linearly convex (see property 6))
  domains, which approximate the compact set
  $M_1 = inter_p (tilde(tilde(D))_p)_C$, $M_1 supset cal(H) (M)$, from the
  outside (see 5)). Every $f in A(M)$ can by assumption be represented in some
  neighborhood $U$ of $M$ by a uniformly convergent series
  @eq:partial-fractions. It is well known that the domains of uniform
  convergence of series of holomorphic functions are (see @bib:Fuks1963,
  Chapter~I, §1.2) domains of holomorphy; therefore, the series
  @eq:partial-fractions converges uniformly on compact sets lying in the
  envelope of holomorphy $cal(H) (U) supset cal(H) (M)$. Hence, there exists a
  $p_0$ such that this series converges uniformly in $D_(p_0)$. The denominator
  of each term in the series is nonzero in $D_(p_0)$, i.e.,
  $(-a_(p j 1) b_(p j)^(-1), ..., -a_(p j n) b_(p j)^(-1)) in tilde(D)_(p_0)$
  (note that $0 in M subset cal(H) (M) subset D_(p_0)$, and so $b_(p j) != 0$);
  hence, this denominator is also nonzero in $(tilde(tilde(D))_(p_0))_C$. By
  Lemma~@lem:plane-distance and the convergence of $sum_1^infinity |A_p|$, this
  gives us the uniform convergence of @eq:partial-fractions in
  $tilde(tilde(D))_(p_0) supset M_1$. Thus, every $f in A(M)$ is also in
  $A(M_1)$, so (see property 2)) $M_1 subset cal(H) (M)$. It has thus been shown
  that $cal(H) (M) = M_1$, and the compact set $M_1$ is linearly convex.
]

#small-print[
  #point <pt:linear-functionals> The integral representation
  @eq:linearly-convex-formula enabled us to describe the general form of the
  continuous linear functionals on the spaces $A(D)$ (respectively, $A(M)$) of
  functions holomorphic in linearly convex domains (on compact sets) that can be
  approximated from the inside (from the outside) by bounded regular linearly
  convex domains. Such an approximation is not always possible. A topology is
  introduced in $A(D)$ and $A(M)$ in the usual way. This description is a
  generalization of the familiar results of Köthe, Sebastião e Silva, and
  Grothendieck for the case $n = 1$. The conjugate set plays the role of the
  exterior. Let $D_m = {z: Phi_m (z) < 0}$ be the approximating domains
  indicated above, with $0 in D_m$, $m = 1, 2, ...$. We set
  $tau(Phi) = (tau_1 (Phi), ..., tau_n (Phi))$, where
  $tau_i (Phi) = Phi'_(z_i) chevron.l grad Phi, z chevron.r^(-1)$,
  $i = 1, ..., n$.

  #theorem(title: [Martineau and Aĭzenberg])[
    Every continuous linear functional $F(f)$ in $A(D)$ (in $A(M)$) has the form
    $
      F(f) = integral_(partial D_m) f(z) phi(tau(Phi_m))
      omega(z, grad Phi_m (z)),
    $ <eq:functional-representation>
    where $phi in A(tilde(D))$ (respectively, $phi in A(tilde(M))$) and $m$
    depends only on $phi$. This formula gives an isomorphism between the
    topological linear spaces $A'(D)$ and $A(tilde(D))$ (respectively, $A'(M)$
    and $A(tilde(M))$).
  ] <th:martineau-aizenberg>

  Suppose that $F in A'(D)$ (respectively, $F in A'(M)$). The #index-mark(
    "Indicatrix",
    sub: "Fantappiè",
  )Fantappiè indicatrix is defined to be the function
  $F_z [(1 - chevron.l z, w chevron.r)^(-n)]$, where $z in D$, $w in tilde(D)$
  and $0 in D$ (respectively, $z in M$, $w in tilde(M)$ and $0 in M$). In
  @eq:functional-representation the function $phi$ is the indicatrix of the
  corresponding functional $F$. A domain $D$ (a compact set $M$) is said to be
  #index-mark(
    "Domain",
    sub: "strongly linearly convex",
  )#index-mark(
    "Compact set",
    sub: "strongly linearly convex",
  )_strongly linearly convex_ if it is linearly convex, and the mapping
  $F -> F_z [(1 - chevron.l z, w chevron.r)^(-n)]$ is an isomorphism between the
  spaces $A'(D)$ and $A(tilde(D))$ (respectively, $A'(M)$ and $A(tilde(M))$). It
  follows from Theorem~@th:martineau-aizenberg that the approximation mentioned
  before this theorem is a sufficient condition for strong linear convexity. The
  next result is based on Theorem~@th:aizenberg-partial-fractions.

  #source(218)
  #theorem(title: [Znamenskiĭ])[
    A domain (compact set) is strongly linearly convex if and only if it
    intersects every complex line in a connected and simply connected set.
  ] <th:znamenskii>

  It is now possible to formulate a result on expansion of holomorphic functions
  in fractions of a simpler form than in @eq:partial-fractions:
  $
    f(z) = sum_(p = 1)^infinity A_p
    / (a_(p 1) z_1 + dots.c + a_(p n) z_n + b_p)^n,
  $ <eq:simple-fractions>
  where $sum_(m = 1)^n |a_(p m)|^2 = 1$ and
  $sum_(p = 1)^infinity |A_p| < infinity$. As in @pt:partial-fractions, it is
  assumed that the compact set $M$ is connected and has a one-sheeted envelope
  of holomorphy $cal(H) (M)$.

  #theorem(title: [Trutnev])[
    Every $f in A(M)$ can be represented in a neighborhood of $M$ by a uniformly
    convergent series @eq:simple-fractions if and only if the envelope of
    holomorphy $cal(H) (M)$ is a strongly linearly convex compact set.
  ] <th:trutnev>

  #corollary(title: [Aĭzenberg])[
    For every $f in A(M)$ to be representable in a neighborhood of $M$ by a
    uniformly convergent series @eq:simple-fractions it is necessary that
    $cal(H) (M)$ be a linearly convex compact set, and sufficient that
    $cal(H) (M)$ be approximable from the outside by regular linearly convex
    domains.
  ] <cor:aizenberg-simple-fractions>
]
