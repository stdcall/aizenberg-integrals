import Mathlib.Analysis.Complex.Exponential
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Algebra.Order.BigOperators.Group.LocallyFinite
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Tactic

/-!
Chapter IV, §§20-23, of L. A. Aizenberg and A. P. Yuzhakov, *Integral
Representations and Residues in Multidimensional Complex Analysis* (AMS, 1983).

Formalised steps.

* §20, 6°, proof of Theorem 20.19 (p. 153; label `th:remainder-estimate`):
  the remainder of the Taylor series of `(1 - a)^(-n)`,
  `Σ_(q > k) C(q + n - 1, q) a^q = a^(k+1) Σ_(p=1)^n C(k + n - p, k)(1 - a)^(-p)`.
  `remainder_tail` is the identity cleared of denominators, in any
  commutative ring, with `n + 1` for the book's `n ≥ 1`:
  `a^(k+1) Σ_(j ≤ n) C(k + j, k)(1 - a)^j + (1 - a)^(n+1) Σ_(q ≤ k) C(q + n, q) a^q = 1`;
  `remainder_tail_field` is the book's form over a field (`a ≠ 1`), with
  `Σ_(q ≤ k)` moved to the right.  The contour integrals of the printed proof
  (the corrected one has `a < ε < 1`) are checked in `checks/sage/ch4.py`.
* §20, 7°, Example 1 (p. 154; `pt:implicit-examples`, with
  Proposition 20.18, `prop:convergence-special`): for `r, R > 0`,
  `min{r, R e^(-rR)} ≤ e^(-1/2)` (`example1_radius_le`), with equality at
  `r = e^(-1/2)`, `R = e^(1/2)` (`example1_radius_attained`): the largest
  radius is `1/√e` (a maximum, not a minimum).
* §21, 2°, proof of Theorem 21.4 (pp. 165-166; `th:aizenberg-tsikh`): from
  (21.22), `α_i ≤ Σ_(j ≥ i) m_j + Σ_(j < i) k_j - 2i + 2 + Σ_(j < i)(k_j - 1) α_j`,
  and `α_1 ≤ μ ≤ |m|`, by induction every `α_i` is at most the bound of the
  box `M`, `k_1⋯k_(i-1)(|m| + 1) - Σ_(l < i) k_(l+1)⋯k_(i-1)(m_l + 1) - 1`
  (`box_bound`; the book says "it is easy to see").  Indices are shifted to
  `0, ..., n - 1`; `k`, `m`, `α` are integer sequences, `k_j ≥ 1`.  The
  bounds for `α_2`, `α_3` printed after (21.22) are `box_closed_one`,
  `box_closed_two`.  Not covered: the degree count (21.20) itself, which for
  `i ≥ 3` assumes a degree of `Δ_1` that can fail (see `checks/sage/ch4.py`,
  B4); here (21.22) is a hypothesis.
* §22, 3°, proof of Theorem 22.7 (p. 184; `th:weighted-principal-part`):
  with `s_j = q Π_(k ≠ j) a_k`, `Π_j s_j = q^n (Π a)^(n-1)`
  (`weighted_mapping_degree`, the multiplicity of `z_j = ζ_j^(s_j)`); a
  monomial of weighted degree `Σ i_k / a_k = d` becomes a monomial of degree
  `q (Π a) d` (`weighted_degree_after_substitution`); and
  `q^n (Π d)(Π a)^n / (q^n (Π a)^(n-1)) = Π_j a_j d_j`
  (`weighted_quotient`); the printed denominator `q^n Π a_j` gives 36
  instead of 6 for `a = (1, 2, 3)`, `d = (1, 1, 1)`
  (`weighted_quotient_printed_false`).  Not covered: the multiplicities
  themselves (Theorem 22.6, Proposition 22.1), checked on examples in
  `checks/sage/ch4.py` (C6).
-/

namespace AizenbergIntegrals.Ch4

open Finset

section Remainder

variable {R : Type*} [CommRing R]

/-- `Σ_(q ≤ k) C(q + n, q) a^q`. -/
def headSum (a : R) (n k : ℕ) : R :=
  ∑ q ∈ range (k + 1), ((q + n).choose q : R) * a ^ q

