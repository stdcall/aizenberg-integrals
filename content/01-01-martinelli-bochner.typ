#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== The Martinelli-Bochner integral representation <sec:martinelli-bochner>

#source(29)
#theorem[#point <pt:martinelli-bochner>
  #index-mark("Representation", sub: "integral", subsub: "Martinelli-Bochner")
  Suppose that $f in A_C (D)$, where $D$ is a bounded domain in $CC^n$ with
  piecewise smooth boundary $partial D$. Then the Martinelli-Bochner formula
  holds:
  $
    integral_(partial D) f(zeta) omega(zeta - z, overline(zeta) - overline(z))
    = cases(f(z)\, quad & z in D\,, 0\, & z in.not overline(D)\,)
  $ <eq:martinelli-bochner>
  where
  $
    omega(zeta - z, overline(zeta) - overline(z))
    = (n - 1)! / (2 pi i)^n
    (sum_(k = 1)^n (-1)^(k - 1) (overline(zeta)_k - overline(z)_k)
    d overline(zeta)_([k]) and d zeta)
    / (|zeta - z|^(2n)) .
  $ <eq:martinelli-bochner-kernel>
  #notation-mark($omega(zeta - z, overline(zeta) - overline(z))$, sort: "omega")
] <th:martinelli-bochner>

#proof[
  1\. It is easy to establish by direct calculation that the Martinelli-Bochner
  kernel $omega$ is closed with respect to $zeta$ on the set $CC^n without {z}$.
  From this and Corollary~@cor:closed-form-over-null-cycle we get
  @eq:martinelli-bochner for the case $z in.not overline(D)$. But if $z in D$,
  then, by the same Corollary~@cor:closed-form-over-null-cycle, the integration
  over $partial D$ can be replaced by integration over the sphere
  $partial B_r (z)$, where the radius $r$ is sufficiently small.

  2\. In a sufficiently small neighborhood of a point $z in D$ the holomorphic
  function $f(zeta)$ can be expanded in a multiple power series about $z$;
  hence, to prove @eq:martinelli-bochner it suffices to establish that
  $
    (n - 1)! / (2 pi i r^2)^n integral_(partial B_r) (zeta - z)^beta
    sum_(k = 1)^n (-1)^(k - 1) (overline(zeta)_k - overline(z)_k)
    d overline(zeta)_([k]) and d zeta \
    = cases(0 quad & "if" beta != 0\,, 1 & "if" beta = 0.)
  $ <eq:martinelli-bochner-sphere>
  #source(30)
  #new-par
  3\. Note that under the change of variables
  $zeta_k - z_k = e^(i t_k) (zeta'_k - z_k)$ with all the $t_k$ real
  ($k = 1, ..., n$) the set $partial B_r (z)$ is carried into itself, and the
  integrand form in @eq:martinelli-bochner-sphere is multiplied by
  $e^(i t_1 beta_1) dots.c e^(i t_n beta_n)$; therefore,
  @eq:martinelli-bochner-sphere holds for the case $beta != 0$.

  4\. If $beta = 0$, then, by Stokes' formula, the left-hand side of
  @eq:martinelli-bochner-sphere is equal to
  $
    & n! / (2 pi i r^2)^n integral_(B_r) d overline(zeta) and d zeta \
    & quad = (n! 2^n) / r^(2n)
      integral_(|zeta_1 - z_1|^2 + dots.c + |zeta_n - z_n|^2 < r^2)
      |zeta_1 - z_1| dots.c |zeta_n - z_n| d|zeta_1 - z_1| \
    & quad quad and dots.c and d|zeta_n - z_n| \
    & quad = n! integral_(tau_1 + dots.c + tau_n < 1, tau_i >= 0)
      d tau_1 and dots.c and d tau_n = 1.
  $
]

#point For $n > 1$ the Martinelli-Bochner kernel
$omega(zeta - z, overline(zeta) - overline(z))$ is not holomorphic in $z$ but
only harmonic; nevertheless, the following assertion holds.

