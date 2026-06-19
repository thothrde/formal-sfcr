# formal-sfcr

**Type-theoretic formal verification of Solvency II / SFCR compliance using Lean 4**

Every theorem marked `by decide` is **machine-checked** by the Lean 4 kernel.
No assertion — a proof.

---

## What this does

Solvency II (Directive 2009/138/EC) requires insurers to publish annual
**SFCRs** (Solvency and Financial Condition Reports) with:

- **SCR** — Solvency Capital Requirement
- **MCR** — Minimum Capital Requirement (25%–45% of SCR, Art. 129(3))
- **EOF** — Eligible Own Funds
- **SCR Ratio** — EOF / SCR × 100%, must be ≥ 100% (Art. 100)

This project:
1. **Encodes** these legal requirements as Lean 4 types and decidable predicates
2. **Instantiates** them with data from published SFCR documents
3. **Proves or refutes** compliance with `by decide` — no rhetoric, no assertion

---

## Repository Structure

```
FormalSFCR/
├── Types.lean           -- SFCRData, ModelType, DataStatus
├── Directive.lean       -- Art. 100 + Art. 129(3) as decidable predicates
├── Predicates.lean      -- Compliance predicates on SFCRData records
└── Cases/
    ├── MunichRe_FY2025.lean      ✅ VERIFIED + DERIVED
    ├── ERGO_Direkt_FY2024.lean   ✅ VERIFIED (incl. ⚠ anomaly theorem)
    ├── ERGO_Leben_FY2024.lean    ⚠ PARTIAL (SCR confirmed)
    ├── Allianz_FY2025.lean       ⚠ PARTIAL (ratio confirmed)
    ├── HannoverRueck_FY2025.lean ⚠ PARTIAL (ratio confirmed)
    ├── Talanx_FY2024.lean        ⚠ PARTIAL (ratio confirmed)
    ├── HUK_Coburg_FY2025.lean    ⚠ PARTIAL (ratio confirmed)
    ├── AXA_Deutschland.lean      🔲 STUB
    ├── Generali_Deutschland.lean 🔲 STUB
    ├── RuV_Versicherung.lean     🔲 STUB (PDF URL confirmed)
    └── Debeka.lean               🔲 STUB
```

---

## Verified Theorems (`by decide` — machine-checked)

### Munich Re Group FY2025

| Theorem | Result |
|---|---|
| `munichRe_FY2025_scr_covered` | ✅ |
| `munichRe_FY2025_above_minimum` | ✅ |
| `munichRe_FY2025_above_comfort` | ✅ |
| `munichRe_FY2025_ratio_consistent` | ✅ |
| `munichRe_FY2024_scr_covered` | ✅ |
| `munichRe_FY2024_ratio_consistent` | ✅ |

Data: SCR €18.2bn (SFCR 2025 PDF confirmed); Ratio 300% (confirmed); EOF derived.

### ERGO Direkt Versicherung AG FY2024

| Theorem | Result |
|---|---|
| `ergo_direkt_FY2024_scr_covered` | ✅ |
| `ergo_direkt_FY2024_mcr_covered` | ✅ |
| `ergo_direkt_FY2024_above_minimum` | ✅ |
| `ergo_direkt_FY2024_above_comfort` | ✅ |
| `ergo_direkt_FY2024_mcr_lower_band` | ✅ |
| **`ergo_direkt_FY2024_mcr_upper_cap_anomaly`** | ✅ **FORMAL FINDING** |
| `ergo_direkt_FY2023_mcr_band` | ✅ |

Data: SCR 23,766 TEUR; MCR 10,695 TEUR; Ratio 290.2% — all from SFCR 2024 PDF.

#### ⚠ Formal Finding: MCR Upper-Cap Anomaly

```
Art. 129(3): MCR ≤ 45% × SCR  ↔  100 × MCR ≤ 45 × SCR
  100 × 10,695 = 1,069,500
   45 × 23,766 = 1,069,470
  Result: 1,069,500 > 1,069,470  →  cap FORMALLY EXCEEDED by 30 TEUR
```

Interpretation: The MCR was calculated at exactly the 45% cap (cap applied by BaFin).
TEUR rounding produces a 30 TEUR formal exceedance. Not a regulatory breach;
a rounding artifact provably visible in the TEUR representation of the SFCR.

### Ratio-only theorems (partial data, `by decide`)

| Entity | Confirmed Ratio | Theorems verified |
|---|---|---|
| Allianz Group FY2025 | 218% | above_minimum, above_comfort |
| Hannover Rück FY2025 | 256% | above_minimum, above_comfort |
| Talanx FY2024 (regulatory) | 220% | above_minimum, above_comfort |
| HUK-COBURG VVaG FY2025 (S/U) | 442.9% | above_minimum, above_comfort |
| HUK-COBURG PKV FY2024 | 254.9% | above_minimum |

---

## Data Sources

All data from publicly available documents. Sources are cited in each case file.

| Entity | Source | Date | Status |
|---|---|---|---|
| Munich Re Group FY2025 | SFCR 2025 PDF (munichre.com) | 2026-04-02 | Verified |
| Munich Re Group FY2024 | IR page (munichre.com) | 2026-06-19 | Verified |
| ERGO Direkt FY2024 | SFCR 2024 PDF (ergo.com) | 2025-04 | Verified |
| ERGO Lebensversicherung FY2024 | SFCR 2024 PDF (ergo.com) | 2025-04 | Partial |
| Allianz Group FY2025 | Solvency II Wire | 2026-05 | Partial (ratio) |
| Hannover Rück FY2025 | Annual results press release | 2026-03-12 | Partial (ratio) |
| Talanx FY2024 | Q1 2025 quarterly statement | 2025-05-15 | Partial (ratio) |
| HUK-COBURG VVaG FY2025 | Franke & Bornberg map-report 944 | 2026-05-07 | Partial (ratio) |
| HUK-COBURG PKV FY2024 | Franke & Bornberg map-report 939 | 2025-05 | Partial (ratio) |

---

## Legal Framework

- **Directive 2009/138/EC** (Solvency II Directive)
- **Directive (EU) 2025/2** (Solvency II Review, OJ L, 8 January 2025)
- **Commission Delegated Regulation (EU) 2015/35**
- **§40 VAG** (Versicherungsaufsichtsgesetz — German implementation)

---

## Contributing: Populate a STUB entry

1. Fetch SFCR PDF from insurer's investor relations page
2. Open QRT template S.25.01 in the PDF annex
3. Extract: SCR (row C0030), MCR (row C0100), EOF for SCR (row C0010)
4. Extract reported ratio from the Executive Summary
5. Update: `scr_teur`, `mcr_teur`, `eof_teur`, `ratio_reported_bp`
6. Set `data_status := .Verified`
7. Replace `sorry` with `by decide`
8. Cite PDF URL and publication date in the module docstring

---

## About

Author: Thomas Riepe — Autark Data, Berlin  
Lean 4 Mathlib contributor: PR #39701 (`feat/condensed-solid-isSolid-profiniteSolid`)  
Created: 2026-06-19  
License: MIT
