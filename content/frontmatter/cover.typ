// The cover of Translations of Mathematical Monographs 58 (1983) and the
// display lines of the cover and of the title pages, set from measurements
// of the originals.

// A display line: the origin of its first letter at `x`, its baseline at
// `y` and its size given by the cap height `cap`. A measured `width` is
// reached by scaling the line horizontally (`fit: "scale"`) or by widening
// its word spaces (`fit: "spacing"`); without it the line keeps its natural
// width. `anchor` is the point of the line placed at `x`: its left end, its
// centre or its right end. Further arguments are those of `text`.
#let display-line(
  x,
  y,
  cap,
  body,
  width: none,
  fit: "scale",
  anchor: left,
  ..style,
) = place(top + left, dx: x, dy: y, context {
  let style = style.named()
  let spacing = style.remove("spacing", default: 100%)
  let edges = (top-edge: "baseline", bottom-edge: "baseline")
  let cap-ratio = (
    measure(text(
      ..style,
      size: 100pt,
      top-edge: "cap-height",
      bottom-edge: "baseline",
    )[H]).height
      / 100pt
  )
  let size = cap / cap-ratio
  let set-line(extra) = text(
    ..style,
    ..edges,
    size: size,
    spacing: spacing + extra,
    body,
  )
  let line = set-line(0pt)
  let natural = measure(line).width
  if width != none and fit == "spacing" {
    // The widening of the line per point added to each word space.
    let spaces = (measure(set-line(1pt)).width - natural) / 1pt
    if spaces > 0 {
      line = set-line((width - natural) / spaces)
      natural = width
    }
  }
  let k = if width != none and fit == "scale" { width / natural } else { 1 }
  let shift = if anchor == center { -natural * k / 2 } else if (
    anchor == right
  ) { -natural * k } else { 0pt }
  move(dx: shift, scale(x: k * 100%, origin: left, reflow: true, line))
})

// A display line of a title page measured on the printed page of the
// edition, in pixels of 1/300 in; the text area of the book starts at
// (129, 153) of the printed page: the text block of the full pages is
// centred at 835 px and their first baseline stands at 180.5 px, the cap
// height of 10-pt type (6.62 pt, 27.6 px) below the top of the text area.
// The ink spreads in print: a cap height of 10-pt type measures 29 px,
// so 1.4 px is taken off the measured cap heights.
#let page-px = 1in / 300
#let page-line(x, y, cap, body, width: none, ..args) = display-line(
  (x - 129) * page-px,
  (y - 153) * page-px,
  (cap - 1.4) * page-px,
  body,
  width: if width == none { none } else { width * page-px },
  ..args,
)

// The cover is measured in pixels of 1/300 in on the cover of the
// edition (1800 x 2759 px, 6.0 x 9.2 in), mapped proportionally onto the
// 6 x 9 in page of the book: a horizontal pixel is 6 in / 1800, a vertical
// one 9 in / 2759. A line is given by the origin of its first letter, its
// baseline, its cap height and the right end of its ink. Green type and a
// green band on cream cloth; the type in the band is the cloth left bare.
#let ux = 6in / 1800
#let uy = 9in / 2759
#let cream = rgb(231, 225, 205)
#let green = rgb(44, 136, 8)
#let condensed = (font: "TeX Gyre Heros", stretch: 75%, weight: "bold")
#let heros = (font: "TeX Gyre Heros", weight: "bold")

#let cover-line(x, y, cap, body, right: none, ..args) = display-line(
  x * ux,
  y * uy,
  cap * uy,
  body,
  width: if right == none { none } else { (right - x) * ux },
  ..args,
)

// The corners of an M of the series emblem, clockwise, in pixels of the
// cover: its box `x0`, `y0`, `x1`, `y1`; the inner sides `l` and `r` of its
// legs, which also bound the V cut from the top; the bottom `apex` of that
// V; the top `horn` of the space between the legs and the bottom `vertex`
// of the middle of the M.
#let m-outline(x0, y0, x1, y1, (l, r), apex, horn, vertex) = {
  let mid = (l + r) / 2
  (
    (x0, y0),
    (l, y0),
    (mid, apex),
    (r, y0),
    (x1, y0),
    (x1, y1),
    (r, y1),
    (r, horn),
    (mid, vertex),
    (l, horn),
    (l, y1),
    (x0, y1),
  )
}

