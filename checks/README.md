# Checks kept with the edition

Independent checks of statements from Aĭzenberg and Yuzhakov, *Integral
Representations and Residues in Multidimensional Complex Analysis* (AMS,
1983). They supplement, and never replace, reading the text against the
printed book: none of them establishes that our text matches the book.

* `tests/` — `just test` (and `just check`, and CI): the bibliography is
  generated from `references.bib` and `editorial.bib` (a change of a record
  reaches the printed entry and its links; the editorial references follow
  the list of the book), and statements, formulas, points and examples are
  numbered by counters, sections through the book (an inserted statement
  renumbers the following ones and every reference to them).
* `sage/` — `just check-sage` runs every `*.py` here with `sage -python`
  (last run with SageMath 10.9); one script per chapter, the Preliminaries
  with Chapter I, the Brief Historical Notes with Chapter V. Exact
  arithmetic only — ℤ, ℚ, ℚ(i), algebraic numbers, polynomial, rational
  function and power series rings, exact integrals and limits, Gröbner
  bases and local algebras in Singular; no floating-point value is
  evidence. The scripts check the explicit kernels of the book and their
  normalizing constants (Martinelli–Bochner, Leray–Koppelman,
  Cauchy–Fantappiè, Andreotti–Norguet, Bergman, Szegő, Schwarz, Temlyakov,
  Martinelli–Bochner–Koppelman), exterior-algebra identities and the signs
  of Stokes' formula, residues and their transformation, examples of
  homology and duality, series of implicit and inverse functions, power
  sums of roots of systems, multiplicities of zeros, generating functions
  and combinatorial sums, and the examples and counterexamples of the text
  with all their hypotheses. Expected values are written as literals with
  the printed page and the label they come from; where the book is wrong,
  the printed reading stays in the script as a refuted check beside the
  corrected one. The docstring of each script states what it covers and
  what it does not establish — none certifies an analytic limiting argument
  or a theorem beyond the stated ranges. Each script prints
  `ok <name>: N checks`; the `sage` job of CI runs them one job per
  script.
* `lean/` and `lean-proofs.json` — `just check-lean` compiles the formal
  steps of `lean/AizenbergIntegrals/` against the pinned mathlib (versions
  in `lean/lean-toolchain` and `lean/lake-manifest.json`) and audits their
  axioms: the declarations of the five files, one per chapter, may depend
  only on `propext`, `Classical.choice` and `Quot.sound`. Each record of
  `lean-proofs.json` names its declarations, the passage of the book they
  check, their limitations, and the labels of the checked passages
  (`passages`), which must exist in `content/`: when such a passage
  changes, the proof is reviewed by hand. The declarations prove bounded
  steps — algebraic identities, sign and constant computations,
  inequalities under explicit hypotheses — not the analytic theorems they
  serve.

`just check` runs the tests, builds both PDFs and checks fonts, links,
bookmarks and the sources; `just check-sage` and `just check-lean` run the
mathematical checks, as CI does for every change.
