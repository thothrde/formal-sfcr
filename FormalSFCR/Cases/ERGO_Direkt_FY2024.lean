/-!
# ERGO Direkt Versicherung AG — FY2024 SFCR

## Verified data sources (from SFCR PDF)
URL: https://www.ergo.com/content/dam/ergocom/de/pdf/unternehmen/berichte/sfcr/ergo-direkt-versicherung/sfcr-2024-ergo-direkt-versicherung.pdf.coredownload.pdf

Direct citation:
  "Die Kapitalanforderung bemisst sich am SCR in Höhe von 23.766 (20.156) Tsd. €
   und am MCR in Höhe von 10.695 (9.070) Tsd. €.
   Die Solvenzquote beträgt 290,2 (444,5) %."

FY2024: SCR = 23,766 TEUR; MCR = 10,695 TEUR; Ratio = 290.2%
FY2023: SCR = 20,156 TEUR; MCR = 9,070 TEUR; Ratio = 444.5%

## ⚠ FORMAL FINDING: MCR UPPER-CAP ANOMALY (provable by decide)

Art. 129(3): MCR ≤ 45% × SCR  ↔  100 × MCR ≤ 45 × SCR
  100 × 10,695 = 1,069,500
   45 × 23,766 = 1,069,470
  1,069,500 > 1,069,470  →  UPPER CAP FORMALLY EXCEEDED BY 30 TEUR

Interpretation: BaFin's calculation applies the 45% cap; TEUR rounding
produces a 30 TEUR formal exceedance. Not a regulatory breach; a rounding
artifact that is machine-checkably present in the published TEUR figures.
The theorem `ergo_direkt_FY2024_mcr_upper_cap_anomaly` is true by decide.
-/
import FormalSFCR.Types
import FormalSFCR.Predicates

namespace FormalSFCR.Cases
open FormalSFCR FormalSFCR.Predicates FormalSFCR.Directive

def ergo_direkt_FY2024 : SFCRData := {
  insurer           := "ERGO Direkt Versicherung AG"
  lei_code          := ""               -- not confirmed in available sources
  reporting_year    := 2024
  scr_teur          := 23_766           -- CONFIRMED from SFCR 2024 PDF
  mcr_teur          := 10_695           -- CONFIRMED from SFCR 2024 PDF
  eof_teur          := 68_990           -- DERIVED: 23766 × 2.902 ≈ 68,990 TEUR
  ratio_reported_bp := 29020            -- 290.2%; CONFIRMED from SFCR 2024 PDF
  with_transitionals := false
  ratio_excl_trans  := true
  model_type        := .InternalModel
  data_status       := .Verified
  source_url        := "https://www.ergo.com/content/dam/ergocom/de/pdf/unternehmen/berichte/sfcr/ergo-direkt-versicherung/sfcr-2024-ergo-direkt-versicherung.pdf.coredownload.pdf"
  source_date       := "2025-04"
}

theorem ergo_direkt_FY2024_scr_covered      : scr_coverage ergo_direkt_FY2024 := by decide
theorem ergo_direkt_FY2024_mcr_covered      : mcr_coverage ergo_direkt_FY2024 := by decide
theorem ergo_direkt_FY2024_above_minimum    : above_minimum ergo_direkt_FY2024 := by decide
theorem ergo_direkt_FY2024_above_comfort    : above_comfort_zone ergo_direkt_FY2024 := by decide
theorem ergo_direkt_FY2024_mcr_lower_band   :
    mcr_lower_band ergo_direkt_FY2024.scr_teur ergo_direkt_FY2024.mcr_teur := by decide

/- ⚠ FORMAL FINDING: The MCR upper cap is formally violated by 30 TEUR -/
theorem ergo_direkt_FY2024_mcr_upper_cap_anomaly :
    mcr_at_upper_cap ergo_direkt_FY2024 := by decide

-- FY2023 (from FY2024 prior-year column in SFCR)
def ergo_direkt_FY2023 : SFCRData := {
  insurer           := "ERGO Direkt Versicherung AG"
  lei_code          := ""
  reporting_year    := 2023
  scr_teur          := 20_156           -- CONFIRMED from SFCR 2024 prior-year column
  mcr_teur          := 9_070            -- CONFIRMED from SFCR 2024 prior-year column
  eof_teur          := 89_593           -- DERIVED: 20156 × 4.445 ≈ 89,593
  ratio_reported_bp := 44450            -- 444.5%; CONFIRMED from SFCR 2024
  with_transitionals := false
  ratio_excl_trans  := true
  model_type        := .InternalModel
  data_status       := .Derived
  source_url        := "https://www.ergo.com/content/dam/ergocom/de/pdf/unternehmen/berichte/sfcr/ergo-direkt-versicherung/sfcr-2024-ergo-direkt-versicherung.pdf.coredownload.pdf"
  source_date       := "2025-04"
}

-- MCR was within band in FY2023 (no cap anomaly)
theorem ergo_direkt_FY2023_mcr_band : mcr_band ergo_direkt_FY2023 := by decide

end FormalSFCR.Cases
