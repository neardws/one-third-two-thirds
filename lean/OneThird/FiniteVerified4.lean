module
public import OneThird.GridData4_0
public import OneThird.GridData4_1
public import OneThird.GridData4_2
public import OneThird.GridData4_3
public import OneThird.GridData4_4
public import OneThird.GridData4_5
public import OneThird.GridData4_6
public import OneThird.GridData4_7
@[expose] public section
namespace OneThird.FiniteGrid4
/-- Kernel-checked full-grid recurrences and all event cutoffs for m=0,...,7. -/
def verified : (m : Fin 8) → Checked m.val
  | ⟨0,_⟩ => GridData4_0.checked
  | ⟨1,_⟩ => GridData4_1.checked
  | ⟨2,_⟩ => GridData4_2.checked
  | ⟨3,_⟩ => GridData4_3.checked
  | ⟨4,_⟩ => GridData4_4.checked
  | ⟨5,_⟩ => GridData4_5.checked
  | ⟨6,_⟩ => GridData4_6.checked
  | ⟨7,_⟩ => GridData4_7.checked
  | ⟨n+8,h⟩ => False.elim (by omega)
end OneThird.FiniteGrid4
