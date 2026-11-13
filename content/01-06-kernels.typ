#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[The Bergman kernel function, the Szegö kernel, and integral
  representations with a holomorphic kernel on the Shilov
  boundary] <sec:kernels>

#point <pt:shilov-boundary> Let $Q$ be a compact subset of $CC^n$, and $frak(S)$
some collection of real-valued upper semicontinuous functions on $Q$. A set
$S_frak(S) (Q)#notation-mark($S_frak(S) (Q)$) subset Q$ is called a #index-mark(
  "Boundary",
  sub: "Shilov",
  subsub: "of a set $Q$ with respect to a family $frak(S)$",
)_Shilov boundary of $Q$ with respect to $frak(S)$_ if 1) $S_frak(S) (Q)$ is a
#index-mark("Set", sub: "determining")_determining set_ for the collection on
the compact set $Q$, i.e., it is closed, and for any $phi in frak(S)$
$
  sup_(z in Q) phi(z) = sup_(z in S_frak(S) (Q)) phi(z),
$ <eq:determining-set>
and 2) $S_frak(S) (Q)$ is minimal, i.e., no proper subset of it is determining.

The concept of a Shilov boundary is introduced similarly when $frak(S)$ is a
collection of complex-valued functions, except that it is necessary to replace
@eq:determining-set by
$
  sup_(z in Q) |phi(z)| = sup_(z in S_frak(S) (Q)) |phi(z)| .
$

#source(57)
#theorem[
  Suppose that a collection $frak(S)$ of real-valued upper semicontinuous
  functions on a compact set $Q$ satisfies the condition that if
  $phi in frak(S)$, then $[phi(z) + ln|z_i - c| ] in frak(S)$, $i = 1, ..., n$,
  for any complex number $c$. Then the Shilov boundary $S_frak(S) (Q)$ exists
  and is unique.
] <th:shilov-boundary-existence>

#proof[
  The class of determining sets is not empty; for example, $Q$ is determining.
  Let ${Gamma_k}$ be a nested sequence of determining sets:
  $Gamma_k supset Gamma_(k + 1)$, $k = 1, 2, ...$. Then
  $Gamma = inter.big_1^infinity Gamma_k$ is determining. This follows from the
  fact that for an upper semicontinuous function $phi$
  $
    lim_(k -> infinity) sup_(z in Gamma_k) phi(z) = sup_(z in Gamma) phi(z).
  $
  It now follows from Zorn's lemma that there is a minimal determining set---a
  Shilov boundary.

  We prove that $S_frak(S) (Q)$ is unique. Suppose that there exist two Shilov
  boundaries $S^1 = S_frak(S)^1 (Q)$ and $S^2 = S_frak(S)^2 (Q)$. Then there
  exist a point $z^0 in S^1 without S^2$ and an $r > 0$ such that the polydisk
  $U(z^0, r) = {z: |z_i - z_i^0| < r, i = 1, ..., n}$ does not intersect $S^2$.
  There exists a function $phi in frak(S)$ that attains a maximal value $M$ on
  $S^1$ in $U(z^0, r) inter S^1$ and remains less than this $M$ on
  $S^1 without U(z^0, r)$ (otherwise $S^1$ would not be a minimal determining
  set). Let
  $
    m = sup_(z in S^1 without U(z^0, r)) phi(z);
  $
  then $m < M$.

  On the other hand, there exists a point $z^1 in S^2 without S^1$ such that
  $phi(z^1) = M$. Since $z^1 in.not U(z^0, r)$, there exists an $i$ such that
  $|z_i^1 - z_i^0| >= r$. Let $R = sup_(z in S^1) |z_i - z_i^1|$ and choose
  $lambda > 1$ in such a way that
  $
    m + ln(R + lambda |z_i^0 - z_i^1|) < M + ln(lambda |z_i^0 - z_i^1|).
  $
  #new-par
  Consider the function
  $
    psi(z) = [phi(z) + ln|z_i - z_i^1 - lambda(z_i^0 - z_i^1)| ] in frak(S).
  $
  Obviously, $psi(z^1) = M + ln(lambda |z_i^0 - z_i^1|)$. If
  $z in S^1 without U(z^0, r)$, then
  $
    psi(z) & <= m + ln|z_i - z_i^1 - lambda(z_i^0 - z_i^1)| \
           & <= m + ln(R + lambda |z_i^0 - z_i^1|)
             < M + ln(lambda |z_i^0 - z_i^1|);
  $
  but if $z in S^1 inter U(z^0, r)$ then
  $
    psi(z) & <= M + ln|z_i - z_i^0 + (1 - lambda)(z_i^0 - z_i^1)| \
           & < M + ln(
               lambda |z_i^0 - z_i^1| - |z_i^0 - z_i^1|
               + |z_i - z_i^0|
             )
             < M + ln(lambda |z_i^0 - z_i^1|).
  $
  Thus, for $z in S^1$ we have the inequality $psi(z) < psi(z^1)$, which is
  impossible, because $S^1$ is a Shilov boundary of $Q$ with respect to
  $frak(S)$.
]

