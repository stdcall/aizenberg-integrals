#set document(
  title: (
    "Integral Representations and Residues in Multidimensional Complex "
      + "Analysis"
  ),
  author: ("L. A. Aizenberg", "A. P. Yuzhakov"),
  date: none,
)
#import "frontmatter/cover.typ": cover
#import "book-style.typ": blank-page, book-style, contents-style, recto-break

#cover()

#show: book-style

// Front matter: i half-title, ii blank, iii title, iv copyright page,
// v-vi Contents, vii-x Preface.
#set page(numbering: "i")
#counter(page).update(1)
#[
  #set page(header: none)
  #include "frontmatter/half-title.typ"
  #blank-page()
  #include "frontmatter/title.typ"
  #pagebreak()
  #include "frontmatter/publication.typ"
  #pagebreak()
]
#[
  #show: contents-style
  #heading(numbering: none, outlined: false, bookmarked: true)[Table of
    Contents]
  <front:contents>
  #outline(title: none, depth: 2)
]
#recto-break()
#include "frontmatter/preface.typ"

#recto-break()
#set page(numbering: "1")
#counter(page).update(1)
#include "00-preliminaries.typ"
#recto-break()
#include "01-00-integral-representations.typ"
#include "01-01-martinelli-bochner.typ"
#include "01-02-rouche-principle.typ"
#include "01-03-leray-koppelman.typ"
#include "01-04-cauchy-formula.typ"
#include "01-05-andreotti-norguet.typ"
#include "01-06-kernels.typ"
#include "01-07-martinelli-bochner-koppelman.typ"
#recto-break()
#include "02-00-special-form.typ"
#include "02-08-leray-modifications.typ"
#include "02-09-bergman-weil.typ"
#include "02-10-strictly-pseudoconvex.typ"
#include "02-11-n-circular.typ"
#include "02-12-schwarz-kernel.typ"
#recto-break()
#include "03-00-residues.typ"
#include "03-13-statement.typ"
#include "03-14-alexander-pontryagin.typ"
#include "03-15-de-rham.typ"
#include "03-16-leray-residues.typ"
#include "03-17-cohomological-reduction.typ"
#include "03-18-two-variables.typ"
#include "03-19-local-residues.typ"
#recto-break()
#include "04-00-applications.typ"
#include "04-20-implicit-functions.typ"
#include "04-21-nonlinear-systems.typ"
#include "04-22-multiplicity.typ"
#include "04-23-generating-functions.typ"
#recto-break()
#include "05-00-multidimensional-analysis.typ"
#include "05-24-hartogs-bochner.typ"
#include "05-25-dbar-problem.typ"
#include "05-26-orthogonal-forms.typ"
#include "05-27-algebraic-singularities.typ"
#recto-break()
#include "70-historical-notes.typ"
#recto-break()
#include "80-bibliography.typ"
#recto-break()
#include "90-index.typ"
#recto-break()
#include "95-notation.typ"
