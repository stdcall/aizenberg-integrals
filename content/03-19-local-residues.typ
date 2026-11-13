#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[Local residues of certain meromorphic and rational functions
  on $CC^n$] <sec:local-residues>

#point <pt:local-residues-setting> Suppose that $phi_1, ..., phi_N$ are
functions holomorphic in a neighborhood of a point $a in CC^n$, $phi_j (a) = 0$,
and
$
  lr(
    |(partial(phi_(alpha_1), ..., phi_(alpha_n)))
    / (partial(z_1, ..., z_n))|
  )_(z = a) != 0
$
for any ${alpha_1, ..., alpha_n} subset {1, ..., N}$. Consider the integral
$
  integral_gamma f(z) d z \/ product_(j = 1)^N phi_j^(r_j) (z),
$ <eq:local-residue-integral>
where $gamma in Z_n (U without union.big_1^N T_j)$, $U$ is a sufficiently small
neighborhood of $a$, $T_j = {z: phi_j (z) = 0}$, and $f in A(U)$, along with the
more general integral
$
  integral_gamma F(z) d z,
$ <eq:local-residue-general-integral>
where $F in A(U without union.big_1^N T_j)$. We shall use the approach
considered in @sec:de-rham for the study of these integrals. We find dual (in
the de Rham sense) bases for the $n$-dimensional homology and cohomology of the
domain $U without union.big_1^N T_j$, and compute the residues of the functions
$f \/ product_1^N phi_j^(r_j)$ with respect to the basis cycles.

#point <pt:separation-of-singularities> Let us first prove some auxiliary
theorems on separation of singularities. The following result is a special case
of a theorem on the solvability of the first Cousin problem (see
@bib:Hormander1966, Theorem~5.5.1).

#source(144)
#theorem[
  Let $D_1$ and $D_2$ be domains in $CC^n$ such that $D_1 union D_2$ is a domain
  of holomorphy. Then every function $f in A(D_1 inter D_2)$ can be represented
  in the form $f = f_1 + f_2$, where $f_j in A(D_j)$, $j = 1, 2$.
] <th:cousin-separation>

Using this, we prove a theorem on separation of singularities lying on analytic
sets.

#theorem(title: [Yuzhakov])[
  Let $G$ be a domain of holomorphy in $CC^n$, and let $phi_j in A(G)$,
  $j = 1, ..., k$. If there exist functions $c_j in A(G)$, $c_j (z) != 0$ in $G$
  ($j = 1, ..., k$), such that $c_1 phi_1 + dots.c + c_k phi_k equiv 0$, then
  every function
  $
    f in A(G without union.big_1^k T_j), quad
    T_j = {z in G: phi_j (z) = 0},
  $
  can be represented in the form $f = f_1 + dots.c + f_(k - 1)$, where
  $
    f_j in A(G without (T_1 union dots.c [j] dots.c union T_k)),
    quad j = 1, ..., k - 1.
  $
] <th:yuzhakov-separation>

