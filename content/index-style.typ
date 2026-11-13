#import "main-defs.typ": index-destination, index-page, index-room

// The Subject Index as printed (pp. 279-281): one alphabet in two columns,
// 9 on 10 pt, a blank line between the letters. Every line names its whole
// entry, "Boundary, Shilov, of a set Q with respect to a family E, 42"; the
// parts it shares with the line above are replaced by a dash, "____, ____,
// of a domain, 44". An entry without pages of its own is printed with its
// first subentry. A turned line is indented. Marks name the heading
// (`term`), the subentry (`sub`) and the subsubentry (`subsub`) as printed.

// Letters and figures only; a formula sorts as it reads: "$n$-circular"
// under n, "$overline(partial)$-problem" under d.
#let sort-key(name) = {
  let read(formula) = formula
    .text
    .replace(regex("\b(cal|overline|hat|tilde|bold|upright)\("), "")
    .replace("partial", "d")
  lower(name.replace(regex("\$[^$]*\$"), read)).replace(
    regex("[^\p{L}0-9]"),
    "",
  )
}

// Names are strings of markup: "$n$-circular" gets its formula.
#let shown(name) = eval(name, mode: "markup")

// Pages joined into ranges, each page a link to the first mark on it.
#let page-list(marks) = {
  let pages = ()
  for mark in marks.sorted(key: index-page) {
    let page = index-page(mark)
    if pages.len() == 0 or pages.last().page != page {
      pages.push((page: page, mark: mark))
    }
  }
  let locator(entry) = box(context {
    let destination = index-destination(entry.mark)
    let printed = str(entry.page)
    metadata((
      kind: "page-reference",
      target: "index-mark",
      resolved: true,
      target-position: destination.position(),
      destination-offset-pt: 10,
      description: printed,
      printed: printed,
    ))
    link(destination, printed)
  })
  let runs = ()
  for entry in pages {
    if runs.len() > 0 and runs.last().last().page + 1 == entry.page {
      runs.last().push(entry)
    } else { runs.push((entry,)) }
  }
  runs
    .map(run => if run.len() == 1 { locator(run.first()) } else {
      // A range is not broken at its dash.
      [#locator(run.first())#sym.wj–#sym.wj#locator(run.last())]
    })
    .join[, ]
}

// The dash that stands for a repeated part of an entry.
#let repeat-dash = box(width: 2.4em, baseline: -0.1em, line(
  length: 100%,
  stroke: 0.5pt,
))

// A line of the index; a turned line stands 1.2 em in.
#let index-line(body) = block(
  width: 100%,
  breakable: false,
  spacing: 10pt - 0.662 * 9pt,
  pad(left: 1.2em, par(
    hanging-indent: 1.2em,
    first-line-indent: 0pt,
  )[#h(-1.2em)#body]),
)

#let new-node(name) = (
  name: name,
  marks: (),
  see: none,
  also: none,
  children: (:),
)

#let index-entries() = context {
  let heads = (:)
  for mark in query(<index-mark>) {
    let path = mark.value.path
    // Insert along the path, keeping the nodes as dictionaries.
    let add(nodes, path) = {
      let name = path.first()
      let node = nodes.at(name, default: new-node(name))
      if path.len() == 1 {
        node.marks.push(mark)
        if mark.value.see != none { node.see = mark.value.see }
        if mark.value.also != none { node.also = mark.value.also }
      } else {
        node.children = add(node.children, path.slice(1))
      }
      nodes.insert(name, node)
      nodes
    }
    heads = add(heads, path)
  }
  // A cross-reference names an entry as printed: a heading, or a heading
  // with its subentry.
  let first-place(node) = {
    let marks = node.marks
    for child in node.children.values() {
      marks += child.marks
      for grandchild in child.children.values() { marks += grandchild.marks }
    }
    if marks.len() == 0 { none } else {
      index-destination(marks.sorted(key: index-page).first())
    }
  }
  let target(name) = {
    let node = heads.at(name, default: none)
    if node != none { return first-place(node) }
    let (head, ..rest) = name.split(", ")
    let node = heads.at(head, default: none)
    if node != none and rest.len() > 0 {
      let child = node.children.at(rest.join(", "), default: none)
      if child != none { return first-place(child) }
    }
    none
  }
  let cross(name) = {
    let place = target(name)
    if place == none { shown(name) } else { link(place, shown(name)) }
  }
  let detail(node) = {
    let paged = node.marks.filter(m => m.value.see == none)
    let pages = if paged.len() > 0 [, #page-list(paged)]
    let see = if node.see != none [, _see_ #cross(node.see)]
    let also = if node.also != none [; _see also_ #cross(node.also)]
    [#pages#see#also]
  }
  let ordered(nodes) = nodes.values().sorted(key: it => sort-key(it.name))
  // The printed lines: every entry with pages or a cross-reference, with
  // its path.
  let rows = ()
  let walk(node, path) = {
    let path = path + (node.name,)
    let own = node.marks.len() > 0
    let found = if own { ((path: path, node: node),) } else { () }
    for child in ordered(node.children) { found += walk(child, path) }
    found
  }
  for head in ordered(heads) { rows += walk(head, ()) }
  let letter = none
  let previous = ()
  for row in rows {
    let initial = sort-key(row.path.first()).first()
    if letter != none and initial != letter {
      v(10pt, weak: true)
      previous = ()
    }
    letter = initial
    let parts = ()
    let same = true
    for (i, name) in row.path.enumerate() {
      same = (
        same
          and i < row.path.len() - 1
          and i < previous.len()
          and previous.at(i) == name
      )
      parts.push(if same { repeat-dash } else { shown(name) })
    }
    index-line[#parts.join[, ]#detail(row.node)]
    previous = row.path
  }
}

#let subject-index(body) = {
  set par(justify: false, leading: 10pt - 0.662 * 9pt)
  set text(size: 9pt)
  show math.equation.where(block: false): index-room
  columns(2, gutter: 14pt, body)
}
