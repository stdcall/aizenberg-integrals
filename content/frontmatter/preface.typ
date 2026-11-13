#import "../main-defs.typ": *
#import "../symbols.typ": *

#heading(numbering: none)[Preface] <front:preface>

#source(11)
Integral representations and the theory of residues occupy an important place in
multidimensional complex analysis. At the present time these areas are
continuing to develop intensively and are finding ever newer applications in
function theory itself and in other areas of mathematics, as well as in
theoretical physics. For example, the Khenkin-Ramírez de Arellano integral
representation for functions holomorphic in strictly pseudoconvex domains has
led to a number of important results in the theory of holomorphic functions of
several complex variables.

We mention also a certain "nonsymmetry" in the integral representations of
holomorphic functions of several complex variables that existed before 1967:
functions were represented by integration of exterior differential forms. This
"nonsymmetry" was removed by the Martinelli-Bochner-Koppelman formula (forms are
represented by integration of forms), which has found many serious applications
in multidimensional complex analysis. In particular, Khenkin used this formula
to get an integral representation for a solution of the $dbar$-problem in
strictly convex domains, and this led to a new proof of the main theorems of Oka
without the use of sheaf theory or the theory of differential operators.

There recently appeared a Leray-Koppelman integral formula of very general form
that includes both all possible integral representations of holomorphic
functions and formulas for the multidimensional logarithmic residue (see
@sec:leray-koppelman). Therefore, Chapter~@ch:integral-representations contains
both integral representations of general form and formulas for the logarithmic
residue. We remark that integral representations and residues are closely
connected, since they are based on Stokes' formula.

The theory of multidimensional residues, whose beginning goes back to Poincaré,
has developed in various directions and presently is far from complete. In
generalizing the theory of residues to the multidimensional case there arise
serious difficulties of a topological nature, since for holomorphic functions of
several complex variables the role of isolated singular points is played by
analytic sets, which can have a complicated topological structure. To
#source(12)
overcome these difficulties it is necessary to resort to the tools of algebraic
topology.

Multidimensional residues, besides having well-known applications in the
investigation of Feynman integrals by homological methods and the investigation
of fundamental solutions of hyperbolic partial differential equations (Leray),
have recently been applied to implicit functions, systems of nonlinear
equations, and combinatorial analysis. These new applications have not yet been
reflected in the existing texts of function theory. Moreover, in these texts
integral representations and residues of functions of several complex variables
are not presented in a sufficiently complete manner. The present book is
intended to fill this gap. It arose from special courses taught by the authors
at Krasnoyarsk University in 1965–1974 (see @bib:Aizenberg1975b and
@bib:Yuzhakov1975c).

As already mentioned, Chapter~@ch:integral-representations contains integral
representations of holomorphic functions of several complex variables and
formulas for the multidimensional logarithmic residue, presented here from a
unified point of view.

In @sec:rouche-principle we define the multiplicity of a zero of a holomorphic
mapping and prove the main theorems on zeros of holomorphic mappings, using only
the properties of integrals of closed forms and not using results in the local
theory of analytic sets. In particular, a compact set of zeros of a holomorphic
mapping is proved to be discrete. The theorem of Osgood asserting that a
one-to-one holomorphic mapping is biholomorphic is obtained as a corollary in
@sec:cauchy-formula.

Moreover, in Chapter~@ch:integral-representations we present the
Andreotti-Norguet integral representation for the derivatives of a holomorphic
function (@sec:andreotti-norguet) and the Martinelli-Bochner-Koppelman integral
representation for exterior differential forms
(@sec:martinelli-bochner-koppelman).

Chapter~@ch:special-form deals with a special form of integral representations
derived from Leray's formula. The most important of them are the Bergman-Weil
formula (@sec:bergman-weil) for functions holomorphic in analytic polyhedra and
the Khenkin-Ramírez de Arellano formula (@sec:strictly-pseudoconvex) for
functions holomorphic in strictly pseudoconvex domains. @sec:schwarz-kernel
stands somewhat isolated; there we consider an integral representation for
holomorphic functions with nonnegative real part (a generalization of the
classical Riesz-Herglotz formula).

In this book integral representations are considered only for bounded domains, a
reflection of the personal preferences of the authors (see, for example,
@bib:Vladimirov1969–@bib:Vladimirov1977, @bib:Gindikin1962–@bib:Gindikin1965,
@bib:Yarmukhamedov1974 and @bib:Bochner1944 about integral representations in
unbounded domains).