#proof(title: none)[
  The proof is by induction on $k$. For $k = 3$ Theorem~@th:yuzhakov-separation
  is a corollary to Theorem~@th:cousin-separation. Indeed, let
  $D_1 = G without (T_2 union T_3)$ and $D_2 = G without (T_1 union T_3)$. Then
  $
    D_1 inter D_2 = G without (T_1 union T_2 union T_3),
  $
  and $D_1 union D_2 = G without (T_3 union (T_1 inter T_2)) = G without T_3$ is
  a domain of holomorphy; here
  $
    T_1 inter T_2 & = {z in G: phi_1 (z) = phi_2 (z) = 0} subset T_3 \
                  & = {z in G: phi_3 (z)
                      = -[c_1 (z) phi_1 (z)
                        + c_2 (z) phi_2 (z)] \/ c_3 (z) = 0}.
  $
  #new-par
  We suppose that the theorem is valid for some $k >= 3$, and prove it for
  $k + 1$. If $f in A(G without union.big_1^(k + 1) T_j)$, then $f$ is also
  holomorphic in the domain
  $
    G without (T'_k union union.big_(j = 1)^(k + 1) T_j)
    = G' without (T_1 union dots.c union T_(k - 1) union T'_k),
  $
  where
  $
    T'_k = {z in G: c_k (z) phi_k (z) + c_(k + 1) (z) phi_(k + 1) (z) = 0},
    quad G' = G without (T_k union T_(k + 1)).
  $
  The domain $G'$ and the functions $phi_1, ..., phi_(k - 1)$ and
  $c_k phi_k + c_(k + 1) phi_(k + 1)$ satisfy the conditions of the theorem for
  $k$. By the induction hypothesis, $f$ can be represented in the form
  $f = g_1 + dots.c + g_(k - 1)$, where $g_j in A(G_j)$,
  $
    G_j = G' without (T_1 union dots.c [j] dots.c union T_(k - 1) union T'_k)
    = D_j without (T_k union T'_k union T_(k + 1)),
  $
  with
  $
    D_j = G without (T_1 union [j] dots.c union T_(k - 1)).
  $
  #source(145)
  By what was proved for $k = 3$, $g_j$ can be represented in the form
  $g_j = f_j + psi_j$, where
  $
    f_j in A(D_j without T_k union T_(k + 1))
    = A(G without (T_1 union dots.c [j] dots.c union T_(k + 1))),
  $
  and $psi_j in A(D_j without T'_k union T_(k + 1))$, $j = 1, ..., k - 1$. Then
  the function $f_k = sum_(j = 1)^(k - 1) psi_j = f - sum_(j = 1)^(k - 1) f_j$
  is holomorphic in the domains $G without union.big_(j = 1)^(k + 1) T_j$ and
  $
    inter.big_(j = 1)^(k - 1) (D_j without (T'_k union T_(k + 1)))
    = G without (T_1 union dots.c union T_(k - 1) union T'_k union T_(k + 1)),
  $
  hence, also in their union
  $
    G without (T_1 union dots.c union T_(k - 1) union T_(k + 1)
      union (T_k inter T'_k))
    = G without (T_1 union dots.c union T_(k - 1) union T_(k + 1)).
  $
  Here $T_k inter T'_k = {z in G: phi_k (z)
    = c_k (z) phi_k (z) + c_(k + 1) (z) phi_(k + 1) (z) = 0} subset T_(k + 1)
  = {z in G: phi_(k + 1) (z) = 0}$.
]

#point <pt:local-bases> We return to the notation of @pt:local-residues-setting.
Let $A$ be the set of multi-indices $alpha = (alpha_1, ..., alpha_n)$ with
$1 <= alpha_1 < alpha_2 < dots.c < alpha_(n - 1) <= N - 1$ and $alpha_n = N$.

#theorem[
  The dimension of the groups
  $
    H_n (U without union.big_1^N T_j), quad "and" quad
    H^n (U without union.big_1^N T_j)
  $
  is equal to $binom(N - 1, n - 1)$. The cycles
  $
    gamma_alpha = {z in U: |phi_(alpha_1) (z)| = dots.c
      = |phi_(alpha_(n - 1)) (z)| = delta, \
      |phi_(alpha_n) (z)| = epsilon}, quad alpha in A,
  $
  where $epsilon$ and $delta \/ epsilon$ are sufficiently small positive
  numbers, and the forms
  $
    omega_alpha = 1 / (2 pi i)^n
    (d phi_(alpha_1) and dots.c and d phi_(alpha_n))
    / (phi_(alpha_1) dots.c phi_(alpha_n)),
    quad alpha in A,
  $
  make up dual (in the de Rham sense) bases for the $n$-dimensional homology and
  cohomology of the domain $U without union.big_1^N T_j$.
] <th:local-dual-bases>

#lemma[
  For $N >= n$ every function $f in A(U without union.big_1^N T_j)$ can be
  represented as $f = sum_(alpha in A) f_alpha$ in some neighborhood $V$ of $a$
  with $V subset U$, where $f_alpha in A(V without union.big_1^n T_(alpha_j))$.
] <lem:local-decomposition>

#proof[
  We use induction on $N$. For $N = n$ the assertion is trivial. We assume that
  the lemma is valid for $N - 1 >= n$ and prove it for $N$. From the assumption
  that $(partial phi_alpha \/ partial z)|_a != 0$ it follows for any subset
  ${alpha_1, ..., alpha_n} subset {1, ..., N}$ that in some neighborhood $V$ of
  $a$ the function $phi_N$ can be represented in the form
  $phi_N = c_1 phi_1 + dots.c + c_n phi_n$, where $c_j in A(V)$ and
  $c_j (z) != 0$ in $V$. Indeed, it suffices to make the substitution
  $zeta_j = phi_j (z)$, $j = 1, ..., n$, expand
  #source(146)
  $phi_N$ in a series with respect to $zeta_1, ..., zeta_n$, and group the terms
  of the series according to $zeta_j$ ($j = 1, ..., n$). Since
  $V without union.big_1^N T_j$ is a domain of holomorphy, $f$ can be
  represented (by Theorem~@th:yuzhakov-separation) as $sum_1^n f_j$, where
  $
    f_j in A(V without T_1 union dots.c [j] dots.c union T_N),
    quad j = 1, ..., n.
  $
  It now remains to apply the induction hypothesis to the functions $f_j$.
]

#remark[
  If $f$ is a meromorphic function, then the functions $f_alpha$ ($alpha in A$)
  can also be chosen to be meromorphic. For this, we multiply the function
  $f = F \/ product_1^N phi_j^(r_j)$ by $sum_1^n c_j phi_j$ and divide by
  $phi_N$, then cancel $phi_j$ in each term. Repeating this finitely many times,
  we represent $f$ as $sum_1^n f_j$, where
  $
    f_j = F_j \/ (phi_1^(beta_1) dots.c [j] dots.c phi_N^(beta_N)).
  $
]

#proof(title: [Proof of Theorem~@th:local-dual-bases.])[
  We assume that the neighborhood $U$ is sufficiently small and such that for
  any $alpha = (alpha_1, ..., alpha_n)$ and any $j != alpha_1, ..., alpha_n$
  there exist functions $c_k in A(U)$, $c_k (z) != 0$ in $overline(U)$
  ($k = 1, ..., n$), for which $phi_j = sum_(k = 1)^n c_k phi_(alpha_k)$. For
  $epsilon$ and $delta \/ epsilon$ sufficiently small we have
  $|gamma_alpha| subset U without union.big_1^N T_j$. Indeed, it is obvious that
  $|gamma_alpha| inter T_j = emptyset$ for $j = alpha_1, ..., alpha_n$. For
  $j in {1, ... [alpha_1, ..., alpha_n], ..., N}$ we have
  $T_j inter |gamma_alpha| = emptyset$ if
  $delta \/ epsilon < min_(z in overline(U))
  (sum_(k = 1)^(n - 1) |c_k (z) \/ c_n (z)|)^(-1)$.

  By Serre's theorem, every form $omega in Z^n (U without union.big_1^N T_j)$ is
  cohomologous to a holomorphic form, $omega tilde.op f(z) d z$, where
  $f in A(U without union.big_1^N T_j)$. Lemma~@lem:local-decomposition gives us
  that $f d z = sum_(alpha in A) f_alpha d z$, where
  $f_alpha in A(U without (T_(alpha_1) union dots.c union T_(alpha_n)))$.
  Exactly as in Example~@st:monomial-duality it can be shown that
  $f_alpha d z tilde.op c_alpha omega_alpha$, where $c_alpha$ is a constant. For
  this, it suffices to make the substitution
  $
    zeta_j = phi_(alpha_j) (z), quad j = 1, ..., n,
  $ <eq:local-substitution>
  and expand $f_alpha$ in a Laurent series of powers of $zeta_1, ..., zeta_n$.
  According to Proposition~@prop:dual-bases, it remains to show that
  $
    integral_(gamma_alpha) omega_beta
    = cases(1 quad & "if" alpha = beta\,, 0 & "if" alpha != beta.)
  $
  After the substitution @eq:local-substitution, we get
  $
    integral_(gamma_alpha) omega_alpha
    = 1 / (2 pi i)^n
    integral_(|zeta_n| = epsilon \ |zeta_1| = dots.c = |zeta_(n - 1)| = delta)
    (d zeta) / zeta = 1.
  $
  For $beta = (beta_1, ..., beta_n) != alpha = {alpha_1, ..., alpha_n}$ the
  cycle $gamma_alpha$ is homologous to 0 in
  $U without (T_(beta_1) union dots.c union T_(beta_n))$. Indeed, in this case
  there is a $j in {1, ..., n - 1}$ such that $alpha_j != beta_1, ..., beta_n$.
  Then $gamma_alpha = partial B$, where
  $
    B = {z in U: |phi_(alpha_1) (z)| = dots.c [alpha_j] dots.c
      = |phi_(alpha_(n - 1)) (z)| = delta, \
      |phi_(alpha_j) (z)| <= delta, quad |phi_(alpha_n) (z)| = epsilon}.
  $
  #source(147)
  Moreover, $|B| subset U without T_(beta_1) union dots.c union T_(beta_n)$,
  since obviously $T_(beta_q) inter |B| = emptyset$ if $beta_q = alpha_k$,
  $k != j$, while if $beta_q != alpha_1, ..., alpha_n$, then the inequality
  $
    epsilon = |phi_(alpha_n)|
    > sum_(k = 1)^(n - 1) lr(|c_k / c_n|) delta
    >= sum_(k = 1)^(n - 1) lr(|c_k / c_n|) |phi_(alpha_k)|,
  $
  holds on $|B|$, i.e., $phi_(beta_q) != 0$ and again
  $T_(beta_q) inter |B| = emptyset$. Here
  $phi_(beta_q) = c_1 phi_(alpha_1) + dots.c + c_n phi_(alpha_n)$,
  $c_j in A(U)$, $c_j != 0$, $j = 1, ..., n$. Then
  $integral_(gamma_alpha) omega_beta = 0$ by
  Corollary~@cor:closed-form-over-null-cycle. Clearly, the number of elements in
  the set $A$ is equal to the number of combinations of $N - 1$ things taken
  $n - 1$ at a time, i.e., $binom(N - 1, n - 1)$.
]