/-- `Σ_(j ≤ n) C(k + j, k) x^j`. -/
def tailFactor (x : R) (n k : ℕ) : R :=
  ∑ j ∈ range (n + 1), ((k + j).choose k : R) * x ^ j

lemma headSum_step (a : R) (n : ℕ) :
    ∀ k : ℕ, (1 - a) * headSum a (n + 1) k
      + ((k + n + 1).choose k : R) * a ^ (k + 1) = headSum a n k
  | 0 => by simp [headSum]
  | k + 1 => by
      have ih := headSum_step a n k
      have hp : ((k + 1 + (n + 1)).choose (k + 1) : R)
          = ((k + n + 1).choose (k + 1) : R) + ((k + n + 1).choose k : R) := by
        have h1 : k + 1 + (n + 1) = (k + n + 1) + 1 := by omega
        rw [h1, Nat.choose_succ_succ]
        push_cast
        ring
      have hq : ((k + 1 + n + 1).choose (k + 1) : R)
          = ((k + 1 + (n + 1)).choose (k + 1) : R) := by
        rw [show k + 1 + n + 1 = k + 1 + (n + 1) by omega]
      have hr : ((k + 1 + n).choose (k + 1) : R)
          = ((k + n + 1).choose (k + 1) : R) := by
        rw [show k + 1 + n = k + n + 1 by omega]
      simp only [headSum, sum_range_succ] at ih ⊢
      rw [hq, hr, hp]
      linear_combination ih

theorem remainder_tail (a : R) (n k : ℕ) :
    a ^ (k + 1) * tailFactor (1 - a) n k + (1 - a) ^ (n + 1) * headSum a n k
      = 1 := by
  induction n with
  | zero =>
      have hg := mul_neg_geom_sum a (k + 1)
      simp only [tailFactor, headSum, sum_range_one, add_zero, Nat.choose_self,
        Nat.cast_one, pow_zero, mul_one, zero_add, pow_one, Nat.choose_self]
      have : ∑ q ∈ range (k + 1), ((q + 0).choose q : R) * a ^ q
          = ∑ q ∈ range (k + 1), a ^ q := by
        refine sum_congr rfl fun q _ => ?_
        simp
      simp only [add_zero, Nat.choose_self, Nat.cast_one, one_mul] at this ⊢
      linear_combination hg
  | succ n ih =>
      have hs := headSum_step a n k
      have ht : tailFactor (1 - a) (n + 1) k
          = tailFactor (1 - a) n k
            + ((k + n + 1).choose k : R) * (1 - a) ^ (n + 1) := by
        simp only [tailFactor]
        rw [sum_range_succ (n := n + 1)]
        have : k + (n + 1) = k + n + 1 := by omega
        rw [this]
      rw [ht]
      linear_combination ih + (1 - a) ^ (n + 1) * hs

/-- The book's form over a field: for `a ≠ 1`,
`(1 - a)^(-(n+1)) - Σ_(q ≤ k) C(q + n, q) a^q
  = a^(k+1) Σ_(p=1)^(n+1) C(k + n + 1 - p, k)(1 - a)^(-p)`. -/
theorem remainder_tail_field {K : Type*} [Field K] (a : K) (ha : a ≠ 1)
    (n k : ℕ) :
    ((1 - a) ^ (n + 1))⁻¹ - headSum a n k
      = a ^ (k + 1) * ∑ p ∈ range (n + 1),
          ((k + n - p).choose k : K) * ((1 - a) ^ (p + 1))⁻¹ := by
  have hx : (1 - a) ≠ 0 := sub_ne_zero.mpr (Ne.symm ha)
  have key := remainder_tail a n k
  have hrefl : ∑ p ∈ range (n + 1), ((k + n - p).choose k : K)
        * ((1 - a) ^ (p + 1))⁻¹
      = ((1 - a) ^ (n + 1))⁻¹ * tailFactor (1 - a) n k := by
    rw [tailFactor, mul_sum, ← sum_range_reflect]
    refine sum_congr rfl fun j hj => ?_
    have hj' : j < n + 1 := mem_range.mp hj
    have e1 : k + n - (n + 1 - 1 - j) = k + j := by omega
    have e2 : n + 1 - 1 - j + 1 = n + 1 - j := by omega
    rw [e1, e2]
    have hpow : (1 - a) ^ (n + 1) = (1 - a) ^ (n + 1 - j) * (1 - a) ^ j := by
      rw [← pow_add]; congr 1; omega
    rw [hpow]
    field_simp
  have hpx : (1 - a) ^ (n + 1) ≠ 0 := pow_ne_zero _ hx
  have hT : a ^ (k + 1) * tailFactor (1 - a) n k
      = 1 - (1 - a) ^ (n + 1) * headSum a n k := by
    linear_combination key
  rw [hrefl, ← mul_assoc, mul_comm (a ^ (k + 1)), mul_assoc, hT, mul_sub,
    mul_one, ← mul_assoc, inv_mul_cancel₀ hpx, one_mul]

