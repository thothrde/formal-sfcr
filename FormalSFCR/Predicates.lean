/-!
# FormalSFCR.Predicates
Formal compliance predicates on SFCRData records.
All predicates are decidable (provable by `by decide` with concrete data).
-/
import FormalSFCR.Types
import FormalSFCR.Directive

namespace FormalSFCR.Predicates
open FormalSFCR Directive

def scr_coverage (d : SFCRData) : Prop := scr_covered d.scr_teur d.eof_teur
def mcr_coverage (d : SFCRData) : Prop := mcr_covered d.mcr_teur d.eof_teur
def mcr_band     (d : SFCRData) : Prop := mcr_band_compliant d.scr_teur d.mcr_teur
def ratio_internally_consistent (d : SFCRData) : Prop :=
  ratio_consistent d.scr_teur d.eof_teur d.ratio_reported_bp
def above_minimum    (d : SFCRData) : Prop := d.ratio_reported_bp ≥ 10000
def above_comfort_zone (d : SFCRData) : Prop := d.ratio_reported_bp ≥ 15000

/-- MCR upper-cap anomaly: MCR > 45% SCR in TEUR representation -/
def mcr_at_upper_cap (d : SFCRData) : Prop := ¬ mcr_upper_cap d.scr_teur d.mcr_teur

instance (d : SFCRData) : Decidable (scr_coverage d) := inferInstance
instance (d : SFCRData) : Decidable (mcr_coverage d) := inferInstance
instance (d : SFCRData) : Decidable (mcr_band d) := And.decidable
instance (d : SFCRData) : Decidable (ratio_internally_consistent d) := And.decidable
instance (d : SFCRData) : Decidable (above_minimum d) := inferInstance
instance (d : SFCRData) : Decidable (above_comfort_zone d) := inferInstance
instance (d : SFCRData) : Decidable (mcr_at_upper_cap d) := inferInstance

end FormalSFCR.Predicates