#point <pt:local-residue-computation> Let us compute the residues of the form
$f(z) d z$ with respect to the basis cycles $gamma_alpha$ ($alpha in A$). We
make the change of variables @eq:local-substitution in the neighborhood $U$ of
the point $a$. Then
$
  R_alpha = 1 / (2 pi i)^n integral_(gamma_alpha) f(z) d z
  = 1 / (2 pi i)^n integral_Gamma g(zeta) d zeta,
$
where
$
    Gamma & = {zeta in CC^n: |zeta_1| = dots.c = |zeta_(n - 1)| = delta,
              |zeta_n| = epsilon}, \
  g(zeta) & = lr([f(z) \/ (partial(phi_alpha)) / (partial(z))] |)_(z
            = phi_alpha^(-1) (zeta)),
            quad phi_alpha = (phi_(alpha_1), ..., phi_(alpha_n)).
$
Since $g$ is holomorphic in a neighborhood of the $n$-circular compact set
$|Gamma|$, it admits a Laurent expansion with respect to the variables
$zeta_1, ..., zeta_n$ in this neighborhood. The coefficient of
$zeta^(-upright(I)) = zeta_1^(-1) dots.c zeta_n^(-1)$ in this expansion is
obviously equal to $R_alpha$.

In the general case it is a complicated matter to find the inverse of the
holomorphic mapping @eq:local-substitution. Actually, in computing the residue
$R_alpha$ we can confine ourselves to the linear change of variables
$
  zeta_j = cal(L)_(alpha_j) (z), quad j = 1, ..., n,