end Remainder

section Example1

open Real

lemma mul_exp_neg_le (x : ℝ) : x * exp (-x) ≤ exp (-1) := by
  have h := add_one_le_exp (x - 1)
  have hx : x ≤ exp (x - 1) := by linarith
  have hpos : 0 < exp (-x) := exp_pos _
  calc x * exp (-x) ≤ exp (x - 1) * exp (-x) :=
        mul_le_mul_of_nonneg_right hx hpos.le
    _ = exp (-1) := by rw [← exp_add]; ring_nf

theorem example1_radius_le (r R : ℝ) (hr : 0 < r) :
    min r (R * exp (-(r * R))) ≤ exp (-1 / 2) := by
  have hb : R * exp (-(r * R)) ≤ exp (-1) / r := by
    rw [le_div_iff₀ hr]
    have := mul_exp_neg_le (r * R)
    nlinarith [this]
  by_cases h : r ≤ exp (-1 / 2)
  · exact (min_le_left _ _).trans h
  · have h : exp (-1 / 2) < r := not_le.mp h
    refine (min_le_right _ _).trans (hb.trans ?_)
    rw [div_le_iff₀ hr]
    have h2 : exp (-1) = exp (-1 / 2) * exp (-1 / 2) := by
      rw [← exp_add]; norm_num
    rw [h2]
    exact mul_le_mul_of_nonneg_left h.le (exp_pos _).le

theorem example1_radius_attained :
    min (exp (-1 / 2)) (exp (1 / 2) * exp (-(exp (-1 / 2) * exp (1 / 2))))
      = exp (-1 / 2) := by
  have h1 : exp (-1 / 2) * exp (1 / 2) = 1 := by rw [← exp_add]; norm_num
  have h2 : exp (1 / 2) * exp (-1) = exp (-1 / 2) := by
    rw [← exp_add]; norm_num
  rw [h1, h2, min_self]

end Example1

section Box

/-- The bound of the box `M` for `α_(i+1)` (0-based `i`):
`k_0⋯k_(i-1)(S + 1) - Σ_(l < i) k_(l+1)⋯k_(i-1)(m_l + 1) - 1`, `S = |m|`. -/
def boxClosed (k m : ℕ → ℤ) (S : ℤ) (i : ℕ) : ℤ :=
  (∏ j ∈ range i, k j) * (S + 1)
    - ∑ l ∈ range i, (∏ j ∈ Ico (l + 1) i, k j) * (m l + 1) - 1

