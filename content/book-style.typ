#import "main-defs.typ": reference-rules
#import "numbering.typ": heading-number, roman, section-at
#import "statements.typ": (
  cap, display-above, display-below, example-counter, example-kind, line-pitch,
  point-counter, statement, statement-kind,
)

// AMS 1983: 6 x 9 in, Times 10/13 on a measure of 339 pt and 40 lines.
// Running heads: on a left-hand page the folio and the short title of the
// chapter, on a right-hand page the short title of the section starting on
// (or running through) the page and the folio, in capitals; the opening
// pages of chapters and of the front and back matter have no head and the
// folio centred at the foot.
//
// The book is set in Monotype Times, about 5 per cent wider than TeX Gyre
// Termes at the same size; the sizes below are the book's, so a line here
// holds a little more text than in the book.
#let page-width = 6in
#let page-height = 9in
#let text-width = 339pt
// 40 lines: 39 line steps of 13 pt and the cap height of the first line.
#let text-height = 39 * line-pitch + cap(10pt) + 1pt
#let page-margin = (
  inside: 44pt,
  outside: page-width - 44pt - text-width,
  top: 60pt,
  bottom: page-height - 60pt - text-height,
)
#let text-font = "TeX Gyre Termes"
#let math-font = "TeX Gyre Termes Math"
// The baseline of the running head stands 23 pt above that of the first
// line of the text.
#let head-drop = 23pt
// An opening page is shorter: its folio stands at the foot, 29 pt below
// the last line, and that line 60 pt above the last line of a full page.
#let opening-foot = 60pt

// The cover stands before the counted pages: the half-title i is the second
// page of the file, so the right-hand pages (odd folios) are the even pages
// of the file; Typst tells left from right pages by their place in the file
// (see `binding` below).
#let recto-parity = "even"

// The number of sections before each chapter (sections are numbered
// through the book).
#let sections-before-chapter = (0, 7, 12, 19, 23)

// Short titles of the running heads, as printed: the chapter on a left-hand
// page, the section on a right-hand page.
#let running-titles = (
  "ch:integral-representations": [Integral Representations],
  "ch:special-form": [Integral Representations of Special Form],
  "ch:residues": [The Theory of Residues],
  "ch:applications": [Applications],
  "ch:multidimensional-analysis": [Multidimensional Complex Analysis],
  "sec:martinelli-bochner": [The Martinelli-Bochner Representation],
  "sec:rouche-principle": [The Rouché Principle],
  "sec:leray-koppelman": [The Leray-Koppelman Formula],
  "sec:cauchy-formula": [The Cauchy Formula],
  "sec:andreotti-norguet": [The Andreotti-Norguet Formula],
  "sec:kernels": [Various Kernels],
  "sec:martinelli-bochner-koppelman": [
    The Martinelli-Bochner-Koppelman Representation
  ],
  "sec:leray-modifications": [Modifications and the Leray Formula],
  "sec:bergman-weil": [The Bergman-Weil Formula],
  "sec:strictly-pseudoconvex": [Strictly Pseudoconvex Domains],
  "sec:n-circular": [$n$-Circular Domains],
  "sec:schwarz-kernel": [The Schwarz Kernel],
  "sec:statement": [Statement of the Problem],
  "sec:alexander-pontryagin": [Alexander-Pontryagin Duality],
  "sec:de-rham": [De Rham Duality],
  "sec:leray-residues": [The Leray Duality],
  "sec:cohomological-reduction": [Cohomological Reduction of Certain Forms],
  "sec:two-variables": [Rational Functions of Two Variables],
  "sec:local-residues": [Local Residues],
  "sec:implicit-functions": [Expansion of Implicit Functions],
  "sec:nonlinear-systems": [Systems of Nonlinear Equations],
  "sec:multiplicity": [Computing the Multiplicity of a Zero],
  "sec:generating-functions": [Generating Functions and Combinatorial Sums],
  "sec:hartogs-bochner": [The Hartogs-Bochner Theorem],
  "sec:dbar-problem": [The $overline(partial)$-Problem and Oka's Theorems],
  "sec:orthogonal-forms": [Forms Orthogonal to Holomorphic Functions],
  "sec:algebraic-singularities": [Functions with Algebraic Singularities],
  "front:preface": [Preface],
  "front:contents": [Contents],
  "front:preliminaries": [Preliminaries],
  "back:notes": [Historical Notes],
  "back:bibliography": [Bibliography],
  "back:index": [Index],
  "back:notation": [Index of Notation],
)
#let running-title(it) = {
  let key = if it.has("label") { str(it.label) }
  let short = running-titles.at(key, default: it.body)
  upper(short)
}

