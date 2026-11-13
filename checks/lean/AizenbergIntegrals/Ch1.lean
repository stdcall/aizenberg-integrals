import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Tactic

/-!
# Preliminaries and Chapter I, §§1–7: bounded steps

Aĭzenberg and Yuzhakov, *Integral Representations and Residues in
Multidimensional Complex Analysis* (AMS, 1983), printed pp. 1–58.  Each
declaration proves one bounded step of the text with its hypotheses stated
explicitly; no integral, limit, holomorphy or homology argument is
formalised.  The exact identities of the chapter (kernels, constants, signs,
residues) are checked in `checks/sage/ch1.py`.

* `shilov_unique_step`, `shilov_far_bound`, `shilov_lambda_exists`
  (Theorem 6.1, p. 43, uniqueness of the Shilov boundary): with `z` a point
  of `S¹ ∩ U(z⁰, r)` (one coordinate `z_i`), `z1 = z_i¹` and the corrected
  hypothesis `r ≤ |z_i¹ - z_i⁰|` (the polydisk `U(z⁰, r)` is open,
  correction i-43-polydisk-complement),
  `|z_i - z_i¹ - λ(z_i⁰ - z_i¹)| < λ |z_i⁰ - z_i¹|` for `λ > 1`; off the
  polydisk the same quantity is at most `R + λ|z_i⁰ - z_i¹|`; and a `λ > 1`
  with `m + ln(R + λ B) < M + ln(λ B)` exists for `m < M`, `R ≥ 0`, `B > 0`
  (here `B = |z_i⁰ - z_i¹| ≥ r > 0`).
* `bergman_diagonal_bound` (Theorem 6.4, p. 45, (6.6)): from
  `S ≥ S²/c²` with `S = ∑_{m ≤ M} |φ_m(a)|² ≥ 0` and `c > 0` follows `S ≤ c²`.
* `example3_bound`, `example3_attained` (§6, Example 3, p. 44): for `l > 0`,
  `-m s - l s² ≤ m²/(4l)` with equality at `s = -m/(2l)`; with
  `s = ln|z₁|` and `|z₂| = |z₁|^(-ln|z₁|)` this is the maximum of
  `ln|z₁^(-m) z₂^l|` on the closure of the domain, attained at
  `|z₁| = exp(-m/(2l))`.
* `rouche_remark`, `rouche_remark_printed` (Remark after Theorem 2.5,
  p. 20, correction i-20-remark-absolute-values): for real parts `a = Re f_j`,
  `b = Re g_j` (the imaginary parts likewise), `|b| < |a|` and `0 ≤ t ≤ 1`
  give `a + t b ≠ 0`; the printed `b < a` does not (`a = 1`, `b = -1`,
  `t = 1`).

Notation: real numbers stand for moduli, real parts and logarithms of the
text; the hypotheses are exactly those named above.  Not covered: the
existence of Shilov boundaries (Zorn's lemma), the orthonormal-system and
convergence arguments of Theorem 6.4, the description of `S(D)` in
Example 3, the zero counts of Theorem 2.5.
-/

namespace AizenbergIntegrals.Ch1

/-! ## Theorem 6.1: uniqueness of the Shilov boundary -/

/-- Theorem 6.1, p. 43: for `|z - z0| < r ≤ |z0 - z1|` and `λ > 1`,
`|z - z1 - λ (z0 - z1)| < λ |z0 - z1|`. -/
theorem shilov_unique_step (z z0 z1 : ℂ) (r lam : ℝ) (hz : ‖z - z0‖ < r)
    (h1 : r ≤ ‖z0 - z1‖) (hlam : 1 < lam) :
    ‖z - z1 - (lam : ℂ) * (z0 - z1)‖ < lam * ‖z0 - z1‖ := by
  have hsplit : z - z1 - (lam : ℂ) * (z0 - z1)
      = (z - z0) + ((1 - lam : ℝ) : ℂ) * (z0 - z1) := by
    push_cast
    ring
  have hn : ‖((1 - lam : ℝ) : ℂ) * (z0 - z1)‖ = (lam - 1) * ‖z0 - z1‖ := by
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs,
      abs_of_neg (by linarith)]
    ring
  rw [hsplit]
  calc ‖(z - z0) + ((1 - lam : ℝ) : ℂ) * (z0 - z1)‖
      ≤ ‖z - z0‖ + ‖((1 - lam : ℝ) : ℂ) * (z0 - z1)‖ := norm_add_le _ _
    _ = ‖z - z0‖ + (lam - 1) * ‖z0 - z1‖ := by rw [hn]
    _ < lam * ‖z0 - z1‖ := by linarith

/-- Theorem 6.1, p. 43: off the polydisk,
`|z - z1 - λ (z0 - z1)| ≤ R + λ |z0 - z1|` whenever `|z - z1| ≤ R`. -/
theorem shilov_far_bound (z z0 z1 : ℂ) (R lam : ℝ) (hR : ‖z - z1‖ ≤ R)
    (hlam : 0 ≤ lam) :
    ‖z - z1 - (lam : ℂ) * (z0 - z1)‖ ≤ R + lam * ‖z0 - z1‖ := by
  have hn : ‖(lam : ℂ) * (z0 - z1)‖ = lam * ‖z0 - z1‖ := by
    rw [norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hlam]
  calc ‖z - z1 - (lam : ℂ) * (z0 - z1)‖
      ≤ ‖z - z1‖ + ‖(lam : ℂ) * (z0 - z1)‖ := norm_sub_le _ _
    _ ≤ R + lam * ‖z0 - z1‖ := by rw [hn]; linarith