#theorem(title: [Aronov and Kytmanov])[
  If $D$ is a bounded domain with piecewise smooth boundary and the
  Martinelli-Bochner integral representation @eq:martinelli-bochner is valid for
  $z in D$ for a particular $f in C^((1)) (overline(D))$, then $f in A(D)$.
] <th:aronov-kytmanov>

To prove this theorem we need some lemmas.

#lemma(title: [#index-mark(
    "Formula",
    sub: "Martinelli-Bochner",
    subsub: "for smooth functions",
    target: <lem:martinelli-bochner-smooth>,
  )The Martinelli-Bochner formula for smooth functions])[
  If $f in C^((1)) (overline(D))$, then
  $
    integral_(partial D) f(zeta) omega(zeta - z, overline(zeta) - overline(z))
    - integral_D dbar f(zeta) and omega(
      zeta - z,
      overline(zeta) - overline(z)
    ) \
    = cases(f(z)\, quad & z in D\,, 0\, & z in.not overline(D).)
  $ <eq:martinelli-bochner-smooth>
] <lem:martinelli-bochner-smooth>

This lemma can be proved in the same way as Theorem~@th:martinelli-bochner,
except that the integral of
$d_zeta (f(zeta) omega(zeta - z, overline(zeta) - overline(z)))
= dbar_zeta f(zeta) and omega(
  zeta - z,
  overline(zeta) - overline(z)
)$, over $D$ also appears, and it is not possible to expand $f(zeta)$ in a
neighborhood of $z$ in a Taylor series with respect to powers of $zeta - z$, but
is instead necessary to approximate $f$ in this closed neighborhood by a
polynomial in $zeta - z$ and $overline(zeta) - overline(z)$. The formula
@eq:martinelli-bochner-smooth enables us to easily compute the saltus of an
integral of Martinelli-Bochner type in passing across the boundary of a domain
$D$.

#lemma[
  Let $f in C^((1)) (partial D)$, and define
  $
    F^plus.minus (z)
    = integral_(partial D) f(zeta) omega(
      zeta - z,
      overline(zeta) - overline(z)
    ), quad z in D^plus.minus,
  $ <eq:martinelli-bochner-type>
  #source(31)
  where $D^+ = D$ and $D^- = CC^n without overline(D)$. Then the functions
  $F^plus.minus (z)$ are continuous all the way up to the boundary of
  $D^plus.minus$, respectively, and
  $
    F^+ (z) - F^- (z) = f(z), quad z in partial D.
  $ <eq:saltus>
] <lem:saltus>

#proof[
  Suppose that $F in C^((1)) (overline(D))$ and $F|_(partial D) = f$. The
  function
  $
    phi(z) = integral_D dbar F(zeta) and omega(
      zeta - z,
      overline(zeta) - overline(z)
    )
  $
  is continuous in $CC^n$ (see Proposition~@prop:potentials-holder). By
  @eq:martinelli-bochner-smooth,
  $
    F^+ (z) & = F(z) + phi(z), quad && z in D^+, \
    F^- (z) & = phi(z),             && z in D^-,
  $
  and this and the continuity of $phi$ and $F$ give us the continuity of
  $F^plus.minus (z)$ all the way up to the boundary of $D^plus.minus$, along
  with equality @eq:saltus.
]

We shall also make use of the following result of Keldysh and Lavrent'ev, which
we present in the even-dimensional case we need.

#lemma(title: [Keldysh and Lavrent'ev])[
  The linear manifold generated by the fractions of the form
  $
    1 / (|zeta - z|^(2n - 2)), quad zeta in K, z in CC^n without K,
  $
  where $K$ is a compact set in $CC^n$ of total Lebesgue measure zero and
  $n > 1$, is dense in the space $C(K)$.
] <lem:keldysh-lavrentev>

