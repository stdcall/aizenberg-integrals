#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== The Andreotti-Norguet formula and generalizations of it
<sec:andreotti-norguet>

#point <pt:andreotti-norguet> Let $alpha = (alpha_1, ..., alpha_n)$, where all
the $alpha_k$ are nonnegative integers. We use the notation
$chevron.l w, f^((alpha)) chevron.r = w_1 f_1^(alpha_1) + dots.c
+ w_n f_n^(alpha_n)$; here $w = (w_1, ..., w_n)$ and $f = (f_1, ..., f_n)$.
Further,
$
  omega_alpha (f, w) = ((n - 1)! alpha!) / (2 pi i)^n
  (sum_(k = 1)^n (-1)^(k - 1) w_k^(alpha_k + 1)
  d w_([k])^((alpha + upright(I))) and d f)
  / (chevron.l w^((alpha + upright(I))), f^((alpha + upright(I)))
  chevron.r^n) .
$
#notation-mark($omega_alpha (f, w)$, sort: "omega_alpha(f, w)")

#theorem(title: [Andreotti and Norguet])[
  #index-mark(
    "Formula",
    sub: "Andreotti-Norguet",
    target: <th:andreotti-norguet>,
  )
  Suppose that $phi in A_C (D)$, where $D$ is a bounded domain with piecewise
  smooth boundary. Then for every point $z in D$ and any $alpha$
  $
    integral_(partial D) phi(zeta)
    omega_alpha (zeta - z, overline(zeta) - overline(z)) = D^alpha phi(z).
  $ <eq:andreotti-norguet>
] <th:andreotti-norguet>

The Andreotti-Norguet formula @eq:andreotti-norguet generalizes the
Martinelli-Bochner formula @eq:martinelli-bochner to the case involving the
computation not of the value of a holomorphic function at a given point but of
the value of any derivative of it. For $alpha = 0$ we get @eq:martinelli-bochner
from @eq:andreotti-norguet. We remark that for $n > 1$ the kernel $omega_alpha$
is not a derivative of the kernel $omega$; it is only for $n = 1$ that
@eq:andreotti-norguet becomes the formula obtained by simple differentiation of
the Cauchy formula.

#proof[
  1\. It is easy to verify that the form
  $omega_alpha (zeta - z, overline(zeta) - overline(z))$ is closed. Fix a point
  $z in D$; by Corollary~@cor:closed-form-over-null-cycle, the integration over
  $partial D$ can be replaced by integration over
  $partial B_r^(alpha + upright(I)) (z)$.

  2\. In a sufficiently small neighborhood of $z$ the holomorphic function
  $phi(zeta)$ can be expanded in a multiple power series about $z$. Hence, to
  prove @eq:andreotti-norguet it suffices to establish that
  $
    ((n - 1)!) / (2 pi i r^2)^n
    integral_(partial B_r^((alpha + upright(I)))) (zeta - z)^beta
    sum_(k = 1)^n (-1)^(k - 1) (overline(zeta)_k - overline(z)_k)^(alpha_k + 1)
    d(overline(zeta) - overline(z))_([k])^((alpha + upright(I)))
    and d zeta \
    = cases(0 quad & "if" alpha != beta\,, 1 & "if" alpha = beta.)
  $ <eq:andreotti-norguet-sphere>
  #source(53)
  #new-par
  3\. Note that under the change of variables
  $zeta_k - z_k = e^(i t_k) (zeta'_k - z_k)$, $0 <= t_k <= 2 pi$,
  $k = 1, ..., n$, the set $partial B_r^((alpha + upright(I)))$ is carried into
  itself, and the integrand form in @eq:andreotti-norguet-sphere is multiplied
  by $e^(i t_1 (beta_1 - alpha_1)) dots.c e^(i t_n (beta_n - alpha_n))$.
  Therefore, the part of @eq:andreotti-norguet-sphere involving the case where
  $alpha != beta$ is true.

  4\. If $alpha = beta$, then, by Stokes' theorem, the integral in
  @eq:andreotti-norguet-sphere is equal to
  $
    & (n! (alpha + upright(I))^upright(I)) / (2 pi i r^2)^n
      integral_(B_r^((alpha + upright(I))))
      |zeta_1 - z_1|^(2 alpha_1) dots.c |zeta_n - z_n|^(2 alpha_n)
      d overline(zeta) and d zeta \
    & quad = (n! (alpha + upright(I))^upright(I) 2^n) / r^(2n)
      integral_(sum_1^n |zeta_i - z_i|^(2(alpha_i + 1)) < r^2)
      |zeta_1 - z_1|^(2 alpha_1 + 1) dots.c |zeta_n - z_n|^(2 alpha_n + 1)
      d|zeta_1 - z_1| \
    & quad quad and dots.c and d|zeta_n - z_n|
      = n! integral_(sum_1^n tau_i < 1 \ tau_i > 0) d tau = 1.
  $
]

