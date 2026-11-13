#import "numbering.typ": local-number

// Theorems, lemmas, corollaries and propositions share one counter per
// section ("Lemma 1.3"). Each is a figure, so that @label prints its number.
#let statement-kind = "statement"
#let statement = counter(figure.where(kind: statement-kind))

// The numbered points of a section, 1°, 2°, ...: `#point` at the start of a
// paragraph, or first in the body of a statement that opens with it
// (`#theorem[#point <pt:…> Suppose …]`). The style prints it.
#let point-counter = counter("point")
#let point = metadata((kind: "point"))

// The end of a proof: a white square after a space, as printed.
#let qed-mark = box(
  baseline: 0pt,
  rect(width: 0.6em, height: 0.6em, stroke: 0.04em, inset: 0pt),
)
#let qed-gap = 0.8em

// The book's line: 10 on 13 pt; the cap height of the type.
#let line-pitch = 13pt
#let cap(size) = 0.662 * size

// The space above and below a display, between the line of text and the
// box of the formula: 14 and 11 pt in the text, less in small print, as
// printed. Measured on the printed pages, the baseline of a display of one
// line stands about 25 pt below the line before it and 23-31 pt above the
// line after it (the median over the numbered displays).
#let display-above = 1.4em
#let display-below = 1.1em

// Statements and proofs stand half a line clear of the text around them
// (19 pt from baseline to baseline). The paragraph after one is a new,
// indented paragraph: an empty paragraph without spacing after the block
// makes it a consecutive one (Typst indents only those), and weak space
// restores the gap. The weak space collapses with that of a following
// statement or display and vanishes at a page break.
#let statement-gap = line-pitch + 6pt - cap(10pt)
#let resume = par(spacing: 0pt)[] + v(statement-gap, weak: true)
#let statement-block(body) = {
  block(
    width: 100%,
    breakable: true,
    above: statement-gap,
    below: 0pt,
    align(left, body),
  )
  resume
}

#let keep-with-opening(body) = {
  let first = if body.func() == [].func() {
    body.children.find(it => it.func() not in ([ ].func(), parbreak))
  } else { body }
  if first == none { return false }
  (
    first.func()
      in (enum, enum.item, list, list.item, table, grid, align, figure, block)
      or (first.func() == math.equation and first.block)
  )
}

// The square closes the last line of a proof; after a display it stands
// at the end of the display, after a list in its last item.
#let ends-with-square(body) = {
  let children = if body.func() == [].func() { body.children } else { (body,) }
  let blank(it) = (
    it.func() in ([ ].func(), parbreak) or (it.func() == par and it.body == [])
  )
  let offset = children.rev().position(it => not blank(it))
  if offset == none { return body }
  let index = children.len() - 1 - offset
  let last = children.at(index)
  if last.func() == math.equation and last.block and last.has("label") {
    // A numbered display is left as it is (its label stays in the chapter
    // file, where the editor finds it); the square follows at the right.
    children.slice(0, index + 1).sum(default: [])
    align(right, qed-mark)
  } else if last.func() == math.equation and last.block {
    let fields = last.fields()
    let formula = fields.remove("body")
    let _ = fields.remove("label", default: none)
    children.at(index) = math.equation(
      formula + math.equation(h(qed-gap) + qed-mark).body,
      ..fields,
    )
    children.slice(0, index + 1).sum(default: [])
  } else if last.func() == enum.item {
    let fields = last.fields()
    let item-body = fields.remove("body")
    let _ = fields.remove("label", default: none)
    let number = fields.remove("number", default: auto)
    children.at(index) = enum.item(number, ends-with-square(item-body))
    children.slice(0, index + 1).sum(default: [])
  } else if last.func() == enum {
    let fields = last.fields()
    let items = fields.remove("children")
    let _ = fields.remove("label", default: none)
    let item = items.pop()
    if item.func() == enum.item {
      let item-fields = item.fields()
      let item-body = item-fields.remove("body")
      items.push(enum.item(ends-with-square(item-body), ..item-fields))
    } else {
      items.push(ends-with-square(item))
    }
    children.at(index) = enum(..items, ..fields)
    children.slice(0, index + 1).sum(default: [])
  } else if last.func() in (table, grid, align, block, figure) {
    body
    align(right, qed-mark)
  } else {
    // The square stays on the line of the last word.
    [#children.slice(0, index + 1).sum(default: [])#sym.wj#box[#h(
          qed-gap,
        )#qed-mark]]
  }
}

// A point that opens the body of a statement stands before its head:
// "1°. Theorem 1.1. …".
#let take-point(body) = {
  if body.func() != [].func() { return (none, body) }
  let children = body.children
  let first = children.position(it => it.func() not in ([ ].func(), parbreak))
  if first == none { return (none, body) }
  let it = children.at(first)
  if (
    it.func() == metadata
      and type(it.value) == dictionary
      and (
        it.value.at("kind", default: none) == "point"
      )
  ) {
    let rest = children.slice(first + 1)
    while rest.len() > 0 and rest.first().func() == [ ].func() {
      rest = rest.slice(1)
    }
    (it, rest.sum(default: []))
  } else { (none, body) }
}

