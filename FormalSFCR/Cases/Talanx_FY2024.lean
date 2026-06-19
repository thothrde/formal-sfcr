/-!
# Talanx Group / HDI Gruppe — FY2024 SFCR

## Data sources (STATUS: PARTIAL — ratio confirmed, EUR amounts pending)
Ratio FY2024 (regulatory, Art. 230): 220%

Source: Talanx AG Q1 2025 Quarterly Statement (15 May 2025):
https://www.talanx.com/en/newsroom/press_articles/quarterly-statement-as-of-31-march-2025
Citation: "Regulatory Solvency 2 ratio was 220 percent per 31 December 2024 and
216 percent per 31 March 2025 based on Article 230(2) of Directive 2009/138/EC."

Internal model ratio Q1 2025: 229% (differs from regulatory 216%)
The binding regulatory figure is 220% (FY2024) / 216% (Q1 2025).

HDI Gruppe SFCR 2024 PDF:
https://www.talanx.com/media/files/investor-relations/pdf/geschaeftsberichte/risikoberichte/2024/2024-sfcr-hdi-gruppe-de.pdf
-/
import FormalSFCR.Types
import FormalSFCR.Predicates

namespace FormalSFCR.Cases
open FormalSFCR FormalSFCR.Predicates

def talanx_FY2024 : SFCRData := {
  insurer           := "Talanx AG / HDI Gruppe"
  lei_code          := ""
  reporting_year    := 2024
  scr_teur          := 0                -- ⚠ extract from HDI Gruppe SFCR 2024
  mcr_teur          := 0
  eof_teur          := 0
  ratio_reported_bp := 22000            -- 220% regulatory; CONFIRMED Talanx Q1 2025
  with_transitionals := false
  ratio_excl_trans  := true
  model_type        := .PartialInternalModel  -- TERM partial internal model
  data_status       := .PartialData
  source_url        := "https://www.talanx.com/en/newsroom/press_articles/quarterly-statement-as-of-31-march-2025"
  source_date       := "2025-05-15"
}

theorem talanx_FY2024_above_minimum : above_minimum talanx_FY2024 := by decide
theorem talanx_FY2024_above_comfort : above_comfort_zone talanx_FY2024 := by decide

end FormalSFCR.Cases