#source(58)
#corollary[
  Suppose that $frak(S)$ is a collection of complex-valued functions whose
  moduli are upper semicontinuous on a compact set $Q$, and that if
  $phi in frak(S)$, then $phi(z)(z_i - c) in frak(S)$, $i = 1, ..., n$, for any
  complex number $c$. Then $S_frak(S) (Q)$ exists and is unique.
] <cor:shilov-boundary-complex>

#proof(title: none)[
  The proof reduces to a verification of the fact that the collection
  ${ln|phi(z)|}$, $phi in frak(S)$, satisfies the conditions of
  Theorem~@th:shilov-boundary-existence.
]

If $D$ is a bounded domain and $frak(S) = A_C (D)$, then
$S_frak(S) (overline(D))$ is simply called the #index-mark(
  "Boundary",
  sub: "Shilov",
  subsub: "of a domain",
)_Shilov boundary of the domain $D$_ and denoted by $S(D)$#notation-mark(
  $S(D)$,
). If $frak(S) = A(overline(D))$, then $S_frak(S) (overline(D))$ is called the
#index-mark(
  "Boundary",
  sub: "Bergman, of a domain",
)_Bergman boundary of the domain $D$_ and denoted by $B(D)$#notation-mark(
  $B(D)$,
). If $frak(S)$ is the set of all polynomials, then $S_frak(S) (overline(D))$ is
called the #index-mark(
  "Boundary",
  sub: "polynomial, of a domain",
)_polynomial boundary of the domain $D$_ and denoted by $P(D)$.

#corollary[
  Let $D$ be a bounded domain in $CC^n$. Then the boundaries $S(D)$, $B(D)$, and
  $P(D)$ exist and are unique, and
  $P(D) subset B(D) subset S(D) subset partial D$.
] <cor:shilov-bergman-polynomial-boundaries>

