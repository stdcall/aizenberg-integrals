#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

#heading(level: 2)[Cohomological reduction of certain semimeromorphic and
  rational forms] <sec:cohomological-reduction>

#point <pt:reduction-problem> Theorem~@th:residue-class only proves the
existence of the residue class for a form $phi in Z^(p + 1) (X without S)$, and
does not give constructive algorithms for finding it. The situation with the
composite residue class is analogous. Theorem~@th:residue-form,
Example~@exm:simple-pole-residue in @sec:leray-residues, and
Lemma~@lem:repeated-residues enable us to find the residue class in the case of
semimeromorphic forms having first-order poles. Therefore, the problem of
determining the residue class of a form $phi in Z^(p + 1) (X without S)$
(respectively, the multiple residue class of a form
$phi in Z^(p + m) (X without (S_1 union dots.c union S_m))$) reduces to the
problem of determining a form cohomologous to it which has first-order poles on
$S$ (respectively, on $S_1, ..., S_m$), i.e., to the problem of cohomological
#source(128)
reduction of the form $phi$. It suffices to solve this problem in a neighborhood
of $S$ (respectively, $S_1 inter dots.c inter S_m$). In a number of cases the
problem of cohomological reduction can be solved constructively if $phi$ has
poles on $S$ (respectively, $S_1, ..., S_m$), i.e., is a semimeromorphic form.

#point <pt:lowering-pole-order> If the submanifold $S$ is given by a global
equation, then the following result enables us to realize a lowering of the
order of poles.

#lemma[
  Let $S = {z: z in V, s(z) = 0}$, where $V$ is a neighborhood of $S$, and
  $s in A(V)$, $grad s != 0$. Then every form $phi in Z^(p + 1) (X without S)$
  having a pole of order $k$ on $S$ can be represented as
  $
    phi = (d s) / s^k and psi + theta / s^(k - 1),
  $ <eq:lowering-pole-order>
  where $psi$ and $theta$ are regular forms in $V$.
] <lem:lowering-pole-order>

#proof[
  By the assumption, the form $s^k phi$ is regular in $V$. But, since $phi$ is a
  closed form, $d(s^k phi) = k s^(k - 1) d s and phi$. Multiplication of the
  last form by $d s$ carries it to zero. Consequently, by
  Lemma~@lem:division-of-forms, for any $a in S$ there is a form $theta_a$ that
  is regular in some neighborhood $U_a$ of $a$ and such that
  $s^(k - 1) d s and phi = d s and theta_a$. The form $s^k phi - s theta_a$ is
  regular in $U_a$, and $d s and (s^k phi - s theta_a) = 0$. By
  Lemma~@lem:division-of-forms, there exists a form $psi_a$ that is regular in
  $U_a$ and such that $s^k phi - s theta_a = d s and psi_a$, or
  $
    phi = (d s) / s^k and psi_a + theta_a / s^(k - 1).
  $ <eq:lowering-pole-order-local>
  In a neighborhood $U_a subset V without S$ of a point $a in V without S$ we
  represent $phi$ in the form @eq:lowering-pole-order-local, where $psi_a = 0$
  and $theta_a = phi s^(k - 1)$. We take a partition of unity ${chi_a}_(a in V)$
  subordinate to the covering ${U_a}_(a in V)$ and construct forms
  $psi = sum_(a in V) chi_a psi_a$ and $theta = sum_(a in V) chi_a theta_a$ that
  are regular in $V$. For these forms @eq:lowering-pole-order follows from
  @eq:lowering-pole-order-local.
]

The form @eq:lowering-pole-order can be transformed to the expression
$
  phi = d(-psi / ((k - 1) s^(k - 1))) + theta_1 / s^(k - 1),
$
where $theta_1 = d psi \/ (k - 1) + theta$. Thus, in $V without S$ the form
$phi$ is cohomologous to the form $theta_1 \/ s^(k - 1)$, which has a pole of
order $k - 1$ on $S$. By induction $phi$ can be cohomologically reduced in
$V without S$ to a form having a first-order pole on $S$.

