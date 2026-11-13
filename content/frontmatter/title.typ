// Page iii: the title page, measured on the edition: each line
// by the origin of its first letter, its baseline and cap height and, where
// given, its width, in pixels (see `page-line`). The series in a bold
// grotesque, slightly letterspaced, with wide word spaces; the title, the
// authors and the volume number in a condensed bold grotesque; the
// publisher in an Optima-like face, set here in the bold grotesque.
#import "../main-defs.typ": source
#import "cover.typ": page-line

#let heros = (font: "TeX Gyre Heros", weight: "bold")
#let condensed = (font: "TeX Gyre Heros", stretch: 75%, weight: "bold")

#source(7)
#page-line(
  189.5,
  107,
  35,
  width: 1274.5,
  fit: "spacing",
  tracking: 0.4pt,
  ..heros,
)[TRANSLATIONS OF MATHEMATICAL MONOGRAPHS]
#page-line(1159, 220, 35, tracking: 0.4pt, ..heros)[VOLUME]
#page-line(1396, 220, 57, ..condensed)[58]
// The title and "by", flush left at 389 px; the names at 503 px.
#for (baseline, width, words) in (
  (623, 911, [Integral Representations]),
  (736, 496, [and Residues]),
  (850, 726, [in Multidimensional]),
  (963, 672, [Complex Analysis]),
) {
  page-line(389, baseline, 70, width: width, ..condensed, words)
}
#page-line(389, 1176, 55, ..condensed)[by]
#page-line(503, 1176, 55, ..condensed)[L. A. AĬZENBERG]
#page-line(503, 1263, 55, ..condensed)[A. P. YUZHAKOV]
// The publisher, its parts at their places on the line.
#for (x, width, words) in (
  (195.5, 668.5, [American Mathematical Society]),
  (920, 232, [Providence]),
  (1205, 271, [Rhode Island]),
) {
  page-line(x, 2226, 32.5, width: width, ..heros, words)
}
#for x in (895, 1180.5) {
  page-line(x, 2226, 32.5, anchor: center, ..heros)[·]
}
