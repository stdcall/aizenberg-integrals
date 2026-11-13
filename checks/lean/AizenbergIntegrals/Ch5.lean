import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Convex.Function
import Mathlib.Tactic

/-!
# Chapter V: bounded steps

Aizenberg and Yuzhakov, *Integral Representations and Residues in
Multidimensional Complex Analysis* (AMS, 1983), Chapter V, §25-§26,
printed pp. 205-243.

* `support_dist_bound`, `support_phi_le`, `support_lower_bound`,
  `support_upper_bound`, `support_printed_domain_false` (§25, 2°, p. 206,
  `eq:support-function-estimates` - `eq:phi-tilde-estimate`): the
  estimates (25.3)-(25.5) from the first inequality (25.2).  Notation:
  `Φ = Φ(ζ, z) : ℂ`, `r₁ = ρ(ζ)`, `r₂ = ρ(z)`, `d = |ζ - z|²`,
  `Φ̃ = Φ - ρ(ζ)` is `Φ - r₁`; the hypotheses `r₁ ≤ 0`, `r₂ ≤ 0` say
  `ζ, z ∈ D̄` (corrected domain; the printed `ζ, z ∈ Ω'` is refuted by
  `support_printed_domain_false`, the data of the ball
  `ρ = |z|² - 1`, `ζ = (3/2, 0)`, `z = (2/3, 0)`, `σ = 1`).  The
  corrected (25.5) is the lower bound `σ₁ [...] ≤ |Φ̃|` used in the
  proofs of Theorem 25.9 and Lemma 26.6, with `σ₁ = σ/(5σ + 2)`;
  `support_upper_bound` is the printed direction, from the Taylor upper
  bound `2 Re Φ ≤ r₁ - r₂ + K d`.
* `sphere_angle_bound` (§25, proof of Lemma 25.7, p. 210,
  `lem:model-integral`): `|s₁| + s₂ √(1 - s₁²) ≥ (|s₁| + s₂)/4` for
  `-1 ≤ s₁ ≤ 1`, `0 ≤ s₂ ≤ 1`; `x = |s₁|`, `c = √(1 - s₁²)` given by
  `0 ≤ c`, `c² = 1 - x²`.
* `theta_mul_le`, `theta_le_ratio`, `rho_h_near`, `rho_h_far` (§26, 2°,
  proofs of Lemma 26.3, p. 222-223, `lem:rho-times-g`, and Lemma 26.6,
  p. 227, `lem:h-integrals`): for a modulus of continuity `θ` (concave,
  monotone on `[0, ∞)`, `θ 0 = 0`): `θ(λt) ≤ λ θ(t)` for `λ ≥ 1`;
  `θ(x) ≤ (x/y + 1) θ(y)`; the two cases of Lemma 26.3:
  `θ(d) ≤ 2 θ(|x - y|)` for `d ≤ 2|x - y|` and
  `(|x - y|/d) θ(d) ≤ θ(|x - y|)` for `d > 2|x - y|`.

Not covered: (25.2) itself (Taylor's formula and strict convexity are
hypotheses), the change of variables of Lemma 10.6, the integrals of
Lemma 25.7, the differential forms; the exact computations are in
`checks/sage/ch5.py`.
-/

namespace AizenbergIntegrals.Ch5

/-! ## (25.3)-(25.5) -/

/-- (25.2), second inequality, from the first. -/
theorem support_second (Φ : ℂ) (r₁ r₂ d σ : ℝ)
    (h : r₁ - r₂ + σ * d ≤ 2 * Φ.re) :
    -r₁ - r₂ + σ * d ≤ 2 * (Φ - (r₁ : ℂ)).re := by
  simp only [Complex.sub_re, Complex.ofReal_re]
  linarith

/-- (25.3): `|ζ - z|² ≤ (2/σ) |Φ̃|` for `ζ, z ∈ D̄`. -/
theorem support_dist_bound (Φ : ℂ) (r₁ r₂ d σ : ℝ) (hr₁ : r₁ ≤ 0) (hr₂ : r₂ ≤ 0)
    (hσ : 0 < σ) (h : r₁ - r₂ + σ * d ≤ 2 * Φ.re) :
    d ≤ 2 / σ * ‖Φ - (r₁ : ℂ)‖ := by
  have h2 := support_second Φ r₁ r₂ d σ h
  have hre : (Φ - (r₁ : ℂ)).re ≤ ‖Φ - (r₁ : ℂ)‖ := Complex.re_le_norm _
  rw [div_mul_eq_mul_div, le_div_iff₀ hσ]
  nlinarith

