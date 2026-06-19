/-!
# Munich Re Group — FY2025 SFCR

## Verified data sources
- SFCR 2025 PDF (published 2026-04-02):
  https://www.munichre.com/content/dam/munichre/contentlounge/website-pieces/documents/SFCR-Munich-Re-Group-2025.pdf
  Direct citation: "SCR decreased by 3.6% to €18.2bn"; "Solvency II ratio: 300%;
  excluding transitional measures: 298%"
- Munich Re IR — Ratings & Solvency (FY2024 figures confirmed):
  https://www.munichre.com/en/company/investors/ratings-and-solvency.hsb.html
  "eligible own funds: €54.3bn; SCR: €18.9bn; ratio: 289%"
- Solvency II Wire (Apr 2026): ratio rose 289% → 300%
  https://www.solvencyiiwire.com/munich-re-2025-solvency-ii-ratio-increased-with-growth-of-tier-2-capital/

## Data notes
FY2025: SCR €18.2bn CONFIRMED. Ratio 300% CONFIRMED. EOF DERIVED = 18,200,000 × 3.00.
FY2024: SCR €18.9bn CONFIRMED. EOF €54.3bn CONFIRMED. Ratio 289% CONFIRMED.
MCR: group-level MCR not separately published in available public sources.
-/
import FormalSFCR.Types
import FormalSFCR.Predicates

namespace FormalSFCR.Cases
open FormalSFCR FormalSFCR.Predicates

def munichRe_FY2025 : SFCRData := {
  insurer           := "Munich Reinsurance Company (Munich Re Group)"
  lei_code          := "529900BDPJ7ZSH2CJEW7"
  reporting_year    := 2025
  scr_teur          := 18_200_000       -- €18.2bn; CONFIRMED SFCR 2025 PDF
  mcr_teur          := 0                -- not separately published (group, internal model)
  eof_teur          := 54_600_000       -- DERIVED: 18,200,000 × 3.00 (ratio = 300%)
  ratio_reported_bp := 30000            -- 300.00%; CONFIRMED SFCR 2025 PDF
  with_transitionals := true
  ratio_excl_trans  := false
  model_type        := .InternalModel
  data_status       := .Derived
  source_url        := "https://www.munichre.com/content/dam/munichre/contentlounge/website-pieces/documents/SFCR-Munich-Re-Group-2025.pdf"
  source_date       := "2026-04-02"
}

theorem munichRe_FY2025_scr_covered : scr_coverage munichRe_FY2025 := by decide
theorem munichRe_FY2025_above_minimum : above_minimum munichRe_FY2025 := by decide
theorem munichRe_FY2025_above_comfort : above_comfort_zone munichRe_FY2025 := by decide
theorem munichRe_FY2025_ratio_consistent : ratio_internally_consistent munichRe_FY2025 := by decide

def munichRe_FY2024 : SFCRData := {
  insurer           := "Munich Reinsurance Company (Munich Re Group)"
  lei_code          := "529900BDPJ7ZSH2CJEW7"
  reporting_year    := 2024
  scr_teur          := 18_900_000       -- €18.9bn; CONFIRMED Munich Re IR
  mcr_teur          := 0
  eof_teur          := 54_300_000       -- €54.3bn; CONFIRMED Munich Re IR
  ratio_reported_bp := 28900            -- 289%; CONFIRMED Munich Re IR
  with_transitionals := true
  ratio_excl_trans  := false
  model_type        := .InternalModel
  data_status       := .Verified
  source_url        := "https://www.munichre.com/en/company/investors/ratings-and-solvency.hsb.html"
  source_date       := "2026-06-19"
}

theorem munichRe_FY2024_scr_covered : scr_coverage munichRe_FY2024 := by decide
theorem munichRe_FY2024_above_minimum : above_minimum munichRe_FY2024 := by decide
theorem munichRe_FY2024_ratio_consistent : ratio_internally_consistent munichRe_FY2024 := by decide

end FormalSFCR.Cases
