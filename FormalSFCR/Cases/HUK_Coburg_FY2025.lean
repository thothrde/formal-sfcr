/-!
# HUK-COBURG Gruppe — FY2025 / FY2024

## Data sources

### HUK-COBURG VVaG (Schaden/Unfall) FY2025: 442.9%
Source: Franke & Bornberg GmbH, map-report 944 –
"Solvabilität im Vergleich 2016 bis 2025", published 7 May 2026.
https://www.franke-bornberg.de/fb-news/pressemitteilungen/map-report-944-solvabilitaet-im-vergleich-2016-bis-2025
Citation: "Spitzenreiter sind die Württembergische Gemeinde-Versicherung (474,5 %),
Huk-Coburg VVaG (442,9 %) und DEVK Eisenbahn (418,0 %)."
(Ranking within Schaden-/Unfallversicherung top-50 by Franke & Bornberg)

### HUK-COBURG Krankenversicherung AG (PKV) FY2024: 254.9%
Source: Versicherungsbote.de / Franke & Bornberg map-report 939, May 2025:
https://www.versicherungsbote.de/id/4939463/PKV-Solvenzquoten-Hohes-Niveau-bei-breiter-Streuung/
Citation: "HUK-Coburg: 254,9 % (2023: 317,2 %)"

Note: HUK-COBURG is organised as VVaG (Versicherungsverein auf Gegenseitigkeit).
Solvency II requirements are identical to stock companies.
The 442.9% ratio makes HUK-COBURG among the most highly capitalised S/U insurers
in Germany in FY2025.
-/
import FormalSFCR.Types
import FormalSFCR.Predicates

namespace FormalSFCR.Cases
open FormalSFCR FormalSFCR.Predicates

def hukCoburg_SU_FY2025 : SFCRData := {
  insurer           := "HUK-COBURG VVaG (Schaden/Unfall)"
  lei_code          := ""
  reporting_year    := 2025
  scr_teur          := 0                -- ⚠ extract from SFCR 2025
  mcr_teur          := 0
  eof_teur          := 0
  ratio_reported_bp := 44290            -- 442.9%; CONFIRMED map-report 944, May 2026
  with_transitionals := false
  ratio_excl_trans  := true
  model_type        := .StandardFormula
  data_status       := .PartialData
  source_url        := "https://www.franke-bornberg.de/fb-news/pressemitteilungen/map-report-944-solvabilitaet-im-vergleich-2016-bis-2025"
  source_date       := "2026-05-07"
}

theorem hukCoburg_SU_FY2025_above_minimum : above_minimum hukCoburg_SU_FY2025 := by decide
theorem hukCoburg_SU_FY2025_above_comfort : above_comfort_zone hukCoburg_SU_FY2025 := by decide

def hukCoburg_PKV_FY2024 : SFCRData := {
  insurer           := "HUK-COBURG-Krankenversicherung AG"
  lei_code          := ""
  reporting_year    := 2024
  scr_teur          := 0
  mcr_teur          := 0
  eof_teur          := 0
  ratio_reported_bp := 25490            -- 254.9%; CONFIRMED map-report 939, May 2025
  with_transitionals := false
  ratio_excl_trans  := true
  model_type        := .StandardFormula
  data_status       := .PartialData
  source_url        := "https://www.versicherungsbote.de/id/4939463/PKV-Solvenzquoten-Hohes-Niveau-bei-breiter-Streuung/"
  source_date       := "2025-05"
}

theorem hukCoburg_PKV_FY2024_above_minimum : above_minimum hukCoburg_PKV_FY2024 := by decide

end FormalSFCR.Cases