/-- (25.4): `|Φ| ≤ |Φ̃|` for `ζ, z ∈ D̄`. -/
theorem support_phi_le (Φ : ℂ) (r₁ r₂ d σ : ℝ) (hr₁ : r₁ ≤ 0) (hr₂ : r₂ ≤ 0)
    (hσ : 0 < σ) (hd : 0 ≤ d) (h : r₁ - r₂ + σ * d ≤ 2 * Φ.re) :
    ‖Φ‖ ≤ ‖Φ - (r₁ : ℂ)‖ := by
  have key : Complex.normSq Φ ≤ Complex.normSq (Φ - (r₁ : ℂ)) := by
    simp only [Complex.normSq_apply, Complex.sub_re, Complex.sub_im,
      Complex.ofReal_re, Complex.ofReal_im, sub_zero]
    have : r₁ ≤ 2 * Φ.re := by nlinarith
    nlinarith
  have h1 : ‖Φ‖ ^ 2 ≤ ‖Φ - (r₁ : ℂ)‖ ^ 2 := by
    rw [← Complex.normSq_eq_norm_sq, ← Complex.normSq_eq_norm_sq]
    exact key
  exact (pow_le_pow_iff_left₀ (norm_nonneg _) (norm_nonneg _) two_ne_zero).mp h1

/-- (25.5), the direction used in the proofs:
`σ/(5σ + 2) [|ρ(ζ) - ρ(z)| + |Im Φ| - ρ(ζ) - ρ(z) + |ζ - z|²] ≤ |Φ̃|`. -/
theorem support_lower_bound (Φ : ℂ) (r₁ r₂ d σ : ℝ) (hr₁ : r₁ ≤ 0) (hr₂ : r₂ ≤ 0)
    (hσ : 0 < σ) (hd : 0 ≤ d) (h : r₁ - r₂ + σ * d ≤ 2 * Φ.re) :
    σ / (5 * σ + 2) * (|r₁ - r₂| + |Φ.im| - r₁ - r₂ + d) ≤ ‖Φ - (r₁ : ℂ)‖ := by
  have h2 := support_second Φ r₁ r₂ d σ h
  have hre : (Φ - (r₁ : ℂ)).re ≤ ‖Φ - (r₁ : ℂ)‖ := Complex.re_le_norm _
  have him : |(Φ - (r₁ : ℂ)).im| ≤ ‖Φ - (r₁ : ℂ)‖ := Complex.abs_im_le_norm _
  have himeq : (Φ - (r₁ : ℂ)).im = Φ.im := by simp
  rw [himeq] at him
  have habs : |r₁ - r₂| ≤ -r₁ - r₂ := by
    rw [abs_le]; constructor <;> linarith
  rw [div_mul_eq_mul_div, div_le_iff₀ (by positivity)]
  set N := ‖Φ - (r₁ : ℂ)‖ with hNdef
  have hσd : 0 ≤ σ * d := mul_nonneg hσ.le hd
  have hs : -r₁ - r₂ ≤ 2 * N := by linarith
  have hsd : σ * d ≤ 2 * N := by linarith
  have h5 : σ * (-r₁ - r₂) ≤ σ * (2 * N) := mul_le_mul_of_nonneg_left hs hσ.le
  have h6 : σ * |Φ.im| ≤ σ * N := mul_le_mul_of_nonneg_left him hσ.le
  have h7 : σ * |r₁ - r₂| ≤ σ * (-r₁ - r₂) := mul_le_mul_of_nonneg_left habs hσ.le
  nlinarith

