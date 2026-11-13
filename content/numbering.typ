// Numbering of the book: chapters I-V; sections §1-§27 numbered through
// the whole book (the Preliminaries are §0 for this purpose: Corollary 0.4,
// formula (0.1)); the numbered points 1°, 2°, ... of a section. Theorems,
// lemmas, corollaries and propositions form one series per section,
// "Lemma 1.3"; a parallel series per section numbers the formulas, "(1.4)".
// References never carry the chapter: section numbers are unique.

#let roman(n) = numbering("I", n)

// The heading counter is (chapter, section). A chapter heading would restart
// the sections at 1; `book-style.typ` sets the section part back to the last
// section number after each chapter heading, so that sections are numbered
// through the book.
#let heading-number(..n) = {
  let parts = n.pos()
  if parts.len() == 1 { roman(parts.first()) } else {
    "§" + str(parts.at(1)) + "."
  }
}

// The section of a location, 0 in the Preliminaries and before them.
#let section-at(loc) = {
  let n = counter(heading).at(loc)
  n.at(1, default: 0)
}

// "1.3": the section and the number of a statement or a formula.
#let local-number(loc, n) = str(section-at(loc)) + "." + str(n)
