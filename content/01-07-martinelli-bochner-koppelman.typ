#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[The Martinelli-Bochner-Koppelman integral representation\
  for exterior differential forms]
<sec:martinelli-bochner-koppelman>

In this section formula @eq:martinelli-bochner is generalized to exterior
differential forms.

Let $w(zeta, z) = (w_1, ..., w_n)$ be a vector-valued function defined on a set
$U subset CC_zeta^n times CC_z^n without {(zeta, z): zeta = z}$, and such that
$chevron.l w, zeta - z chevron.r = 1$. If $w_i in C^((1)) (U)$, then we
write#notation-mark($W_(p, q) (w, zeta, z)$)
$
  W_(p, q) (w, zeta, z)
  = ((-1)^(q + p(n - q - 1)) binom(n - 1, q)) / ((2 pi i)^n p! (n - p)!)
  D_(1, q, n - q - 1) (w, dbar_z w, dbar_zeta w)
  and D_(p, n - p) (partial z, partial zeta), \
  W_(p, -1) equiv W_(p, n) equiv 0.
$
The forms $W_(p, q) (w, zeta, z)$ with the special choice
$w = t(zeta, z) = (overline(zeta) - overline(z)) \/ |zeta - z|^2$ are integral
representation kernels for exterior differential forms; therefore, we introduce
the extra notation#notation-mark($U_(p, q) (zeta, z)$)
$
  U_(p, q) (zeta, z) = W_(p, q) (t(zeta, z), zeta, z).
$
#source(64)
Observe that $W_(0, 0) (w, zeta, z) = omega(zeta - z, w)$, since
$
  W_(0, 0) (w, zeta, z)
  & = 1 / ((2 pi i)^n n!) D_(1, n - 1) (w, dbar_zeta w) and D_n (partial zeta) \
  & = (n - 1)! / (2 pi i)^n sum_(k = 1)^n (-1)^(k - 1)
  w_k d_zeta w_([k]) and d zeta.
$

#theorem(title: [Koppelman])[
  Let $D$ be a bounded domain with piecewise smooth boundary $partial D$, and
  let $gamma in C_(p, q)^((1)) (overline(D))$. Then the #index-mark(
    "Representation",
    sub: "integral",
    subsub: "Martinelli-Bochner-Koppelman",
    target: <th:koppelman>,
  )Martinelli-Bochner-Koppelman formula is valid:
  $
    J_(p, q)^1 (D, gamma) - J_(p, q)^2 (D, dbar_zeta gamma)
    - dbar_z J_(p, q - 1)^2 (D, gamma)
    = cases(gamma(z)\, quad & z in D, 0\, & z in.not overline(D)\,)
  $ <eq:martinelli-bochner-koppelman>
  where#notation-mark($J_(p, q)^1 (D, gamma)$)#notation-mark(
    $J_(p, q)^2 (D, gamma)$,
  )
  $
    J_(p, q)^1 (D, gamma)(z)
    & = integral_((partial D)_zeta) gamma(zeta) and U_(p, q) (zeta, z), \
    J_(p, q)^2 (D, gamma)(z)
    & = integral_(D_zeta) gamma(zeta) and U_(p, q) (zeta, z).
  $
] <th:koppelman>

Note that $U_(p, q) (zeta, z)$ has type $(p, q)$ with respect to $z$ and type
$(n - p, n - q - 1)$ with respect to $zeta$. For $n = 1$ in the case $p = q = 0$
the third term is not present in @eq:martinelli-bochner-koppelman by definition,
and
$
  U_(0, 0) (zeta, z) & = W_(0, 0) (1 / (zeta_1 - z_1), zeta_1, z_1) \
                     & = 1 / (2 pi i) D_(1, 0, 0) (1 / (zeta_1 - z_1), ...)
                       and D_(0, 1) (d z_1, d zeta_1)
                       = 1 / (2 pi i) (d zeta_1) / (zeta_1 - z_1)