/-- Theorem 6.1, p. 43: the choice of `λ`: for `m < M`, `R ≥ 0`, `B > 0`
there is `λ > 1` with `m + ln(R + λ B) < M + ln(λ B)`. -/
theorem shilov_lambda_exists (m M R B : ℝ) (hmM : m < M) (hR : 0 ≤ R)
    (hB : 0 < B) :
    ∃ lam : ℝ, 1 < lam ∧ m + Real.log (R + lam * B) < M + Real.log (lam * B) := by
  set c := Real.exp (M - m) with hc
  have hc1 : 1 < c := Real.one_lt_exp_iff.mpr (by linarith)
  have hcB : 0 < (c - 1) * B := mul_pos (by linarith) hB
  refine ⟨R / ((c - 1) * B) + 2, ?_, ?_⟩
  · have : 0 ≤ R / ((c - 1) * B) := div_nonneg hR hcB.le
    linarith
  · set lam := R / ((c - 1) * B) + 2 with hlam
    have hl0 : 0 < lam := by
      have : 0 ≤ R / ((c - 1) * B) := div_nonneg hR hcB.le
      linarith
    have hlB : 0 < lam * B := mul_pos hl0 hB
    have key : R + lam * B < c * (lam * B) := by
      have e : (c - 1) * (lam * B) = R + 2 * ((c - 1) * B) := by
        have h1 : c - 1 ≠ 0 := by linarith
        have h2 : B ≠ 0 := hB.ne'
        rw [hlam]
        field_simp
      nlinarith
    have hpos : 0 < R + lam * B := by linarith
    have hlog : Real.log (R + lam * B) < Real.log (c * (lam * B)) :=
      Real.log_lt_log hpos key
    rw [Real.log_mul (by positivity) hlB.ne', hc, Real.log_exp] at hlog
    linarith

/-! ## Theorem 6.4: the bound (6.6) -/

/-- Theorem 6.4, p. 45: `S ≥ S²/c²`, `S ≥ 0`, `c > 0` give `S ≤ c²`. -/
theorem bergman_diagonal_bound (S c : ℝ) (hS : 0 ≤ S) (hc : 0 < c)
    (h : S ^ 2 / c ^ 2 ≤ S) : S ≤ c ^ 2 := by
  have hc2 : 0 < c ^ 2 := by positivity
  have h' : S ^ 2 ≤ S * c ^ 2 := by
    rwa [div_le_iff₀ hc2] at h
  rcases hS.lt_or_eq with hpos | hzero
  · nlinarith
  · rw [← hzero]
    exact hc2.le

/-! ## §6, Example 3 -/

/-- §6, Example 3, p. 44: `-m s - l s² ≤ m²/(4l)` for `l > 0`. -/
theorem example3_bound (m l s : ℝ) (hl : 0 < l) :
    -m * s - l * s ^ 2 ≤ m ^ 2 / (4 * l) := by
  have key : m ^ 2 / (4 * l) - (-m * s - l * s ^ 2)
      = l * (s + m / (2 * l)) ^ 2 := by
    field_simp
    ring
  have : 0 ≤ l * (s + m / (2 * l)) ^ 2 := mul_nonneg hl.le (sq_nonneg _)
  linarith

/-- §6, Example 3, p. 44: the bound is attained at `s = -m/(2l)`. -/
theorem example3_attained (m l : ℝ) (hl : 0 < l) :
    -m * (-m / (2 * l)) - l * (-m / (2 * l)) ^ 2 = m ^ 2 / (4 * l) := by
  field_simp
  ring

/-! ## §2, the Remark after Theorem 2.5 -/

/-- Remark after Theorem 2.5, p. 20 (corrected): `|b| < |a|` and
`0 ≤ t ≤ 1` give `a + t b ≠ 0` (`a = Re f_j`, `b = Re g_j`). -/
theorem rouche_remark (a b t : ℝ) (ht0 : 0 ≤ t) (ht1 : t ≤ 1)
    (h : |b| < |a|) : a + t * b ≠ 0 := by
  intro h0
  have ha : a = -(t * b) := by linarith
  have : |a| ≤ |b| := by
    rw [ha, abs_neg, abs_mul, abs_of_nonneg ht0]
    nlinarith [abs_nonneg b]
  linarith

/-- Remark after Theorem 2.5, p. 20 (printed): `b < a` does not give
`a + t b ≠ 0` for `0 ≤ t ≤ 1`. -/
theorem rouche_remark_printed :
    ¬ ∀ a b t : ℝ, 0 ≤ t → t ≤ 1 → b < a → a + t * b ≠ 0 := by
  intro h
  exact h 1 (-1) 1 (by norm_num) (by norm_num) (by norm_num) (by norm_num)

end AizenbergIntegrals.Ch1

#print axioms AizenbergIntegrals.Ch1.shilov_unique_step
#print axioms AizenbergIntegrals.Ch1.shilov_far_bound
#print axioms AizenbergIntegrals.Ch1.shilov_lambda_exists
#print axioms AizenbergIntegrals.Ch1.bergman_diagonal_bound
#print axioms AizenbergIntegrals.Ch1.example3_bound
#print axioms AizenbergIntegrals.Ch1.example3_attained
#print axioms AizenbergIntegrals.Ch1.rouche_remark
#print axioms AizenbergIntegrals.Ch1.rouche_remark_printed