#point <pt:gelfand-shilov> The #index-mark(
  "Construction",
  sub: "Gel'fand-Shilov",
)_Gel'fand-Shilov construction_ enables us to find the composite residue class
of certain semimeromorphic closed forms.

#source(129)
#theorem(title: [Gel'fand, Shilov and Leray])[
  Let $S_j = {z in X: s_j (z) = 0}$, $j = 1, ..., m$, be submanifolds in general
  position and given by global equations, and $omega(z)$ a regular form on $X$
  satisfying the condition
  $
    d s_1 (z) and dots.c and d s_m (z) and d omega(z) = 0
  $ <eq:gelfand-shilov-condition>
  in a neighborhood of $S = S_1 inter dots.c inter S_m$. Then there exist forms
  $omega_1, ..., omega_m$, $omega_11, ..., omega_(1 m)$, $omega_21, ...,
  omega_(j dots.c k)$ ($j, k = 1, ..., m$) that are regular in a neighborhood of
  $S$ and such that
  $
    & d omega = d s_1 and omega_1 + dots.c + d s_m and omega_m; \
    & d omega_1 = d s_1 and omega_11 + dots.c + d s_m and omega_(1 m); \
    & dots.c dots.c dots.c dots.c dots.c dots.c dots.c dots.c dots.c \
    & d omega_(p dots.c q) = d s_1 and omega_(p dots.c q, 1) + dots.c
      + d s_m and omega_(p dots.c q, m).
  $ <eq:gelfand-shilov-chain>
  Moreover,
  $
    1 / (r_1 ! dots.c r_m !) omega_(j dots.c k)|_S
    in Res[(d s_1 and dots.c and d s_m and omega)
      / (s_1^(r_1 + 1) dots.c s_m^(r_m + 1))],
  $ <eq:gelfand-shilov-residue>
  where $r_i$ is the number of indices $i$ ($i = 1, ..., m$) contained among
  $j, ..., k$.
] <th:gelfand-shilov-leray>

#lemma[
  If $phi$ is a regular form on $X$ and satisfies the condition
  $d s_1 and dots.c and d s_m and phi = 0$ in a neighborhood of
  $S = S_1 inter dots.c inter S_m$, then in this neighborhood there exist
  regular forms such that
  $
    phi(z) = d s_1 (z) and psi_1 (z) + dots.c + d s_m (z) and psi_m (z).
  $ <eq:division-by-several>
] <lem:division-by-several>

#proof[
  In a neighborhood $U_a$ of an arbitrary point $a in S$ we choose local
  coordinates $z_1, ..., z_n$ in such a way that $S_j inter U_a = {z: z_j = 0}$,
  $j = 1, ..., m$. Then in $U_a$ the form $phi$ can be represented as
  $
    phi(z) = psi_0 (a, z) + d z_1 and psi_1 (a, z) + dots.c
    + d z_m and psi_m (a, z),
  $ <eq:division-by-several-local>
  where $psi_0$ is a form that does not contain $d z_1, ..., d z_m$. By the
  assumption,
  $d z_1 and dots.c and d z_m and phi = d z_1 and dots.c and d z_m and psi_0
  = 0$, and so $psi_0 = 0$. Using a partition of unity subordinate to the
  covering ${U_a}_(a in S)$, we pass from the local representation
  @eq:division-by-several-local, where $psi_0 = 0$, to the global representation
  @eq:division-by-several in the neighborhood $V = union.big_(a in S) U_a$ of
  the submanifold $S$.
]

