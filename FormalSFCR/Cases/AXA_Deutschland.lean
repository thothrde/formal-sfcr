/-!
# AXA Konzern AG (Deutschland) — STUB

## Data sources (STATUS: STUB — awaiting verified data)
Note: AXA Group ratio 224% FY2025 is group-level (France). German entity: see https://axa.de/ueber-axa/zahlen-und-fakten/solvency-ii/

Action required:
- Fetch SFCR 2025 PDF
- Extract SCR, MCR, EOF from QRT template S.25.01
- Extract reported SCR ratio from Executive Summary
- Update record with data_status := .Verified
- Replace `sorry` with `by decide`
-/
import FormalSFCR.Types
import FormalSFCR.Predicates

namespace FormalSFCR.Cases
open FormalSFCR FormalSFCR.Predicates

def axa_deutschland_stub : SFCRData := {
  insurer           := "AXA Konzern AG (Deutschland)"
  lei_code          := ""
  reporting_year    := 2025
  scr_teur          := 0
  mcr_teur          := 0
  eof_teur          := 0
  ratio_reported_bp := 0
  with_transitionals := false
  ratio_excl_trans  := true
  model_type        := .StandardFormula
  data_status       := .Stub
  source_url        := ""
  source_date       := ""
}

-- Replace sorry with `by decide` once ratio_reported_bp is populated
-- theorem stub_above_minimum : above_minimum ... := by sorry

end FormalSFCR.Cases