#unnumbered([Examples])[
  1\. If $D$ is a ball, then $S(D) = B(D) = P(D) = partial D$.

  2\. If $D$ is a polydisk, then $S(D) = B(D) = P(D) = Gamma$, where $Gamma$ is
  its skeleton.

  3\. _#index-mark(
    "Example of a domain of holomorphy for which the Shilov boundary and "
      + "the Bergman boundary have different dimension",
  )Example of a domain of holomorphy $D$ such that the Shilov and Bergman
  boundaries have different dimension (Aĭzenberg)._ Let
  $D = {z in CC^2: |z_2| < |z_1|^(-ln|z_1|), 0 < |z_1| < 1}$. The functions
  $f_(m, l) = z_1^(-m) z_2^l$, $m, l = 1, 2, ...,$ belong to $A_C (D)$, and
  their moduli $|f_(m, l)|$ attain their respective maxima on $overline(D)$ at a
  point $z = (z_1, z_2)$ with $z = (z_1, z_2)$, where $|z_1| = exp(-m \/ 2 l)$,
  $|z_2| = |z_1|^(-ln|z_1|)$. From this it is not hard to see that
  $S(D) = {z in CC^2: |z_1| <= 1, |z_2| = R(|z_1|)}$, where
  $
    R(|z_1|) = cases(
      |z_1|^(-ln|z_1|) quad & "if" 0 < |z_1| <= 1\,,
      0 & "if" |z_1| = 0.
    )
  $
  #new-par
  Every function in $A(overline(D))$ is holomorphic also in the closed bidisk
  $overline(U(0, 1)) = {z in CC^2: |z_1| <= 1, |z_2| <= 1}$; therefore
  $B(D) = S(U) = Gamma = {z in CC^2: |z_1| = |z_2| = 1}$. Thus, the boundary
  $S(D)$ is three-dimensional, while $B(D)$ is two-dimensional.
]

#point <pt:bergman-kernel> Let $D$ be a bounded domain in $CC^n$, and suppose
that $h(z, overline(z))$ is in $C(overline(D))$ and is positive in $D$. Denote
by $L_h^2 = L_h^2 (D)$ the collection of all functions $f in A(D)$ with finite
form
$
  norm(f) = norm(f)_D^h = (integral_D |f|^2 h d v)^(1\/2),
$ <eq:weighted-norm>
where $d v$ is the volume element, and the integral is understood as an improper
integral; $L_h^2$ is a Hilbert space with the inner product
$(f, g) = integral_D f overline(g) h d v$.

#source(59)
It is easy to see that if a polydisc satisfies $U(z^0, r) relcomp D$, then for
every $f in L_h^2$
$
  |f(z^0)| <= c norm(f)_D^h,
$ <eq:point-estimate>
where the constant $c$ depends on $r$ and $h$ but not on $f$ nor on $z^0$.

It can be shown in the usual way that there are complete orthonormal systems in
$L_h^2$. If ${phi_m (z), m = 0, 1, 2, ...}$ is such a system, and $a_m$ are the
Fourier coefficients of an $f in L_h^2$ with respect to this system, then the
series
$
  f(z) = sum_(m = 0)^infinity a_m phi_m (z)
$ <eq:orthonormal-expansion>
converges in the norm and, hence (by @eq:point-estimate), absolutely and
uniformly on compact subsets of $D$.

Let us next consider the series#index-mark("Kernel function", sub: "Bergman")
$
  sum_(m = 0)^infinity phi_m (z) overline(phi_m (zeta)) = K(z, overline(zeta)).
$ <eq:bergman-kernel-series>

#theorem(title: [Bergman])[
  The series @eq:bergman-kernel-series converges absolutely and uniformly on
  compact subsets of $D times D$. For fixed $zeta in D$ this series converges in
  the $L_h^2$-norm with respect to $z$.
] <th:bergman-kernel-convergence>

#proof[
  Let $a in D$. Taking account of the orthonormality of the system ${phi_m}$ and
  inequality @eq:point-estimate, we then get that
  $
    sum_(m = 0)^M |phi_m (a)|^2
    = integral_D abs(sum_(m = 0)^M phi_m (z) overline(phi_m (a)))^2 h d v
    >= 1 / c^2 (sum_(m = 0)^M |phi_m (a)|^2)^2,
  $
  and so
  $
    sum_(m = 0)^M |phi_m (a)|^2 <= c^2.
  $ <eq:kernel-diagonal-bound>
  Let $z in D$ and $zeta in D$, and suppose that the polydisks $U(z, r)$ and
  $U(zeta, rho)$ are in $D$ along with their closures. Then
  $
    (sum_(m = 0)^M |phi_m (z) overline(phi_m (zeta))|)^2
    & <= sum_(m = 0)^M |phi_m (z)|^2 sum_(m = 0)^M |phi_m (zeta)|^2 \
    & <= c^2 (r) dot.c c^2 (rho),
  $
  which implies that @eq:bergman-kernel-series converges absolutely and
  uniformly on compact subsets of $D times D$. Finally, it follows from
  @eq:kernel-diagonal-bound that for fixed $zeta in D$ the equality
  @eq:bergman-kernel-series is the expansion of $K(z, overline(zeta))$ in the
  complete orthonormal system ${phi_m (z)}$.
]