/-- (25.5) as printed (an upper bound), given the Taylor upper bound
`2 Re Φ ≤ ρ(ζ) - ρ(z) + K |ζ - z|²`. -/
theorem support_upper_bound (Φ : ℂ) (r₁ r₂ d σ K : ℝ) (hr₁ : r₁ ≤ 0) (hr₂ : r₂ ≤ 0)
    (hσ : 0 < σ) (hd : 0 ≤ d) (h : r₁ - r₂ + σ * d ≤ 2 * Φ.re)
    (hT : 2 * Φ.re ≤ r₁ - r₂ + K * d) :
    ‖Φ - (r₁ : ℂ)‖ ≤ max 1 K * (|r₁ - r₂| + |Φ.im| - r₁ - r₂ + d) := by
  have hle := Complex.norm_le_abs_re_add_abs_im (Φ - (r₁ : ℂ))
  have hre0 : 0 ≤ (Φ - (r₁ : ℂ)).re := by
    have := support_second Φ r₁ r₂ d σ h; nlinarith
  rw [abs_of_nonneg hre0] at hle
  have himeq : (Φ - (r₁ : ℂ)).im = Φ.im := by simp
  have hreeq : (Φ - (r₁ : ℂ)).re = Φ.re - r₁ := by simp
  rw [himeq, hreeq] at hle
  have hm1 : (1 : ℝ) ≤ max 1 K := le_max_left _ _
  have hmK : K ≤ max 1 K := le_max_right _ _
  have hB : 0 ≤ |r₁ - r₂| + |Φ.im| - r₁ - r₂ + d := by
    have := abs_nonneg (r₁ - r₂); have := abs_nonneg Φ.im; linarith
  have h3 : Φ.re - r₁ + |Φ.im| ≤ |r₁ - r₂| + |Φ.im| - r₁ - r₂ + K * d := by
    have := abs_nonneg (r₁ - r₂); nlinarith
  have h4 : |r₁ - r₂| + |Φ.im| - r₁ - r₂ + K * d ≤
      max 1 K * (|r₁ - r₂| + |Φ.im| - r₁ - r₂ + d) := by
    have hA : 0 ≤ |r₁ - r₂| + |Φ.im| - r₁ - r₂ := by
      have := abs_nonneg (r₁ - r₂); have := abs_nonneg Φ.im; linarith
    nlinarith [mul_le_mul_of_nonneg_right hm1 hA, mul_le_mul_of_nonneg_right hmK hd]
  linarith

/-- The printed domain `ζ, z ∈ Ω'` is too large: for the ball `ρ = |z|² - 1`
(`σ = 1`), `ζ = (3/2, 0) ∈ B(0, 2) \ D̄`, `z = (2/3, 0) ∈ D`, one has
`Φ = 5/4`, `ρ(ζ) = 5/4`, `ρ(z) = -5/9`, `|ζ - z|² = 25/36`; (25.2) holds
and (25.3) fails. -/
theorem support_printed_domain_false :
    ∃ (Φ : ℂ) (r₁ r₂ d σ : ℝ), 0 < σ ∧ r₂ ≤ 0 ∧ r₁ - r₂ + σ * d ≤ 2 * Φ.re ∧
      ¬ d ≤ 2 / σ * ‖Φ - (r₁ : ℂ)‖ := by
  refine ⟨(5 / 4 : ℝ), 5 / 4, -5 / 9, 25 / 36, 1, by norm_num, by norm_num, ?_, ?_⟩
  · simp only [Complex.ofReal_re]; norm_num
  · rw [sub_self, norm_zero]; norm_num

/-! ## Lemma 25.7 -/

/-- `x + y c ≥ (x + y)/4` for `0 ≤ x ≤ 1`, `0 ≤ y ≤ 1`, `c ≥ 0`, `c² = 1 - x²`
(`x = |s₁|`, `y = s₂`, `c = √(1 - s₁²)`). -/
theorem sphere_angle_bound (x y c : ℝ) (hx0 : 0 ≤ x) (hx1 : x ≤ 1) (hy0 : 0 ≤ y)
    (hy1 : y ≤ 1) (hc0 : 0 ≤ c) (hc : c ^ 2 = 1 - x ^ 2) :
    (x + y) / 4 ≤ x + y * c := by
  rcases le_or_gt (1 / 4) c with h | h
  · nlinarith [mul_le_mul_of_nonneg_left h hy0]
  · have hx2 : 15 / 16 < x ^ 2 := by nlinarith
    have hx : 1 / 2 < x := by nlinarith
    nlinarith [mul_nonneg hy0 hc0]

/-! ## Moduli of continuity (Lemmas 26.3, 26.6) -/

variable {θ : ℝ → ℝ}

/-- `θ(λ t) ≤ λ θ(t)` for `λ ≥ 1` (p. 222). -/
theorem theta_mul_le (hc : ConcaveOn ℝ (Set.Ici 0) θ) (h0 : θ 0 = 0) {lam t : ℝ}
    (hl : 1 ≤ lam) (ht : 0 ≤ t) : θ (lam * t) ≤ lam * θ t := by
  have hl0 : 0 < lam := by linarith
  have ha : 0 ≤ 1 / lam := by positivity
  have hb : 0 ≤ 1 - 1 / lam := by
    rw [sub_nonneg, div_le_one hl0]; exact hl
  have hmem : lam * t ∈ Set.Ici (0 : ℝ) := Set.mem_Ici.mpr (by positivity)
  have hz : (0 : ℝ) ∈ Set.Ici (0 : ℝ) := Set.mem_Ici.mpr le_rfl
  have key := hc.2 hmem hz ha hb (by ring)
  simp only [smul_eq_mul, mul_zero, add_zero, h0] at key
  have e : 1 / lam * (lam * t) = t := by field_simp
  rw [e] at key
  have := mul_le_mul_of_nonneg_left key hl0.le
  have e2 : lam * (1 / lam * θ (lam * t)) = θ (lam * t) := by field_simp
  linarith

