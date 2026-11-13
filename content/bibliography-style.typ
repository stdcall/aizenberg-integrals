#import "bibliography-data.typ": bibliography-data
#import "main-defs.typ": bib-numbers

// A record prints from its `annotation`, a template that gives the order of
// the fields and the punctuation of the printed entry after the names:
// "_{title}_, {journal} *{volume}* ({year}), {pages}.". {field} is a field of
// the record, {Key.field} a field of a record named in its `related` (a
// translation, a reprint); *…* in the template is bold, _…_ italic, ~ a
// non-breaking space.
//
// - author: "Surname, Initials and …", printed "Initials Surname and …";
//   a braced name prints as it stands;
// - journal: userb, the abbreviation printed in the book, else the verified
//   abbreviation (shortjournal), else the full title;
// - in the values, $…$ is a formula and "--" an en dash.
// userc names the part of a compound record that a DOI belongs to.

// The list is set smaller than the text: 8 pt on a 10 pt line, as printed.
// The number of an entry stands right-aligned in a column; the turned lines
// hang under the names. A record with the authors of the one before it
// prints a dash for them, as printed.
#let bib-size = 8pt
#let bib-line-gap = 10pt - 0.662 * 8pt
#let number-column = 2.4em
#let number-gap = 0.5em

#let nbsp = "\u{00A0}"
#let rich-bib-text(value) = {
  let position = 0
  let plain(part) = (
    part
      .replace("--", "–")
      .replace("'", "’")
      .replace("\\&", "&")
      .replace("\\#", "#")
      .replace("\\]", "]")
      .replace("\\[", "[")
  )
  for match in value.matches(regex("\\$[^$]+\\$")) {
    plain(value.slice(position, match.start))
    eval(match.text, mode: "markup")
    position = match.end
  }
  plain(value.slice(position))
}

// "Agranovskiĭ, M. L. and Val'skiĭ, R. E." prints "M. L. Agranovskiĭ and
// R. E. Val'skiĭ"; three names "A, B and C", as printed; "Lawson, Jr.,
// H. Blaine" prints "H. Blaine Lawson, Jr."; a last name "others" prints
// "et al.".
#let bib-names(value) = {
  let parts = value.split(" and ")
  let others = parts.last() == "others"
  if others { parts = parts.slice(0, -1) }
  let names = parts.map(name => {
    if name.starts-with("{") { return name.trim("{").trim("}") }
    let pieces = name.split(", ")
    let given(text) = text.replace(". ", "." + nbsp)
    if pieces.len() == 1 { pieces.first() } else if pieces.len() == 3 {
      given(pieces.at(2)) + nbsp + pieces.first() + ", " + pieces.at(1)
    } else {
      given(pieces.slice(1).join(", ")) + nbsp + pieces.first()
    }
  })
  let joined = if names.len() == 1 { names.first() } else {
    names.slice(0, -1).join(", ") + " and " + names.last()
  }
  if others { joined + " et al." } else { joined }
}

#let ordinal(value) = {
  if value.match(regex("^[0-9]+$")) == none { return value }
  let n = int(value)
  let suffix = if calc.rem(calc.quo(n, 10), 10) == 1 { "th" } else {
    ("th", "st", "nd", "rd").at(calc.rem(n, 10), default: "th")
  }
  value + suffix
}

#let bib-field(data, field) = {
  if field in ("author", "editor", "translator") {
    rich-bib-text(bib-names(data.at(field)))
  } else if field == "journal" {
    // The form printed in the book, else the verified abbreviation, else the
    // full title.
    let name = if "userb" in data { data.userb } else if (
      "shortjournal" in data
    ) { data.shortjournal } else { data.journal }
    rich-bib-text(name)
  } else if field == "edition" {
    ordinal(data.edition)
  } else if field == "xref" {
    // Another entry of the list cited by its number, "[84]".
    let target = data.xref
    link(label("bib:" + target), str(bib-numbers.at(target)))
  } else {
    rich-bib-text(data.at(field))
  }
}