$
so that the classical #index-mark("Formula", sub: "Pompeiu")_Pompeiu formula_,
sometimes called the #index-mark("Formula", sub: "Cauchy-Green")_Cauchy-Green
formula_,
$
  1 / (2 pi i) integral_(partial D) (phi(zeta_1) d zeta_1) / (zeta_1 - z_1)
  - 1 / (2 pi i) integral_D
  (phi'_(overline(zeta)_1) (zeta_1) d overline(zeta)_1 and d zeta_1)
  / (zeta_1 - z_1)
  = cases(phi(z)\, quad & z in D\,, 0\, & z in.not overline(D)\,)
$
follows from @eq:martinelli-bochner-koppelman, where
$phi in C^((1)) (overline(D))$. In the particular case where $p = q = 0$ and
$n > 1$ we have
$U_(0, 0) (zeta, z) = omega(zeta - z, overline(zeta) - overline(z))$, and we
arrive at the Martinelli-Bochner formula @eq:martinelli-bochner-smooth for
smooth functions.

Formula @eq:martinelli-bochner-koppelman is true also under somewhat more
general requirements: for example, it holds when $D$ is the union of finitely
many domains of the type indicated in Theorem~@th:koppelman whose closures are
disjoint. Further, we note that
$
  dbar_z t = (overline(zeta) - overline(z)) dbar_z 1 / (|zeta - z|^2)
  - 1 / (|zeta - z|^2) dbar_z overline(z),
$
#source(65)
and so, for $q >= 1$
$
  & D_(1, q, n - q - 1) (t, dbar_z t, dbar_zeta t)
    = 1 / (|zeta - z|^2) dbar_z 1 / (|zeta - z|^2)
    and D_(2, q - 1, n - q - 1) (
      overline(zeta) - overline(z), dbar_z t, dbar_zeta t
    ) \
  & quad - 1 / (|zeta - z|^4) D_(1, 1, q - 1, n - q - 1) (
      overline(zeta) - overline(z), dbar_z overline(z), dbar_z t,
      dbar_zeta t
    ).
$
The first determinant on the right-hand side has two identical columns of
functions; consequently, it equals zero by Property~@st:determinant-interchange.
Application of this device $q - 1$ more times gives us that
$
  D_(1, q, n - q - 1) (t, dbar_z t, dbar_zeta t)
  = (-1)^q / (|zeta - z|^(2q + 2)) D_(1, q, n - q - 1) (
    overline(zeta) - overline(z), dbar_z overline(z), dbar_zeta t
  ).
$
We proceed similarly with the last $n - q - 1$ columns, and get that
$
  & D_(1, q, n - q - 1) (t, dbar_z t, dbar_zeta t) \
  & quad = (-1)^q / (|zeta - z|^(2n)) D_(1, q, n - q - 1) (
      overline(zeta) - overline(z), dbar_z overline(z),
      dbar_zeta overline(zeta)
    ) \
  & quad = ((-1)^q q! (n - q - 1)!) / (|zeta - z|^(2n)) sum'_J
    sum_(k = 1 \ k in.not J)^n sigma(J, k) (overline(zeta)_k - overline(z)_k)
    d overline(z)_J d overline(zeta)_([J, k]),
$ <eq:koppelman-determinant>
where $J = (i_1, ..., i_q)$ is a multi-index, the prime after the summation sign
indicates summation over $J$ with $1 <= i_1 < dots.c < i_q <= n$, the constant
$sigma(J, k)$ is determined by the equality $sigma(J, k) d overline(z)
= d overline(z)_k and d overline(z)_J and d overline(z)_([J, k])$, and the
factors $q!$ and $(n - q - 1)!$ are due to the permutations of the $q$ columns
consisting of differentials of $overline(z)$ and the $n - q - 1$ columns
consisting of differentials of $overline(zeta)$, respectively. Using the
equality
$
  D_(p, n - p) (partial z, partial zeta)
  = p! (n - p)! sum'_frak(J) sigma(frak(J)) d z_frak(J) d zeta_([frak(J)]),
$
where $frak(J) = (j_1, ..., j_p)$ and
$sigma(frak(J)) d z = d z_frak(J) and d z_([frak(J)])$, we get the following
expression for the Martinelli-Bochner-Koppelman kernel:
$
  U_(p, q) (zeta, z) & = ((-1)^(p(n - q - 1)) (n - 1)!) / (2 pi i)^n
                       sum'_(J, frak(J)) sum_(k = 1 \ k in.not J)^n
                       sigma(J, k) sigma(frak(J)) \
                     & quad times (overline(zeta)_k - overline(z)_k)
                       / (|zeta - z|^(2n)) d overline(zeta)_([J, k])
                       and d zeta_([frak(J)]) d overline(z)_J and d z_frak(J).
$ <eq:martinelli-bochner-koppelman-kernel>
#source(66)
#new-par
To prove Theorem~@th:koppelman we need one more form of expression for the
kernel $U_(0, q)$. If
$
  v_q = ((-1)^n (n - 1)!) / (2 pi i)^n sum'_J sum_(k = 1 \ k in.not J)^n
  sigma(J, k) (-1)^(k - 1) d overline(zeta)_([J, k]) and d zeta_([k])
  d overline(z)_J,
$
then
$
  U_(0, q) = (-1)^(q + 1) / (1 - n) partial_zeta 1 / (|zeta - z|^(2n - 2))
  and v_q.
$ <eq:koppelman-kernel-potential>

#lemma[
  Let $w(zeta, z)$ be a vector-valued function of class $C^((2))$ on the set
  $U subset (CC_zeta^n times CC_z^n) without {(zeta, z): zeta = z}$ such that
  $chevron.l w, zeta - z chevron.r = 1$ and $0 <= q <= n$. Then
  $
    dbar_zeta W_(p, q) (w, zeta, z) = (-1)^(p + q) dbar_z W_(p, q - 1) (
      w, zeta, z
    ).
  $ <eq:koppelman-kernel-dbar>
  In particular, $dbar_zeta W_(0, 0) = dbar_z W_(p, n - 1) = 0$.
] <lem:koppelman-kernel-dbar>