#source(60)
The function $K(z, overline(zeta))$ is called the _Bergman-kernel function for
$D$ with respect to the weight $h$_, or simply the _kernel function_. Note that
$K(z, overline(zeta)) = overline(K(zeta, overline(z)))$ and that
$K(z, overline(zeta))$ is holomorphic with respect to $z$ and antiholomorphic
with respect to $zeta$ in $D times D$.

#theorem(title: [Bergman])[
  If $f in L_h^2 (D)$, then for $z in D$
  $
    f(z) = integral_D f(zeta) K(z, overline(zeta)) h(zeta, overline(zeta))
    d v_zeta.
  $ <eq:bergman-formula>
] <th:bergman-formula>

#proof[
  Let us represent $f$ and $K$ by @eq:orthonormal-expansion and
  @eq:bergman-kernel-series. Then
  $
    integral_D f(zeta) K(z, overline(zeta)) h(zeta, overline(zeta)) d v_zeta
    & = integral_D (sum_(m = 0)^infinity a_m phi_m (zeta))
    (sum_(l = 0)^infinity phi_l (z) overline(phi_l (zeta)))
    h(zeta, overline(zeta)) d v_zeta \
    & = sum_(m = 0)^infinity a_m phi_m (z) = f(z).
  $
]

We mention the following results of Bergman without proof.

1\. The kernel function $K(z, overline(zeta))$ does not depend on the choice of
the complete orthonormal system ${phi_m}$, but only on the domain $D$ and the
weight function $h$.

2\. If $h equiv 1$, then the positive-definite differential form
$
  sum_(alpha, beta = 1)^n (partial^2 ln K(z, overline(z)))
  / (partial z_alpha partial overline(z)_beta)
  d z_alpha d overline(z)_beta
$
determines a Hermitian metric in $D$ that is invariant under biholomorphic
mappings; it is called the #index-mark("Metric", sub: "Bergman")_Bergman
metric_.

#index-mark("Examples of computation", sub: "of kernel functions")We give
examples of the computation of the kernel function, confining ourselves to
complete $n$-circular domains $D$ and to the weight function $h equiv 1$. It is
convenient to take the monomials ${a_k z^k}$, $k = (k_1, ..., k_n)$,
$k_j = 0, 1, ...,$ $j = 1, ..., n$, as a complete orthonormal system, where
$
  a_k^2 = [integral_D |z^k|^2 d v]^(-1).