The Andreotti-Norguet formula can be generalized in the spirit of the
Cauchy-Fantappiè formula.

#theorem[
  Suppose that the conditions of Theorem~@th:andreotti-norguet hold and that the
  vector-valued function $w in C_zeta^((1)) (partial D)$ satisfies the condition
  $
    chevron.l w^((alpha + upright(I))) (zeta, z),
    (zeta - z)^((alpha + upright(I))) chevron.r != 0,
    quad z in D, zeta in partial D.
  $
  Then
  $
    integral_(partial D) phi(zeta) omega_alpha (zeta - z, w) = D^alpha phi(z).
  $ <eq:andreotti-norguet-fantappie>
] <th:andreotti-norguet-fantappie>

#ends-with-square[This can be proved either in the same way as
  Theorem~@th:fundamental-integral-formula (Koppelman's way, which is analytic)
  or geometrically (Khenkin's way); we take the latter course. Each of the
  integrals @eq:andreotti-norguet and @eq:andreotti-norguet-fantappie is an
  integral of one and the same exterior differential form
  $
    phi(zeta) sum_(k = 1)^n (-1)^(k - 1) v_k d v_([k]) and d zeta
  $ <eq:andreotti-norguet-form>
  over the respective cycles
  $
    & gamma_0 = {(zeta, v): zeta in partial D, v_k = v_k^0 \
    & quad = (overline(zeta)_k - overline(z)_k)^(alpha_k + 1)
      / (|zeta_1 - z_1|^(2(alpha_1 + 1)) + dots.c
      + |zeta_n - z_n|^(2(alpha_n + 1))), k = 1, ..., n}
  $
  #source(54)
  and
  $
    gamma = {(zeta, v): zeta in partial D, v = v'
      = w^((alpha + upright(I)))
      / (chevron.l w^((alpha + upright(I))), (zeta - z)^((alpha + upright(I)))
      chevron.r)}
  $
  lying on the surface
  $
    M_z^((alpha)) = {(zeta, v): zeta in partial D,
      chevron.l v, (zeta - z)^((alpha + upright(I))) chevron.r = 1}
  $
  in $CC_(zeta, v)^(2n)$. The form @eq:andreotti-norguet-form is closed on this
  surface, and to prove that the integral in @eq:andreotti-norguet-fantappie is
  equal to the integral in @eq:andreotti-norguet it suffices to establish that
  the cycles $gamma_0$ and $gamma$ are homologous on $M_z^((alpha))$. Consider
  the set $Q = {(zeta, v): zeta in partial D, v = lambda v^0 + (1 - lambda) v',
    0 <= lambda <= 1}$. It is clear that $gamma - gamma_0 = partial Q$. Further,
  $
    & chevron.l lambda v^0 + (1 - lambda) v',
      (zeta - z)^((alpha + upright(I))) chevron.r \
    & quad = lambda chevron.l v^0, (zeta - z)^((alpha + upright(I))) chevron.r
      + (1 - lambda) chevron.l v', (zeta - z)^((alpha + upright(I))) chevron.r
      = 1,
  $
  i.e., $Q subset M_z^((alpha))$. Thus, the cycles $gamma_0$ and $gamma$ are
  homologous on $M_z^((alpha))$.]

Finally, we can make the following generalization of @eq:andreotti-norguet in a
way similar to what was done in the case of
Theorem~@th:fundamental-integral-formula. Let
$
  Omega_alpha (w^0, w^1, ..., w^(n - 1), f)
  = (alpha! (-1)^(n(n - 1)\/2)) / (2 pi i)^n
  (chevron.l w^0, d f chevron.r)
  / (chevron.l w^0, f^((alpha + upright(I))) chevron.r) \
  and d (chevron.l w^1, d f chevron.r)
  / (chevron.l w^1, f^((alpha + upright(I))) chevron.r)
  and dots.c and d (chevron.l w^(n - 1), d f chevron.r)
  / (chevron.l w^(n - 1), f^((alpha + upright(I))) chevron.r) .
$

#theorem[
  If the conditions of Theorem~@th:andreotti-norguet hold and the vector-valued
  functions $w^0 in C_zeta (partial D)$ and $w^j in C_zeta^((1)) (partial D)$,
  $j = 1, ..., n - 1$, satisfy the condition
  $
    chevron.l w^j (zeta, z), (zeta - z)^((alpha + upright(I))) chevron.r != 0,
    quad z in D, zeta in partial D, j = 0, 1, ..., n - 1,
  $
  then
  $
    integral_(partial D) phi(zeta) Omega_alpha (w^0, w^1, ..., w^(n - 1),
      zeta - z)
    = D^alpha phi(z).
  $ <eq:andreotti-norguet-koppelman>
] <th:andreotti-norguet-koppelman>