#let bib-backlinks(target) = context {
  let refs = query(metadata.where(value: (kind: "bib-mention", target: target)))
  let seen = ()
  let pages = ()
  for mention in refs {
    let loc = mention.location()
    if not seen.contains(loc.page()) {
      seen.push(loc.page())
      let position = loc.position()
      let destination = (
        page: position.page,
        x: position.x,
        y: calc.max(0pt, position.y - 8pt),
      )
      let pattern = loc.page-numbering()
      let folio = counter(page).at(loc)
      let shown = if pattern == none { str(folio.first()) } else {
        numbering(pattern, ..folio)
      }
      pages.push(box(context [
        #metadata((
          kind: "page-reference",
          resolved: true,
          target: "bib-mention:" + target,
          target-position: position,
          // Typst adds 10pt above the coordinate destination as well.
          destination-offset-pt: 18,
          description: shown,
        ))
        #link(destination, shown)
      ]))
    }
  }
  if pages.len() > 0 { [ \[#pages.join(", ")\]] }
}

#let bib-description(key) = {
  let entry = bibliography-data.at(key)
  let related = entry.at("related", default: "").split(",").filter(k => k != "")
  let segments = entry.annotation.split("_")
  for (index, segment) in segments.enumerate() {
    let printed = {
      let position = 0
      let bold = false
      for match in segment.matches(regex("\\*|\\{([^{}]+)\\}")) {
        rich-bib-text(segment.slice(position, match.start).replace("~", nbsp))
        position = match.end
        if match.text == "*" {
          bold = not bold
          continue
        }
        let token = match.captures.first().split(".")
        let data = if token.len() == 1 { entry } else {
          assert(
            token.first() in related,
            message: "Template references an unrelated bibliography record",
          )
          bibliography-data.at(token.first())
        }
        let field = bib-field(data, token.last())
        if bold { strong(field) } else { field }
      }
      rich-bib-text(segment.slice(position).replace("~", nbsp))
    }
    if calc.odd(index) { emph(printed) } else { printed }
  }
  for component in (key,) + related {
    let record = bibliography-data.at(component)
    if "doi" in record {
      let part = if "userc" in record { " (" + record.userc + ")" } else { "" }
      // A line may end after the first slash and, in the suffix, before a
      // hyphen, a point or a slash (the digit groups of a book's DOI would
      // not break otherwise). A break point is a vanishing space: it adds no
      // character to the text of the DOI (a zero-width space would), and
      // `h(0pt)` gives no break point.
      let break-point = h(0.001pt)
      let (prefix, ..rest) = record.doi.split("/")
      let pieces = ("",)
      for character in rest.join("/").clusters() {
        if character in ("-", ".", "/") and pieces.last() != "" {
          pieces.push("")
        }
        pieces.at(-1) += character
      }
      [
        #link(
          "https://doi.org/" + record.doi,
          [DOI#part: #prefix/#break-point#pieces.join(break-point)],
        )]
    }
  }
  bib-backlinks("bib:" + key)
}

// The records of the list in order, without the parts of compound records.
#let bib-order = (
  bibliography-data
    .keys()
    .filter(key => "userc" not in bibliography-data.at(key))
)
#let bib-previous = {
  let previous = (:)
  for (i, key) in bib-order.enumerate() {
    if i > 0 { previous.insert(key, bib-order.at(i - 1)) }
  }
  previous
}

// The dash that stands for the authors of the record before.
#let repeat-dash = box(width: 3.6em, baseline: -0.1em, line(
  length: 100%,
  stroke: 0.5pt,
))

// A record of the list: "17. ____, _Expansion of …_, …". A reference inside
// an entry links to its target but is not a mention of it: the pages of
// mentions count the text of the book only.
#let bib-item(key: none) = {
  let record = bibliography-data.at(key)
  let number = bib-numbers.at(key)
  let previous = if key in bib-previous {
    bibliography-data.at(bib-previous.at(key))
  }
  let same = previous != none and previous.author == record.author
  // Another form of a name, printed in brackets after the names.
  let addon = if "nameaddon" in record [ \[#rich-bib-text(record.nameaddon)\]]
  let names = if same { repeat-dash } else {
    [#rich-bib-text(bib-names(record.author))#addon]
  }
  block(
    width: 100%,
    above: bib-line-gap,
    below: bib-line-gap,
    {
      set text(size: bib-size)
      set par(
        leading: bib-line-gap,
        first-line-indent: 0pt,
        justify: true,
      )
      show ref: it => {
        let target = str(it.target)
        if not target.starts-with("bib:") { return it }
        link(it.target, [\[#bib-numbers.at(target.slice(4))\]])
      }
      par(hanging-indent: number-column + number-gap)[#box(
          width: number-column,
          align(right)[#number.],
        )#h(number-gap)#names, #bib-description(key)]
    },
  )
}
