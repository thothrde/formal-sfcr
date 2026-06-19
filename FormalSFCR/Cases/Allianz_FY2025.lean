/-!
# Allianz SE Group — FY2025 SFCR

## Data sources (STATUS: PARTIAL — ratio confirmed, EUR amounts pending)
Ratio FY2025: 218%
Source: Solvency II Wire, "Europe's Largest Solvency II Groups: SCR Ratios Rise
as EOF Outpaces Capital Requirements in 2025" (~May 2026).
https://www.solvencyiiwire.com/europes-largest-solvency-ii-groups-scr-ratios-rise-as-eof-outpaces-capital-requirements-in-2025/
Citation: "Allianz Group moved from 209% to 218%, a year-on-year change of +4.3%."

Ratio FY2024: 209%
Source: Solvency II Wire, "Allianz 2024 SFCR: solvency ratio down, sub-debt up",
November 2025. https://www.solvencyiiwire.com/allianz-2024-sfcr-solvency-ratio-down-sub-debt-up/
Citation: "Allianz group reported a drop in the Solvency II ratio from 229% in 2023 to 209% in 2024."

Full SFCR PDFs: https://www.allianz.com/en/investor_relations/results-reports.html
-/
import FormalSFCR.Types
import FormalSFCR.Predicates

namespace FormalSFCR.Cases
open FormalSFCR FormalSFCR.Predicates

def allianz_FY2025 : SFCRData := {
  insurer           := "Allianz SE Group"
  lei_code          := ""
  reporting_year    := 2025
  scr_teur          := 0                -- ⚠ see SFCR 2025 PDF for EUR amounts
  mcr_teur          := 0
  eof_teur          := 0
  ratio_reported_bp := 21800            -- 218%; CONFIRMED Solvency II Wire May 2026
  with_transitionals := false
  ratio_excl_trans  := true
  model_type        := .InternalModel
  data_status       := .PartialData
  source_url        := "https://www.solvencyiiwire.com/europes-largest-solvency-ii-groups-scr-ratios-rise-as-eof-outpaces-capital-requirements-in-2025/"
  source_date       := "2026-05"
}

theorem allianz_FY2025_above_minimum  : above_minimum allianz_FY2025 := by decide
theorem allianz_FY2025_above_comfort  : above_comfort_zone allianz_FY2025 := by decide

def allianz_FY2024 : SFCRData := {
  insurer           := "Allianz SE Group"
  lei_code          := ""
  reporting_year    := 2024
  scr_teur          := 0
  mcr_teur          := 0
  eof_teur          := 0
  ratio_reported_bp := 20900            -- 209%; CONFIRMED Solvency II Wire Nov 2025
  with_transitionals := false
  ratio_excl_trans  := true
  model_type        := .InternalModel
  data_status       := .PartialData
  source_url        := "https://www.solvencyiiwire.com/allianz-2024-sfcr-solvency-ratio-down-sub-debt-up/"
  source_date       := "2025-11"
}

theorem allianz_FY2024_above_minimum : above_minimum allianz_FY2024 := by decide

end FormalSFCR.Cases