// Opening pages of chapters and of the front and back matter.
#let opening-page(this-page) = query(heading.where(level: 1)).any(it => (
  it.location().page() == this-page
))

// The blank page inserted by `recto-break`: the page between its two
// markers. No head, no folio.
#let blank-inserted(this-page) = {
  let marks(side) = query(metadata.where(value: (
    kind: "recto-break",
    side: side,
  ))).map(it => it.location().page())
  marks("before")
    .zip(marks("after"))
    .any(((before, after)) => (
      before == this-page - 1 and after == this-page + 1
    ))
}

#let running-head = context {
  let this-page = here().page()
  if opening-page(this-page) or blank-inserted(this-page) { return }
  let folio = text(size: 10pt, weight: "bold", counter(page).display())
  let n = counter(page).get().first()
  let chapters = query(heading.where(level: 1)).filter(it => (
    it.location().page() <= this-page
  ))
  let chapter = chapters.last(default: none)
  let chapter-head = if chapter == none { [] } else if (
    chapter.numbering == none
  ) {
    running-title(chapter)
  } else {
    [#roman(counter(heading).at(chapter.location()).first()). #running-title(
        chapter,
      )]
  }
  let section-head = {
    let sections = query(heading.where(level: 2)).filter(it => (
      chapter != none
        and it.location().page() <= this-page
        and it.location().page() >= chapter.location().page()
    ))
    let section = sections.last(default: none)
    if section == none { chapter-head } else if section.numbering == none {
      // An unnumbered part (Supplementary Bibliography) keeps the head of
      // its chapter, as printed.
      chapter-head
    } else {
      let number = counter(heading).at(section.location())
      [#heading-number(..number) #running-title(section)]
    }
  }
  set text(size: 8pt)
  set par(first-line-indent: 0pt, justify: false)
  if calc.even(n) {
    grid(
      columns: (3em, 1fr, 3em),
      align: (left + bottom, center + bottom, right + bottom),
      folio, chapter-head, [],
    )
  } else {
    grid(
      columns: (3em, 1fr, 3em),
      align: (left + bottom, center + bottom, right + bottom),
      [], section-head, folio,
    )
  }
}

// An opening page: no head; the folio centred at the foot, `opening-foot`
// above the foot of a full page, and the text above it as much shorter. A
// bottom float on the opening page holds the folio and the room.
#let opening-folio-text = context text(
  size: 10pt,
  weight: "regular",
  counter(page).display(),
)
// A page that holds footnotes: Typst sets them below a bottom float, so
// there the folio stands in the footer, below the notes, as printed.
#let has-footnotes(this-page) = query(footnote).any(it => (
  it.location().page() == this-page
))
#let opening-folio = context {
  if not has-footnotes(here().page()) {
    place(
      bottom + center,
      float: true,
      clearance: 0pt,
      // The top of the float stands at the lowest baseline the text may
      // reach; the folio 29 pt below it.
      block(height: opening-foot, width: 100%, {
        v(29pt - cap(10pt))
        align(center + top, opening-folio-text)
      }),
    )
  }
}
#let opening-footer = context {
  let this-page = here().page()
  let opening = query(heading.where(level: 1)).any(it => (
    it.location().page() == this-page
  ))
  if opening and has-footnotes(this-page) {
    align(center, opening-folio-text)
  }
}

// A blank page of the edition (ii, iv): it counts in the page sequence and
// has neither head nor folio.
#let blank-page() = page(header: none)[]

// The next right-hand page (an odd folio), after a blank page if needed.
// The markers on both sides let the running head leave the inserted blank
// page empty.
#let recto-break() = {
  metadata((kind: "recto-break", side: "before"))
  pagebreak(weak: true, to: recto-parity)
  metadata((kind: "recto-break", side: "after"))
}