$ <eq:linear-substitution>
where $cal(L)_(alpha_j)$ is the linear part of the function $phi_(alpha_j)$ at
the point $a$. Indeed, the cycle $gamma_alpha$ is homologous (homotopic) in
$U without union.big_1^N T_j$ to the cycle
$
  tilde(gamma)_alpha = {z in U: |cal(L)_(alpha_1) (z)| = dots.c
    = |cal(L)_(alpha_(n - 1)) (z)| = delta,
    |cal(L)_(alpha_n) (z)| = epsilon}.
$
Then
$
  R_alpha = 1 / ((2 pi i)^n Delta_alpha)
  integral_Gamma f(cal(L)_alpha^(-1) (zeta)) d zeta,
$
where $Delta_alpha = (partial(phi_alpha) \/ partial(z))|_a$. To find the residue
$R_alpha$ it remains to expand $f(cal(L)_alpha^(-1) (zeta))$ in a multiple
Laurent series in a neighborhood of the $n$-circular compact set $|Gamma|$.

#source(148)
In the case of the meromorphic function $f = F \/ product_1^N phi_j^(r_j)$ this
coefficient in the Laurent series can be found as follows. After the
substitution @eq:linear-substitution the function $f(cal(L)_alpha^(-1) (zeta))$
takes the form
$
  psi(zeta)
  / (product_(j = 1)^n (zeta_j
    + sum_(|beta| > 1) a_(alpha_j beta) zeta^beta)^(r_(alpha_j))
  product_(j = 1, j in.not alpha)^N (sum_(k = 1)^n a_(j k) zeta_k
    + sum_(|beta| > 1) a_(j beta) zeta^beta)^(r_j)).
