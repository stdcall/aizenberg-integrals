# Typesetting conventions

The sources are Typst; `content/main.typ` is the book. Build with
`just build` (the PDF goes to `build/`), check with `just check`, format with
`just fmt`. Lines are at most 80 characters; a long display formula is
broken across source lines (a line break in a formula is a space).

## Pages

The page is 6 × 9 in with a measure of 339 pt and 40 lines of 10/13 pt TeX
Gyre Termes; formulas are set in TeX Gyre Termes Math. The book was set in
Monotype Times, a little wider at the same size, so our lines hold a little
more text and our page breaks differ from the edition's. Running heads, in
capitals: a left-hand page has the folio and the short title of the
chapter ("I. INTEGRAL REPRESENTATIONS"), a right-hand page the short title of
the section that starts on the page or runs through it ("§1. THE
MARTINELLI-BOCHNER REPRESENTATION") and the folio. The short titles are
those of the edition (`running-titles` in `content/book-style.typ`). The
opening pages of chapters and of the front and back matter have no head and
their folio centred at the foot. Footnotes are numbered "(1)", "(2)", …
through a chapter (the Preliminaries count as one), as printed.

The front matter is numbered i–x as in the 1983 edition: i half-title, ii
blank, iii title, iv copyright page, v–vi Contents, vii–x Preface. The main
text starts again at 1 with the Preliminaries. Chapters and the parts of the
front and back matter begin on a right-hand page; sections run on. The
cover is outside the count and comes first in the PDF, so the right-hand
pages (odd folios) are the even pages of the file; `recto-break()` in
`book-style.typ` starts the next right-hand page and leaves the blank page it
may insert without head or folio.

## Files

One file per section, `content/CC-SS-<name>.typ`, included by `main.typ`:
`01-00-…` holds the heading of Chapter I, `01-01-…` its §1, `02-08-…` §8
(the first section of Chapter II), and so on; `00-preliminaries.typ` the
Preliminaries. A file starts with

```typst
#import "main-defs.typ": *
#import "statements.typ": *
#import "symbols.typ": *
```

then the heading: `= Integral Representations and the Logarithmic Residue
<ch:integral-representations>` (chapter), `== The Martinelli-Bochner integral
representation <sec:martinelli-bochner>` (section §1; the sections are
numbered through the book by the style). A heading longer than a source line
is a call, `#heading(level: 2)[The Bergman kernel function, … on the Shilov
boundary] <sec:kernels>`. The section labels are fixed in `running-titles`
of `content/book-style.typ`. A note of the editor of the translation, marked
"*" in the book (in the heading of §4), is `#translation-note[…]`.

`#source(n)` marks where page `n` of the 1983 file begins (printed page +
14): before the first word of the page, also inside a statement or a proof;
if the page begins with a heading, at the start of the first paragraph after
it.

## Points

A section is divided into numbered points 1°, 2°, …: `#point` at the start
of the paragraph prints "**1°**." (bold numeral). A point that opens a
statement or a proof is the first thing in its body:
`#theorem[#point <pt:…> Suppose …] <th:…>` prints "1°. THEOREM 1.1. …". A
point referred to elsewhere has a label right after it: `#point <pt:…>`;
`@pt:…` prints "2°". In the Preliminaries a point has a bold title:
`#point *Integration of differential forms. Stokes' formula.* We assume …`.

## Statements

Theorems, lemmas, corollaries and propositions share one counter per
section, "Lemma 1.3" (the Preliminaries are section 0: "Corollary 0.4"); no
number is written in the source.

- `#theorem[…] <th:…>`, `#lemma[…] <lem:…>`, `#corollary[…] <cor:…>`,
  `#proposition[…] <prop:…>` print "THEOREM 1.1." in capitals and small
  capitals, indented like a paragraph, and set the statement in italic.
- A name: `#theorem(title: [Aronov and Kytmanov])[…]` prints "THEOREM 1.2
  (Aronov and Kytmanov)."; an index mark may stand inside the title.
- A footnote of the book right after the number ("THEOREM 14.1(¹)"):
  `#theorem(title: […], note: [the footnote])[…]`.
- Unnumbered: `#remark[…]`, `#example[…]`, `#definition[…]` ("REMARK.",
  upright), `#unnumbered([Examples])[…]` for another head; `slant: true`
  for an italic one.
- Examples numbered in a section ("EXAMPLE 1.", "EXAMPLE 2 (a ball).") are
  counted: `#eg[…] <exm:…>`, `#eg(title: [a ball])[…] <exm:ball>`; `@exm:…`
  prints the number.
- `#proof[…]` prints "PROOF." in small capitals and closes with the white
  square □ after a space (at the end of a closing display, in the last item
  of a closing list); `qed: false` where the book has none,
  `title: [Proof of Theorem~@th:….]` for another head, `title: none` for an
  argument that the book closes with □ without a head.
- `#property[…] <st:…>` prints "PROPERTY 0.12." (the properties of
  determinants in the Preliminaries).
- Passages the book sets in small print (8 on 10 pt) are wrapped in
  `#small-print[…]`; statements and labels inside keep their helpers.
- `#roman-text[…]` sets words upright inside an italic statement (a formula
  number referred to inside a statement is upright by itself).
- Lists: `+` items print "a)", "b)", … upright, indented 1 em, as printed;
  other styles with `#enum(numbering: …)[…][…]`.
- The paragraph after a statement or proof is a new, indented paragraph;
  text after a display formula or a list continues at the margin, as
  printed; where the book starts a new, indented paragraph right after a
  display or a list, the source has `#new-par`. Steps "1.", "2." of a proof
  are written `1\.` (a bare `1. ` at the start of a line would make a list).

## Labels and references

Put a literal semantic label right after its target. Prefixes: `ch:`,
`sec:` (§), `pt:` (a point), `th:`, `lem:`, `cor:`, `prop:`, `eq:`, `fig:`,
`bib:`.

References are native: `@th:…` prints "1.1"; write the word yourself:
`Theorem~@th:…`, `Corollary~@cor:…`. `@sec:…` prints "§3", `@pt:…` "2°",
`@eq:…` "(1.4)"; inside formulas write `#[@eq:…]`. A page reference ("see
p. 156") is `p.~@label[page]`; a passage without a number gets an invisible
anchor `#anchor <para:…>`.

While the book is being typeset, a reference to a target in another part
that is not typeset yet is a placeholder `@x:th-0.10`, `@x:cor-0.4`,
`@x:eq-0.1`, `@x:sec-3`, `@x:pt-3-2` (kind, then the printed number; for a
point, section and point): it prints the number and is replaced by the
semantic label when the target exists.

Citations `@bib:Key` print the number of the bibliography, "[133]"; a
locator inside the brackets is the supplement: `@bib:Key[p.~5]` prints
"[133, p. 5]". The keys are those of `references.bib` (Latin surname of the
first author and the year: `Aizenberg1961a`).

## Formulas

- Only labelled display formulas are numbered, "(1.13)" at the right
  margin, in one series per section, as printed: `$ … $ <eq:…>`. Label every
  display that the book numbers. A symbolic tag "(*)" is
  `#tagged-equation([$*$], $ … $) <eq:…>`. Where the book passes over a
  formula number, `#skipped-formula-number` before the next formula keeps
  the printed numbers. A numbered display stays on one page; one too wide
  to stand centred beside its number is centred in the room left of it,
  and one too wide for that has its number on a line below, at the margin.
  The spacing around displays and section titles is set in the style from
  measurements of the printed pages.
- A display of several lines lines up as printed: `&` before the aligned
  sign of relation in each row, or, where the book starts the first row at
  the margin and indents the others (a display wider than the measure),
  `& first row \ & quad = …`.
- Words inside a display are upright strings (`"if"`); conditions after a
  formula stand after `quad`: `F^+ (z) - F^- (z) = f(z), quad z in partial
  D.`; cases: `cases(f(z)\, quad & z in D, 0\, & z in.not overline(D))`.
- Notation helpers are in `content/symbols.typ`: `CC`, `RR`, `ZZ`, `NN`
  print the bold upright C, R, Z, N of the book (not double-struck); `dbar`
  (∂̄), `relcomp` (⋐), the operators `Re`, `Im`, `supp`, `interior` ("int"),
  `dist`, `rank`, `grad`, `res`, `Res`, `sign`, `diam`, `Hom`, `Ker`.
- The closure of a set is `overline(D)`, conjugates `overline(zeta)`;
  `d overline(zeta)_([k])` for dζ̄[k]; `C^((1)) (overline(D))` for
  C⁽¹⁾(D̄).
- The push-forward of chains, f with a tilde under it, is `utilde(f)`;
  ⟨w, z⟩ is `chevron.l w, z chevron.r`; `meas`, `II` (the bold multi-index
  I) are in `symbols.typ`.
- Write `f_i lr((x))` when a subscripted symbol is followed by an argument
  (`nu_f (zeta)` with a space works as well).
- Capital Greek letters are upright (Ω, Δ), as printed.
- Write `$C^1$-norm`: the style keeps the hyphen with the formula.

## Corrections and notes

Errors of the 1983 text are corrected minimally in the source; every change
is recorded in `corrections.json` (printed page, place, printed and
corrected reading in Typst markup, reason, how it was verified). The list of
corrections is built into a separate PDF (`just corrections`). An editorial
note `#ed-note[…]` is added only where the reader needs an explanation of a
deviation from the book; it is a footnote with its own marks "*1)", "*2)",
…, and the helper appends "— Ed.". The AMS correction notice bound in the
edition (the first author is L. A., not I. A., Aĭzenberg) is applied.

## Index and notation

The Subject Index and the Index of Notation are generated from marks in the
text. Subject index: `#index-mark("Formula", sub: "Stokes'")`, a subentry of
a subentry with `subsub:`, a cross-reference `see:`/`also:`; a mark
referring to a statement or heading names it: `target: <th:…>`. A subentry
with a formula is a string of markup: `sub: "$n$-circular"`. Index of
Notation: `#notation-mark($A_C (D)$)`, with `sort: "omega"` where the
letters of the formula do not give its place. Marks add no space; put them
right before the word or after the formula they describe.
