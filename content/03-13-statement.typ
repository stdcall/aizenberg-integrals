#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *

== Statement of the problem <sec:statement>

#source(107)
One of the main problems in the theory of multidimensional residues is the
problem of studying and computing integrals (periods) of closed differential
forms on a complex analytic manifold that have singularities on analytic subsets
of this manifold when the integrals are over cycles disjoint from the singular
sets.

An important case of such integrals involves integrals of holomorphic functions
of $n$ complex variables over $n$-dimensional cycles (closed $n$-dimensional
surfaces) located in the domain where these functions are holomorphic. Here an
$n$-fold integral of a holomorphic function $f$ of the complex variables
$z = (z_1, ..., z_n)$ can be regarded as an integral of the closed holomorphic
form $f(z) d z = f(z_1, ..., z_n) d z_1 and dots.c and d z_n$.

There is a more abstract approach to the theory of residues which studies the
duality of homomorphisms of the homology and cohomology groups of a complex
analytic manifold, and of the groups of the analytic subsets of it and their
complements (see @bib:Norguet1959a, @bib:Kantor1971, and other references).

Stokes' formula and the Cauchy-Poincaré integral theorem enable us to replace
the integral of a closed form over a cycle by the integral of a simpler form
cohomologous to the given one over a simpler cycle homologous to the original
one. Directly from Corollary~@cor:cohomologous-forms-over-cycles we have

#proposition[
  Let $omega$ be a closed form of degree $q$ on a manifold $X$, and suppose that
  it has singularities on a set $T$ and that ${gamma_j}$ is a basis for the
  $q$-dimensional homology of the manifold $X without T$. Then for any cycle
  $gamma in Z_q (X without T)$
  $
    integral_gamma omega = sum_j k_j integral_(gamma_j) omega,
  $ <eq:period-expansion>
  #source(108)
  where the $k_j$ are the expansion coefficients of the cycle $gamma$ in the
  basis
  $
    {gamma_j}: gamma approx sum k_j gamma_j.
  $
] <prop:period-expansion>

Thus, the problem of computing the integral of a closed form over a cycle
reduces to:
#enum(numbering: "1)")[
  the study of the corresponding homology group of the complement $X without T$
  of the singular set $T$ (the determination of its dimension and the
  construction of a homology basis);
][
  the computation of the integrals of the form over the basis cycles; and
][
  the determination of the expansion coefficients of the cycle of integration in
  the basis.
]
#new-par
The solution of problems 1) and 3) in the multidimensional case (unlike in the
case of a single complex variable, where they can be solved trivially by
intuitive geometric arguments) involves significant topological difficulties. In
some cases the solution of these problems is essentially facilitated by using
the Alexander-Pontryagin duality (see @sec:alexander-pontryagin[§§14] and
@sec:two-variables[18]) or the de Rham duality (@sec:de-rham[§§15] and
@sec:local-residues[19]). Problem 2) cannot always be solved completely;
sometimes it is possible only to reduce the dimension of the integral (see
@sec:leray-residues[§§16] and @sec:two-variables[18]). It is often possible to
replace the cycle of integration directly (without determining a homology basis)
by another cycle over which the integral can be computed or at least simplified.
An important means of reducing integrals to a simpler form is to lower the order
of the poles of the integrand form: cohomological reduction of periods
(@sec:cohomological-reduction).