$ <eq:monomial-normalization>
The completeness of this system follows from the fact that holomorphic functions
can be expanded in a Taylor series for the class of domains under consideration,
and the orthonormality follows from @eq:monomial-normalization and
$
  integral_D z^k overline(z)^(k') d v = 0, quad k != k'.
$
#new-par
1\. _A polydisk._ For the polydisk $U(0, r)$, $r = (r_1, ..., r_n)$ we get from
@eq:monomial-normalization that
$
  a_k^2 = 1 / pi^n product_(nu = 1)^n (k_nu + 1) / r_nu^(2k_nu + 2) .
$
#source(61)
#new-par
Then, by @eq:bergman-kernel-series (here
$x_nu = z_nu overline(zeta)_nu r_nu^(-2)$)
$
  K(z, overline(zeta))
  & = sum_k 1 / pi^n product_(nu = 1)^n (k_nu + 1) / r_nu^(2k_nu + 2)
  z^k overline(zeta)^k
  = 1 / (pi^n r_1^2 dots.c r_n^2) sum_k
  (partial^n) / (partial x_1 dots.c partial x_n) x^k \
  & = 1 / (pi^n r_1^2 dots.c r_n^2)
  (partial^n) / (partial x_1 dots.c partial x_n)
  1 / ((1 - x_1) dots.c (1 - x_n)) \
  & = 1 / (pi^n r_1^2 dots.c r_n^2) 1 / ((1 - x_1)^2 dots.c (1 - x_n)^2) \
  & = 1 / pi^n product_(nu = 1)^n r_nu^2
  / (r_nu^2 - z_nu overline(zeta)_nu)^2 .
$
#new-par
2\. _A ball._ For the ball $B(O, R)$ formula @eq:monomial-normalization gives us
that
$
  a_k^2 = ((k_1 + dots.c + k_n + n)!)
  / (k_1 ! dots.c k_n ! pi^n R^(2(k_1 + dots.c + k_n + n))),
$
and so (here $x = R^(-2) sum_1^n z_j overline(zeta)_j$, $|x| < 1$)
$
  K(z, overline(zeta))
  & = 1 / (pi^n R^(2n)) sum_k ((k_1 + dots.c + k_n + n)!)
  / (k_1 ! dots.c k_n ! R^(2(k_1 + dots.c + k_n))) z^k overline(zeta)^k \
  & = 1 / (pi^n R^(2n)) sum_(m = 0)^infinity ((m + 1) dots.c (m + n))
  / R^(2m) sum_(k_1 + dots.c + k_n = m) (m!) / (k_1 ! dots.c k_n !)
  z^k overline(zeta)^k \
  & = 1 / (pi^n R^(2n)) sum_(m = 0)^infinity (d^n) / (d x^n) x^m
  = 1 / (pi^n R^(2n)) (d^n) / (d x^n) 1 / (1 - x)
  = (n!) / (pi^n R^(2n) (1 - x)^(n + 1)) \
  & = (n! R^2)
  / (pi^n (R^2 - z_1 overline(zeta)_1 - dots.c
    - z_n overline(zeta)_n)^(n + 1)) .
$
#new-par
#point <pt:holomorphic-kernel> Let $D$ be a bounded domain in $CC^n$ with a
piecewise smooth boundary $partial D$. For a function $f in A_C (D)$ we write
the Martinelli-Bochner formula @eq:martinelli-bochner in the form
$
  f(zeta) = integral_(partial D) f(eta) M(eta, zeta) d sigma_eta,
$
where $zeta in D$, and $d sigma$ is the surface element of $partial D$. Further,
by @eq:bergman-formula,
$
  f(z) & = integral_D [integral_(partial D) f(eta) M(eta, zeta) d sigma_eta]
         K(z, overline(zeta)) h(zeta, overline(zeta)) d v_zeta \
       & = integral_(partial D) [integral_D M(eta, zeta) K(z, overline(zeta))
           h(zeta, overline(zeta)) d v_zeta] f(eta) d sigma_eta \
       & = integral_(partial D) f(eta) B(z, eta) d sigma_eta .
$
#source(62)
Here the kernel
$
  B(z, eta) = integral_D M(eta, zeta) K(z, overline(zeta))
  h(zeta, overline(zeta)) d v_zeta
$ <eq:bungart-kernel>
is holomorphic in $z in D$ and continuous in $eta in partial D$ if the integral
in @eq:bungart-kernel converges uniformly on each set of the form
${(z, eta): z in Q, eta in partial D}$, where $Q$ is an arbitrary compact subset
of $D$. For this to be true it suffices that with respect to the variable $zeta$
we have $norm(M(eta, zeta))_D^h <= c$, where $c$ does not depend on $eta$. This
inequality is true when, for example, $h = [rho(zeta, partial D)]^(4n - 2)$.
Thus, by combining the Martinelli-Bochner integral representation
@eq:martinelli-bochner and the Bergman formula @eq:bergman-formula (with a
specially chosen weight function), we have proved the following result by using
an idea of Khenkin.

#theorem(title: [Bungart])[
  For every bounded domain $D$ with a piecewise smooth boundary $partial D$
  there exists an integral representation
  $
    f(z) = integral_(partial D) f(zeta) B(z, zeta) d sigma_zeta,
  $ <eq:bungart-representation>
  $z in D$, for functions $f in A_C (D)$, where the kernel $B(z, zeta)$ is
  holomorphic with respect to $z in D$, and
  $B(z, zeta) in C{(z, zeta): z in D, zeta in partial D}$.
] <th:bungart>