The proof is analogous to that of Theorem~@th:fundamental-integral-formula.

#small-print[
  #point <pt:andreotti-norguet-residue> The problem arises of whether we can
  construct a multidimensional logarithmic residue formula based not on the
  Martinelli-Bochner integral representation @eq:martinelli-bochner but on the
  more general Andreotti-Norguet integral representation @eq:andreotti-norguet,
  i.e., we pose the question of computing the integral
  $
    integral_(partial D) phi omega_alpha (f, overline(f)),
  $ <eq:andreotti-norguet-residue>
  #source(55)
  where $f$ is in $A^n (overline(D))$ and does not have zeros on $partial D$,
  or, what is the same (compare @eq:yuzhakov-roos with
  @eq:fundamental-integral-formula, and @eq:andreotti-norguet with
  @eq:andreotti-norguet-koppelman),
  $
    integral_(partial D) phi Omega_alpha (w^0, w^1, ..., w^(n - 1), f).
  $ <eq:andreotti-norguet-residue-koppelman>
  #new-par
  We do not know the answer in the general case, so we list particular cases in
  which computation of the integrals @eq:andreotti-norguet-residue and
  @eq:andreotti-norguet-residue-koppelman has been successful.

  1\. For $n = 1$ these integrals take the form
  $
    (alpha_1 !) / (2 pi i) integral_(partial D)
    (phi(zeta_1) d f(zeta_1)) / (f(zeta_1)^(alpha_1 + 1))
    = sum_(z_1 in E_f) (alpha_1 !) / ([mu_(z_1) (f)(alpha_1 + 1) - 1]!)
    (d^(mu_(z_1) (f)(alpha_1 + 1) - 1))
    / (d z_1^(mu_(z_1) (f)(alpha_1 + 1) - 1))
    (phi(z_1) f'(z_1)) / (psi_(z_1)^(alpha_1 + 1) (z_1)) .
  $
  Here $mu_(z_1) (f)$, as usual, is the multiplicity of a zero $z_1$ of $f$;
  consequently, $f$ has the form
  $
    f(z'_1) = psi_(z_1) (z'_1)(z'_1 - z_1)^(mu_(z_1) (f))
  $
  in a neighborhood of this zero where $psi_(z_1)$ is holomorphic in the given
  neighborhood and $psi_(z_1) (z_1) != 0$.

  2\. If $alpha = (0, ..., 0)$, see @eq:yuzhakov-roos and
  @eq:fundamental-integral-formula.

  3\. Suppose that all the roots of the system $f = 0$ in $D$ are simple, i.e.,
  in a neighborhood of each root the Jacobian $partial f \/ partial z$ is
  nonzero. Then the $eta_k = f_k (z)$, $k = 1, ..., n$, form a system of local
  coordinates in this neighborhood. Since the forms $omega_alpha$ and
  $Omega_alpha$ are closed, the integral @eq:andreotti-norguet-residue
  (respectively, @eq:andreotti-norguet-residue-koppelman) is equal to the sum of
  the integrals over the boundaries of sufficiently small neighborhoods of the
  roots of the system $f = 0$, and, by a change of variables in each of these
  neighborhoods the integral reduces to @eq:andreotti-norguet. Thus, in this
  case the integral @eq:andreotti-norguet-residue (respectively,
  @eq:andreotti-norguet-residue-koppelman) is equal to
  $
    sum_(a in E_f) lr(
      (partial^(|alpha|) phi(z))
      / (partial f_1^(alpha_1) dots.c partial f_n^(alpha_n)) |
    )_(z = a) .
  $
  #new-par
  4\. If the function $phi$ can be divided by $f^alpha$, i.e.,
  $phi f^(-alpha) in A_C (D)$, then the integral @eq:andreotti-norguet-residue
  can be written as
  $
    ((n - 1)! alpha!) / ((2 pi i)^n (alpha + upright(I))^upright(I))
    integral_(partial D)
    (phi f^(-alpha) sum_(k = 1)^n (-1)^(k - 1) overline(f)_k^(alpha_k + 1)
    d overline(f)_([k])^((alpha + upright(I))) and d f^((alpha + upright(I))))
    / ([ |f_1|^(2(alpha_1 + 1)) + dots.c + |f_n|^(2(alpha_n + 1)) ]^n),
  $
  i.e., an integral of the form @eq:yuzhakov-roos is obtained, though not for
  the mapping $f$ but for the mapping
  $f^((alpha + upright(I))) = (f_1^(alpha_1 + 1), ..., f_n^(alpha_n + 1))$,
  whose zeros differ from those of $f$ only in their multiplicities. Therefore,
  the integral @eq:andreotti-norguet-residue (respectively,
  @eq:andreotti-norguet-residue-koppelman) is equal to
  $
    alpha! sum_(a in E_(f^((alpha + upright(I)))))
    lr((phi(z)) / (f(z)^alpha (alpha + upright(I))^upright(I)) |)_(z = a)
    = alpha! sum_(a in E_f) lr((phi(z)) / (f(z)^alpha) |)_(z = a) .
  $
  #new-par
  5\. If the conditions of Theorem~@th:skeleton-boundary hold, then it can be
  shown as in the proof of that theorem that the integrals
  @eq:andreotti-norguet-residue and @eq:andreotti-norguet-residue-koppelman are
  equal to
  $
    (alpha!) / (2 pi i)^n integral_Gamma phi (d f) / f^((alpha + upright(I))) .
  $ <eq:andreotti-norguet-skeleton>
  #new-par
  If the conditions of Theorem~@th:caccioppoli-martinelli-sorani hold, then it
  can be shown ($Gamma'$ denotes the distinguished boundary of the special
  analytic polyhedron $D$) that the integrals @eq:andreotti-norguet-residue and
  @eq:andreotti-norguet-residue-koppelman can be transformed to the form
  $
    (alpha!) / (2 pi i)^n integral_(Gamma') phi
    (d f) / f^((alpha + upright(I))) .
  $
  #source(56)
  #new-par
  We need a definition for what follows: a point $a$ is called an #index-mark(
    "Point",
    sub: "ordinary, of an analytic set",
  )_ordinary point of an analytic set $S$_ if for some neighborhood $U$ of this
  point there exists a biholomorphic mapping $F$ in $U$ such that
  $F(S inter U) = F(U) inter L$, where $L$ is an analytic plane in $CC^n$.

  Assume that any point $a in E_f$ is an ordinary point of the analytic sets
  ${z: f_j (z) = 0}$, $j = 1, ..., n$. Then in a neighborhood $U_a$ of $a$ there
  exist holomorphic functions $h_(a i) (z)$ such that
  $h_(a i)^(m_(a i)) (z) = f_i (z)$, where $m_(a i)$ is the smallest degree of a
  homogeneous polynomial in the Taylor expansion of $f_i$ in a neighborhood of
  $a$ (see @bib:Ronkin1977, p.~117), $i = 1, ..., n$. If it is also required
  that for every $a in E_f$ the indicated homogeneous polynomials have an
  isolated zero at $a$, then $mu_a (f) = m_(a 1) dots.c m_(a n)$ by
  Theorem~@th:tsikh-yuzhakov. According to Corollary~@cor:skeleton-zeros,
  $
    m_(a 1) dots.c m_(a n) = mu_a (h_a^((m)))
    & = 1 / (2 pi i)^n integral_Gamma (d h_a^((m))) / h_a^((m)) \
    & = (m_(a 1) dots.c m_(a n)) / (2 pi i)^n integral_Gamma (d h_a) / h_a
    = m_(a 1) dots.c m_(a n) mu_a (h_a),
  $
  where $m = (m_(a 1) dots.c m_(a n))$. Hence, $mu_a (h_a) = 1$; here
  $h_a = (h_(a 1), ..., h_(a n))$. Therefore, the integral
  @eq:andreotti-norguet-skeleton is equal to
  $
    (alpha!) / (2 pi i)^n sum_(a in E_f) m_(a 1) dots.c m_(a n)
    integral_(gamma_a) phi (d h_a) / h_a^((beta_a + upright(I))),
  $
  where $gamma_a = {z: z in U_a, |f_1 (z)| = dots.c = |f_n (z)| = delta}$, with
  $delta$ sufficiently small, and $beta_a = (beta_(a 1), ..., beta_(a n))$; with
  $beta_(a i) = alpha_i m_(a i)$, $i = 1, ..., n$. Since $mu_(h_a) (a) = 1$, it
  follows that $(partial h_a \/ partial z)|_(z = a) != 0$, and so the functions
  $eta_k = h_k (z)$, $k = 1, ..., n$, form a system of local coordinates in some
  neighborhood of the point $a$, and we obtain the following assertion.

  #proposition(title: [Bolotov])[
    Suppose that all the points $a in E_f$ are ordinary points of the analytic
    sets ${z: f_j (z) = 0}$, $j = 1, ..., n$, and that the homogeneous
    polynomial of smallest degree in the Taylor expansions of the functions
    $f_1, ..., f_n$ in a neighborhood of each point $a in E_f$ have an isolated
    zero there. Then the integrals @eq:andreotti-norguet-residue and
    @eq:andreotti-norguet-residue-koppelman are equal to
    $
      sum_(a in E_f) m_(a 1) dots.c m_(a n) (alpha!) / (beta_a !)
      lr(
        (partial^(|beta_a|) phi(z))
        / (partial h_(a 1)^(beta_(a 1)) dots.c partial h_(a n)^(beta_(a n))) |
      )_(z = a) .
    $
  ] <prop:bolotov>
]