lemma boxClosed_succ (k m : ℕ → ℤ) (S : ℤ) (i : ℕ) :
    boxClosed k m S (i + 1) = k i * (boxClosed k m S i + 1) - (m i + 1) - 1 := by
  simp only [boxClosed]
  rw [prod_range_succ, sum_range_succ]
  have hI : ∀ l ∈ range i,
      (∏ j ∈ Ico (l + 1) (i + 1), k j) * (m l + 1)
        = k i * ((∏ j ∈ Ico (l + 1) i, k j) * (m l + 1)) := by
    intro l hl
    have hl' : l + 1 ≤ i := mem_range.mp hl
    rw [prod_Ico_succ_top hl']
    ring
  rw [sum_congr rfl hI, ← mul_sum]
  have : Ico (i + 1) (i + 1) = (∅ : Finset ℕ) := Ico_self _
  rw [this, prod_empty]
  ring

/-- `E i = Σ_(j ∈ [i, n)) m_j + Σ_(j < i) k_j - 2 i + Σ_(j < i)(k_j - 1) C_j`
is the right side of (21.22) with every `α_j`, `j < i`, replaced by its
bound `C_j`; it equals `C_i`. -/
lemma rhs_eq_boxClosed (k m : ℕ → ℤ) (n : ℕ) :
    ∀ i, i ≤ n →
      (∑ j ∈ Ico i n, m j) + (∑ j ∈ range i, k j) - 2 * (i : ℤ)
        + ∑ j ∈ range i, (k j - 1) * boxClosed k m (∑ j ∈ range n, m j) j
      = boxClosed k m (∑ j ∈ range n, m j) i
  | 0, _ => by
      simp only [boxClosed, range_zero, sum_empty, prod_empty, Nat.cast_zero,
        mul_zero, sub_zero, add_zero, one_mul, ← range_eq_Ico]
      ring
  | i + 1, hi => by
      have ih := rhs_eq_boxClosed k m n i (by omega)
      rw [sum_eq_sum_Ico_succ_bot (by omega : i < n)] at ih
      rw [boxClosed_succ, sum_range_succ, sum_range_succ]
      push_cast
      linear_combination ih

/-- (21.22) for every `i ≥ 1`, `α_0 ≤ |m|` and `k_j ≥ 1` give
`α_i ≤ C_i` for all `i < n`. -/
theorem box_bound (k m α : ℕ → ℤ) (n : ℕ) (hk : ∀ j, 1 ≤ k j)
    (h0 : α 0 ≤ ∑ j ∈ range n, m j)
    (h22 : ∀ i, 1 ≤ i → i < n →
      α i ≤ (∑ j ∈ Ico i n, m j) + (∑ j ∈ range i, k j) - 2 * (i : ℤ)
        + ∑ j ∈ range i, (k j - 1) * α j) :
    ∀ i, i < n → α i ≤ boxClosed k m (∑ j ∈ range n, m j) i := by
  intro i
  induction i using Nat.strong_induction_on with
  | _ i ih =>
    intro hi
    rcases Nat.eq_zero_or_pos i with rfl | hpos
    · simpa [boxClosed] using h0
    · have hsum : ∑ j ∈ range i, (k j - 1) * α j
          ≤ ∑ j ∈ range i, (k j - 1) * boxClosed k m (∑ j ∈ range n, m j) j := by
        refine sum_le_sum fun j hj => ?_
        have hj : j < i := mem_range.mp hj
        exact mul_le_mul_of_nonneg_left (ih j hj (by omega))
          (by linarith [hk j])
      have := h22 i hpos hi
      rw [← rhs_eq_boxClosed k m n i hi.le]
      linarith

/-- The bounds printed after (21.22): `α_2 ≤ k_1(|m| + 1) - m_1 - 2` and
`α_3 ≤ k_1 k_2(|m| + 1) - k_2 m_1 - k_2 - m_2 - 2` (0-based here). -/
theorem box_closed_one (k m : ℕ → ℤ) (S : ℤ) :
    boxClosed k m S 1 = k 0 * (S + 1) - m 0 - 2 := by
  simp [boxClosed]; ring

theorem box_closed_two (k m : ℕ → ℤ) (S : ℤ) :
    boxClosed k m S 2 = k 0 * k 1 * (S + 1) - k 1 * m 0 - k 1 - m 1 - 2 := by
  rw [boxClosed_succ, box_closed_one]; ring

end Box

section Weighted

variable {ι K : Type*} [DecidableEq ι] [Field K]

/-- `Π_j (q Π_(k ≠ j) a_k) = q^n (Π a)^(n-1)`, `n = |s| ≥ 1`. -/
theorem weighted_mapping_degree (s : Finset ι) (a : ι → K) (q : K)
    (ha : ∀ j ∈ s, a j ≠ 0) (hs : s.Nonempty) :
    ∏ j ∈ s, (q * ∏ k ∈ s.erase j, a k)
      = q ^ s.card * (∏ k ∈ s, a k) ^ (s.card - 1) := by
  rw [prod_mul_distrib, prod_const]
  congr 1
  have hP : (∏ k ∈ s, a k) ≠ 0 := prod_ne_zero_iff.mpr ha
  have h1 : (∏ j ∈ s, ∏ k ∈ s.erase j, a k) * (∏ j ∈ s, a j)
      = (∏ k ∈ s, a k) ^ s.card := by
    rw [← prod_mul_distrib]
    rw [show (∏ k ∈ s, a k) ^ s.card = ∏ _j ∈ s, ∏ k ∈ s, a k from
      (prod_const _).symm]
    refine prod_congr rfl fun j hj => ?_
    exact prod_erase_mul s a hj
  have hc : s.card = (s.card - 1) + 1 := by
    have := hs.card_pos; omega
  rw [hc, pow_succ] at h1
  exact mul_right_cancel₀ hP h1

/-- A monomial `z^i` of weighted degree `Σ i_k / a_k = d` becomes, after
`z_k = ζ_k^(s_k)`, a monomial of degree `Σ i_k s_k = q (Π a) d`. -/
theorem weighted_degree_after_substitution (s : Finset ι) (a : ι → K)
    (q : K) (i : ι → K) (ha : ∀ j ∈ s, a j ≠ 0) :
    ∑ k ∈ s, i k * (q * ∏ l ∈ s.erase k, a l)
      = q * (∏ l ∈ s, a l) * ∑ k ∈ s, i k / a k := by
  rw [mul_sum]
  refine sum_congr rfl fun k hk => ?_
  rw [← mul_prod_erase s a hk]
  field_simp [ha k hk]

omit [DecidableEq ι] in
theorem weighted_quotient (s : Finset ι) (a d : ι → K) (q : K)
    (ha : ∀ j ∈ s, a j ≠ 0) (hq : q ≠ 0) (hs : s.Nonempty) :
    q ^ s.card * (∏ j ∈ s, d j) * (∏ j ∈ s, a j) ^ s.card
        / (q ^ s.card * (∏ j ∈ s, a j) ^ (s.card - 1))
      = ∏ j ∈ s, a j * d j := by
  have hP : (∏ k ∈ s, a k) ≠ 0 := prod_ne_zero_iff.mpr ha
  obtain ⟨c, hc⟩ : ∃ c, s.card = c + 1 := ⟨s.card - 1, by
    have := hs.card_pos; omega⟩
  rw [prod_mul_distrib, hc, Nat.add_sub_cancel]
  field_simp
  ring

/-- The printed denominator `q^n Π a_j`: for `a = (1, 2, 3)`, `d = (1, 1, 1)`,
`q = 1` the quotient is `36`, not `a_1 d_1 a_2 d_2 a_3 d_3 = 6`. -/
theorem weighted_quotient_printed_false :
    ((1 : ℚ) ^ 3 * (1 * 1 * 1) * (1 * 2 * 3) ^ 3) / (1 ^ 3 * (1 * 2 * 3)) = 36
      ∧ (1 * 1) * (2 * 1) * (3 * 1 : ℚ) = 6 := by
  norm_num

end Weighted

end AizenbergIntegrals.Ch4

#print axioms AizenbergIntegrals.Ch4.remainder_tail
#print axioms AizenbergIntegrals.Ch4.remainder_tail_field
#print axioms AizenbergIntegrals.Ch4.example1_radius_le
#print axioms AizenbergIntegrals.Ch4.example1_radius_attained
#print axioms AizenbergIntegrals.Ch4.box_bound
#print axioms AizenbergIntegrals.Ch4.box_closed_one
#print axioms AizenbergIntegrals.Ch4.box_closed_two
#print axioms AizenbergIntegrals.Ch4.weighted_mapping_degree
#print axioms AizenbergIntegrals.Ch4.weighted_degree_after_substitution
#print axioms AizenbergIntegrals.Ch4.weighted_quotient
#print axioms AizenbergIntegrals.Ch4.weighted_quotient_printed_false
