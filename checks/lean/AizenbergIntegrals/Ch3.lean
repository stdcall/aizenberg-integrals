/-
Chapter III of L. A. Aizenberg and A. P. Yuzhakov, *Integral Representations
and Residues in Multidimensional Complex Analysis* (AMS, 1983), §§13-19.

Formalised steps.

* §19, 3°, proof of Theorem 19.3 (p. 132; label `th:local-dual-bases`) and
  5°, the cycles `γ_α` before Theorem 19.8 (p. 136; `th:linear-dual-bases`):
  if `φ = c_n ζ_n + Σ_(k<n) c_k ζ_k` with `c_n ≠ 0`, `|ζ_k| ≤ δ` (k < n),
  `|ζ_n| = ε` and `δ Σ_(k<n) |c_k| < ε |c_n|`, then `φ ≠ 0`
  (`dominant_sum_ne_zero`; with radii `ε_k` and the condition
  `Σ_(k<m) |b_(j k)| ε_k < |b_(j m)| ε_m` of p. 136,
  `dominant_sum_ne_zero_weighted`).  For `ε > 0` the hypothesis is the corrected
  condition `δ/ε < (Σ |c_k/c_n|)⁻¹` (`ratio_condition_iff`).  The printed
  condition `δ/ε < Σ |c_k/c_n|` does not suffice: `2 ζ_1 + ζ_2` vanishes at
  `ζ_1 = -1`, `ζ_2 = 2` (`δ = 1`, `ε = 2`), although `δ/ε = 1/2 < 2`
  (`printed_bound_admits_zero`).  Notation: `s` is the index set
  `{1, ..., n-1}` (any finset), `c k`, `x k` the coefficients and the values
  `φ_(α_k)` on the cycle, `cn`, `xn` those of `k = n`.
* §18, 3°, last step of the proof of Proposition 18.3 (p. 123;
  `prop:complement-dimension-discriminant`): if over each of the `N` roots
  `z_j` of the discriminant the multiplicities `β_(j i)` of the `r_j`
  distinct finite roots and the multiplicity `δ_j` of the infinite root add
  up to `n`, then
  `Σ_j Σ_i (β_(j i) - 1) + Σ_j δ_j - n + m = (N - 1) n - Σ_j r_j + m`
  (`discriminant_count`).
* §18, 2°, proof of Theorem 18.1 (Riemann, pp. 120-121;
  `th:riemann-genus`): if the orders of the points over each of the `N + 1`
  points of the branch set add up to `n` and the Euler-Poincaré formula
  `p_1 = 2 - α_0 + α_1 - α_2` holds with `α_0 = r + n`,
  `α_1 = n (N + 1)`, `α_2 = n`, then `p_1 = Σ (k_i - 1) - 2 n + 2`
  (`riemann_genus_count`).

Not covered: the topology (homology of the cycles, the Euler-Poincaré
formula, the Alexander-Pontryagin and de Rham dualities), the analytic
facts (the representation `φ_j = Σ c_k φ_(α_k)` with `c_k ≠ 0`, Puiseux
expansions, the identification of branch points with roots of the
discriminant); these are assumptions of the lemmas, taken from the book's
text.  The residue computations of the chapter are checked in
`checks/sage/ch3.py`.
-/
import Mathlib.Analysis.Complex.Basic

namespace AizenbergIntegrals.Ch3

open Finset

/-- §19, before Theorem 19.8 (p. 136): with radii `|x_k| ≤ e_k` and
`Σ_(k<m) |b_k| e_k < |b_m| ε_m`, `|x_m| = ε_m`, the combination
`b_m x_m + Σ_(k<m) b_k x_k` does not vanish. -/
theorem dominant_sum_ne_zero_weighted {ι : Type*} (s : Finset ι)
    (c x : ι → ℂ) (e : ι → ℝ) (cn xn : ℂ) (ε : ℝ)
    (hx : ∀ k ∈ s, ‖x k‖ ≤ e k) (hxn : ‖xn‖ = ε)
    (h : ∑ k ∈ s, ‖c k‖ * e k < ε * ‖cn‖) :
    cn * xn + ∑ k ∈ s, c k * x k ≠ 0 := by
  intro h0
  have heq : cn * xn = -∑ k ∈ s, c k * x k := by
    linear_combination h0
  have hle : ‖∑ k ∈ s, c k * x k‖ ≤ ∑ k ∈ s, ‖c k‖ * e k := by
    calc ‖∑ k ∈ s, c k * x k‖ ≤ ∑ k ∈ s, ‖c k * x k‖ := norm_sum_le _ _
      _ = ∑ k ∈ s, ‖c k‖ * ‖x k‖ := by simp
      _ ≤ ∑ k ∈ s, ‖c k‖ * e k := by
          apply sum_le_sum
          intro k hk
          exact mul_le_mul_of_nonneg_left (hx k hk) (norm_nonneg _)
  have hnorm : ‖cn * xn‖ = ε * ‖cn‖ := by rw [norm_mul, hxn, mul_comm]
  have : ε * ‖cn‖ ≤ ∑ k ∈ s, ‖c k‖ * e k := by
    rw [← hnorm, heq, norm_neg]
    exact hle
  linarith