/-- `θ(x) ≤ (x/y + 1) θ(y)` for `x ≥ 0`, `y > 0` (proof of Lemma 26.6,
p. 227, with `x = |ρ(ζ)|`, `y = |ρ(z⁰)|`). -/
theorem theta_le_ratio (hc : ConcaveOn ℝ (Set.Ici 0) θ) (hm : MonotoneOn θ (Set.Ici 0))
    (h0 : θ 0 = 0) {x y : ℝ} (hx : 0 ≤ x) (hy : 0 < y) :
    θ x ≤ (x / y + 1) * θ y := by
  have hθy : 0 ≤ θ y := by
    rw [← h0]; exact hm (Set.mem_Ici.mpr le_rfl) (Set.mem_Ici.mpr hy.le) hy.le
  rcases le_or_gt x y with hxy | hxy
  · have := hm (Set.mem_Ici.mpr hx) (Set.mem_Ici.mpr hy.le) hxy
    have : 0 ≤ x / y * θ y := by positivity
    nlinarith
  · have hl : 1 ≤ x / y := by rw [le_div_iff₀ hy]; linarith
    have := theta_mul_le hc h0 hl hy.le
    have e : x / y * y = x := by field_simp
    rw [e] at this
    nlinarith

/-- Lemma 26.3, case `d ≤ 2|x - y|`: `θ(d) ≤ 2 θ(|x - y|)`. -/
theorem rho_h_near (hc : ConcaveOn ℝ (Set.Ici 0) θ) (hm : MonotoneOn θ (Set.Ici 0))
    (h0 : θ 0 = 0) {d δ : ℝ} (hd : 0 ≤ d) (hδ : 0 ≤ δ) (h : d ≤ 2 * δ) :
    θ d ≤ 2 * θ δ := by
  have h1 := hm (Set.mem_Ici.mpr hd) (Set.mem_Ici.mpr (by positivity)) h
  have h2 := theta_mul_le hc h0 (by norm_num : (1 : ℝ) ≤ 2) hδ
  linarith

/-- Lemma 26.3, case `d > 2|x - y|` (corrected segment `y + t(x - y)`):
`(|x - y|/d) θ(d) ≤ θ(|x - y|)`, with `λ = d/|x - y| ≥ 2`. -/
theorem rho_h_far (hc : ConcaveOn ℝ (Set.Ici 0) θ) (h0 : θ 0 = 0) {d δ : ℝ}
    (hδ : 0 < δ) (h : 2 * δ < d) : δ / d * θ d ≤ θ δ := by
  have hd : 0 < d := by linarith
  have hl : 1 ≤ d / δ := by rw [le_div_iff₀ hδ]; linarith
  have := theta_mul_le hc h0 hl hδ.le
  have e : d / δ * δ = d := by field_simp
  rw [e] at this
  have hq : 0 ≤ δ / d := by positivity
  have := mul_le_mul_of_nonneg_left this hq
  have e2 : δ / d * (d / δ * θ δ) = θ δ := by field_simp
  linarith

end AizenbergIntegrals.Ch5

#print axioms AizenbergIntegrals.Ch5.support_second
#print axioms AizenbergIntegrals.Ch5.support_dist_bound
#print axioms AizenbergIntegrals.Ch5.support_phi_le
#print axioms AizenbergIntegrals.Ch5.support_lower_bound
#print axioms AizenbergIntegrals.Ch5.support_upper_bound
#print axioms AizenbergIntegrals.Ch5.support_printed_domain_false
#print axioms AizenbergIntegrals.Ch5.sphere_angle_bound
#print axioms AizenbergIntegrals.Ch5.theta_mul_le
#print axioms AizenbergIntegrals.Ch5.theta_le_ratio
#print axioms AizenbergIntegrals.Ch5.rho_h_near
#print axioms AizenbergIntegrals.Ch5.rho_h_far
