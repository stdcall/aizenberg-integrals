import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.NormNum

/-!
# Chapter II: bounded steps

Aizenberg and Yuzhakov, *Integral Representations and Residues in
Multidimensional Complex Analysis* (AMS, 1983), Chapter II, §8-§10,
printed pp. 59-73.

* `levi_expansion` (§8, 3°, p. 61-62, `eq:linearly-convex-levi`, the
  restored formula (8.6)): the Levi determinant
  `L(ρ) = - det [[0, ρ'_ζ], [ρ'_ζ̄, ρ''_{ζ ζ̄}]]` expands along its first
  column as `L(ρ) = ∑ₗ (-1)^(l-1) ρ'_{ζ̄_l} δ_l`, with `δ_l` the
  determinants of (8.5) (first row `ρ'_{ζ_1}, …, ρ'_{ζ_n}`, then the rows
  `ρ''_{ζ_1 ζ̄_k}, …, ρ''_{ζ_n ζ̄_k}`, `k ≠ l`, in their order).  This is
  the identity behind (8.6); the relation between the forms `dζ̄_[k] ∧ dζ`
  on `Γ_m` is checked in `checks/sage/ch2.py` (section C).
  Notation: `n = m + 1`, indices from `0`; `b j = ρ'_{ζ_j}`,
  `a l = ρ'_{ζ̄_l}`, `H j l = ρ''_{ζ_j ζ̄_l}`, entries of any commutative
  ring (the values at a point).
* `bochner_ono_chain`, `bochner_ono_ne_zero` (§8, 4°, p. 63, the chain of
  inequalities before `eq:bochner-ono`, correction ii-63-bochner-ono-chain):
  `|⟨ζ̄ - v̄, ζ - z⟩| ≥ |ζ - v| (|ζ - v| - |z - v|)`, hence the denominator
  of (8.9) does not vanish when `|z - v| < |ζ - v|` (for `z ∈ B_r(v)` and
  `ζ ∈ ∂D`, `B_r(v) ⊂ D`).  Stated in any complex inner product space;
  the book's `⟨ζ̄ - v̄, ζ - z⟩ = ∑ (ζ̄_k - v̄_k)(ζ_k - z_k)` is mathlib's
  `⟪ζ - v, ζ - z⟫_ℂ` on `ℂⁿ` (conjugate-linear in the first argument).
* `lemma_10_7_bound`, `lemma_10_7_quotient`, `lemma_10_7_printed_false`
  (§10, proof of Lemma 10.7, p. 72, `lem:log-integral-estimate`):
  `r^(2n-3)/(r² + ε²)^(n-1) ≤ 2^(n-1)/(r + ε)` for `r, ε > 0`, `n ≥ 2`
  (written with `n = m + 2`); the printed bound without `2^(n-1)` fails
  for `n = 2`, `r = 2`, `ε = 1`.

Not covered: the analytic parts (integral formulas, Stokes' theorem,
spherical coordinates, the exterior algebra on `∂D`), the hypotheses on
`D` and `ρ`.
-/

namespace AizenbergIntegrals.Ch2

open scoped BigOperators
open Matrix

/-! ## (8.6): the Levi determinant -/

variable {R : Type*} [CommRing R]

/-- The bordered matrix of the Levi determinant (p. 62): first row
`(0, b_1, …, b_n)`, then the rows `(a_l, H 1 l, …, H n l)`. -/
def bordered {m : ℕ} (b a : Fin (m + 1) → R) (H : Matrix (Fin (m + 1)) (Fin (m + 1)) R) :
    Matrix (Fin (m + 2)) (Fin (m + 2)) R :=
  Matrix.of fun i j =>
    Fin.cases (Fin.cases 0 b j) (fun l => Fin.cases (a l) (fun j' => H j' l) j) i

/-- The determinant `δ_l` of (8.5) (p. 61): first row `b`, then the rows
`(H 1 k, …, H n k)` for `k ≠ l`, in increasing order of `k`. -/
def deltaMat {m : ℕ} (b : Fin (m + 1) → R) (H : Matrix (Fin (m + 1)) (Fin (m + 1)) R)
    (l : Fin (m + 1)) : Matrix (Fin (m + 1)) (Fin (m + 1)) R :=
  Matrix.of (Fin.cons b fun k j => H j (l.succAbove k))

theorem levi_expansion {m : ℕ} (b a : Fin (m + 1) → R)
    (H : Matrix (Fin (m + 1)) (Fin (m + 1)) R) :
    -(bordered b a H).det = ∑ l : Fin (m + 1), (-1) ^ (l : ℕ) * a l * (deltaMat b H l).det := by
  rw [det_succ_column_zero, Fin.sum_univ_succ]
  have h0 : bordered b a H 0 0 = 0 := by simp [bordered]
  rw [h0, mul_zero, zero_mul, zero_add, ← Finset.sum_neg_distrib]
  refine Finset.sum_congr rfl fun l _ => ?_
  have hsub : (bordered b a H).submatrix l.succ.succAbove Fin.succ = deltaMat b H l := by
    ext i j
    refine Fin.cases ?_ (fun k => ?_) i
    · simp [bordered, deltaMat]
    · simp [bordered, deltaMat]
  have ha : bordered b a H l.succ 0 = a l := by simp [bordered]
  rw [hsub, ha, Fin.val_succ, pow_succ]
  ring

/-! ## (8.9): the Bochner-Ono chain -/

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]

