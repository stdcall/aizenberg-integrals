// Page i: the half-title, measured on the edition (positions,
// cap heights and widths in pixels, see `page-line`): the title in a
// condensed bold grotesque, each line centred on the text block.
#import "../main-defs.typ": source
#import "cover.typ": page-line

#let title-line(y, width, body) = page-line(
  835,
  y,
  54,
  body,
  width: width,
  anchor: center,
  font: "TeX Gyre Heros",
  stretch: 75%,
  weight: "bold",
)

#source(5)
#title-line(616, 1069)[Integral Representations and Residues]
#title-line(715, none)[in]
#title-line(815, 990)[Multidimensional Complex Analysis]
#pagebreak()