$ <eq:meromorphic-after-substitution>
For $epsilon$, $delta$, $delta \/ epsilon$, and $epsilon^2 \/ delta$
sufficiently small on $Gamma$ the following inequalities hold:
$
  lr(|sum_(|beta| > 1) a_(alpha_j beta) zeta^beta|) < |zeta_j|, quad
  lr(
    |sum_(k = 1)^(n - 1) a_(j k) zeta_k
    + sum_(|beta| > 1) a_(j beta) zeta^beta|
  ) < |a_(j n) zeta_n|.
$
Thus, on $Gamma$ the fractions
$
  1 \/ zeta_j (1 + 1 / zeta_j sum_(|beta| > 1) a_(alpha_j beta) zeta^beta), \
  1 \/ a_(j n) zeta_n [1 + 1 / (a_(j n) zeta_n)
    (sum_(|beta| > 1) a_(j beta) zeta^beta
      + sum_(k = 1)^(n - 1) a_(j k) zeta_k)]
$
can be expanded in series of geometric progressions. Multiplying out these
series and the Taylor series of $psi$, we get the Laurent series of the fraction
@eq:meromorphic-after-substitution. We observe that to determine the coefficient
of $zeta^(-upright(I))$ in the Laurent series it suffices to have only finitely
many terms of the indicated series. It is sometimes convenient to represent the
denominator in @eq:meromorphic-after-substitution in the form
$
  (product_(j = 1 [alpha])^N a_(j n)^(r_j))
  (product_(j = 1)^n zeta_j^(r_(alpha_j)))
  zeta_n^(r_1 + dots.c [alpha_1, ..., alpha_n] dots.c + r_N) [1 + g(zeta)],
$
where
$
  g(zeta) = sum_(|beta| >= r_1 + dots.c + r_N) c_beta zeta^beta
  \/ (product_(j = 1 [alpha])^N a_(j n)^(r_j))
  (product_(j = 1)^n zeta_j^(r_(alpha_j)))
  zeta_n^(r_1 + dots.c [alpha] dots.c + r_N).
$
For $epsilon$, $delta \/ epsilon$, and $epsilon^2 \/ delta$ sufficiently small
we have $|g(zeta)| < 1$ on $|Gamma|$. Expanding the fraction $1 \/ (1 + g)$ in a
geometric progression, we find the Laurent series of
@eq:meromorphic-after-substitution in a neighborhood of $|Gamma|$.