#proof(title: [Proof of Theorem~@th:gelfand-shilov-leray.])[
  Note that condition @eq:gelfand-shilov-condition gives us immediately that the
  form $d s_1 and dots.c and d s_m and omega \/ s_1^(r_1 + 1) dots.c
  s_m^(r_m + 1)$ is closed. From Lemma~@lem:division-by-several and condition
  @eq:gelfand-shilov-condition it follows that there are forms
  $omega_1, ..., omega_m$ such that the first of the equalities
  @eq:gelfand-shilov-chain holds. Differentiating it, we get that
  $
    d s_1 and d omega_1 + dots.c + d s_m and d omega_m = 0.
  $
  #source(130)
  Hence, $d s_1 and dots.c and d s_m and d omega_j = 0$. According to
  Lemma~@lem:division-by-several, there exist forms
  $omega_(j 1), ..., omega_(j m)$ such that
  $d omega_j = d s_1 and omega_(j 1) + dots.c + d s_m and omega_(j m)$, and so
  on. Thus, @eq:gelfand-shilov-chain is obtained successively.

  The relation @eq:gelfand-shilov-residue will be proved by induction on the
  number of indices $j dots.c k$, which is equal to $r_1 + dots.c + r_m$. For
  $r_1 = dots.c = r_m = 0$ we have (see @sec:leray-residues,
  @pt:composite-residues)
  $
    omega|_S = res^m [(d s_1 and dots.c and d s_m and omega)
      / (s_1 dots.c s_m)]
    in Res^m [(d s_1 and dots.c and d s_m and omega) / (s_1 dots.c s_m)].
  $
  Suppose that @eq:gelfand-shilov-residue holds for $r_1, ..., r_m$; we prove it
  for $r_1, ..., r_j + 1, ..., r_m$. Observing that
  $
    (d s_1 and dots.c and d s_m and omega)
    / (s_1^(r_1 + 1) dots.c s_j^(r_j + 2) dots.c s_m^(r_m + 1))
    & = (-1)^j / (r_j + 1)
    d((d s_1 and dots.c [j] dots.c and d s_m and omega)
      / (s_1^(r_1 + 1) dots.c s_j^(r_j + 1) dots.c s_m^(r_m + 1))) \
    & quad + (-1)^(m - j) / (r_j + 1)
    (d s_1 and dots.c [j] dots.c and d s_m and d omega)
    / (s_1^(r_1 + 1) dots.c s_j^(r_j + 1) dots.c s_m^(r_m + 1)) \
    & approx (d s_1 and dots.c and d s_m and omega_j)
    / ((r_j + 1) s_1^(r_1 + 1) dots.c s_j^(r_j + 1) dots.c s_m^(r_m + 1)),
  $
  we get by the induction hypothesis that
  $
    Res[(d s_1 and dots.c and d s_m and omega)
      / (s_1^(r_1 + 1) dots.c s_j^(r_j + 2) dots.c s_m^(r_m + 1))]
    & = 1 / (r_j + 1)
    Res[(d s_1 and dots.c and d s_m and omega_j)
      / (s_1^(r_1 + 1) dots.c s_j^(r_j + 1) dots.c s_m^(r_m + 1))] \
    & = 1 / (r_1 ! dots.c (r_j + 1)! dots.c r_m !)
    omega_(j p dots.c q)|_S,
  $
  where the indices $1, ..., j, ..., m$ are encountered
  $r_1, ..., r_j + 1, ..., r_m$ times, respectively, among the indices
  $j p dots.c q$.#footnote[The partial derivative apparatus worked out by Leray
    and Norguet for exterior differential forms provides an equivalent method;
    see @bib:Leray1959 (§§7, 46 and 47) and @bib:Norguet1959a.]
]

#eg[
  If $X = CC^n$, $m = n$, $S_j = {z: z_j = 0}$, and
  $omega(z) = f(z) in A(CC^n)$, then
  $
    omega_(p dots.c q) = (partial^(r_1 + dots.c + r_n) f(z))
    / (partial z_1^(r_1) dots.c partial z_m^(r_m)).
  $
] <exm:coordinate-poles>

The devices given above for lowering the order of the poles of a closed
semimeromorphic form are not completely constructive, since the determination of
the representations @eq:lowering-pole-order and @eq:division-by-several is based
on a partition of unity.

#source(131)
#point <pt:rational-reduction> For rational forms in $CC^n$ the problem of
cohomological reduction by an analogous scheme can be solved with the use of the
Hilbert Nullstellensatz.