#proof[
  For $1 <= q <= n$ Property~@st:determinant-dbar gives us that
  $
    & dbar_z D_(1, q - 1, n - q) (w, dbar_z w, dbar_zeta w)
      = D_(q, n - q) (dbar_z w, dbar_zeta w) \
    & quad + (-1)^(q - 1) (n - q) D_(1, q - 1, 1, n - q - 1) (
        w, dbar_z w, dbar_z dbar_zeta w, dbar_zeta w
      ),
  $ <eq:dbar-z-determinant>
  and for $0 <= q <= n - 1$
  $
    & dbar_zeta D_(1, q, n - q - 1) (w, dbar_z w, dbar_zeta w)
      = (-1)^q D_(q, n - q) (dbar_z w, dbar_zeta w) \
    & quad + q D_(1, q - 1, 1, n - q - 1) (
        w, dbar_z w, dbar_zeta dbar_z w, dbar_zeta w
      ).
  $ <eq:dbar-zeta-determinant>
  According to Property~@st:determinant-factor, the first determinants in
  @eq:dbar-z-determinant and @eq:dbar-zeta-determinant are equal to zero. The
  second terms are equal to zero for $q = n$ in @eq:dbar-z-determinant and for
  $q = 0$ in @eq:dbar-zeta-determinant; therefore, @eq:koppelman-kernel-dbar
  holds for $q = 0, n$.

  If $1 <= q <= n - 1$, then the second determinants in @eq:dbar-z-determinant
  and @eq:dbar-zeta-determinant are equal, since the double forms
  $dbar_z dbar_zeta w$ and $dbar_zeta dbar_z w$ are equal. Hence,
  $
    dbar_zeta [(n - q) D_(1, q, n - q - 1) (w, dbar_z w, dbar_zeta w)]
    = dbar_z [(-1)^(q - 1) q D_(1, q - 1, n - q) (w, dbar_z w, dbar_zeta w)].
  $
  Multiplying the last equality by
  $
    ((n - 1)! (-1)^(p(n - q - 1)))
    / ((2 pi i)^n q! (n - q)! p! (n - p)!)
    D_(p, n - p) (partial z, partial zeta),
  $
  we arrive at @eq:koppelman-kernel-dbar.
]

