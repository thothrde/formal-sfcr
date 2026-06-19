/-!
# R+V Lebensversicherung AG — STUB

## Data sources (STATUS: STUB — awaiting verified data)
Note: SFCR 2025 PDF available: https://www.ruv.de/dam/jcr:b6c95966-d98b-47ec-b2e8-4ea364d398ee/2025-SFCR-Leben-AG.pdf — extract SCR, MCR, EOF from QRT S.25.01

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

def ruv_versicherung_stub : SFCRData := {
  insurer           := "R+V Lebensversicherung AG"
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
