#import "main-defs.typ": index-destination, index-page, index-room

// The Index of Notation as printed (p. 283): "A(D), 13", one symbol a line
// in three columns. The symbols are those of the marks in the text
// (`notation-mark`); a symbol marked in several places gets all its pages.
// Order: by the letters of the symbol as it reads (Latin, then Greek and
// signs), or by the `sort` key of its mark.

#let greek = (
  "alpha",
  "beta",
  "gamma",
  "delta",
  "epsilon",
  "zeta",
  "eta",
  "theta",
  "iota",
  "kappa",
  "lambda",
  "mu",
  "nu",
  "xi",
  "omicron",
  "pi",
  "rho",
  "sigma",
  "tau",
  "upsilon",
  "phi",
  "chi",
  "psi",
  "omega",
)

// The key of a symbol: its `sort` key, or the letters of its formula. A
// Latin letter sorts first, a Greek one after the Latin alphabet, a sign
// last.
#let symbol-key(mark) = {
  let given = mark.value.sort
  let source = if given != none { given } else {
    repr(mark.value.symbol)
  }
  let text = lower(source)
  let name = greek.find(g => text.contains(g))
  let latin = text.replace(
    regex(
      "\b(overline|tilde|hat|bold|upright|cal|frak|sequence|equation|"
        + "attach|text|body|block|false|true|base|t|b|tl|tr|bl|br)\b",
    ),
    "",
  )
  let letters = latin.replace(regex("[^a-z]"), "")
  let greek-key = greek.find(g => text.starts-with(g))
  // A sort key that starts with "~" is a sign: after the Greek letters.
  if given != none and given.starts-with("~") { "3" + text } else if (
    given != none and greek-key != none
  ) { "2" + text } else if given != none { "1" + text } else if (
    letters != ""
  ) {
    "1" + letters
  } else if name != none { "2" + name } else { "3" + text }
}

#let notation-entries() = context {
  let groups = (:)
  for mark in query(<notation-mark>) {
    let key = repr(mark.value.symbol)
    let group = groups.at(key, default: (mark: mark, marks: ()))
    group.marks.push(mark)
    groups.insert(key, group)
  }
  let rows = groups.values().sorted(key: g => symbol-key(g.mark))
  for group in rows {
    let pages = ()
    for mark in group.marks.sorted(key: index-page) {
      let page = index-page(mark)
      if pages.len() == 0 or pages.last().page != page {
        pages.push((page: page, mark: mark))
      }
    }
    let locators = pages.map(p => {
      let destination = index-destination(p.mark)
      let printed = str(p.page)
      box(
        metadata((
          kind: "page-reference",
          target: "notation-mark",
          resolved: true,
          target-position: destination.position(),
          destination-offset-pt: 10,
          description: printed,
          printed: printed,
        ))
          + link(destination, printed),
      )
    })
    block(
      width: 100%,
      breakable: false,
      spacing: 13pt - 0.662 * 10pt,
      par(
        hanging-indent: 1em,
        first-line-indent: 0pt,
      )[#group.mark.value.symbol, #locators.join[, ]],
    )
  }
}

#let notation-index(body) = {
  set par(justify: false, leading: 13pt - 0.662 * 10pt)
  show math.equation.where(block: false): index-room
  columns(3, gutter: 12pt, body)
}
