#import "numbering.typ": heading-number, local-number, roman, section-at
#import "statements.typ": example-kind, point-counter, statement-kind
#import "bibliography-data.typ": bibliography-data, editorial-data

// Page anchor of the 1983 edition: #source(n) marks where page n of the
// file begins (half-title i = 5, ..., printed page p = p + 14). Plain
// metadata without context: the query that reads it supplies its position.
#let front-pages = ("i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix", "x")
#let source(n) = metadata((
  kind: "source",
  file-page: n,
  printed-page: if n <= 14 { front-pages.at(n - 5) } else { str(n - 14) },
))

// The printed number of a record of the bibliography: its place in the
// list (a translation or another part of a compound record has none). An
// entry inserted with a special number, as printed, keeps it and does not
// advance the count.
#let special-bib-numbers = ("Fotiadi1965": "192a")
#let bib-numbers = {
  let numbers = (:)
  let n = 0
  let e = 0
  for (key, record) in bibliography-data {
    if key in editorial-data {
      if "userc" not in record {
        e += 1
        numbers.insert(key, "E" + str(e))
      }
    } else if "userc" not in record {
      if key in special-bib-numbers {
        numbers.insert(key, special-bib-numbers.at(key))
      } else {
        n += 1
        numbers.insert(key, n)
      }
    }
  }
  numbers
}

// The number a reference prints: "I" (a chapter), "§3", "1.3" (a
// statement), "(1.4)" (a formula), "2°" (a point).
#let reference-number(target) = {
  let loc = target.location()
  if target.func() == heading {
    if target.numbering == none { return target.body }
    let n = counter(heading).at(loc)
    if target.level == 1 { roman(n.first()) } else { "§" + str(n.at(1)) }
  } else if target.func() == figure and target.kind == statement-kind {
    let n = counter(figure.where(kind: statement-kind)).at(loc).first()
    local-number(loc, n)
  } else if target.func() == figure and target.kind == example-kind {
    str(counter(figure.where(kind: example-kind)).at(loc).first())
  } else if target.func() == footnote {
    // "see footnote 4": the number of a footnote of the book.
    str(counter(footnote).at(loc).first())
  } else if target.func() == math.equation {
    // A labelled display is numbered by the style as it is set again, so
    // its number is the next value of the counter.
    let n = counter(math.equation).at(loc).first()
    if target.numbering == none {
      "(" + local-number(loc, n + 1) + ")"
    } else {
      numbering(target.numbering, n)
    }
  } else if (
    target.func() == metadata
      and type(target.value) == dictionary
      and target.value.at("kind", default: none) == "point"
  ) {
    // The style steps the counter where it prints the point.
    str(point-counter.at(loc).first() + 1) + "°"
  } else { none }
}

#let reference-rules(body) = {
  show ref: it => context {
    let target = it.element
    let key = str(it.target)
    let loc = if target != none { target.location() }
    let description = it.supplement not in (auto, none, [])
    // `@label[page]` ("see p. 156") prints the page of the target.
    let page-form = description and it.supplement == [page]
    let citation = key.starts-with("bib:")
    let standard = if citation {
      let n = bib-numbers.at(key.slice(4), default: none)
      if n == none { "?" } else { str(n) }
    } else if target == none and key.starts-with("x:") {
      // A placeholder for a target not typeset yet: `@x:eq-0.1` prints
      // "(0.1)", `@x:pt-3-2` "2°", `@x:sec-3` "§3", `@x:th-0.10` "0.10".
      let (kind, ..number) = key.slice(2).split("-")
      let number = number.join("-")
      if kind == "eq" { "(" + number + ")" } else if kind == "sec" {
        "§" + number
      } else if kind == "pt" { number.split("-").last() + "°" } else {
        number
      }
    } else if target == none { [?] } else {
      let n = reference-number(target)
      if n == none { [?] } else { n }
    }
    let visible = if citation {
      // "[133]"; a locator inside the brackets: `@bib:…[p. 5]`.
      [\[#standard#if description [, #it.supplement]\]]
    } else if page-form {
      if loc == none { [?] } else {
        numbering(loc.page-numbering(), ..counter(page).at(loc))
      }
    } else if description {
      it.supplement
    } else {
      standard
    }
    let mark = [#metadata((
      kind: "cross-reference",
      target: key,
      number: if type(standard) == str { standard },
      override: if description and it.supplement.has("text") {
        it.supplement.text
      },
      resolved: loc != none or (citation and standard != "?"),
      placeholder: not description and not citation and standard == [?],
      target-position: if loc != none { loc.position() },
    ))<cross-reference-mark>]
    // A citation leaves a stable record, without coordinates, that the
    // bibliography queries for its pages of mentions.
    let mention = if citation {
      [#metadata((kind: "bib-mention", target: key))<bib-mention>]
    }
    // Numbers of references are upright also in an italic statement.
    let label = if description and not page-form { visible } else {
      text(style: "normal", visible)
    }
    let content = box(mention + mark + label)
    if loc == none { content } else { link(loc, content) }
  }
  body
}