#proof[
  By the Stone-Weierstrass theorem, it can be assumed that $f in C^((1)) (K)$.
  We extend $f$ as a smooth function to some closed ball $overline(B)$ with
  $B supset K$, and we represent it by formula @eq:martinelli-bochner-smooth,
  where $D = B$. If we now replace the domain of integration $B$ in the second
  integral in @eq:martinelli-bochner-smooth by $B without U$, where $U$ is a
  neighborhood of $K$ of sufficiently small volume, and the integrals themselves
  by appropriate integral sums, then, using the fact that the coefficients of
  the form $omega(zeta - z, overline(zeta) - overline(z))$ are the derivatives
  of the fundamental solution
  $
    g(zeta, z) = (1 - n)^(-1) |zeta - z|^(2 - 2n)
  $ <eq:fundamental-solution>
  of the Laplace equation and replacing the derivatives of $g$ by difference
  quotients, we obtain linear combinations of the desired fractions that
  uniformly approximate $f$ on $K$.
]

#proof(title: [Proof of Theorem~@th:aronov-kytmanov.])[
  Consider the integrals of Martinelli-Bochner type @eq:martinelli-bochner-type;
  then $F^+ equiv f$ in $D$. It now follows from @eq:saltus that
  $F^-|_(partial D) = 0$. We note that $F^-$ is harmonic in $D^-$ and has a zero
  of order $2n - 1$ at infinity. By the uniqueness theorem for harmonic
  functions,
  $
    F^- (z) equiv 0, quad z in D^-.
  $ <eq:exterior-vanishes>
  #source(32)
  Since $f$ is representable by formula @eq:martinelli-bochner, it is harmonic
  in $D$. Let us represent it by Green's formula for harmonic functions:
  $
    integral_(partial D) [f omega + g(zeta, z) nu_f (zeta)]
    = cases(f(z)\, quad & z in D\,, 0\, & z in.not overline(D)\,)
  $ <eq:green-complex>
  where
  $
    nu_f (zeta) = (-1)^(n - 1) (n - 1)! / (2 pi i)^n sum_(k = 1)^n
    (-1)^(k - 1) (partial f) / (partial overline(zeta)_k)
    d zeta_([k]) and d overline(zeta).
  $
  This "complex" Green's formula can be proved in the same way as its "real"
  analogue, the ordinary Green's formula (see also the proof of
  Lemma~@lem:martinelli-bochner-smooth). It follows from @eq:martinelli-bochner
  and @eq:green-complex that
  $
    integral_(partial D) (nu_f (zeta)) / (|zeta - z|^(2n - 2)) = 0
  $ <eq:green-vanishing>
  for $z in D$. Comparing @eq:exterior-vanishes and @eq:green-complex, we get
  that @eq:green-vanishing is also valid for points $z in D^-$.
  Lemma~@lem:keldysh-lavrentev, applied to the compact set $partial D$, now
  shows that $nu_f (zeta)|_(partial D) = 0$.

  The function $f$ is harmonic in $D$; therefore,
  $d nu_f (zeta) = c Delta f d zeta and d overline(zeta) = 0$, i.e., the form
  $nu_f$ is closed in $D$, and so $d(overline(f(zeta)) times nu_f (zeta))$,
  extends continuously to $overline(D)$. Stokes' formula gives us that
  $
    -((n - 1)!) / pi^n integral_D sum_(k = 1)^n
    lr(|(partial f) / (partial overline(zeta)_k)|)^2 d V
    = integral_D d(overline(f(zeta)) dot.c nu_f (zeta))
    = integral_(partial D) overline(f(zeta)) nu_f (zeta) = 0.
  $
  From this and the continuity of the derivatives
  $partial f \/ partial overline(zeta)_k$ ($k = 1, ..., n$) it follows that
  these derivatives are equal to zero in $D$, i.e., $f$ is holomorphic in $D$.
]

The following result is harder to prove, and we present it without proof.

#theorem(title: [Kytmanov and Aĭzenberg])[
  If a function $f in C(overline(D))$ can be represented in $D$ by the
  Martinelli-Bochner integral #roman-text[@eq:martinelli-bochner], then it is
  holomorphic in $D$ in each of the following cases:
  + $partial D in C^((2))$;
  + $n = 2$, and the boundary $partial D$ is connected and belongs to the class
    $C^((1))$.
] <th:kytmanov-aizenberg>