#let page-setup(body) = {
  set page(
    width: page-width,
    height: page-height,
    // Right-hand pages are the even pages of the file (after the cover):
    // binding on the right in Typst's terms puts their inside margin on the
    // left.
    binding: right,
    margin: page-margin,
    header: running-head,
    header-ascent: head-drop - cap(10pt),
    footer: opening-footer,
    footer-descent: 20pt,
  )
  // Cyrillic (the title of the original, R. Zh. numbers) and the modifier
  // prime ʹ of transliterated names come from Liberation Serif, a Times
  // design that has them.
  set text(
    font: (text-font, "Liberation Serif"),
    size: 10pt,
    lang: "en",
    region: "us",
  )
  set par(
    justify: true,
    leading: line-pitch - cap(10pt),
    spacing: line-pitch - cap(10pt),
    first-line-indent: 1em,
  )
  show math.equation: set text(font: math-font)
  body
}

// Chapter opening, measured on the book from the baseline of the first line
// of a full page: "CHAPTER I" 28 pt below it, the title (bold 13 pt) 31.4 pt
// below that, the first section title 45.8 pt lower still.
#let chapter-opening(label, title) = {
  v(28pt - cap(10pt))
  block(
    above: 0pt,
    below: 31.4pt - cap(13pt),
    sticky: true,
    width: 100%,
    align(center, text(size: 10pt, weight: "regular", label)),
  )
  block(
    above: 0pt,
    below: 45.8pt - cap(10pt),
    sticky: true,
    width: 100%,
    align(center, par(
      justify: false,
      first-line-indent: 0pt,
      leading: 16pt - cap(13pt),
      text(size: 13pt, weight: "bold", hyphenate: false, title),
    )),
  )
}

// Titles of the front and back matter (Preface, Contents, Bibliography,
// Index, ...): bold 13 pt, centred; `sink`: the baseline of the title below
// that of the first line of a full page; `drop`: from it to the first
// baseline below.
#let opening-title(title, sink: 36.7pt, drop: 21pt) = {
  v(sink - cap(13pt))
  block(
    above: 0pt,
    below: 0pt,
    sticky: true,
    width: 100%,
    align(center, par(
      justify: false,
      first-line-indent: 0pt,
      leading: 16pt - cap(13pt),
      text(size: 13pt, weight: "bold", hyphenate: false, title),
    )),
  )
  // The first paragraph is indented, as printed.
  par(spacing: 0pt)[]
  v(drop - cap(10pt), weak: true)
}

// A heading's body without its notes, for the Contents.
// The first letter of a formula ("" when it opens with something else).
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

// A note of the translation (a footnote and the counter update that
// restores the numbering) is dropped as a whole.
#let without-notes(body) = {
  if (
    body.func() == footnote or repr(body).starts-with("counter-update")
  ) { [] } else if body.has("children") {
    body.children.map(without-notes).join()
  } else { body }
}