#lemma[
  If $f in C^((1))$ in a neighborhood of the point $0 in CC^n$, then
  $
    lim_(epsilon -> 0) integral_(|zeta| = epsilon)
    (f(zeta) d overline(zeta) and d zeta_([k])) / (|zeta|^(2n - m))
    = cases(
      (-1)^(n - k - 1) (2 pi i)^n / (n!) (partial f) / (partial zeta_k) (0)\,
      quad & m = 0\,,
      0\, & m > 0\;
    )
  $ <eq:sphere-limit>
  #source(67)
  in particular,
  $
    lim_(epsilon -> 0) integral_(|zeta| = epsilon)
    (f(zeta) zeta_j d overline(zeta) and d zeta_([k])) / (|zeta|^(2n))
    = (-1)^(n - k - 1) (2 pi i)^n / (n!) f(0) delta_(j k).
  $ <eq:sphere-limit-delta>
] <lem:sphere-limit>

#proof[
  In fact,
  $
    & integral_(|zeta| = epsilon)
      (f(zeta) d overline(zeta) and d zeta_([k])) / (|zeta|^(2n - m))
      = 1 / epsilon^(2n - m) integral_(|zeta| = epsilon) f(zeta)
      d overline(zeta) and d zeta_([k]) \
    & = (-1)^(n - k - 1) epsilon^(m - 2n) integral_(|zeta| < epsilon)
      (partial f) / (partial zeta_k) d overline(zeta) and d zeta \
    & = (-1)^(n - k - 1) epsilon^(m - 2n) [(partial f) / (partial zeta_k) (0)
        integral_(|zeta| < epsilon) d overline(zeta) and d zeta
        + integral_(|zeta| < epsilon) ((partial f) / (partial zeta_k) (zeta)
          - (partial f) / (partial zeta_k) (0)) d overline(zeta) and d zeta] \
    & = (-1)^(n - k - 1) epsilon^(m - 2n) [(2 pi i)^n / (n!) epsilon^(2n)
        (partial f) / (partial zeta_k) (0) + o(epsilon^(2n))],
  $
  and, passing to the limit as $epsilon -> 0$, we get @eq:sphere-limit. To prove
  @eq:sphere-limit-delta it now suffices to note that
  $(partial \/ partial zeta_k) f(zeta) zeta_j|_(zeta = 0) = f(0) delta_(j k)$.
]