// The polygon `points` (listed clockwise) moved inward by `d`: each corner
// goes to the meeting point of its two sides moved by `d`.
#let inset(points, d) = {
  let n = points.len()
  let inward((x0, y0), (x1, y1)) = {
    let length = calc.sqrt(calc.pow(x1 - x0, 2) + calc.pow(y1 - y0, 2))
    ((y0 - y1) / length, (x1 - x0) / length)
  }
  range(n).map(i => {
    let (p, q) = (points.at(i - 1), points.at(i))
    let s = points.at(calc.rem(i + 1, n))
    let (ax, ay) = inward(p, q)
    let (bx, by) = inward(q, s)
    let k = d / (1 + ax * bx + ay * by)
    (q.at(0) + k * (ax + bx), q.at(1) + k * (ay + by))
  })
}

#let on-page(points) = points.map(((x, y)) => (x * ux, y * uy))

// The emblem: a solid M behind and, in front of it, an M drawn by a green
// outline 14.5 px wide and parted from the solid M by a cream margin of
// 4.5 px; the band leaves a cream window around them.
#let emblem = {
  let back = m-outline(124, 1998.5, 588, 2376.5, (297, 423), 2078, 2270.5, 2368)
  let front = m-outline(
    224,
    2144,
    693.5,
    2520,
    (397, 523.5),
    2232.5,
    2414,
    2511.5,
  )
  let line-width = 14.5
  let margin = 4.5
  let middle = on-page(inset(front, line-width / 2))
  let outline(paint, width) = (
    paint: paint,
    thickness: width * uy,
    join: "miter",
    miter-limit: 10,
  )
  place(polygon(fill: green, ..on-page(back)))
  place(polygon(stroke: outline(cream, line-width + 2 * margin), ..middle))
  place(polygon(fill: cream, stroke: outline(green, line-width), ..middle))
}

#let cover() = page(
  width: 6in,
  height: 9in,
  margin: 0pt,
  header: none,
  footer: none,
  numbering: none,
  fill: cream,
)[
  #set text(hyphenate: false, fill: green)
  // The band from 2144 px down, with the window of the emblem.
  #place(top + left, dy: 2144 * uy, rect(
    width: 100%,
    height: 9in - 2144 * uy,
    fill: green,
  ))
  #place(top + left, dx: 96.5 * ux, dy: 2144 * uy, rect(
    width: (722 - 96.5) * ux,
    height: (2547.5 - 2144) * uy,
    fill: cream,
  ))
  #emblem
  // The title and the authors, flush left at 420 px.
  #for (baseline, right, words) in (
    (566, 1546, [Integral Representations]),
    (708, 1033, [and Residues]),
    (849, 1310, [in Multidimensional]),
    (992, 1241, [Complex Analysis]),
  ) {
    cover-line(420, baseline, 88, words, right: right, ..condensed)
  }
  #cover-line(420, 1269, 70, [by], ..condensed)
  #cover-line(552.5, 1269, 70, [L. A. AĬZENBERG], ..condensed)
  #cover-line(552.5, 1386, 70, [A. P. YUZHAKOV], ..condensed)
  // The series, flush left at 797 px.
  #cover-line(
    797,
    2089,
    54,
    [Volume 58],
    right: 1106,
    fit: "spacing",
    ..condensed,
  )
  #set text(fill: cream)
  #cover-line(797, 2277, 37, [TRANSLATIONS OF], right: 1253, ..heros)
  #cover-line(797, 2336, 37, [MATHEMATICAL MONOGRAPHS], right: 1560, ..heros)
  #cover-line(
    797,
    2517,
    43,
    [American Mathematical Society],
    right: 1490,
    font: "TeX Gyre Heros",
  )
]