The theory of multidimensional residues is presented in Chapter~@ch:residues. We
formulate the problem of this theory (@sec:statement) and indicate some ways of
solving it that follow from Stokes' formula, the Cauchy-Poincaré integral
theorem, the
#source(13)
Alexander-Pontryagin topological duality (@sec:alexander-pontryagin), and the de
Rham duality (@sec:de-rham). Then (@sec:leray-residues[§§16] and
@sec:cohomological-reduction[17]) we give the main results in the theory of
residues on a complex analytic manifold (the Leray theory of residues). The
chapter concludes with an application of the Alexander-Pontryagin duality and
the de Rham duality to the computation of residues of meromorphic and rational
forms (@sec:two-variables[§§18] and @sec:local-residues[19]).

This book does not reflect results on extension of the Leray theory of residues
to forms having singularities on submanifolds of codimension greater than 1, nor
residues of currents, nor the abstract theory of residues which studies dual
homomorphisms of the homology and cohomology groups of a closed subset and its
complement in a manifold, nor Grothendieck residues, nor Dolbeault residues of
semimeromorphic forms.

Chapter~@ch:applications deals with so-called "external" applications (found
during the last few years mainly by Krasnoyarsk mathematicians) of various
formulas for the multidimensional logarithmic residue and simply for residues.

In @sec:implicit-functions we consider applications of the multiple logarithmic
residue for representing implicit functions of several variables determined by
systems of equations, in particular, for inverting a holomorphic mapping in the
form of a multiple power series or a function series (multidimensional analogues
of the Lagrange expansion and the Bürmann-Lagrange expansion), with estimates
given of the domain of convergence for these series. We consider some cases in
which single-valued branches of multi-valued implicit functions are determined,
and obtain effective formulas for the coefficients of a Weierstrass
pseudopolynomial.

In @sec:nonlinear-systems the formulas for the multiple logarithmic residue are
applied to systems of nonlinear equations, in particular, to the solution of the
problem of eliminating unknowns in systems of algebraic equations. We obtain
multidimensional analogues of the Waring formula which expresses power sums of
the roots of equations in terms of their coefficients.

The multiplicity of a zero of a system of holomorphic functions is determined
from the Taylor expansions of these functions in @sec:multiplicity. Here the
main tool of the investigation is again the theory of multiple residues.

In @sec:generating-functions multidimensional residues are used to find
generating functions and to compute various combinatorial sums in closed form.

Chapter~@ch:multidimensional-analysis contains some "internal" applications,
mainly of integral representations to problems in multidimensional function
theory. There are discussions of holomorphic extension from the boundary of a
domain to the whole domain and of expansion of holomorphic functions in series
of polynomials or "partial fractions" (@sec:hartogs-bochner). In
@sec:dbar-problem we prove the main theorems of Oka without using sheaf theory
or the theory of differential operators. The text in this
#source(14)
section was written by Sh.~A.~Dautov on the basis of an unpublished manuscript
which G.~M.~Khenkin kindly made available to the authors. In general, Khenkin's
ideas had a large influence on the contents of
Chapters~@ch:integral-representations, @ch:special-form, and
@ch:multidimensional-analysis. @sec:orthogonal-forms contains information about
the description of forms orthogonal to holomorphic functions when integrated
over the boundary of a domain, about the general form of formulas for integral
representation of holomorphic functions and for the logarithmic residue, and
about the solvability of the Lewy equation. @sec:algebraic-singularities deals
with bases in spaces of holomorphic functions with fixed algebraic
singularities.

The limited space in the book did not permit the authors to present many other
applications of integral representations and residues. Here we should mention
first of all the work of Leray on differential equations, as well as the
applications of residues to the investigation of Feynman integrals. A number of
other references are mentioned in the section @back:notes[_Brief historical
notes_].

We note that @sec:martinelli-bochner[§§1], @sec:leray-koppelman[3],
@sec:andreotti-norguet[5]–@sec:schwarz-kernel[12], @sec:nonlinear-systems[21],
and @sec:hartogs-bochner[24] were written by L.~A.~Aĭzenberg,
@sec:rouche-principle[§§2], @sec:cauchy-formula[4],
@sec:statement[13]–@sec:implicit-functions[20], @sec:generating-functions[23],
and @sec:algebraic-singularities[27] by A.~P.~Yuzhakov, @sec:dbar-problem[§§25]
and @sec:orthogonal-forms[26] by Sh.~A.~Dautov, and @sec:multiplicity by
A.~K.~Tsikh. The authors thank G.~M.~Khenkin and the editor, Sh.~A.~Dautov, for
numerous useful improvements and changes in the text.

Furthermore, the authors use this opportunity to thank V.~A.~Bolotov,
A.~M.~Kytmanov, E.~S.~Mkrtchyan, M.~A.~Mkrtchyan, V.~A.~Stepanenko, and
A.~K.~Tsikh for help in preparing the manuscript for printing.

#signature[_The authors_]