#proof(title: [Proof of Theorem~@th:koppelman.])[
  Because the operations performed on the form $gamma$ on the left-hand side of
  @eq:martinelli-bochner-koppelman are additive, it suffices to carry out the
  proof for forms like
  $
    gamma = f(z) d overline(z)_J and d z_frak(J),
  $
  where $f in C^((1)) (overline(D))$, $J = (i_1, ..., i_q)$ and
  $frak(J) = (j_1, ..., j_p)$. Further,
  $
    gamma(zeta) and U_(p, q) (zeta, z)
    & = ((-1)^(q + p(n - q - 1)) binom(n - 1, q))
    / ((2 pi i)^n p! (n - p)!) f(zeta) d overline(zeta)_J and d zeta_frak(J) \
    & quad and D_(1, q, n - q - 1) (t, dbar_z t, dbar_zeta t)
    and D_(p, n - p) (partial z, partial zeta) \
    & = f(zeta) d overline(zeta)_J and ((-1)^q binom(n - 1, q)) / (2 pi i)^n
    D_(1, q, n - q - 1) (t, dbar_z t, dbar_zeta t) and d zeta d z_frak(J) \
    & = f(zeta) d overline(zeta)_J and U_(0, q) (zeta, z) and d z_frak(J).
  $
  Similarly,
  $
    dbar gamma and U_(p, q) (zeta, z)
    & = dbar (f d overline(zeta)_J) and U_(0, q) d z_frak(J), \
    gamma and U_(p, q - 1) (zeta, z)
    & = f d overline(zeta)_J and U_(0, q - 1) d z_frak(J),
  $
  i.e., it suffices to obtain @eq:martinelli-bochner-koppelman for forms of type
  $(0, q)$---more precisely, for forms like $gamma = f(z) d overline(z)_J$.

  #source(68)
  Finally, the kernels $U_(0, q)$ are invariant under the transformations
  $zeta_j -> zeta_(tau(j))$, $z_j -> z_(tau(j))$, $j = 1, ..., n$, where $tau$
  is an arbitrary permutation, since the same rows are thereby interchanged in
  the two determinants of $U_(0, q)$. Hence, it suffices to consider forms like
  $
    gamma = f(z) d overline(z)_1 and dots.c and d overline(z)_q.
  $
  #new-par
  For $z in.not overline(D)$, @eq:martinelli-bochner-koppelman is a corollary of
  Stokes' formula and Lemma~@lem:koppelman-kernel-dbar.

  Let $z in D$. We write
  $
    theta_q^* = U_(0, q) - dbar_z g and v_(q - 1),
  $
  where $g$ was introduced in @eq:fundamental-solution. Since
  $gamma and U_(0, q)$ has type $(n, n - 1)$ with respect to $zeta$ and the form
  $gamma and dbar_z g and v_(q - 1)$ has type $(n - 1, n)$, it follows that
  $
    d_zeta (gamma and theta_q^*)
    & = dbar_zeta (gamma and U_(0, q))
    - partial_zeta (gamma and dbar_z g and v_(q - 1)) \
    & = dbar_zeta gamma and U_(0, q) + (-1)^q gamma and dbar_zeta U_(0, q)
    - partial_zeta gamma and dbar_z g and v_(q - 1) \
    & quad - (-1)^q gamma and partial_zeta dbar_z g and v_(q - 1).
  $
  With the help of @eq:koppelman-kernel-potential and
  Lemma~@lem:koppelman-kernel-dbar we now get that
  $
    (-1)^q gamma and partial_zeta dbar_z g and v_(q - 1)
    & = (-1)^q gamma and dbar_z (partial_zeta g and v_(q - 1)) \
    & = gamma and dbar_z U_(0, q - 1) = (-1)^q gamma and dbar_zeta U_(0, q);
  $
  consequently,
  $
    d_zeta (gamma and theta_q^*) = dbar_zeta gamma and U_(0, q)
    - partial_zeta gamma and dbar_z g and v_(q - 1),
  $ <eq:theta-star-differential>
  and so the second integral in
  $
    i(z) = integral_(partial D_zeta) gamma and theta_q^*
    - integral_(D_zeta) d_zeta (gamma(zeta) and theta_q^*)
  $ <eq:koppelman-integral>
  converges absolutely.

  Let us now show that $i(z)$ coincides with the left-hand side of
  @eq:martinelli-bochner-koppelman. To do this we consider the form
  $gamma and g v_(q - 1)$, which has type $(n - 1, n)$ with respect to $zeta$.

  By Stokes' formula,
  $
    integral_(partial D_zeta) gamma and g v_(q - 1)
    - integral_(partial B_epsilon (z)) gamma and g v_(q - 1)
    & = integral_(D without B_epsilon (z)) partial gamma and g v_(q - 1) \
    & quad + (-1)^q integral_(D without B_epsilon (z))
    gamma and partial_zeta g and v_(q - 1).
  $ <eq:koppelman-stokes>
  #source(69)
  According to Lemma~@lem:sphere-limit, the limit of the second integral on the
  left-hand side of @eq:koppelman-stokes as $epsilon -> 0$ is equal to zero.
  Consequently, @eq:koppelman-kernel-potential implies that
  $
    integral_(D_zeta) gamma and U_(0, q - 1)
    = integral_(partial D_zeta) gamma and g v_(q - 1)
    - integral_(D_zeta) partial gamma(zeta) and g v_(q - 1).
  $ <eq:koppelman-volume-integral>
  We can differentiate under the integral sign in the integrals on the
  right-hand side of @eq:koppelman-volume-integral: after differentiation the
  first integral will be a proper integral as before, but the second will have a
  singularity of the form $|zeta - z|^(1 - 2n)$, and therefore converges
  absolutely. Hence, the left-hand side of @eq:koppelman-volume-integral is also
  differentiable, and
  $
    & integral_(partial D_zeta) gamma(zeta) and dbar_z g and v_(q - 1)
      - integral_(D_zeta) partial gamma(zeta) and dbar_z g and v_(q - 1) \
    & quad - dbar_z integral_(D_zeta) gamma and U_(0, q - 1) = 0.
  $ <eq:koppelman-volume-derivative>
  Adding @eq:koppelman-integral and @eq:koppelman-volume-derivative and using
  the definition of $U_(0, q)$ and @eq:theta-star-differential, we get that
  $i(z)$ is equal to the left-hand side of @eq:martinelli-bochner-koppelman.

  We show that $i(z) = gamma(z)$. From Stokes' formula, applied to the domain
  $D without overline(B_epsilon (z))$, and @eq:koppelman-integral it follows
  that
  $
    i(z) = lim_(epsilon -> 0) integral_(partial B_epsilon (z))
    gamma(zeta) and theta_q^*.
  $
  Let us compute this limit; to do this we pass from the form $theta_q^*$ to the
  form
  $
    theta_q = (-1)^q dbar_zeta g and v_q - dbar_z g and v_(q - 1).
  $
  From the invariance of the first differential we have that
  $d_zeta g|_(partial B_epsilon (z)) = 0$, or
  $dbar_zeta g|_(partial B_epsilon (z))
  = -partial_zeta g|_(partial B_epsilon (z))$; therefore,
  @eq:koppelman-kernel-potential gives us that
  $theta_q^*|_(partial B_epsilon (z)) = theta_q|_(partial B_epsilon (z))$.

  Let $g_k = (zeta_k - z_k) |zeta - z|^(-2n)$, $k = 1, ..., n$. We have that
  $
    gamma(zeta) and theta_q
    & = (-1)^n (n - 1)! / (2 pi i)^n f(zeta) \
    & quad times {(-1)^q d overline(zeta)_1 and dots.c and d overline(zeta)_q
      and sum_(k = 1)^n g_k d overline(zeta)_k and sum'_J
      sum_(j in.not J) sigma(J, j) (-1)^(j - 1) d overline(zeta)_([J, j]) \
      & quad and d zeta_([j]) d overline(z)_J - d overline(zeta)_1 and dots.c
      and d overline(zeta)_q and sum_(j = 1)^n (-g_j) d overline(z)_j \
      & quad and sum'_frak(J) sum_(k in.not frak(J)) sigma(frak(J), k)
      (-1)^(k - 1) d overline(zeta)_([frak(J), k]) and d zeta_([k])
      d overline(z)_frak(J)} \
    #source(70)
    & = ((-1)^n (n - 1)!) / (2 pi i)^n f(zeta) \
    & quad times {(-1)^q sum_(k = q + 1)^n g_k d overline(zeta)_1 and dots.c
      and d overline(zeta)_q and d overline(zeta)_k
      and d overline(zeta)_([1, ..., q, k]) \
      & quad and [sum_(j = 1)^q sigma((1, ... [j] ..., q, k), j) (-1)^(j - 1)
        d zeta_([j]) d overline(z)_1 and dots.c [j] dots.c and d overline(z)_q
        and d overline(z)_k \
        & quad + sigma((1, ..., q), k) (-1)^(k - 1) d zeta_([k]) d overline(z)_1
        and dots.c and d overline(z)_q] \
      & quad + d overline(zeta)_1 and dots.c and d overline(zeta)_q
      and d overline(zeta)_([1, ..., q])
      and sum_(k = 1)^q sigma((1, ... [k] ..., q), k) \
      & quad times (-1)^(k - 1) and d zeta_([k])
      sum_(j = 1)^n g_j d overline(z)_j
      and d overline(z)_1 and dots.c [k] dots.c and d overline(z)_q}.
  $
  Note that
  $
    & (-1)^q sigma((1, ..., q), k) d overline(zeta)_1 and dots.c
      and d overline(zeta)_q and d overline(zeta)_k
      and d overline(zeta)_([1, ..., q, k]) \
    & quad = sigma((1, ..., q), k) d overline(zeta)_k and d overline(zeta)_1
      and dots.c and d overline(zeta)_q and d overline(zeta)_([1, ..., q, k]) \
    & quad = d overline(zeta), sigma((1, ... [k] ..., q), k)
      d overline(zeta)_1 and dots.c and d overline(zeta)_q
      and d overline(zeta)_([1, ..., q]) d overline(z)_k \
    & quad quad and d overline(z)_1 and dots.c [k] dots.c and d overline(z)_q \
    & quad = sigma((1, ... [k] ..., q), k) d overline(zeta)_k
      and d overline(zeta)_1 and dots.c [k] dots.c and d overline(zeta)_q \
    & quad quad and d overline(zeta)_([1, ..., q]) d overline(z)_1 and dots.c
      and d overline(z)_q \
    & quad = d overline(zeta) d overline(z)_1 and dots.c and d overline(z)_q.
  $
  Consequently,
  $
    gamma and theta_q = ((-1)^n (n - 1)!) / (2 pi i)^n f sum_(k = 1)^n
    (-1)^(k - 1) g_k d overline(zeta) and d zeta_([k]) and d overline(z)_1
    and dots.c and d overline(z)_q + chi,
  $
  where $chi$ consists of terms like
  $
    c f(zeta) g_k d overline(zeta) and d zeta_([j]) d overline(z)_J,
    quad j != k, J = (i_1, ..., i_q).
  $
  #source(71)
  By Lemma~@lem:sphere-limit,
  $
    i(z) & = lim_(epsilon -> 0) integral_(partial B_epsilon (z))
           gamma(zeta) and theta_q
           = (n - 1)! / (2 pi i)^n sum_(k = 1)^n lim_(epsilon -> 0)
           (-1)^(n + k - 1) \
         & quad times integral_(partial B_epsilon (z))
           (f(zeta) (zeta_k - z_k)) / (|zeta - z|^(2n))
           d overline(zeta) and d zeta_([k]) d overline(z)_1 and dots.c
           and d overline(z)_q
           + lim_(epsilon -> 0) integral_(partial B_epsilon (z)) chi \
         & = (n - 1)! / (2 pi i)^n sum_(k = 1)^n (2 pi i)^n / (n!) f(z)
           d overline(z)_1 and dots.c and d overline(z)_q = gamma(z).
  $
]

