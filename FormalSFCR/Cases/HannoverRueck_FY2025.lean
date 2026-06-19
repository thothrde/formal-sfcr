/-!
# Hannover Rück SE — FY2025 SFCR

## Data sources (STATUS: PARTIAL — ratio confirmed, EUR amounts pending)
Ratio FY2025: 256% (FY2024: 261%)

Source 1: "Hannover Re Publishes 2025 Results", 12 March 2026:
https://insurance-edge.net/2026/03/12/hannover-re-publishes-2025-results/
Citation: "The capital adequacy ratio under Solvency II stood at 256% at
the end of December 2025, compared with 261% a year earlier."

Source 2: Reinsurance News, 12 March 2026:
https://www.reinsurancene.ws/hannover-res-net-income-rises-to-e2-6bn-in-2025
Same citation confirmed.

SFCR 2025 PDF: https://assets.hannover-re.com/asset/.../2025_SFCR_HRSE_E.pdf
(URL confirmed in search; SCR/EOF amounts not yet extracted)

Ratio decrease 261% → 256%: driven by realized fixed-income losses (~€593m in 2025)
and reserve strengthening (+€700m). Ratio remains well above internal target (≥200%).
-/
import FormalSFCR.Types
import FormalSFCR.Predicates

namespace FormalSFCR.Cases
open FormalSFCR FormalSFCR.Predicates

def hannoverRueck_FY2025 : SFCRData := {
  insurer           := "Hannover Rück SE"
  lei_code          := "529900ODI3047E2LIV03"
  reporting_year    := 2025
  scr_teur          := 0                -- ⚠ extract from SFCR 2025 PDF
  mcr_teur          := 0
  eof_teur          := 0
  ratio_reported_bp := 25600            -- 256%; CONFIRMED annual results Mar 2026
  with_transitionals := true
  ratio_excl_trans  := false
  model_type        := .InternalModel
  data_status       := .PartialData
  source_url        := "https://insurance-edge.net/2026/03/12/hannover-re-publishes-2025-results/"
  source_date       := "2026-03-12"
}

theorem hannoverRueck_FY2025_above_minimum : above_minimum hannoverRueck_FY2025 := by decide
theorem hannoverRueck_FY2025_above_comfort : above_comfort_zone hannoverRueck_FY2025 := by decide

def hannoverRueck_FY2024 : SFCRData := {
  insurer           := "Hannover Rück SE"
  lei_code          := "529900ODI3047E2LIV03"
  reporting_year    := 2024
  scr_teur          := 0
  mcr_teur          := 0
  eof_teur          := 0
  ratio_reported_bp := 26100            -- 261%; CONFIRMED as prior-year in Mar 2026 press release
  with_transitionals := true
  ratio_excl_trans  := false
  model_type        := .InternalModel
  data_status       := .PartialData
  source_url        := "https://insurance-edge.net/2026/03/12/hannover-re-publishes-2025-results/"
  source_date       := "2026-03-12"
}

end FormalSFCR.Cases
