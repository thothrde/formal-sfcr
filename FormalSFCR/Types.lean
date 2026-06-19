/-!
# FormalSFCR.Types
Core data types for Solvency II / SFCR formal verification.
Monetary values in TEUR (Tausend EUR) for exact integer arithmetic.
Solvency II Directive: 2009/138/EC, amended by (EU) 2025/2.
-/
namespace FormalSFCR

inductive ModelType
  | StandardFormula
  | InternalModel
  | PartialInternalModel
  deriving Repr, DecidableEq

inductive DataStatus
  | Verified    -- from published SFCR PDF or official IR source
  | Derived     -- computed from two verified figures (e.g. EOF = SCR × ratio)
  | PartialData -- ratio known, EUR amounts not yet extracted
  | Stub        -- awaiting data; proofs use `sorry`
  deriving Repr, DecidableEq

/-!
Core SFCR data record. All monetary fields in TEUR.
ratio_reported_bp: basis points (30000 = 300.00%).
Fields set to 0 when data is unavailable (PartialData / Stub).
-/
structure SFCRData where
  insurer           : String
  lei_code          : String
  reporting_year    : Nat
  scr_teur          : Nat     -- SCR in TEUR; 0 if unavailable
  mcr_teur          : Nat     -- MCR in TEUR; 0 if unavailable
  eof_teur          : Nat     -- EOF (for SCR) in TEUR; 0 if unavailable
  ratio_reported_bp : Nat     -- SCR ratio in bp (10000 = 100%); 0 if unavailable
  with_transitionals : Bool
  ratio_excl_trans  : Bool
  model_type        : ModelType
  data_status       : DataStatus
  source_url        : String
  source_date       : String
  deriving Repr

end FormalSFCR