#theorem(title: [Leĭnartas and Yuzhakov])[
  Let $Q_1 (z), ..., Q_m (z)$ be irreducible polynomials in $CC^n$, and let
  $S_j = {z in CC^n: Q_j (z) = 0}$, $j = 1, ..., m$, be manifolds in general
  position. Then the form
  $
    omega = (P(z) d z) / (Q_1^(r_1) dots.c Q_m^(r_m)),
  $ <eq:rational-form>
  where $P$ is a polynomial (entire function) and
  $d z = d z_1 and dots.c and d z_n$, is cohomologous in
  $CC^n without (S_1 union dots.c union S_m)$ to a form
  $
    omega^* = sum_(cal(J)) (P_(cal(J)) d z) / (Q_(j_1) dots.c Q_(j_k)),
  $ <eq:reduced-rational-form>
  where $cal(J) = {j_1, ..., j_k} subset {1, ..., m}$, $k <= n$, and the
  $P_(cal(J))$ are polynomials (entire functions).
] <th:leinartas-yuzhakov>

#proof[
  A. Suppose that $m <= n$. Since $S_1, ..., S_m$ are in general position, the
  matrix $norm(partial Q_j \/ partial z_k)_(j = 1, ..., m; k = 1, ..., n)$ has
  rank $m$ at points in $S_1 inter dots.c inter S_m$. Consequently, the
  polynomials $Q_1, ..., Q_m$ and
  $partial(Q_1, ..., Q_m) \/ partial(z_(j_1), ..., z_(j_m))$,
  $1 <= j_1 < dots.c < j_m <= n$, do not have common zeros in $CC^n$. By the
  Hilbert Nullstellensatz (see @bib:VanDerWaerden1940, Chapter~XI, §79), there
  exist polynomials $H_j$ and $H_(cal(J))$, $cal(J) = {j_1, ..., j_m}$, such
  that
  $
    1 equiv sum_(j = 1)^m H_j Q_j + sum_(cal(J)) H_(cal(J))
    (partial(Q_1, ..., Q_m)) / (partial(z_(j_1), ..., z_(j_m))).
  $ <eq:nullstellensatz-identity>
  Substituting @eq:nullstellensatz-identity into @eq:rational-form, we get
  $
    omega & = sum_(j = 1)^m (P_j d z)
            / (Q_1^(r_1) dots.c Q_j^(r_j - 1) dots.c Q_m^(r_m)) \
          & quad + sum_(cal(J)) ((-1)^(epsilon[cal(J)]) P_(cal(J))
            d Q_1 and dots.c and d Q_m and d z[cal(J)])
            / (Q_1^(r_1) dots.c Q_m^(r_m)),
  $ <eq:rational-form-split>
  where $P_j = H_j dot.c P$, $P_(cal(J)) = H_(cal(J)) dot.c P$,
  $d z[cal(J)] = d z_1 and dots.c [j_1, ..., j_m] dots.c and d z_n$, and
  $epsilon[cal(J)]$ is the parity of the permutation
  $(j_1, ..., j_m, 1, ... [j_1, ..., j_m] ..., n)$ of
  #source(132)
  $(1, ..., n)$. If at least one exponent $r_j$ is greater than 1, then it can
  be shown just as in @pt:gelfand-shilov that
  $
    & (P_(cal(J)) d Q_1 and dots.c and d Q_m and d z[cal(J)])
      / (Q_1^(r_1) dots.c Q_m^(r_m)) \
    & quad approx ((-1)^(j - 1) d P_(cal(J)) and d Q_1 and dots.c [j] dots.c
      and d Q_m and d z[cal(J)])
      / ((r_j - 1) Q_1^(r_1) dots.c Q_j^(r_j - 1) dots.c Q_m^(r_m)).
  $ <eq:lowering-degree>
  If we successively lower the degrees of the denominators in this way, we
  arrive at a form like @eq:reduced-rational-form in finitely many steps.

  B. If $m > n$, then the assumption of general position implies that
  $S_1 inter dots.c inter S_m = emptyset$, i.e., the polynomials
  $Q_1^(r_1), ..., Q_m^(r_m)$ do not have common zeros in $CC^n$. By the Hilbert
  theorem, there then exist polynomials $H_1 (z), ..., H_m (z)$ such that
  $
    1 equiv H_1 (z) Q_1^(r_1) (z) + dots.c + H_m (z) Q_m^(r_m) (z).
  $
  Substituting this into @eq:rational-form, we represent @eq:rational-form as
  $
    omega = sum_(j = 1)^m (P_j d z) / (Q_1^(r_1) dots.c [j] dots.c Q_m^(r_m)),
  $
  where $P_j = H_j dot.c P$. Applying this device $m - n$ times, we come to case
  A.
]