/-- §19, proof of Theorem 19.3 (p. 132): the same with one radius `δ` for
all `k < n`. -/
theorem dominant_sum_ne_zero {ι : Type*} (s : Finset ι) (c x : ι → ℂ)
    (cn xn : ℂ) (δ ε : ℝ) (hx : ∀ k ∈ s, ‖x k‖ ≤ δ) (hxn : ‖xn‖ = ε)
    (h : δ * ∑ k ∈ s, ‖c k‖ < ε * ‖cn‖) :
    cn * xn + ∑ k ∈ s, c k * x k ≠ 0 := by
  refine dominant_sum_ne_zero_weighted s c x (fun _ => δ) cn xn ε hx hxn ?_
  rw [← sum_mul, mul_comm]
  exact h

/-- The corrected condition of p. 132, `δ/ε < (Σ |c_k/c_n|)⁻¹`, is the
hypothesis of `dominant_sum_ne_zero`. -/
theorem ratio_condition_iff {ι : Type*} (s : Finset ι) (c : ι → ℂ)
    (cn : ℂ) (δ ε : ℝ) (hε : 0 < ε) (hcn : cn ≠ 0)
    (hS : 0 < ∑ k ∈ s, ‖c k / cn‖) :
    δ / ε < (∑ k ∈ s, ‖c k / cn‖)⁻¹ ↔ δ * ∑ k ∈ s, ‖c k‖ < ε * ‖cn‖ := by
  have hcn' : 0 < ‖cn‖ := norm_pos_iff.mpr hcn
  have hsum : ∑ k ∈ s, ‖c k / cn‖ = (∑ k ∈ s, ‖c k‖) * ‖cn‖⁻¹ := by
    rw [sum_mul]
    simp [div_eq_mul_inv]
  rw [hsum] at hS ⊢
  have hS' : 0 < ∑ k ∈ s, ‖c k‖ := by
    by_contra hneg
    have h0 : ∑ k ∈ s, ‖c k‖ ≤ 0 := le_of_not_gt hneg
    have : (∑ k ∈ s, ‖c k‖) * ‖cn‖⁻¹ ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg h0 (inv_nonneg.mpr hcn'.le)
    linarith
  have key : ((∑ k ∈ s, ‖c k‖) * ‖cn‖⁻¹)⁻¹ = ‖cn‖ / ∑ k ∈ s, ‖c k‖ := by
    rw [mul_inv, inv_inv, div_eq_mul_inv, mul_comm]
  rw [key, div_lt_div_iff₀ hε hS']
  constructor <;> intro h <;> linarith [mul_comm ε ‖cn‖]

/-- The printed condition `δ/ε < Σ |c_k/c_n|` of p. 132 admits a zero of
`φ = 2 ζ_1 + ζ_2` on `{|ζ_1| = 1, |ζ_2| = 2}`. -/
theorem printed_bound_admits_zero :
    ∃ x1 x2 : ℂ, ‖x1‖ = 1 ∧ ‖x2‖ = 2 ∧ (1 : ℝ) / 2 < ‖(2 : ℂ) / 1‖ ∧
      (1 : ℂ) * x2 + 2 * x1 = 0 := by
  refine ⟨-1, 2, by simp, by simp, ?_, by norm_num⟩
  norm_num

/-- §18, Proposition 18.3: from the multiplicities over the roots of the
discriminant to `p = (N - 1) n - Σ r_j + m`. -/
theorem discriminant_count {N : ℕ} (n m : ℤ) (r : Fin N → ℕ)
    (β : (j : Fin N) → Fin (r j) → ℤ) (δ : Fin N → ℤ)
    (hfib : ∀ j, ∑ i, β j i + δ j = n) :
    (∑ j, ∑ i, (β j i - 1)) + ∑ j, δ j - n + m
      = ((N : ℤ) - 1) * n - ∑ j, (r j : ℤ) + m := by
  have h1 : ∀ j, ∑ i, (β j i - 1) = (n - δ j) - (r j : ℤ) := by
    intro j
    rw [sum_sub_distrib]
    simp only [sum_const, card_univ, Fintype.card_fin, nsmul_eq_mul,
      mul_one]
    linarith [hfib j]
  simp only [h1, sum_sub_distrib, sum_const, card_univ, Fintype.card_fin,
    nsmul_eq_mul]
  ring

/-- §18, Theorem 18.1 (Riemann): the genus count from the Euler-Poincaré
formula for the cell complex of the `n` polygons. -/
theorem riemann_genus_count {N : ℕ} (n p1 : ℤ) (r : Fin (N + 1) → ℕ)
    (k : (a : Fin (N + 1)) → Fin (r a) → ℤ)
    (hfib : ∀ a, ∑ i, k a i = n)
    (hEP : p1 = 2 - ((∑ a, (r a : ℤ)) + n) + n * ((N : ℤ) + 1) - n) :
    p1 = (∑ a, ∑ i, (k a i - 1)) - 2 * n + 2 := by
  have h1 : ∀ a, ∑ i, (k a i - 1) = n - (r a : ℤ) := by
    intro a
    rw [sum_sub_distrib]
    simp only [sum_const, card_univ, Fintype.card_fin, nsmul_eq_mul,
      mul_one]
    linarith [hfib a]
  simp only [h1, sum_sub_distrib, sum_const, card_univ, Fintype.card_fin,
    nsmul_eq_mul]
  rw [hEP]
  push_cast
  ring

end AizenbergIntegrals.Ch3

#print axioms AizenbergIntegrals.Ch3.dominant_sum_ne_zero_weighted
#print axioms AizenbergIntegrals.Ch3.dominant_sum_ne_zero
#print axioms AizenbergIntegrals.Ch3.ratio_condition_iff
#print axioms AizenbergIntegrals.Ch3.printed_bound_admits_zero
#print axioms AizenbergIntegrals.Ch3.discriminant_count
#print axioms AizenbergIntegrals.Ch3.riemann_genus_count