#small-print[
  #point <pt:linear-denominators> The methods used here can also be applied in
  studying the residues of a rational function whose denominator can be
  decomposed into linear factors. Consider integrals of the form
  $
    integral_gamma P(z) d z \/ product_(j = 1)^N cal(L)_j^(r_j) (z)
  $ <eq:rational-integral>
  and
  $
    integral_gamma f(z) d z,
  $ <eq:rational-general-integral>
  #source(149)
  where $P$ is a polynomial (or an entire function),
  $
    cal(L)_j (z) = sum_(k = 1)^n a_(j k) z_k + a_(j 0), quad j = 1, ..., N,
  $ <eq:linear-functions>
  are linear functions, and $f in A(CC^n without union.big_1^N E_j)$, where
  $E_j = {z: cal(L)_j (z) = 0}$.

  Suppose that the rank of the matrix
  $
    norm(a_(j k))_(j = 1, ..., N; k = 1, ..., n)
  $ <eq:linear-matrix>
  is equal to $r$, $r <= n$. Let $Omega = {omega}$ be the family of maximal
  subsets $omega subset {1, ..., N}$ of indices such that the rank of the
  augmented matrix $norm(a_(j k))_(j in omega; k = 0, 1, ..., n)$ also is equal
  to $r$, i.e., $inter.big_(j in omega) E_j != emptyset$.

  #lemma[
    Every function $f in A(CC^n without union.big_1^N E_j)$ can be represented
    in the form $f = sum_(omega in Omega) f_omega$, where
    $f_omega in A(CC^n without union.big_(j in omega) E_j)$.
  ] <lem:linear-decomposition>

  #proof[
    We use induction on $N$. For $N = r$ the assertion is obvious. Suppose that
    $N > r$, and assume that the lemma is true for $N - 1$. If the rank of the
    augmented matrix $norm(a_(j k))_(j = 1, ..., N; k = 0, 1, ..., n)$ is equal
    to $r$, then $Omega$ consists of the lone subset $omega = {1, ..., N}$.
    Suppose that the rank of the augmented matrix is equal to $r + 1$. Then
    among the functions @eq:linear-functions there exist $r + 1$ functions, say
    $cal(L)_1, ..., cal(L)_(r + 1)$, for which the rank of the augmented matrix
    is equal to $r + 1$. From them there are numbers $c_1, ..., c_(r + 1)$ not
    equal to zero such that $sum_(j = 1)^(r + 1) c_j cal(L)_j equiv 1$. Setting
    $G = CC^n without (E_(r + 2) union dots.c union E_N)$, $k = r + 2$,
    $phi_(r + 2) equiv 1$, and $phi_j = cal(L)_j$, $j = 1, ..., r + 1$, in
    Theorem~@th:yuzhakov-separation, we get that each function
    $f in A(CC^n without union.big_1^N E_j)$ can be represented as
    $sum_1^(r + 1) f_j$, where
    $f_j in A(CC^n without (E_1 union dots.c [j] dots.c union E_N))$. Applying
    the induction hypothesis to the $f_j$ and combining the terms corresponding
    to one and the same $omega in Omega$, we prove the lemma for $N$.
  ]

  We take the system ${cal(L)_j}_(j in omega)$, $omega in Omega$ of linear
  functions, and order the set $omega = {j_1, ..., j_q}$, $q = q(omega)$, in
  such a way that the system ${cal(L)_(j_1), ..., cal(L)_(j_r)}$ of functions is
  linearly independent. Let us call this system a zeroth-step system of the
  family ${cal(L)_j}_(j in omega)$. Obviously, $q >= r$. Linearly independent
  systems of $r$ functions in $cal(L)_(j_1), ..., cal(L)_(j_(r + 1))$ that
  contain the function $cal(L)_(j_(r + 1))$ are called first-step systems, and
  so on. The $k$th-step systems are obtained by adjoining to each
  $(k - 1)$st-step system the function $cal(L)_(j_(r + k))$ and forming from
  them all possible systems of $r$ linearly independent functions that contain
  $cal(L)_(j_(r + k))$. The $(q - r)$th-step systems
  ${cal(L)_(alpha_1), ..., cal(L)_(alpha_r)}$ (the last step) are called
  #index-mark("System", sub: "canonical")_canonical systems_ of the family
  ${cal(L)_j}_(j in omega)$. The set of multi-indices
  $alpha = (alpha_1, ..., alpha_r)$ corresponding to the canonical systems is
  denoted by $J(omega)$. Note that $alpha_r = j_q$ for any $alpha in J(omega)$.
  The recursive method of construction of the canonical systems and
  Theorem~@th:yuzhakov-separation give us

  #lemma[
    Every function $f_omega in A(CC^n without union.big_(j in omega) E_j)$ can
    be represented as $sum_(alpha in J(omega)) f_alpha$, where
    $f_alpha in A(CC^n without (E_(alpha_1) union dots.c union E_(alpha_r)))$.
  ] <lem:canonical-decomposition>

  #proposition[
    If the rank of the matrix @eq:linear-matrix is equal to $r < n$, then the
    integral @eq:rational-integral over any cycle
    $gamma in Z_n (CC^n without union.big_1^N E_j)$ is equal to zero.
  ] <prop:degenerate-rank>

  #proof[
    Since $CC^n without union.big_1^N E_j$ is a domain of holomorphy,
    Theorem~@th:serre (Serre) implies that every $n$-dimensional cohomology
    class can be represented by a holomorphic form $f(z) d z$, where
    $f in A(CC^n without union.big_1^N E_j)$. By
    Lemmas~@lem:linear-decomposition and~@lem:canonical-decomposition, this form
    has a representation
    $
      f(z) d z = sum_(omega in Omega) sum_(alpha in J(omega)) f_alpha (z) d z,
    $
    where
    $f_alpha in A(CC^n without (E_(alpha_1) union dots.c union E_(alpha_r)))$.
    We make a linear substitution such that $E_(alpha_1), ..., E_(alpha_r)$ are
    the coordinate planes $zeta_1 = 0, ..., zeta_r = 0$, and then we expand
    $f_alpha$ in a Laurent series with respect to $zeta$. If $r < n$, this
    series does not contain negative powers of $zeta_(r + 1), ..., zeta_n$.
    Consequently, $f_alpha d z tilde.op 0$ (see Example~@st:monomial-duality).
    It remains to apply Corollary~@cor:exact-form-over-cycle of Stokes' formula.
  ]

  Suppose that the rank of the matrix @eq:linear-matrix is equal to $n$. Then
  for each multi-index $alpha = (alpha_1, ..., alpha_n) in J(omega)$ we
  construct the cycle
  $
    gamma_alpha = {z: |cal(L)_(alpha_1) (z)| = epsilon_1, ...,
      |cal(L)_(alpha_n) (z)| = epsilon_n},
  $
  #source(150)
  where $epsilon_1 < dots.c < epsilon_n$ are sufficiently small and are chosen
  in such a way that for $z in |gamma_alpha|$ and $j in omega$
  $
    sum_(k = 1)^(m - 1) |b_(j k)| epsilon_k < |b_(j m)| epsilon_m,
  $
  $b_(j 1), ..., b_(j n)$ being the coefficients of the expansion of $cal(L)_j$
  with respect to $cal(L)_(alpha_1), ..., cal(L)_(alpha_n)$:
  $cal(L)_j = sum_(k = 1)^n b_(j k) cal(L)_(alpha_k)$, with $b_(j m) != 0$ and
  $b_(j k) = 0$ for $k > m$. This implies that
  $|gamma_alpha| inter E_j = emptyset$. If $j in.not omega$, then
  $E_j inter |gamma_alpha| = emptyset$, because the $epsilon_j$ are sufficiently
  small. Thus, $gamma_alpha in Z_n (CC^n without union.big_1^N E_j)$.

  #theorem[
    If the rank of the matrix @eq:linear-matrix is $r = n$, then the cycles
    ${gamma_alpha}$ and the forms
    $
      phi_alpha = (d cal(L)_(alpha_1) and dots.c and d cal(L)_(alpha_n))
      / ((2 pi i)^n cal(L)_(alpha_1) dots.c cal(L)_(alpha_n)),
    $
    $alpha in J(omega)$, $omega in Omega$, make up dual (in the de Rham sense)
    bases for the $n$-dimensional homology and cohomology of the domain
    $CC^n without union.big_1^N E_j$.
  ] <th:linear-dual-bases>

  #proof[
    Obviously, $integral_(gamma_alpha) phi_alpha = 1$. We show that
    $integral_(gamma_alpha) phi_beta = 0$ for $beta != alpha$. To do this it
    suffices to show that the cycle $gamma_alpha$ is homologous to 0 in
    $CC^n without (E_(beta_1) union dots.c union E_(beta_n))$. If
    $alpha in J(omega_1)$ and $beta in J(omega_2)$, $omega_1 != omega_2$, then
    $beta_k in.not omega_1$ for some $k$. For any $beta_j in omega_1$ we have a
    representation $cal(L)_j = sum_(k = 1)^m b_(j k) cal(L)_(alpha_k)$,
    $b_(j m) != 0$, $1 <= m <= n$. Since it is false that $beta_j in omega_1$
    for all $j = 1, ..., n$, there is a $k$, $1 <= k <= m$, such that
    $m = m(beta_j) != k$ for $beta_j in omega_1$. Then
    $gamma_alpha = partial B$, where
    $
      B = {z: |cal(L)_(alpha_j) (z)| = epsilon_j, j = 1, ... [k] ..., n,
        |cal(L)_(alpha_k) (z)| <= epsilon_k},
    $ <eq:chain-b>
    and $|B| inter E_(beta_j) = emptyset$, $j = 1, ..., n$. Indeed,
    $
      |cal(L)_(beta_j)|
      = lr(|sum_(j = 1)^m b_j cal(L)_(alpha_j)|)
      >= |b_m| epsilon_m - sum_(i = 1)^(m - 1) |b_i| epsilon_i > 0
    $
    for $z in |B|$. If $beta_j in.not omega_1$, then
    $|B| inter E_(beta_j) = emptyset$, because $|B|$ lies in a sufficiently
    small neighborhood of the point $a = inter.big_(i in omega_1) E_i in CC^n$,
    and $cal(L)_(beta_j) (a) != 0$. Suppose now that $alpha, beta in J(omega)$,
    $omega in Omega$ and $alpha != beta$. For convenience of notation we set
    $omega = {1, ..., q}$, $alpha_n = beta_n = q$. Suppose that
    $alpha_j = beta_j$, $j = r + 1, ..., n$ and $alpha_r != beta_r$, $r < n$.
    Then there is at least one index $beta_j$, $j <= r$, such that
    $cal(L)_(beta_j)$ cannot be expressed linearly in terms of
    $cal(L)_(alpha_1), ..., cal(L)_(alpha_r)$. Otherwise the system
    $cal(L)_(beta_1), ..., cal(L)_(beta_r)$ can be obtained from the system
    $cal(L)_(alpha_1), ..., cal(L)_(alpha_r)$ by a nonsingular transformation,
    because these are linearly independent systems. Since
    $(cal(L)_(beta_1), ..., cal(L)_(beta_r))$ and
    $(cal(L)_(alpha_1), ..., cal(L)_(alpha_r))$ are encountered in canonical
    systems, they must be encountered in $(beta_r - n)$th-step systems and
    $(alpha_r - n)$th-step systems, respectively, and in systems of all
    subsequent steps. Suppose, for example, that $alpha_r < beta_r$ (the
    argument is similar for $beta_r < alpha_r$). Then at the
    $(alpha_r - n)$th-step instead of systems containing
    $(cal(L)_(beta_1), ..., cal(L)_(beta_r))$ there appear systems containing
    $(cal(L)_(beta_1), ... [j] ..., cal(L)_(beta_r), cal(L)_(alpha_r))$,
    $j = 1, ..., r$, i.e., in the $(alpha_r - m)$ subsequent steps there are no
    systems containing $(cal(L)_(beta_1), ..., cal(L)_(beta_r))$. This is a
    contradiction. Consequently, there is a $k$, $1 <= k <= r$, such that
    $m = m(j) != k$ in the expansions
    $cal(L)_j = sum_(i = 1)^m b_(j i) cal(L)_(alpha_i)$, with $b_(j m) != 0$ for
    $j = beta_1, ..., beta_n$. And then again $gamma_alpha = partial B$, where
    $B$ has the form @eq:chain-b and $|B| inter E_(beta_j) = emptyset$,
    $j = 1, ..., n$.

    From Lemmas~@lem:linear-decomposition and~@lem:canonical-decomposition it
    follows that the form $f d z$ is cohomologous to a linear combination of the
    forms ${phi_alpha}$ (see Example~@st:monomial-duality). Thus, by
    Proposition~@prop:dual-bases, the cycles ${gamma_alpha}$ and the forms
    ${phi_alpha}$ make up bases that are dual in the de Rham sense.
  ]

  The integrals @eq:rational-integral and @eq:rational-general-integral with
  respect to the basis cycles (the residues) can be computed by the method
  indicated in @pt:local-residue-computation.
]