#remark[
  Since the Hilbert theorem has a constructive proof, the polynomials $H_j$,
  $H_(cal(J))$, and, consequently, the form @eq:reduced-rational-form can be
  determined effectively. In essence, part B presents a device for expanding
  rational functions in partial fractions. In the general case this problem is
  solved by
]

#theorem(title: [Leĭnartas])[
  Every rational function of $n$ variables can be represented as a sum of
  fractions whose denominators contain at most $n$ irreducible factors each.
] <th:leinartas>

#eg[
  In $CC^2$ consider the form
  $
    omega = d w and d z \/ w^3 (w z - 1)(w^2 + z^2 - 1)^2.
  $
  Taking into account that $1 equiv w z - 1(w z - 1)$, we apply the arguments in
  B successively. This gives us
  $
    omega = & (z^3 d w and d z) / ((w z - 1)(w^2 + z^2 - 1)^2)
              - (d w and d z) / (w^3 (w^2 + z^2 - 1)^2) \
            & - (z d w and d z) / (w^2 (w^2 + z^2 - 1)^2)
              - (z^2 d w and d z) / (w (w^2 + z^2 - 1)^2).
  $
  #source(133)
  Using the identities
  $
    1 & equiv w dot.c w - 1 dot.c (w^2 + z^2 - 1) + z / 2 dot.c 2 z, \
    1 & equiv -4 / 3 (1 + w z)(w z - 1)
        + 1 / 3 (w^2 + z^2 + 1)(w^2 + z^2 - 1) \
      & quad + 1 / 6 (w^2 - z^2)(2 z^2 - 2 w^2),
  $
  where
  $
    2 z = (partial(w, w^2 + z^2 - 1)) / (partial(w, z)), wide
    2 z^2 - 2 w^2 = (partial(w z - 1, w^2 + z^2 - 1)) / (partial(w, z)),
  $
  along with @eq:lowering-degree, we find that
  $
    omega approx (d w and d z) / (4 w (w^2 + z^2 - 1))
    + ((5 z^3 - 6 z^5) d w and d z) / (6 (w z - 1)(w^2 + z^2 - 1)).
  $
] <exm:circle-form>

Theorem~@th:leinartas-yuzhakov can be generalized to meromorphic forms in
domains of holomorphy.

#theorem[
  Suppose that $P$ and $Q_1, ..., Q_m$ are holomorphic functions in the domain
  of holomorphy $D subset CC^n$, and that $S_j = {z in D: Q_j (z) = 0}$,
  $j = 1, ..., m$, are manifolds in general position. Then a form like
  @eq:rational-form is cohomologous in $D without (S_1 union dots.c union S_m)$
  to a form like @eq:reduced-rational-form with $P_(cal(J)) in A(D)$.
] <th:holomorphy-domain-reduction>

#proof(title: none)[
  The proof is similar to that of Theorem~@th:leinartas-yuzhakov, except that
  instead of the Hilbert Nullstellensatz we use the following assertion (see
  @bib:Shabat1976b, p.~296): if the functions $Q_1, ..., Q_m$ are holomorphic in
  a domain of holomorphy $D subset CC^n$ and do not have common zeros in $D$,
  then there exist functions $P_1, ..., P_m$ holomorphic in $D$ such that
  $1 equiv P_1 Q_1 + dots.c + P_m Q_m$.
]

In complex projective space $C P^n$ we have

#theorem(title: [Griffiths])[
  Let $Q(z)$ be an irreducible polynomial in $z = (z_1, ..., z_n)$, and let
  $S = {z in C P^n: Q(z) = 0}$ be a manifold. Then it is possible to
  cohomologically reduce any form $omega$ rational in $C P^n without S$ to a
  rational form like $omega_1 = P d z \/ Q^k$, where $k <= n - E(n \/ q)$,
  $q = deg Q$, $E(a)$ being the integer part of $a$.
] <th:griffiths-reduction>