// The head runs into the first paragraph; before an opening display, list
// or table it stands on its own line, kept with it. A display after the
// first paragraph may go to the next page, as in the book.
#let with-head(header, content, styled) = {
  if keep-with-opening(content) {
    block(above: 0pt, sticky: true, header) + styled(content)
  } else {
    [#header #styled(content)]
  }
}

// Italic as a text style, not as emphasis: emphasis inside the statement
// then turns upright.
// Figures stay upright in an italic statement, as printed ("Chapter II,
// §19, Theorem 4").
#let italic-statement(body) = {
  show regex("[0-9]"): set text(style: "normal")
  text(style: "italic", body)
}

// "THEOREM 1.1." in capitals and small capitals with an upright number;
// "THEOREM 1.2 (Aronov and Kytmanov)."; the statement proper is italic
// unless `slant: false`.
// `note: […]`: a footnote of the book right after the number, "THEOREM
// 14.1(¹) (Alexander-Pontryagin duality)".
#let numbered-statement(kind, title: none, note: none, slant: true, body) = {
  let (opening-point, body) = take-point(body)
  let header = context {
    let n = local-number(here(), statement.get().first())
    let head = text(style: "normal", smallcaps(kind) + [ #n])
    let mark = if note != none { footnote(note) }
    [#h(1em)#opening-point#head#mark#if title == none [.] else [ (#title).]]
  }
  let styled(body) = if slant { italic-statement(body) } else { body }
  figure(
    kind: statement-kind,
    supplement: kind,
    numbering: "1",
    outlined: false,
    statement-block(with-head(header, body, styled)),
  )
}

#let theorem(..args) = numbered-statement([Theorem], ..args)
#let lemma(..args) = numbered-statement([Lemma], ..args)
#let corollary(..args) = numbered-statement([Corollary], ..args)
#let proposition(..args) = numbered-statement([Proposition], ..args)
// "PROPERTY 0.12.": the properties of determinants in the Preliminaries.
#let property(..args) = numbered-statement([Property], ..args)

// A statement without a number: "REMARK.", "EXAMPLE.", "DEFINITION.". The
// text is upright unless `slant: true`.
#let unnumbered(kind, title: none, slant: false, body) = {
  let (opening-point, body) = take-point(body)
  statement-block(with-head(
    [#h(1em)#opening-point#smallcaps(kind)#if title == none [.] else [
        (#title).]],
    body,
    it => if slant { italic-statement(it) } else { it },
  ))
}
#let remark(..args) = unnumbered([Remark], ..args)

// Examples numbered in a section, "EXAMPLE 1.", "EXAMPLE 2 (a ball)."; a
// series of its own per section, upright. `@exm:…` prints the number.
#let example-kind = "example"
#let example-counter = counter(figure.where(kind: example-kind))
#let eg(title: none, body) = figure(
  kind: example-kind,
  supplement: [Example],
  numbering: "1",
  outlined: false,
  statement-block(with-head(
    context [#h(1em)#smallcaps[Example] #example-counter.get().first()#if (
        title == none
      ) [.] else [ (#title).]],
    body,
    it => it,
  )),
)
#let example(..args) = unnumbered([Example], ..args)
#let definition(..args) = unnumbered([Definition], ..args)

// Upright words inside an italic statement.
#let roman-text(body) = text(style: "normal", body)

// "PROOF." in capitals and small capitals; the text ends with the white
// square. `title: [Proof of Theorem 2.3.]` for another head, `qed: false`
// where the book has no square.
// `title: none` for an argument the book closes with the square but sets
// without a head.
#let proof(title: [Proof.], qed: true, body) = {
  let (opening-point, body) = take-point(body)
  statement-block({
    let text-body = if qed { ends-with-square(body) } else { body }
    let head = if title == none [#h(1em)#opening-point] else [
      #h(1em)#opening-point#smallcaps(title)
    ]
    if keep-with-opening(body) {
      block(above: 0pt, sticky: true, head)
      text-body
    } else {
      [#head #text-body]
    }
  })
}

// A new paragraph after a display or a list, indented as the book prints it;
// text after a display without it continues at the margin.
#let new-par = par(spacing: 0pt)[] + context v(-par.spacing)

// The printed formula numbers of a section pass over a number:
// `#skipped-formula-number` before the next formula keeps them.
#let skipped-formula-number = counter(math.equation).step()

// Small print, as the book sets some passages and proofs: 8 on 10 pt.
// The normal text after it stands a line further down, as printed, and
// starts a new, indented paragraph.
#let small-print(body) = {
  block(width: 100%, above: line-pitch - cap(10pt), below: 0pt, {
    set text(size: 8pt)
    set par(leading: 10pt - cap(8pt), spacing: 10pt - cap(8pt))
    // The first paragraph is indented, as printed.
    par(spacing: 0pt)[]
    body
  })
  par(spacing: 0pt)[]
  v(2 * line-pitch - cap(10pt), weak: true)
}
