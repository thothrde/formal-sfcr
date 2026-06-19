/-!
# ERGO Lebensversicherung AG — FY2024 SFCR

## Data sources (STATUS: PARTIAL — SCR confirmed, EOF/MCR/ratio pending)
URL: https://www.ergo.com/content/dam/ergocom/de/pdf/unternehmen/berichte/sfcr/ergo-leben/sfcr-2024-ergo-lebensversicherung.pdf.coredownload.pdf

Direct citation: "Die Kapitalanforderung bemisst sich am SCR in Höhe von
1.467.290 (973.047) Tsd. €"
FY2024 SCR: 1,467,290 TEUR = €1.467bn  CONFIRMED
FY2023 SCR: 973,047 TEUR = €0.973bn    CONFIRMED (prior-year column)

Note: +51% SCR increase reflects merger of Victoria Lebensversicherung
into ERGO Lebensversicherung AG (effective 1.1.2025, announced by ERGO Group).
-/
import FormalSFCR.Types
import FormalSFCR.Predicates

namespace FormalSFCR.Cases
open FormalSFCR FormalSFCR.Predicates

def ergo_leben_FY2024 : SFCRData := {
  insurer           := "ERGO Lebensversicherung AG"
  lei_code          := ""
  reporting_year    := 2024
  scr_teur          := 1_467_290        -- CONFIRMED from SFCR 2024 PDF
  mcr_teur          := 0                -- not extracted from available snippet
  eof_teur          := 0                -- not extracted from available snippet
  ratio_reported_bp := 0                -- not extracted from available snippet
  with_transitionals := true
  ratio_excl_trans  := false
  model_type        := .InternalModel
  data_status       := .PartialData
  source_url        := "https://www.ergo.com/content/dam/ergocom/de/pdf/unternehmen/berichte/sfcr/ergo-leben/sfcr-2024-ergo-lebensversicherung.pdf.coredownload.pdf"
  source_date       := "2025-04"
}

-- TODO: Populate eof_teur, mcr_teur, ratio_reported_bp from SFCR PDF
-- to replace sorry with by decide

end FormalSFCR.Cases