Theorem~@th:koppelman can be strengthened somewhat by relaxing the requirements
on the form $gamma$. Here and below, the derivative of a continuous function is
understood to be the derivative in the sense of the theory of generalized
functions.

#theorem[
  If $D$ is a bounded domain with a piecewise smooth boundary $partial D$, and
  $gamma in C_(p, q) (overline(D))$, while
  $dbar gamma in C_(p, q + 1) (overline(D))$, then formula
  @eq:martinelli-bochner-koppelman is valid.
] <th:koppelman-generalized-derivatives>

Finally, the following generalization of @eq:martinelli-bochner-koppelman (which
can be obtained without difficulty) will be useful in applications of it.

#theorem[
  Suppose that the conditions of Theorem~@th:koppelman-generalized-derivatives
  hold and the function $phi(zeta, z) in C^((1)) (overline(D) times D)$ is such
  that $phi(z, z) equiv 1$ for $z in D$. Then the integral representation
  $
    gamma(z) & = J_(p, q)^1 (D, gamma phi) - J_(p, q)^2 (D, phi dbar_zeta gamma)
               - dbar_z J_(p, q - 1)^2 (D, gamma phi) \
             & quad - J_(p, q)^2 (D, dbar_zeta phi and gamma)
               + J_(p, q - 1)^2 (D, dbar_z phi and gamma).
  $ <eq:koppelman-weighted>
] <th:koppelman-weighted>
