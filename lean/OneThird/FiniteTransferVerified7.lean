module
public import OneThird.FiniteTransferData7_0
public import OneThird.FiniteTransferData7_1
public import OneThird.FiniteTransferData7_2
public import OneThird.FiniteTransferData7_3
public import OneThird.FiniteTransferData7_4
public import OneThird.FiniteTransferData7_5
public import OneThird.FiniteTransferData7_6
public import OneThird.FiniteTransferData7_7
@[expose] public section
namespace OneThird.FiniteTransfer7
def verified : (m : Fin 8) → Checked m
  | ⟨0,_⟩ => FiniteTransferData7_0.checked
  | ⟨1,_⟩ => FiniteTransferData7_1.checked
  | ⟨2,_⟩ => FiniteTransferData7_2.checked
  | ⟨3,_⟩ => FiniteTransferData7_3.checked
  | ⟨4,_⟩ => FiniteTransferData7_4.checked
  | ⟨5,_⟩ => FiniteTransferData7_5.checked
  | ⟨6,_⟩ => FiniteTransferData7_6.checked
  | ⟨7,_⟩ => FiniteTransferData7_7.checked
  | ⟨n+8,h⟩ => False.elim (by omega)
end OneThird.FiniteTransfer7