// Contents (pp. v-vi): "Preface", "Preliminaries" and the back matter flush
// left; "CHAPTER I. Integral …" flush left with its turned lines indented;
// the sections indented, their numbers right-aligned in a column, turned
// lines under the title; page numbers flush right, without leaders.
#let contents-style(body) = {
  set par(first-line-indent: 0pt, justify: false)
  show outline.entry: it => {
    let element = it.element
    let numbered = element.numbering != none
    let page = it.page()
    let link-to(body) = link(element.location(), body)
    if it.level == 1 {
      let title = if numbered {
        let n = counter(heading).at(element.location()).first()
        [CHAPTER #roman(n). #without-notes(element.body)]
      } else { without-notes(element.body) }
      block(
        above: if numbered { 20pt - cap(10pt) } else { 20pt - cap(10pt) },
        below: 13pt - cap(10pt),
        breakable: false,
        link-to(grid(
          columns: (1fr, 2.5em),
          align: (left, right + bottom),
          par(hanging-indent: 1.2em, title), page,
        )),
      )
    } else {
      let number = if numbered {
        let n = counter(heading).at(element.location())
        [#n.at(1).]
      }
      block(
        above: 13pt - cap(10pt),
        below: 13pt - cap(10pt),
        breakable: false,
        link-to(grid(
          columns: (1.2em, 1.6em, 1fr, 2.5em),
          align: (left, right, left, right + bottom),
          [], number, pad(left: 0.35em, without-notes(element.body)), page,
        )),
      )
    }
  }
  body
}

#let book-style(body) = {
  show: page-setup
  set heading(numbering: heading-number)
  // The bold C, R, Z of the number spaces are upright, as printed.
  show math.equation: it => {
    show ":": math.class("punctuation", ":") + h(0.2em)
    // The inequalities are slanted, as printed.
    show "≤": math.class("relation", "⩽")
    show "≥": math.class("relation", "⩾")
    it
  }
  // Chapters and the front and back matter break the page; sections run
  // on.
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    // Footnotes are numbered through a chapter, as printed.
    counter(footnote).update(0)
    statement.update(0)
    point-counter.update(0)
    counter(math.equation).update(0)
    // Sections are numbered through the book: a chapter heading would
    // restart them at 1. The last section before each chapter, as printed
    // (Chapter I has §1-§7, II §8-§12, III §13-§19, IV §20-§23, V §24-§27);
    // a fixed table, since a count of the headings would not converge.
    if it.numbering != none {
      counter(heading).update((..n) => (
        n.pos().first(),
        sections-before-chapter.at(n.pos().first() - 1),
      ))
    }
    opening-folio
    if it.numbering != none {
      context {
        let n = counter(heading).at(it.location()).first()
        chapter-opening([CHAPTER #roman(n)], it.body)
      }
    } else {
      // An unnumbered title, measured on the printed pages: the sink of its
      // baseline below the first baseline of a full page and the drop from
      // it to the first line below.
      let openings = (
        "front:preface": (sink: 36.7pt, drop: 20.9pt),
        "front:contents": (sink: 30pt, drop: 36.7pt),
        "front:preliminaries": (sink: 35.7pt, drop: 43.4pt),
        "back:notes": (sink: 42.2pt, drop: 46.1pt),
        "back:bibliography": (sink: 33.8pt, drop: 24.2pt),
        "back:index": (sink: 51.3pt, drop: 32.2pt),
        "back:notation": (sink: 0pt, drop: 30pt),
      )
      let key = if it.has("label") { str(it.label) }
      let opening = openings.at(key, default: (sink: 36.7pt, drop: 21pt))
      opening-title(it.body, sink: opening.sink, drop: opening.drop)
    }
  }
  // "§1. The Martinelli-Bochner integral representation", bold 10 pt,
  // centred; a new section restarts the series of statements, points and
  // formulas.
  show heading.where(level: 2): it => {
    if it.numbering != none {
      statement.update(0)
      example-counter.update(0)
      point-counter.update(0)
      counter(math.equation).update(0)
    }
    let number = if it.numbering != none {
      context [#heading-number(..counter(heading).at(it.location())) ]
    }
    // The weak space a statement leaves after itself gives way to the
    // space above the title. Distances from baseline to baseline, medians
    // of the printed pages: a section stands 16.7 pt below the text and
    // 15.5 pt above it; a subhead without a number (the chapters in the
    // Historical Notes) 18 pt from the text around it; the title of a
    // further list of references (Supplementary Bibliography), in 13 pt,
    // 36.5 pt below the list before it and 35.6 pt above the next entry.
    let list-title = (
      it.has("label")
        and str(it.label)
          in ("back:supplementary-bibliography", "back:editorial-references")
    )
    let subhead = it.numbering == none and not list-title
    let size = if list-title { 13pt } else { 10pt }
    let (above, below) = if list-title { (36.5pt, 35.6pt) } else if subhead {
      (18pt, 18pt)
    } else { (16.7pt, 15.5pt) }
    // Below a chapter title the first section stands 46 pt lower.
    if it.numbering != none {
      context {
        let before = query(selector(heading).before(here()))
        let first = (
          before.len() > 1
            and before.at(-2).level == 1
            and before.at(-2).location().page() == here().page()
        )
        if first { v(46pt - above - 0.4pt, weak: false) }
      }
    }
    v(above - cap(size), weak: true)
    block(
      above: above - cap(size),
      below: 0pt,
      sticky: true,
      width: 100%,
      align(center, par(
        justify: false,
        first-line-indent: 0pt,
        leading: 13pt - cap(10pt),
        text(size: size, weight: "bold", hyphenate: false)[#number#it.body],
      )),
    )
    // The first paragraph is indented, as printed: the empty paragraph
    // makes it a consecutive one.
    par(spacing: 0pt)[]
    v(below - cap(10pt), weak: true)
  }
  // The numbered points 1°, 2°, … of a section: bold, at the start of a
  // paragraph.
  show metadata: it => {
    if (
      type(it.value) == dictionary
        and it.value.at("kind", default: none)
          == (
            "point"
          )
    ) {
      point-counter.step()
      context [#strong[#point-counter.get().first()°].]
      [ ]
    } else { it }
  }

  // Displays: centred, the number of a labelled display at the right
  // margin, "(1.13)"; only labelled displays are numbered, in a series per
  // section; their spacing is `display-above` and `display-below`.
  set math.equation(number-align: end + horizon)
  // An unnumbered display of several lines may break across pages, as
  // printed.
  show math.equation.where(block: true): set block(
    above: display-above,
    below: display-below,
    breakable: true,
  )
  // The cells of a matrix or determinant are set full size, their
  // fractions too, as printed.
  show math.mat: it => {
    if it.rows.flatten().all(c => repr(c).starts-with("styled")) { it } else {
      math.mat(
        ..it.rows.map(row => row.map(c => math.display(c))),
        delim: it.delim,
        align: it.align,
        augment: it.augment,
        row-gap: it.row-gap,
        column-gap: it.column-gap,
      )
    }
  }
  // Cases are set full size, their fractions and sums too, as printed:
  // each cell in display style (a cell already styled is left as it is,
  // so the rule does not apply to its own result).
  show math.cases: it => {
    if it.children.all(c => repr(c).starts-with("styled")) { it } else {
      math.cases(
        ..it.children.map(c => math.display(c)),
        delim: it.delim,
        reverse: it.reverse,
        gap: it.gap,
      )
    }
  }
  show math.equation.where(block: true): it => {
    // A numbered display stays on one page (split, it would show its
    // number twice): it is set in an unbreakable block with the spacing of
    // a display.
    // (No width: a block of full width measures 0 pt in the measurement
    // of a display below, which is unbounded.)
    let whole = block.with(
      breakable: false,
      above: display-above,
      below: display-below,
    )
    if it.has("label") and it.numbering == none {
      layout(size => context {
        let section = section-at(here())
        let n = counter(math.equation).get().first() + 1
        let tag = text(font: text-font, style: "normal")[(#section.#n)]
        // References and marks inside are left out of the measurement:
        // their records depend on the layout being measured.
        let width = measure({
          show ref: r => box(width: 2.5em)
          show metadata: none
          math.equation(it.body, block: true)
        }).width
        // (A display of several lines has its number on the last line,
        // which is checked by the reader of the proofs, not here.)
        let lines = repr(it.body).contains("linebreak")
        let room = measure(tag).width + 1em.to-absolute()
        if not lines and size.width - width < room {
          // Too wide to stand clear of its number: the number on a line of
          // its own below, at the right margin, as printed.
          counter(math.equation).step()
          whole(width: 100%, {
            math.equation(it.body, block: true)
            v(-0.4em)
            align(right, tag)
          })
        } else if not lines and (size.width - width) / 2 < room {
          // Too wide to stand centred clear of its number: centred in the
          // room left of the number, at least 1 em from it, as printed.
          counter(math.equation).step()
          whole(width: 100%, grid(
            columns: (1fr, auto),
            column-gutter: 1em,
            align: (center + horizon, right + horizon),
            math.equation(it.body, block: true), tag,
          ))
        } else {
          whole(math.equation(
            // A display of several lines reaching into the room of its
            // number: its last line is padded by that room, so that the
            // display moves left of the number (Typst moves only a display
            // of one line).
            if lines and (size.width - width) / 2 < room {
              it.body + box(width: room)
            } else { it.body },
            block: true,
            numbering: _ => tag,
            // The number of a display of several lines stands on its last
            // line, as printed.
            number-align: end
              + if repr(it.body).contains("linebreak") { bottom } else {
                horizon
              },
          ))
        }
      })
    } else if it.numbering != none {
      // A symbolic tag, (*) or (27.9′) (`tagged-equation`); the displays
      // set above come here again, and their second block is void.
      whole(it)
    } else if repr(it.body).matches("linebreak").len() < 3 {
      // An unnumbered display of up to three lines is not split either: a
      // first line alone at the foot of a page is a bare beginning.
      whole(it)
    } else { it }
  }
  show link: set text(fill: black)
  // No line break between a formula and a hyphen after it ("$C^1$-norm").
  show regex("^-\p{L}"): it => sym.wj + it
  // A range "86–89" is not broken at its dash.
  show "–": it => sym.wj + it + sym.wj
  // A line never starts with an em dash: it stays with the word before it.
  show "—": it => sym.wj + it
  show enum: set par(justify: true)
  set enum(
    numbering: n => text(style: "normal", numbering("a)", n)),
    indent: 1em,
    body-indent: 0.5em,
  )
  show outline: set par(first-line-indent: 0pt)
  show outline.entry: set block(breakable: false)
  // Footnotes: 8 on 10 pt, numbered through the chapter, "(1)", the rule a
  // quarter of the measure.
  set footnote(numbering: "1")
  set footnote.entry(
    separator: line(length: 25%, stroke: 0.4pt),
    clearance: 13pt,
    gap: 10pt - cap(8pt),
    indent: 0pt,
  )
  show footnote.entry: set text(size: 8pt)
  show footnote.entry: set par(
    leading: 10pt - cap(8pt),
    first-line-indent: 1em,
    justify: true,
  )
  // A footnote mark stays on the line of the word it follows.
  // The book's mark is a superior figure in parentheses of the text size,
  // "(¹)"; an editorial note keeps its own mark.
  show footnote: it => sym.wj + if it.numbering == "1" [(#it)] else { it }
  // The entry: its mark, a space, the note, as printed.
  show footnote.entry: it => {
    let loc = it.note.location()
    let n = counter(footnote).at(loc)
    let mark = if it.note.numbering == "1" [(#super(str(n.first())))] else {
      numbering(it.note.numbering, ..n)
    }
    [#h(1em)#mark#h(0.3em)#it.note.body]
  }
  // Brackets in the text keep the size of the type, as printed: a root, an
  // index or an exponent inside does not enlarge them. Brackets around a
  // matrix, cases, a binomial or an evaluation bar grow with it.
  show math.equation.where(block: false): it => {
    show math.lr: l => {
      let body = repr(l.body)
      let tall = (
        ("mat(", "vec(", "cases(", "binom(", "mid(").any(m => body.contains(m))
      )
      if tall or l.size == 1em { l } else { math.lr(l.body, size: 1em) }
    }
    it
  }
  // A formula opening with f: the tail of the italic f would close the
  // word space before it ("if f" read as "iff"); a hair of space keeps it.
  show math.equation.where(block: false): it => {
    if first-text(it.body).starts-with("f") { h(0.1em) + it } else { it }
  }
  // A formula in the text taller than the line (an overline, a high
  // exponent) takes the room it needs, as printed; ordinary formulas keep
  // the line.
  show math.equation.where(block: false): it => context {
    let ascent = measure(text(
      top-edge: "bounds",
      bottom-edge: "baseline",
      it,
    )).height
    if ascent > 1.15em.to-absolute() {
      set text(top-edge: "bounds", bottom-edge: "bounds")
      it
    } else { it }
  }
  // Figures stand at the head of a page; "Figure 1." and the caption in
  // 9 pt, centred.
  set figure(placement: top)
  set figure.caption(separator: [. ])
  show figure.caption: set text(size: 9pt)

  // Statements break across pages like the text.
  show figure.where(kind: statement-kind): set block(breakable: true)
  show figure.where(kind: statement-kind): it => it.body
  show figure.where(kind: example-kind): set block(breakable: true)
  show figure.where(kind: example-kind): it => it.body
  show: reference-rules
  body
}