// An invisible mark of the subject index: nothing but the metadata, so that
// it adds no space where it stands.
#let index-mark(
  term,
  sub: none,
  subsub: none,
  target: none,
  see: none,
  also: none,
) = {
  let value = (
    kind: "index-mark",
    path: (term, sub, subsub).filter(it => it != none),
    target: target,
    see: see,
    also: also,
  )
  [#metadata(value)<index-mark>]
}

// A mark of the Index of Notation: the symbol as a formula; `sort`, the key
// it sorts by when its letters do not give it. The index prints the pages
// of all marks of a symbol.
#let notation-mark(symbol, sort: none, target: none) = {
  let value = (
    kind: "notation-mark",
    symbol: symbol,
    sort: sort,
    target: target,
  )
  [#metadata(value)<notation-mark>]
}

#let editorial-notes = counter("editorial-notes")
#let ed-note(body) = {
  editorial-notes.step()
  context {
    let mark = "*" + str(editorial-notes.get().first()) + ")"
    // The mark is upright also in an italic statement.
    footnote(numbering: _ => text(style: "normal", mark))[#body~—~_Ed._]
    counter(footnote).update(n => n - 1)
  }
}

// A formula in the text whose indices would run into those of the line
// above or below takes the room it needs there (`#room[$…$]`, only where
// the lines touch).
#let room(body) = text(top-edge: "bounds", bottom-edge: "bounds", body)

// In the rows of an index a formula that rises higher than 1.05 em or
// hangs lower than 0.35 em takes the room it needs there, so that the
// indices of neighbouring rows do not touch.
#let index-room(it) = context {
  let ascent = measure(text(top-edge: "bounds", bottom-edge: "baseline", it))
  let full = measure(text(top-edge: "bounds", bottom-edge: "bounds", it))
  let tall = ascent.height > 1.05em.to-absolute()
  let deep = full.height - ascent.height > 0.35em.to-absolute()
  if tall or deep {
    set text(
      top-edge: if tall { "bounds" } else { "cap-height" },
      bottom-edge: if deep { "bounds" } else { "baseline" },
    )
    it
  } else { it }
}

// Symbolic formula tags of the book: (*), (**). The equation steps the
// formula counter like any numbered one; the update inside its body takes
// the step back, so the numeric series is not shifted.
// Its number stands on its last line, like that of a numbered one.
#let tagged-equation(tag, body) = math.equation(
  counter(math.equation).update(n => n - 1) + body.body,
  block: true,
  numbering: _ => text(font: "TeX Gyre Termes", style: "normal", [(#tag)]),
  number-align: end
    + if repr(body.body).contains("linebreak") { bottom } else { horizon },
)

// The signature under the Preface: at the right margin, its baseline
// 18.7 pt below the last line, as printed.
#let signature(name) = block(
  above: 18.7pt - 0.662 * 10pt,
  width: 100%,
  align(right, name),
)

#let index-destination(mark) = {
  let target = mark.value.target
  if target == none { return mark.location() }
  let element = query(target).first(default: none)
  if element == none { mark.location() } else { element.location() }
}

#let index-page(mark) = counter(page).at(index-destination(mark)).first()

// An invisible anchor for a passage the book refers to by its page
// ("cf. p. 26"): `#anchor <para:…>` at the passage, `p.~@para:…[page]` at the
// reference.
#let anchor = metadata((kind: "passage"))

// A note of the editor of the translation, marked "*" as printed; it is a
// part of the book (not an editorial note of this edition) and stands
// outside the series of the footnotes.
#let translation-note(body) = {
  footnote(numbering: _ => "*", body)
  counter(footnote).update(n => n - 1)
}
