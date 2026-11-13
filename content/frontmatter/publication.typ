// Page iv: the copyright page. Every block stands with its first baseline
// where it is on the page of the edition, and a centred line with its
// centre where it is printed (the lines are not all centred on the text
// block), measured in pixels of the page (see `page-line` in `cover.typ`).
// Lines are set on their baselines, so the leading is the distance between
// baselines. Times (TeX Gyre Termes) in the sizes of the edition, the
// paragraphs justified with their printed line breaks. The 8-pt Monotype
// Times of the classification and the abstract has the figures of Termes
// but wider letters: the classification is set at 8 pt, the abstract at
// 8.5 pt, which matches its printed lines. The Russian title block in
// Liberation Serif Bold, a Times design with Cyrillic; the lines of the
// title as wide as printed.
#import "../main-defs.typ": source
#import "cover.typ": page-line, page-px

#let at(y, body, centre: none) = place(
  top + left,
  dy: (y - 153) * page-px,
  block(width: 100%, if centre == none { body } else {
    align(center, move(dx: (centre - 835) * page-px, body))
  }),
)
// The word spaces of the Russian block are about twice the normal ones.
#let russian(centre, y, cap, width, body) = page-line(
  centre,
  y,
  cap,
  body,
  width: width,
  fit: "spacing",
  anchor: center,
  font: "Liberation Serif",
  weight: "bold",
  spacing: 200%,
)
// The wider space after a full stop in the catalog data.
#let stop = h(3.4pt)
#let br = linebreak(justify: true)

#source(8)
#set text(top-edge: "baseline", bottom-edge: "baseline", hyphenate: false)
#set par(first-line-indent: 0pt, justify: false, spacing: 0pt)
#russian(824, 97, 36, 1304)[ИНТЕГРАЛЬНЫЕ ПРЕДСТАВЛЕНИЯ И ВЫЧЕТЫ]
#russian(824.5, 159, 36, 1265)[В МНОГОМЕРНОМ КОМПЛЕКСНОМ АНАЛИЗЕ]
#russian(824.5, 259, 36, 1003)[Л. А. АЙЗЕНБЕРГ И А. П. ЮЖАКОВ]
#russian(831.5, 447, 31, none)[ИЗДАТЕЛЬСТВО «НАУКА»]
#russian(832.5, 498, 31, none)[СИБИРСКОЕ ОТДЕЛЕНИЕ]
// "Новосибирск" in capitals and small capitals (Liberation Serif has no
// small capitals: capitals of 0.76 the size, as printed).
#russian(832.5, 548, 31, none)[Н#text(size: 0.76em)[ОВОСИБИРСК] 1979]

#at(672, centre: 824)[Translated from the Russian by H. H. McFaden]
#at(721, centre: 834.5)[Translation edited by Lev J. Leifman]

#[
  #set text(overhang: false)
  #set par(leading: 10pt, justify: true)
  #let indented = par.with(first-line-indent: (amount: 8pt, all: true))
  #at(814, indented(text(size: 8pt)[1980 _Mathematics Subject Classification._
    Primary 32–02, 32A25, 32A27; Secondary 05A15,#br 30C15, 30C40, 30E20, 32A05,
    32A30, 32C10, 32C25, 32C30, 32C37, 32C40, 32D05, 32E05, 32E10,#br 32F15,
    32F20, 32H10.]))
  #set text(size: 8.5pt)
  #at(999)[#smallcaps[Abstract]. This book deals with integral representations
    of holomorphic functions of several#br complex variables, the
    multidimensional logarithmic residue, and the theory of multidimensional#br
    residues. Applications are given to implicit function theory, systems of
    nonlinear equations,#br computation of the multiplicity of a zero of a
    mapping, and computation of combinatorial sums in#br closed form. Certain
    applications in multidimensional complex analysis are considered.]
  #at(1208, indented[The monograph is intended for specialists in theoretical
    and applied mathematics and theoreti-#br cal physics, and for post graduate
    and graduate students interested in multidimensional complex#br analysis or
    its applications.])
]

#at(1416, text(weight: "bold")[Library of Congress Cataloging in Publication
  Data])
#at(1478, {
  set par(leading: 12pt, spacing: 12pt)
  set block(spacing: 12pt)
  let entry(body) = par(first-line-indent: (amount: 24pt, all: true), body)
  [Aĭzenberg, Lev Abramovich, 1937–]
  entry[Integral representations and residues in multidimensional complex
    analysis.]
  entry[(Translations of mathematical monographs; v. 58)]
  entry[Translation of: Integralʹnye predstavleni͡ia i vychety v mnogomernom\
    kompleksnom analize.]
  entry[Bibliography: p.]
  entry[Includes indexes.]
  entry[1.#stop Holomorphic functions.#stop 2.#stop Integral
    representations.#stop 3.#stop Congruences\ and residues.#stop I.#stop
    I͡Uzhakov, Aleksandr Petrovich.#stop II.#stop Title.#stop III.#stop Series.]
  grid(
    columns: (78.5pt, 76pt, 90pt, auto),
    [QA331.A46413], [1983], [515.9′8], [83-15549],
  )
  [ISBN 0-8218-4511-X]
})

#[
  #set text(size: 9pt)
  #at(2088.5, centre: 854, emph[All rights reserved except those granted to the
    United States Government])
  #at(2130, centre: 850.5)[This book may not be reproduced in any form without
    permission of the publisher.]
]
#at(2193.5, centre: 850)[Copyright © 1983 by the American Mathematical Society]