The following assertion is also true.

#theorem(title: [Bungart])[
  Under the conditions of Theorem~@th:bungart there exists an integral
  representation @eq:bungart-representation with kernel
  $B(z, overline(zeta)) in A{(z, overline(zeta)): z in D, zeta in D}$ in the
  class $H_(d sigma_zeta)^2$ for every $z in D$.
] <th:bungart-szego>

A kernel such as the one in this theorem which is holomorphic in $z$ and
antiholomorphic in $zeta$ is called a #index-mark(
  "Kernel function",
  sub: "Szegö",
)_Szegö kernel_. The question arises of whether we can get an analogue of
formula @eq:bungart-representation with the integration over the Shilov boundary
$S(D)$ instead of over $partial D$. A positive answer to this is contained in
the next theorem, which we present without proof.

#theorem(title: [Gleason])[
  On the Shilov boundary $S(D)$ of a domain $D$ there exist a positive measure
  $mu$ and a $mu$-measurable function $Q(z, zeta)$, $z in D$, $zeta in S(D)$,
  such that the following conditions hold:
  + For fixed $zeta in S(D)$ the function $Q$ is in $A(D)$ with respect to $z$.
  + $Q(z, zeta)$ is integrable with respect to the measure $mu_zeta$ for a fixed
    $z in D$.
  + The function $integral_(S(D)) |Q(z, zeta)| d mu_zeta$ is continuous in $D$.
  + For every $f in A_C (D)$ and $z in D$
    $
      f(z) = integral_(S(D)) f(zeta) Q(z, zeta) d mu_zeta.
    $ <eq:gleason-representation>
] <th:gleason>

#source(63)
Thus, the Shilov boundary plays the same role in the theory of functions of
several complex variables as the whole boundary plays in the theory of functions
of a single complex variable. Not only does every function in $A_C (D)$ attain a
maximum on the Shilov boundary, but also the values of these functions inside
the domain can be recovered by means of the integral representation
@eq:gleason-representation from the values on the Shilov boundary.

We complement Theorem~@th:gleason by a simple but often useful assertion that is
in a certain sense a converse to this theorem.

#theorem[
  If $M$ is a closed subset of the boundary $partial D$ of a bounded domain $D$,
  and for every $f in A_C (D)$ and $z in D$
  $
    f(z) = integral_M f(zeta) R(z, zeta) d mu_zeta,
  $ <eq:representation-on-subset>
  where $mu$ is a positive measure on $M$ and the function $R$ is absolutely
  integrable with respect to the measure $mu_zeta$ for fixed $z in D$, then
  $M supset S(D)$.
] <th:shilov-boundary-converse>

#proof[
  If $f in A_C (D)$, then for any positive integer $m$
  $
    |f(z)|^m = abs(integral_M f(zeta)^m R(z, zeta) d mu_zeta)
    <= (sup_M |f(zeta)|)^m integral_M |R(z, zeta)| d mu_zeta.
  $
  Taking the $m$th root and letting $m -> infinity$, we now get that $M$ is a
  determining set. Hence, $M supset S(D)$.
]