theorem bochner_ono_chain (ζ v z : E) :
    ‖ζ - v‖ * (‖ζ - v‖ - ‖z - v‖) ≤ ‖(inner ℂ (ζ - v) (ζ - z) : ℂ)‖ := by
  have hsplit : ζ - z = (ζ - v) - (z - v) := by abel
  have hself : (inner ℂ (ζ - v) (ζ - v) : ℂ) = ((‖ζ - v‖ : ℂ)) ^ 2 :=
    inner_self_eq_norm_sq_to_K (ζ - v)
  have hcs : ‖(inner ℂ (ζ - v) (z - v) : ℂ)‖ ≤ ‖ζ - v‖ * ‖z - v‖ := norm_inner_le_norm _ _
  have hfirst : ‖(inner ℂ (ζ - v) (ζ - v) : ℂ)‖ = ‖ζ - v‖ ^ 2 := by
    rw [hself, norm_pow, Complex.norm_real, Real.norm_eq_abs, abs_norm]
  have htri : ‖(inner ℂ (ζ - v) (ζ - v) : ℂ)‖ - ‖(inner ℂ (ζ - v) (z - v) : ℂ)‖ ≤
      ‖(inner ℂ (ζ - v) (ζ - v) : ℂ) - inner ℂ (ζ - v) (z - v)‖ := norm_sub_norm_le _ _
  rw [hsplit, inner_sub_right]
  nlinarith [hfirst, hcs, htri]

theorem bochner_ono_ne_zero (ζ v z : E) (h : ‖z - v‖ < ‖ζ - v‖) :
    (inner ℂ (ζ - v) (ζ - z) : ℂ) ≠ 0 := by
  have hpos : 0 < ‖ζ - v‖ * (‖ζ - v‖ - ‖z - v‖) := by
    have : 0 ≤ ‖z - v‖ := norm_nonneg _
    have : 0 < ‖ζ - v‖ := by linarith
    have : 0 < ‖ζ - v‖ - ‖z - v‖ := by linarith
    positivity
  intro h0
  have := bochner_ono_chain ζ v z
  rw [h0, norm_zero] at this
  linarith

/-! ## Lemma 10.7 -/

/-- `r^(2n-3) (r + ε) ≤ 2^(n-1) (r² + ε²)^(n-1)` with `n = m + 2`. -/
theorem lemma_10_7_bound (m : ℕ) {r ε : ℝ} (hr : 0 ≤ r) (he : 0 ≤ ε) :
    r ^ (2 * m + 1) * (r + ε) ≤ 2 ^ (m + 1) * (r ^ 2 + ε ^ 2) ^ (m + 1) := by
  have h1 : r ^ (2 * m + 1) ≤ (r + ε) ^ (2 * m + 1) :=
    pow_le_pow_left₀ hr (by linarith) _
  have h2 : (r + ε) ^ 2 ≤ 2 * (r ^ 2 + ε ^ 2) := by nlinarith [sq_nonneg (r - ε)]
  have h3 : ((r + ε) ^ 2) ^ (m + 1) ≤ (2 * (r ^ 2 + ε ^ 2)) ^ (m + 1) :=
    pow_le_pow_left₀ (sq_nonneg _) h2 _
  have hre : 0 ≤ r + ε := by linarith
  calc r ^ (2 * m + 1) * (r + ε) ≤ (r + ε) ^ (2 * m + 1) * (r + ε) :=
        mul_le_mul_of_nonneg_right h1 hre
    _ = (r + ε) ^ (2 * (m + 1)) := by rw [← pow_succ]; congr 1
    _ = ((r + ε) ^ 2) ^ (m + 1) := pow_mul _ _ _
    _ ≤ (2 * (r ^ 2 + ε ^ 2)) ^ (m + 1) := h3
    _ = 2 ^ (m + 1) * (r ^ 2 + ε ^ 2) ^ (m + 1) := by rw [mul_pow]

/-- The step of the proof of Lemma 10.7 in the form of the book:
`r^(2n-3)/(r² + ε²)^(n-1) ≤ 2^(n-1)/(r + ε)`, `n = m + 2`. -/
theorem lemma_10_7_quotient (m : ℕ) {r ε : ℝ} (hr : 0 < r) (he : 0 < ε) :
    r ^ (2 * m + 1) / (r ^ 2 + ε ^ 2) ^ (m + 1) ≤ 2 ^ (m + 1) / (r + ε) := by
  have hA : 0 < (r ^ 2 + ε ^ 2) ^ (m + 1) := by positivity
  have hB : 0 < r + ε := by linarith
  rw [div_le_div_iff₀ hA hB]
  exact lemma_10_7_bound m hr.le he.le

/-- The printed step `r^(2n-3)/(r² + ε²)^(n-1) ≤ 1/(r + ε)` is false for
`n = 2`: `r = 2`, `ε = 1` give `2/5 > 1/3`. -/
theorem lemma_10_7_printed_false :
    ¬ ∀ r ε : ℝ, 0 < r → 0 < ε → r ^ 1 / (r ^ 2 + ε ^ 2) ^ 1 ≤ 1 / (r + ε) := by
  intro h
  have := h 2 1 (by norm_num) (by norm_num)
  norm_num at this

end AizenbergIntegrals.Ch2

#print axioms AizenbergIntegrals.Ch2.levi_expansion
#print axioms AizenbergIntegrals.Ch2.bochner_ono_chain
#print axioms AizenbergIntegrals.Ch2.bochner_ono_ne_zero
#print axioms AizenbergIntegrals.Ch2.lemma_10_7_bound
#print axioms AizenbergIntegrals.Ch2.lemma_10_7_quotient
#print axioms AizenbergIntegrals.Ch2.lemma_10_7_printed_false
