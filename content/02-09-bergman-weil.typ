#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== The Bergman-Weil formula <sec:bergman-weil>

#source(79)
Suppose that the functions $chi_1 (z), ..., chi_N (z)$, $N >= n$, are
holomorphic in the domain $D subset CC^n$, and that the planar domains
$D_1, ..., D_N$ are such that $D_i subset chi_i (D)$, $i = 1, ..., N$. The set
$Delta = {z: z in D, chi_i (z) in D_i, i = 1, ..., N}$ is called an #index-mark(
  "Polyhedron",
  sub: "analytic",
)_analytic polyhedron_. A connected component of an analytic polyhedron is
called a #index-mark(
  "Polyhedron",
  sub: "Weil",
)_Weil polyhedron_ if the boundaries $partial D_i$ are piecewise smooth and the
intersection of $k$ of the faces
$gamma_i = {z: z in D, chi_i in partial D_i, chi_j in D_j, i != j}$ has
dimension at most $2n - k$ (so that the faces intersect in general position).
Let $gamma_(i_1 dots.c i_n) = inter.big_(k = 1)^n gamma_(i_k)$. We give these
$n$-dimensional edges the natural orientation determined by the order of the
faces $gamma_(i_1), ..., gamma_(i_n)$. The union of all such $n$-dimensional
edges is called the #index-mark(
  "Skeleton",
  sub: "of an analytic polyhedron",
)_skeleton_ of the polyhedron $Delta$ and denoted by $sigma$.

By Hefer's Theorem~@th:oka-hefer,
$
  chi_i (zeta) - chi_i (z) = sum_(j = 1)^n q_(i j) (zeta_j - z_j), quad
  i = 1, ..., N.
$
Let $Omega_(i_1 dots.c i_n)$ denote the determinant $det ||q_(i j)||$,
$i = i_1, ..., i_n$, $j = 1, ..., n$.

#theorem(title: [Weil])[
  Let $Delta$ be a Weil polyhedron, and let $f in A_C (Delta)$. Then for
  $z in Delta$
  $
    f(z) = 1 / (2 pi i)^n sum_(i_1 < dots.c < i_n)
    integral_(gamma_(i_1 dots.c i_n))
    (f(zeta) Omega_(i_1 dots.c i_n) (zeta, z) d zeta)
    / (product_(k = 1)^n [chi_(i_k) (zeta) - chi_(i_k) (z)]) .
  $ <eq:bergman-weil>
] <th:weil>

This is called the #index-mark(
  "Representation",
  sub: "integral",
  subsub: "Bergman-Weil",
)_Bergman-Weil integral representation_. It generalizes the Cauchy integral
formula for polycylinder domains and becomes that formula when $N = n$ and
$chi_i = z_i$, $i = 1, ..., n$. Formula @eq:bergman-weil recovers the value of
the holomorphic function $f$ in $Delta$ from its values on the $n$-dimensional
skeleton $sigma$ and has a kernel that is holomorphic in $z$; moreover, the form
of the kernel depends on the shape of the domain.

On the whole, the proof repeats that of Theorem~@th:cauchy-formula. On each face
$gamma_i$ we consider the vector-valued function
$
  u^i = (u_1^i, ..., u_n^i), quad "where" u_k^i
  = q_(i k) [sum_(j = 1)^n q_(i j) (zeta_j - z_j)]^(-1),
$
#source(80)
and over each edge $gamma_(i_1 dots.c i_n)$ we consider the set
$beta_(i_1 dots.c i_n) = {(zeta, u): zeta in gamma_(i_1 dots.c i_n),
  u = sum_1^n lambda_l u^(i_l), lambda_l >= 0, sum_1^n lambda_l = 1}$. As in the
proof of Theorem~@th:cauchy-formula, it is established that
$
  f(z) & = ((n - 1)!) / (2 pi i)^n sum_(i_1 < dots.c < i_n)
         integral_(beta_(i_1 dots.c i_n)) f(zeta)
         sum_(k = 1)^n (-1)^(k - 1) u_k d u_([k]) and d zeta \
       & = ((n - 1)!) / (2 pi i)^n sum_(i_1 < dots.c < i_n)
         integral_(gamma_(i_1 dots.c i_n))
         (f(zeta) Omega_(i_1 dots.c i_n) (zeta, z) d zeta)
         / (product_(k = 1)^n [chi_(i_k) (zeta) - chi_(i_k) (z)]) \
       & quad times integral_(lambda_1 + dots.c + lambda_n = 1 \ lambda_l >= 0)
         sum_(k = 1)^n (-1)^(k - 1) lambda_k d lambda_([k]) \
       & = 1 / (2 pi i)^n sum_(i_1 < dots.c < i_n)
         integral_(gamma_(i_1 dots.c i_n))
         (f(zeta) Omega_(i_1 dots.c i_n) (zeta, z) d zeta)
         / (product_(k = 1)^n [chi_(i_k) (zeta) - chi_(i_k) (z)]) .
$
#ends-with-square[For simplicity we perform the calculations for $n = 2$:
  $
    & integral_(beta_(i_1 i_2)) f(zeta) (u_1 d u_2 - u_2 d u_1) and d zeta \
    & = integral_1^0 d lambda_1 integral_(gamma_(i_1 i_2)) f(zeta)
      [(lambda_1 u_1^(i_1) + (1 - lambda_1) u_1^(i_2))
      (u_2^(i_1) - u_2^(i_2)) \
    & quad - (lambda_1 u_2^(i_1) + (1 - lambda_1) u_2^(i_2))
      (u_1^(i_1) - u_1^(i_2))] d zeta \
    & = integral_1^0 d lambda integral_(gamma_(i_1 i_2)) f(zeta)
      (-u_1^(i_1) u_2^(i_2) + u_1^(i_2) u_2^(i_1)) d zeta
      = integral_(gamma_(i_1 i_2))
      (f(zeta) Omega_(i_1 i_2) (zeta, z) d zeta)
      / (product_(k = 1)^2 (chi_(i_k) (zeta) - chi_(i_k) (z))) .
  $
]
