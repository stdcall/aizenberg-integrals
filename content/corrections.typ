#import "symbols.typ"

#set document(
  title: "Integral Representations and Residues. Corrections",
  date: none,
)
#set page(width: 6in, height: 9in, margin: 20mm, numbering: "1")
#set text(
  font: ("TeX Gyre Termes", "Liberation Serif"),
  size: 10.5pt,
  lang: "en",
  region: "us",
)
#show math.equation: set text(font: "TeX Gyre Termes Math")
// Matrices and cases in a line of an entry are set full size, as in the book.
#show math.mat: math.display
#show math.cases: math.display
// A formula opening with f keeps the word space before it, as in the book.
#let first-text(c) = {
  if c.has("text") {
    if type(c.text) == str { c.text } else { first-text(c.text) }
  } else if c.has("children") {
    let children = c.children.filter(x => x != [ ])
    if children.len() > 0 { first-text(children.first()) } else { "" }
  } else if c.has("base") { first-text(c.base) } else if c.has("body") {
    first-text(c.body)
  } else { "" }
}
#show math.equation.where(block: false): it => {
  if first-text(it.body).starts-with("f") { h(0.1em) + it } else { it }
}
// A formula taller or deeper than the line (a stacked fraction, limits, a
// matrix) takes the room it needs, so that it does not touch the lines
// around it; ordinary formulas keep the line.
#show math.equation.where(block: false): it => context {
  let ascent = measure(text(top-edge: "bounds", bottom-edge: "baseline", it))
  let full = measure(text(top-edge: "bounds", bottom-edge: "bounds", it))
  if (
    ascent.height > 1em.to-absolute()
      or full.height - ascent.height > 0.3em.to-absolute()
  ) {
    set text(top-edge: "bounds", bottom-edge: "bounds")
    it
  } else { it }
}
// The notation of the book, for the formulas of the entries.
#let operators = dictionary(symbols)

= Corrections

_Integral Representations and Residues in Multidimensional Complex Analysis_ \
L. A. Aĭzenberg and A. P. Yuzhakov

Pages and places are those of the 1983 edition.

#for item in json("../corrections.json").entries {
  metadata((correction: item.id))
  // The entries stand further apart than the lines inside an entry.
  block(above: 1.8em, breakable: false)[
    #set par(spacing: 0.7em)
    *#eval(item.place, mode: "markup", scope: operators)* ·
    p.~#item.printed_page

    *Printed* #eval(item.original, mode: "markup", scope: operators)

    *Corrected* #eval(item.corrected, mode: "markup", scope: operators)

    #emph(eval(item.reason, mode: "markup", scope: operators))
  ]
}
