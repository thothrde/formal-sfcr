/-!
# FormalSFCR.Directive
Formal encoding of Solvency II Directive constraints.

Sources:
- Directive 2009/138/EC (original Solvency II)
- Directive (EU) 2025/2 (Solvency II Review, OJ L 8.1.2025)

All thresholds encoded as integer constraints to support `by decide`.
-/
namespace FormalSFCR.Directive

/-!
## Art. 129(3) — MCR Band
MCR must satisfy: 0.25 × SCR ≤ MCR ≤ 0.45 × SCR
In TEUR integer arithmetic:
  25 × scr ≤ 100 × mcr   [lower band]
  100 × mcr ≤ 45 × scr   [upper cap]
-/

def mcr_lower_band (scr mcr : Nat) : Prop := 25 * scr ≤ 100 * mcr
def mcr_upper_cap  (scr mcr : Nat) : Prop := 100 * mcr ≤ 45 * scr
def mcr_band_compliant (scr mcr : Nat) : Prop :=
  mcr_lower_band scr mcr ∧ mcr_upper_cap scr mcr

instance (s m : Nat) : Decidable (mcr_lower_band s m) := inferInstance
instance (s m : Nat) : Decidable (mcr_upper_cap s m)  := inferInstance
instance (s m : Nat) : Decidable (mcr_band_compliant s m) := And.decidable

/-! ## Art. 100 — SCR Coverage: EOF ≥ SCR -/
def scr_covered (scr eof : Nat) : Prop := eof ≥ scr
instance (s e : Nat) : Decidable (scr_covered s e) := inferInstance

/-! ## Art. 129(1)(d) — MCR Coverage: EOF ≥ MCR -/
def mcr_covered (mcr eof : Nat) : Prop := eof ≥ mcr
instance (m e : Nat) : Decidable (mcr_covered m e) := inferInstance

/-!
## Ratio Internal Consistency
Computed bp = (10000 × EOF) / SCR (integer division).
Tolerance ±50 bp (= ±0.5 pp) for TEUR rounding.
-/
def computed_ratio_bp (scr eof : Nat) : Nat :=
  if scr = 0 then 0 else (10000 * eof) / scr

def ratio_consistent (scr eof reported_bp : Nat) : Prop :=
  let c := computed_ratio_bp scr eof
  (c : Int) - (reported_bp : Int) ≤ 50 ∧
  (reported_bp : Int) - (c : Int) ≤ 50

instance (s e r : Nat) : Decidable (ratio_consistent s e r) := And.decidable

end FormalSFCR.Directive
