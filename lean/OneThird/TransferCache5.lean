module
public import OneThird.CircuitSemantics5
@[expose] public section
namespace OneThird.TransferCache5
open Matrix Structure MatrixBounds CertificateChecker CertificateData4 CircuitSemantics5
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false
def preP0 : ZMat := !![1, 0, 0, 0, 0, 0; 0, 1, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 1, 0; 0, 0, 0, 0, 0, 1]
theorem pre_prefix0 : transfer (pre.take 0)=preP0 := by
  decide
def preP1 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix1 : transfer (pre.take 1)=preP1 := by
  have hs : pre.take 1=pre.take 0++[pre[0]!] := rfl
  rw [hs, transfer_append, pre_prefix0]
  decide
def preP2 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix2 : transfer (pre.take 2)=preP2 := by
  have hs : pre.take 2=pre.take 1++[pre[1]!] := rfl
  rw [hs, transfer_append, pre_prefix1]
  decide
def preP3 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 1, 3, 5, 5, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix3 : transfer (pre.take 3)=preP3 := by
  have hs : pre.take 3=pre.take 2++[pre[2]!] := rfl
  rw [hs, transfer_append, pre_prefix2]
  decide
def preP4 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 4, 9, 14, 14, 0, 0; 1, 3, 5, 5, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix4 : transfer (pre.take 4)=preP4 := by
  have hs : pre.take 4=pre.take 3++[pre[3]!] := rfl
  rw [hs, transfer_append, pre_prefix3]
  decide
def preP5 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 9, 23, 37, 37, 37, 0; 3, 8, 13, 13, 13, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix5 : transfer (pre.take 5)=preP5 := by
  have hs : pre.take 5=pre.take 4++[pre[4]!] := rfl
  rw [hs, transfer_append, pre_prefix4]
  decide
def preP6 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 32, 69, 106, 143, 0, 0; 11, 24, 37, 50, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix6 : transfer (pre.take 6)=preP6 := by
  have hs : pre.take 6=pre.take 5++[pre[5]!] := rfl
  rw [hs, transfer_append, pre_prefix5]
  decide
def preP7 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 69, 175, 318, 318, 318, 0; 24, 61, 111, 111, 111, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix7 : transfer (pre.take 7)=preP7 := by
  have hs : pre.take 7=pre.take 6++[pre[6]!] := rfl
  rw [hs, transfer_append, pre_prefix6]
  decide
def preP8 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 244, 562, 880, 1198, 0, 0; 85, 196, 307, 418, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix8 : transfer (pre.take 8)=preP8 := by
  have hs : pre.take 8=pre.take 7++[pre[7]!] := rfl
  rw [hs, transfer_append, pre_prefix7]
  decide
def preP9 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 562, 1442, 2640, 2640, 0, 0; 196, 503, 921, 921, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix9 : transfer (pre.take 9)=preP9 := by
  have hs : pre.take 9=pre.take 8++[pre[8]!] := rfl
  rw [hs, transfer_append, pre_prefix8]
  decide
def preP10 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 2004, 4644, 7284, 7284, 0, 0; 699, 1620, 2541, 2541, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix10 : transfer (pre.take 10)=preP10 := by
  have hs : pre.take 10=pre.take 9++[pre[9]!] := rfl
  rw [hs, transfer_append, pre_prefix9]
  decide
def preP11 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 4644, 11928, 19212, 19212, 19212, 0; 1620, 4161, 6702, 6702, 6702, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix11 : transfer (pre.take 11)=preP11 := by
  have hs : pre.take 11=pre.take 10++[pre[10]!] := rfl
  rw [hs, transfer_append, pre_prefix10]
  decide
def preP12 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 16572, 35784, 54996, 74208, 0, 0; 5781, 12483, 19185, 25887, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix12 : transfer (pre.take 12)=preP12 := by
  have hs : pre.take 12=pre.take 11++[pre[11]!] := rfl
  rw [hs, transfer_append, pre_prefix11]
  decide
def preP13 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 35784, 90780, 164988, 164988, 0, 0; 12483, 31668, 57555, 57555, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix13 : transfer (pre.take 13)=preP13 := by
  have hs : pre.take 13=pre.take 12++[pre[12]!] := rfl
  rw [hs, transfer_append, pre_prefix12]
  decide
def preP14 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 126564, 291552, 456540, 456540, 0, 0; 44151, 101706, 159261, 159261, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix14 : transfer (pre.take 14)=preP14 := by
  have hs : pre.take 14=pre.take 13++[pre[13]!] := rfl
  rw [hs, transfer_append, pre_prefix13]
  decide
def preP15 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 291552, 748092, 1204632, 1204632, 1204632, 0; 101706, 260967, 420228, 420228, 420228, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix15 : transfer (pre.take 15)=preP15 := by
  have hs : pre.take 15=pre.take 14++[pre[14]!] := rfl
  rw [hs, transfer_append, pre_prefix14]
  decide
def preP16 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 1039644, 2244276, 3448908, 4653540, 0, 0; 362673, 782901, 1203129, 1623357, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix16 : transfer (pre.take 16)=preP16 := by
  have hs : pre.take 16=pre.take 15++[pre[15]!] := rfl
  rw [hs, transfer_append, pre_prefix15]
  decide
def preP17 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 2244276, 5693184, 10346724, 10346724, 0, 0; 782901, 1986030, 3609387, 3609387, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix17 : transfer (pre.take 17)=preP17 := by
  have hs : pre.take 17=pre.take 16++[pre[16]!] := rfl
  rw [hs, transfer_append, pre_prefix16]
  decide
def preP18 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 7937460, 18284184, 28630908, 28630908, 0, 0; 2768931, 6378318, 9987705, 9987705, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix18 : transfer (pre.take 18)=preP18 := by
  have hs : pre.take 18=pre.take 17++[pre[17]!] := rfl
  rw [hs, transfer_append, pre_prefix17]
  decide
def preP19 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 18284184, 46915092, 75546000, 75546000, 75546000, 0; 6378318, 16366023, 26353728, 26353728, 26353728, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix19 : transfer (pre.take 19)=preP19 := by
  have hs : pre.take 19=pre.take 18++[pre[18]!] := rfl
  rw [hs, transfer_append, pre_prefix18]
  decide
def preP20 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 65199276, 140745276, 216291276, 291837276, 0, 0; 22744341, 49098069, 75451797, 101805525, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix20 : transfer (pre.take 20)=preP20 := by
  have hs : pre.take 20=pre.take 19++[pre[19]!] := rfl
  rw [hs, transfer_append, pre_prefix19]
  decide
def preP21 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 140745276, 357036552, 648873828, 648873828, 0, 0; 49098069, 124549866, 226355391, 226355391, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix21 : transfer (pre.take 21)=preP21 := by
  have hs : pre.take 21=pre.take 20++[pre[20]!] := rfl
  rw [hs, transfer_append, pre_prefix20]
  decide
def preP22 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 357036552, 1005910380, 1654784208, 1654784208, 0, 0; 124549866, 350905257, 577260648, 577260648, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_prefix22 : transfer (pre.take 22)=preP22 := by
  have hs : pre.take 22=pre.take 21++[pre[21]!] := rfl
  rw [hs, transfer_append, pre_prefix21]
  decide
def preS22 : ZMat := !![1, 0, 0, 0, 0, 0; 0, 1, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 1, 0; 0, 0, 0, 0, 0, 1]
theorem pre_suffix22 : transfer (pre.drop 22)=preS22 := by
  decide
def preS21 : ZMat := !![0, 0, 0, 0, 0, 0; 1, 1, 1, 1, 0, 0; 0, 1, 1, 1, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix21 : transfer (pre.drop 21)=preS21 := by
  change rowMatrix pre[21]! * transfer (pre.drop 22)=preS21
  rw [pre_suffix22]
  decide
def preS20 : ZMat := !![0, 0, 0, 0, 0, 0; 1, 2, 3, 3, 0, 0; 1, 2, 3, 3, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix20 : transfer (pre.drop 20)=preS20 := by
  change rowMatrix pre[20]! * transfer (pre.drop 21)=preS20
  rw [pre_suffix21]
  decide
def preS19 : ZMat := !![2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 1, 3, 5, 5, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix19 : transfer (pre.drop 19)=preS19 := by
  change rowMatrix pre[19]! * transfer (pre.drop 20)=preS19
  rw [pre_suffix20]
  decide
def preS18 : ZMat := !![0, 0, 0, 0, 0, 0; 7, 19, 31, 31, 0, 0; 5, 14, 23, 23, 0, 0; 3, 9, 15, 15, 0, 0; 1, 4, 7, 7, 0, 0; 0, 1, 2, 2, 0, 0]
theorem pre_suffix18 : transfer (pre.drop 18)=preS18 := by
  change rowMatrix pre[18]! * transfer (pre.drop 19)=preS18
  rw [pre_suffix19]
  decide
def preS17 : ZMat := !![15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 8, 23, 38, 38, 0, 0; 3, 9, 15, 15, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix17 : transfer (pre.drop 17)=preS17 := by
  change rowMatrix pre[17]! * transfer (pre.drop 18)=preS17
  rw [pre_suffix18]
  decide
def preS16 : ZMat := !![0, 0, 0, 0, 0, 0; 53, 149, 245, 245, 0, 0; 38, 107, 176, 176, 0, 0; 23, 65, 107, 107, 0, 0; 8, 23, 38, 38, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix16 : transfer (pre.drop 16)=preS16 := by
  change rowMatrix pre[16]! * transfer (pre.drop 17)=preS16
  rw [pre_suffix17]
  decide
def preS15 : ZMat := !![114, 321, 528, 528, 0, 0; 114, 321, 528, 528, 0, 0; 114, 321, 528, 528, 0, 0; 61, 172, 283, 283, 0, 0; 23, 65, 107, 107, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix15 : transfer (pre.drop 15)=preS15 := by
  change rowMatrix pre[15]! * transfer (pre.drop 16)=preS15
  rw [pre_suffix16]
  decide
def preS14 : ZMat := !![0, 0, 0, 0, 0, 0; 426, 1200, 1974, 1974, 0, 0; 312, 879, 1446, 1446, 0, 0; 198, 558, 918, 918, 0, 0; 84, 237, 390, 390, 0, 0; 23, 65, 107, 107, 0, 0]
theorem pre_suffix14 : transfer (pre.drop 14)=preS14 := by
  change rowMatrix pre[14]! * transfer (pre.drop 15)=preS14
  rw [pre_suffix15]
  decide
def preS13 : ZMat := !![936, 2637, 4338, 4338, 0, 0; 936, 2637, 4338, 4338, 0, 0; 936, 2637, 4338, 4338, 0, 0; 510, 1437, 2364, 2364, 0, 0; 198, 558, 918, 918, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix13 : transfer (pre.drop 13)=preS13 := by
  change rowMatrix pre[13]! * transfer (pre.drop 14)=preS13
  rw [pre_suffix14]
  decide
def preS12 : ZMat := !![0, 0, 0, 0, 0, 0; 3318, 9348, 15378, 15378, 0, 0; 2382, 6711, 11040, 11040, 0, 0; 1446, 4074, 6702, 6702, 0, 0; 510, 1437, 2364, 2364, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix12 : transfer (pre.drop 12)=preS12 := by
  change rowMatrix pre[12]! * transfer (pre.drop 13)=preS12
  rw [pre_suffix13]
  decide
def preS11 : ZMat := !![7146, 20133, 33120, 33120, 0, 0; 7146, 20133, 33120, 33120, 0, 0; 7146, 20133, 33120, 33120, 0, 0; 3828, 10785, 17742, 17742, 0, 0; 1446, 4074, 6702, 6702, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix11 : transfer (pre.drop 11)=preS11 := by
  change rowMatrix pre[11]! * transfer (pre.drop 12)=preS11
  rw [pre_suffix12]
  decide
def preS10 : ZMat := !![0, 0, 0, 0, 0, 0; 26712, 75258, 123804, 123804, 0, 0; 19566, 55125, 90684, 90684, 0, 0; 12420, 34992, 57564, 57564, 0, 0; 5274, 14859, 24444, 24444, 0, 0; 1446, 4074, 6702, 6702, 0, 0]
theorem pre_suffix10 : transfer (pre.drop 10)=preS10 := by
  change rowMatrix pre[10]! * transfer (pre.drop 11)=preS10
  rw [pre_suffix11]
  decide
def preS9 : ZMat := !![58698, 165375, 272052, 272052, 0, 0; 58698, 165375, 272052, 272052, 0, 0; 58698, 165375, 272052, 272052, 0, 0; 31986, 90117, 148248, 148248, 0, 0; 12420, 34992, 57564, 57564, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix9 : transfer (pre.drop 9)=preS9 := by
  change rowMatrix pre[9]! * transfer (pre.drop 10)=preS9
  rw [pre_suffix10]
  decide
def preS8 : ZMat := !![0, 0, 0, 0, 0, 0; 208080, 586242, 964404, 964404, 0, 0; 149382, 420867, 692352, 692352, 0, 0; 90684, 255492, 420300, 420300, 0, 0; 31986, 90117, 148248, 148248, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix8 : transfer (pre.drop 8)=preS8 := by
  change rowMatrix pre[8]! * transfer (pre.drop 9)=preS8
  rw [pre_suffix9]
  decide
def preS7 : ZMat := !![448146, 1262601, 2077056, 2077056, 0, 0; 448146, 1262601, 2077056, 2077056, 0, 0; 448146, 1262601, 2077056, 2077056, 0, 0; 240066, 676359, 1112652, 1112652, 0, 0; 90684, 255492, 420300, 420300, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix7 : transfer (pre.drop 7)=preS7 := by
  change rowMatrix pre[7]! * transfer (pre.drop 8)=preS7
  rw [pre_suffix8]
  decide
def preS6 : ZMat := !![0, 0, 0, 0, 0, 0; 1675188, 4719654, 7764120, 7764120, 0, 0; 1227042, 3457053, 5687064, 5687064, 0, 0; 778896, 2194452, 3610008, 3610008, 0, 0; 330750, 931851, 1532952, 1532952, 0, 0; 90684, 255492, 420300, 420300, 0, 0]
theorem pre_suffix6 : transfer (pre.drop 6)=preS6 := by
  change rowMatrix pre[6]! * transfer (pre.drop 7)=preS6
  rw [pre_suffix7]
  decide
def preS5 : ZMat := !![3681126, 10371159, 17061192, 17061192, 0, 0; 3681126, 10371159, 17061192, 17061192, 0, 0; 3681126, 10371159, 17061192, 17061192, 0, 0; 2005938, 5651505, 9297072, 9297072, 0, 0; 778896, 2194452, 3610008, 3610008, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix5 : transfer (pre.drop 5)=preS5 := by
  change rowMatrix pre[5]! * transfer (pre.drop 6)=preS5
  rw [pre_suffix6]
  decide
def preS4 : ZMat := !![0, 0, 0, 0, 0, 0; 13828212, 38959434, 64090656, 64090656, 0, 0; 10147086, 28588275, 47029464, 47029464, 0, 0; 6465960, 18217116, 29968272, 29968272, 0, 0; 2784834, 7845957, 12907080, 12907080, 0, 0; 778896, 2194452, 3610008, 3610008, 0, 0]
theorem pre_suffix4 : transfer (pre.drop 4)=preS4 := by
  change rowMatrix pre[4]! * transfer (pre.drop 5)=preS4
  rw [pre_suffix5]
  decide
def preS3 : ZMat := !![30441258, 85764825, 141088392, 141088392, 0, 0; 30441258, 85764825, 141088392, 141088392, 0, 0; 30441258, 85764825, 141088392, 141088392, 0, 0; 16613046, 46805391, 76997736, 76997736, 0, 0; 6465960, 18217116, 29968272, 29968272, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix3 : transfer (pre.drop 3)=preS3 := by
  change rowMatrix pre[3]! * transfer (pre.drop 4)=preS3
  rw [pre_suffix4]
  decide
def preS2 : ZMat := !![0, 0, 0, 0, 0, 0; 107936820, 304099866, 500262912, 500262912, 0, 0; 77495562, 218335041, 359174520, 359174520, 0, 0; 47054304, 132570216, 218086128, 218086128, 0, 0; 16613046, 46805391, 76997736, 76997736, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix2 : transfer (pre.drop 2)=preS2 := by
  change rowMatrix pre[2]! * transfer (pre.drop 3)=preS2
  rw [pre_suffix3]
  decide
def preS1 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 232486686, 655005123, 1077523560, 1077523560, 0, 0; 124549866, 350905257, 577260648, 577260648, 0, 0; 47054304, 132570216, 218086128, 218086128, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix1 : transfer (pre.drop 1)=preS1 := by
  change rowMatrix pre[1]! * transfer (pre.drop 2)=preS1
  rw [pre_suffix2]
  decide
def preS0 : ZMat := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 357036552, 1005910380, 1654784208, 1654784208, 0, 0; 124549866, 350905257, 577260648, 577260648, 0, 0; 0, 0, 0, 0, 0, 0]
theorem pre_suffix0 : transfer (pre.drop 0)=preS0 := by
  change rowMatrix pre[0]! * transfer (pre.drop 1)=preS0
  rw [pre_suffix1]
  decide
def midP0 : ZMat := !![1, 0, 0, 0, 0, 0; 0, 1, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 1, 0; 0, 0, 0, 0, 0, 1]
theorem mid_prefix0 : transfer (mid.take 0)=midP0 := by
  decide
def midP1 : ZMat := !![1, 1, 1, 1, 0, 0; 1, 1, 1, 1, 0, 0; 0, 1, 1, 1, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_prefix1 : transfer (mid.take 1)=midP1 := by
  have hs : mid.take 1=mid.take 0++[mid[0]!] := rfl
  rw [hs, transfer_append, mid_prefix0]
  decide
def midP2 : ZMat := !![1, 2, 3, 3, 3, 0; 1, 2, 3, 3, 3, 0; 1, 2, 3, 3, 3, 0; 0, 1, 2, 2, 2, 0; 0, 0, 1, 1, 1, 0; 0, 0, 0, 0, 0, 0]
theorem mid_prefix2 : transfer (mid.take 2)=midP2 := by
  have hs : mid.take 2=mid.take 1++[mid[1]!] := rfl
  rw [hs, transfer_append, mid_prefix1]
  decide
def midP3 : ZMat := !![3, 6, 9, 12, 0, 0; 3, 6, 9, 12, 0, 0; 3, 6, 9, 12, 0, 0; 1, 3, 5, 7, 0, 0; 0, 1, 2, 3, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_prefix3 : transfer (mid.take 3)=midP3 := by
  have hs : mid.take 3=mid.take 2++[mid[2]!] := rfl
  rw [hs, transfer_append, mid_prefix2]
  decide
def midP4 : ZMat := !![6, 15, 27, 27, 0, 0; 6, 15, 27, 27, 0, 0; 6, 15, 27, 27, 0, 0; 3, 8, 15, 15, 0, 0; 1, 3, 6, 6, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_prefix4 : transfer (mid.take 4)=midP4 := by
  have hs : mid.take 4=mid.take 3++[mid[3]!] := rfl
  rw [hs, transfer_append, mid_prefix3]
  decide
def midP5 : ZMat := !![15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 8, 23, 38, 38, 0, 0; 3, 9, 15, 15, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_prefix5 : transfer (mid.take 5)=midP5 := by
  have hs : mid.take 5=mid.take 4++[mid[4]!] := rfl
  rw [hs, transfer_append, mid_prefix4]
  decide
def midP6 : ZMat := !![57, 126, 195, 195, 0, 0; 57, 126, 195, 195, 0, 0; 57, 126, 195, 195, 0, 0; 31, 69, 107, 107, 0, 0; 12, 27, 42, 42, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_prefix6 : transfer (mid.take 6)=midP6 := by
  have hs : mid.take 6=mid.take 5++[mid[5]!] := rfl
  rw [hs, transfer_append, mid_prefix5]
  decide
def midP7 : ZMat := !![126, 321, 516, 516, 0, 0; 126, 321, 516, 516, 0, 0; 126, 321, 516, 516, 0, 0; 69, 176, 283, 283, 0, 0; 27, 69, 111, 111, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_prefix7 : transfer (mid.take 7)=midP7 := by
  have hs : mid.take 7=mid.take 6++[mid[6]!] := rfl
  rw [hs, transfer_append, mid_prefix6]
  decide
def midP8 : ZMat := !![321, 837, 1353, 1353, 1353, 0; 321, 837, 1353, 1353, 1353, 0; 321, 837, 1353, 1353, 1353, 0; 176, 459, 742, 742, 742, 0; 69, 180, 291, 291, 291, 0; 0, 0, 0, 0, 0, 0]
theorem mid_prefix8 : transfer (mid.take 8)=midP8 := by
  have hs : mid.take 8=mid.take 7++[mid[7]!] := rfl
  rw [hs, transfer_append, mid_prefix7]
  decide
def midP9 : ZMat := !![1158, 2511, 3864, 5217, 0, 0; 1158, 2511, 3864, 5217, 0, 0; 1158, 2511, 3864, 5217, 0, 0; 635, 1377, 2119, 2861, 0, 0; 249, 540, 831, 1122, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_prefix9 : transfer (mid.take 9)=midP9 := by
  have hs : mid.take 9=mid.take 8++[mid[8]!] := rfl
  rw [hs, transfer_append, mid_prefix8]
  decide
def midP10 : ZMat := !![2511, 6375, 11592, 11592, 0, 0; 2511, 6375, 11592, 11592, 0, 0; 2511, 6375, 11592, 11592, 0, 0; 1377, 3496, 6357, 6357, 0, 0; 540, 1371, 2493, 2493, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_prefix10 : transfer (mid.take 10)=midP10 := by
  have hs : mid.take 10=mid.take 9++[mid[9]!] := rfl
  rw [hs, transfer_append, mid_prefix9]
  decide
def midP11 : ZMat := !![6375, 17967, 29559, 29559, 0, 0; 6375, 17967, 29559, 29559, 0, 0; 6375, 17967, 29559, 29559, 0, 0; 3496, 9853, 16210, 16210, 0, 0; 1371, 3864, 6357, 6357, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_prefix11 : transfer (mid.take 11)=midP11 := by
  have hs : mid.take 11=mid.take 10++[mid[10]!] := rfl
  rw [hs, transfer_append, mid_prefix10]
  decide
def midS11 : ZMat := !![1, 0, 0, 0, 0, 0; 0, 1, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 1, 0; 0, 0, 0, 0, 0, 1]
theorem mid_suffix11 : transfer (mid.drop 11)=midS11 := by
  decide
def midS10 : ZMat := !![0, 0, 0, 0, 0, 0; 1, 1, 1, 1, 0, 0; 0, 1, 1, 1, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_suffix10 : transfer (mid.drop 10)=midS10 := by
  change rowMatrix mid[10]! * transfer (mid.drop 11)=midS10
  rw [mid_suffix11]
  decide
def midS9 : ZMat := !![0, 0, 0, 0, 0, 0; 1, 2, 3, 3, 0, 0; 1, 2, 3, 3, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_suffix9 : transfer (mid.drop 9)=midS9 := by
  change rowMatrix mid[9]! * transfer (mid.drop 10)=midS9
  rw [mid_suffix10]
  decide
def midS8 : ZMat := !![2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 1, 3, 5, 5, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_suffix8 : transfer (mid.drop 8)=midS8 := by
  change rowMatrix mid[8]! * transfer (mid.drop 9)=midS8
  rw [mid_suffix9]
  decide
def midS7 : ZMat := !![0, 0, 0, 0, 0, 0; 7, 19, 31, 31, 0, 0; 5, 14, 23, 23, 0, 0; 3, 9, 15, 15, 0, 0; 1, 4, 7, 7, 0, 0; 0, 1, 2, 2, 0, 0]
theorem mid_suffix7 : transfer (mid.drop 7)=midS7 := by
  change rowMatrix mid[7]! * transfer (mid.drop 8)=midS7
  rw [mid_suffix8]
  decide
def midS6 : ZMat := !![0, 0, 0, 0, 0, 0; 15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 8, 23, 38, 38, 0, 0; 3, 9, 15, 15, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_suffix6 : transfer (mid.drop 6)=midS6 := by
  change rowMatrix mid[6]! * transfer (mid.drop 7)=midS6
  rw [mid_suffix7]
  decide
def midS5 : ZMat := !![38, 107, 176, 176, 0, 0; 38, 107, 176, 176, 0, 0; 38, 107, 176, 176, 0, 0; 23, 65, 107, 107, 0, 0; 8, 23, 38, 38, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_suffix5 : transfer (mid.drop 5)=midS5 := by
  change rowMatrix mid[5]! * transfer (mid.drop 6)=midS5
  rw [mid_suffix6]
  decide
def midS4 : ZMat := !![0, 0, 0, 0, 0, 0; 137, 386, 635, 635, 0, 0; 99, 279, 459, 459, 0, 0; 61, 172, 283, 283, 0, 0; 23, 65, 107, 107, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_suffix4 : transfer (mid.drop 4)=midS4 := by
  change rowMatrix mid[4]! * transfer (mid.drop 5)=midS4
  rw [mid_suffix5]
  decide
def midS3 : ZMat := !![0, 0, 0, 0, 0, 0; 297, 837, 1377, 1377, 0, 0; 297, 837, 1377, 1377, 0, 0; 160, 451, 742, 742, 0, 0; 61, 172, 283, 283, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_suffix3 : transfer (mid.drop 3)=midS3 := by
  change rowMatrix mid[3]! * transfer (mid.drop 4)=midS3
  rw [mid_suffix4]
  decide
def midS2 : ZMat := !![754, 2125, 3496, 3496, 0, 0; 754, 2125, 3496, 3496, 0, 0; 754, 2125, 3496, 3496, 0, 0; 457, 1288, 2119, 2119, 0, 0; 160, 451, 742, 742, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_suffix2 : transfer (mid.drop 2)=midS2 := by
  change rowMatrix mid[2]! * transfer (mid.drop 3)=midS2
  rw [mid_suffix3]
  decide
def midS1 : ZMat := !![0, 0, 0, 0, 0, 0; 2879, 8114, 13349, 13349, 0, 0; 2125, 5989, 9853, 9853, 0, 0; 1371, 3864, 6357, 6357, 0, 0; 617, 1739, 2861, 2861, 0, 0; 160, 451, 742, 742, 0, 0]
theorem mid_suffix1 : transfer (mid.drop 1)=midS1 := by
  change rowMatrix mid[1]! * transfer (mid.drop 2)=midS1
  rw [mid_suffix2]
  decide
def midS0 : ZMat := !![6375, 17967, 29559, 29559, 0, 0; 6375, 17967, 29559, 29559, 0, 0; 6375, 17967, 29559, 29559, 0, 0; 3496, 9853, 16210, 16210, 0, 0; 1371, 3864, 6357, 6357, 0, 0; 0, 0, 0, 0, 0, 0]
theorem mid_suffix0 : transfer (mid.drop 0)=midS0 := by
  change rowMatrix mid[0]! * transfer (mid.drop 1)=midS0
  rw [mid_suffix1]
  decide
def sufP0 : ZMat := !![1, 0, 0, 0, 0, 0; 0, 1, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 1, 0; 0, 0, 0, 0, 0, 1]
theorem suf_prefix0 : transfer (suf.take 0)=sufP0 := by
  decide
def sufP1 : ZMat := !![1, 1, 1, 1, 0, 0; 1, 1, 1, 1, 0, 0; 0, 1, 1, 1, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix1 : transfer (suf.take 1)=sufP1 := by
  have hs : suf.take 1=suf.take 0++[suf[0]!] := rfl
  rw [hs, transfer_append, suf_prefix0]
  decide
def sufP2 : ZMat := !![1, 2, 3, 3, 3, 0; 1, 2, 3, 3, 3, 0; 1, 2, 3, 3, 3, 0; 0, 1, 2, 2, 2, 0; 0, 0, 1, 1, 1, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix2 : transfer (suf.take 2)=sufP2 := by
  have hs : suf.take 2=suf.take 1++[suf[1]!] := rfl
  rw [hs, transfer_append, suf_prefix1]
  decide
def sufP3 : ZMat := !![3, 6, 9, 12, 0, 0; 3, 6, 9, 12, 0, 0; 3, 6, 9, 12, 0, 0; 1, 3, 5, 7, 0, 0; 0, 1, 2, 3, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix3 : transfer (suf.take 3)=sufP3 := by
  have hs : suf.take 3=suf.take 2++[suf[2]!] := rfl
  rw [hs, transfer_append, suf_prefix2]
  decide
def sufP4 : ZMat := !![6, 15, 27, 27, 0, 0; 6, 15, 27, 27, 0, 0; 6, 15, 27, 27, 0, 0; 3, 8, 15, 15, 0, 0; 1, 3, 6, 6, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix4 : transfer (suf.take 4)=sufP4 := by
  have hs : suf.take 4=suf.take 3++[suf[3]!] := rfl
  rw [hs, transfer_append, suf_prefix3]
  decide
def sufP5 : ZMat := !![15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 8, 23, 38, 38, 0, 0; 3, 9, 15, 15, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix5 : transfer (suf.take 5)=sufP5 := by
  have hs : suf.take 5=suf.take 4++[suf[4]!] := rfl
  rw [hs, transfer_append, suf_prefix4]
  decide
def sufP6 : ZMat := !![57, 126, 195, 195, 195, 0; 57, 126, 195, 195, 195, 0; 57, 126, 195, 195, 195, 0; 31, 69, 107, 107, 107, 0; 12, 27, 42, 42, 42, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix6 : transfer (suf.take 6)=sufP6 := by
  have hs : suf.take 6=suf.take 5++[suf[5]!] := rfl
  rw [hs, transfer_append, suf_prefix5]
  decide
def sufP7 : ZMat := !![126, 321, 516, 711, 0, 0; 126, 321, 516, 711, 0, 0; 126, 321, 516, 711, 0, 0; 69, 176, 283, 390, 0, 0; 27, 69, 111, 153, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix7 : transfer (suf.take 7)=sufP7 := by
  have hs : suf.take 7=suf.take 6++[suf[6]!] := rfl
  rw [hs, transfer_append, suf_prefix6]
  decide
def sufP8 : ZMat := !![447, 963, 1674, 1674, 0, 0; 447, 963, 1674, 1674, 0, 0; 447, 963, 1674, 1674, 0, 0; 245, 528, 918, 918, 0, 0; 96, 207, 360, 360, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix8 : transfer (suf.take 8)=sufP8 := by
  have hs : suf.take 8=suf.take 7++[suf[7]!] := rfl
  rw [hs, transfer_append, suf_prefix7]
  decide
def sufP9 : ZMat := !![963, 2637, 4311, 4311, 0, 0; 963, 2637, 4311, 4311, 0, 0; 963, 2637, 4311, 4311, 0, 0; 528, 1446, 2364, 2364, 0, 0; 207, 567, 927, 927, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix9 : transfer (suf.take 9)=sufP9 := by
  have hs : suf.take 9=suf.take 8++[suf[8]!] := rfl
  rw [hs, transfer_append, suf_prefix8]
  decide
def sufP10 : ZMat := !![3600, 7911, 12222, 12222, 12222, 0; 3600, 7911, 12222, 12222, 12222, 0; 3600, 7911, 12222, 12222, 12222, 0; 1974, 4338, 6702, 6702, 6702, 0; 774, 1701, 2628, 2628, 2628, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix10 : transfer (suf.take 10)=sufP10 := by
  have hs : suf.take 10=suf.take 9++[suf[9]!] := rfl
  rw [hs, transfer_append, suf_prefix9]
  decide
def sufP11 : ZMat := !![7911, 20133, 32355, 44577, 0, 0; 7911, 20133, 32355, 44577, 0, 0; 7911, 20133, 32355, 44577, 0, 0; 4338, 11040, 17742, 24444, 0, 0; 1701, 4329, 6957, 9585, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix11 : transfer (suf.take 11)=sufP11 := by
  have hs : suf.take 11=suf.take 10++[suf[10]!] := rfl
  rw [hs, transfer_append, suf_prefix10]
  decide
def sufP12 : ZMat := !![28044, 60399, 104976, 104976, 0, 0; 28044, 60399, 104976, 104976, 0, 0; 28044, 60399, 104976, 104976, 0, 0; 15378, 33120, 57564, 57564, 0, 0; 6030, 12987, 22572, 22572, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix12 : transfer (suf.take 12)=sufP12 := by
  have hs : suf.take 12=suf.take 11++[suf[11]!] := rfl
  rw [hs, transfer_append, suf_prefix11]
  decide
def sufP13 : ZMat := !![60399, 165375, 270351, 270351, 0, 0; 60399, 165375, 270351, 270351, 0, 0; 60399, 165375, 270351, 270351, 0, 0; 33120, 90684, 148248, 148248, 0, 0; 12987, 35559, 58131, 58131, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix13 : transfer (suf.take 13)=sufP13 := by
  have hs : suf.take 13=suf.take 12++[suf[12]!] := rfl
  rw [hs, transfer_append, suf_prefix12]
  decide
def sufP14 : ZMat := !![225774, 496125, 766476, 766476, 766476, 0; 225774, 496125, 766476, 766476, 766476, 0; 225774, 496125, 766476, 766476, 766476, 0; 123804, 272052, 420300, 420300, 420300, 0; 48546, 106677, 164808, 164808, 164808, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix14 : transfer (suf.take 14)=sufP14 := by
  have hs : suf.take 14=suf.take 13++[suf[13]!] := rfl
  rw [hs, transfer_append, suf_prefix13]
  decide
def sufP15 : ZMat := !![496125, 1262601, 2029077, 2795553, 0, 0; 496125, 1262601, 2029077, 2795553, 0, 0; 496125, 1262601, 2029077, 2795553, 0, 0; 272052, 692352, 1112652, 1532952, 0, 0; 106677, 271485, 436293, 601101, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix15 : transfer (suf.take 15)=sufP15 := by
  have hs : suf.take 15=suf.take 14++[suf[14]!] := rfl
  rw [hs, transfer_append, suf_prefix14]
  decide
def sufP16 : ZMat := !![1758726, 3787803, 6583356, 6583356, 6583356, 0; 1758726, 3787803, 6583356, 6583356, 6583356, 0; 1758726, 3787803, 6583356, 6583356, 6583356, 0; 964404, 2077056, 3610008, 3610008, 3610008, 0; 378162, 814455, 1415556, 1415556, 1415556, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix16 : transfer (suf.take 16)=sufP16 := by
  have hs : suf.take 16=suf.take 15++[suf[15]!] := rfl
  rw [hs, transfer_append, suf_prefix15]
  decide
def sufP17 : ZMat := !![3787803, 10371159, 16954515, 23537871, 0, 0; 3787803, 10371159, 16954515, 23537871, 0, 0; 3787803, 10371159, 16954515, 23537871, 0, 0; 2077056, 5687064, 9297072, 12907080, 0, 0; 814455, 2230011, 3645567, 5061123, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix17 : transfer (suf.take 17)=sufP17 := by
  have hs : suf.take 17=suf.take 16++[suf[16]!] := rfl
  rw [hs, transfer_append, suf_prefix16]
  decide
def sufP18 : ZMat := !![14158962, 31113477, 54651348, 54651348, 0, 0; 14158962, 31113477, 54651348, 54651348, 0, 0; 14158962, 31113477, 54651348, 54651348, 0, 0; 7764120, 17061192, 29968272, 29968272, 0, 0; 3044466, 6690033, 11751156, 11751156, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix18 : transfer (suf.take 18)=sufP18 := by
  have hs : suf.take 18=suf.take 17++[suf[17]!] := rfl
  rw [hs, transfer_append, suf_prefix17]
  decide
def sufP19 : ZMat := !![31113477, 85764825, 140416173, 140416173, 0, 0; 31113477, 85764825, 140416173, 140416173, 0, 0; 31113477, 85764825, 140416173, 140416173, 0, 0; 17061192, 47029464, 76997736, 76997736, 0, 0; 6690033, 18441189, 30192345, 30192345, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix19 : transfer (suf.take 19)=sufP19 := by
  have hs : suf.take 19=suf.take 18++[suf[18]!] := rfl
  rw [hs, transfer_append, suf_prefix18]
  decide
def sufP20 : ZMat := !![116878302, 257294475, 397710648, 397710648, 0, 0; 116878302, 257294475, 397710648, 397710648, 0, 0; 116878302, 257294475, 397710648, 397710648, 0, 0; 64090656, 141088392, 218086128, 218086128, 0, 0; 25131222, 55323567, 85515912, 85515912, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix20 : transfer (suf.take 20)=sufP20 := by
  have hs : suf.take 20=suf.take 19++[suf[19]!] := rfl
  rw [hs, transfer_append, suf_prefix19]
  decide
def sufP21 : ZMat := !![257294475, 655005123, 1052715771, 1052715771, 0, 0; 257294475, 655005123, 1052715771, 1052715771, 0, 0; 257294475, 655005123, 1052715771, 1052715771, 0, 0; 141088392, 359174520, 577260648, 577260648, 0, 0; 55323567, 140839479, 226355391, 226355391, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix21 : transfer (suf.take 21)=sufP21 := by
  have hs : suf.take 21=suf.take 20++[suf[20]!] := rfl
  rw [hs, transfer_append, suf_prefix20]
  decide
def sufP22 : ZMat := !![912299598, 1965015369, 3017731140, 0, 0, 0; 912299598, 1965015369, 3017731140, 0, 0, 0; 912299598, 1965015369, 3017731140, 0, 0, 0; 500262912, 1077523560, 1654784208, 0, 0, 0; 196163046, 422518437, 648873828, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_prefix22 : transfer (suf.take 22)=sufP22 := by
  have hs : suf.take 22=suf.take 21++[suf[21]!] := rfl
  rw [hs, transfer_append, suf_prefix21]
  decide
def sufS22 : ZMat := !![1, 0, 0, 0, 0, 0; 0, 1, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 1, 0; 0, 0, 0, 0, 0, 1]
theorem suf_suffix22 : transfer (suf.drop 22)=sufS22 := by
  decide
def sufS21 : ZMat := !![1, 1, 1, 0, 0, 0; 1, 1, 1, 0, 0, 0; 0, 1, 1, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix21 : transfer (suf.drop 21)=sufS21 := by
  change rowMatrix suf[21]! * transfer (suf.drop 22)=sufS21
  rw [suf_suffix22]
  decide
def sufS20 : ZMat := !![0, 0, 0, 0, 0, 0; 2, 3, 4, 0, 0, 0; 1, 2, 3, 0, 0, 0; 0, 1, 2, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix20 : transfer (suf.drop 20)=sufS20 := by
  change rowMatrix suf[20]! * transfer (suf.drop 21)=sufS20
  rw [suf_suffix21]
  decide
def sufS19 : ZMat := !![3, 6, 9, 0, 0, 0; 3, 6, 9, 0, 0, 0; 3, 6, 9, 0, 0, 0; 1, 3, 5, 0, 0, 0; 0, 1, 2, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix19 : transfer (suf.drop 19)=sufS19 := by
  change rowMatrix suf[19]! * transfer (suf.drop 20)=sufS19
  rw [suf_suffix20]
  decide
def sufS18 : ZMat := !![0, 0, 0, 0, 0, 0; 10, 21, 32, 0, 0, 0; 7, 15, 23, 0, 0, 0; 4, 9, 14, 0, 0, 0; 1, 3, 5, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix18 : transfer (suf.drop 18)=sufS18 := by
  change rowMatrix suf[18]! * transfer (suf.drop 19)=sufS18
  rw [suf_suffix19]
  decide
def sufS17 : ZMat := !![21, 45, 69, 0, 0, 0; 21, 45, 69, 0, 0, 0; 21, 45, 69, 0, 0, 0; 11, 24, 37, 0, 0, 0; 4, 9, 14, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix17 : transfer (suf.drop 17)=sufS17 := by
  change rowMatrix suf[17]! * transfer (suf.drop 18)=sufS17
  rw [suf_suffix18]
  decide
def sufS16 : ZMat := !![0, 0, 0, 0, 0, 0; 74, 159, 244, 0, 0, 0; 53, 114, 175, 0, 0, 0; 32, 69, 106, 0, 0, 0; 11, 24, 37, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix16 : transfer (suf.drop 16)=sufS16 := by
  change rowMatrix suf[16]! * transfer (suf.drop 17)=sufS16
  rw [suf_suffix17]
  decide
def sufS15 : ZMat := !![170, 366, 562, 0, 0, 0; 170, 366, 562, 0, 0, 0; 170, 366, 562, 0, 0, 0; 96, 207, 318, 0, 0, 0; 43, 93, 143, 0, 0, 0; 11, 24, 37, 0, 0, 0]
theorem suf_suffix15 : transfer (suf.drop 15)=sufS15 := by
  change rowMatrix suf[15]! * transfer (suf.drop 16)=sufS15
  rw [suf_suffix16]
  decide
def sufS14 : ZMat := !![0, 0, 0, 0, 0, 0; 606, 1305, 2004, 0, 0, 0; 436, 939, 1442, 0, 0, 0; 266, 573, 880, 0, 0, 0; 96, 207, 318, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix14 : transfer (suf.drop 14)=sufS14 := by
  change rowMatrix suf[14]! * transfer (suf.drop 15)=sufS14
  rw [suf_suffix15]
  decide
def sufS13 : ZMat := !![1404, 3024, 4644, 0, 0, 0; 1404, 3024, 4644, 0, 0, 0; 1404, 3024, 4644, 0, 0, 0; 798, 1719, 2640, 0, 0, 0; 362, 780, 1198, 0, 0, 0; 96, 207, 318, 0, 0, 0]
theorem suf_suffix13 : transfer (suf.drop 13)=sufS13 := by
  change rowMatrix suf[13]! * transfer (suf.drop 14)=sufS13
  rw [suf_suffix14]
  decide
def sufS12 : ZMat := !![0, 0, 0, 0, 0, 0; 5010, 10791, 16572, 0, 0, 0; 3606, 7767, 11928, 0, 0, 0; 2202, 4743, 7284, 0, 0, 0; 798, 1719, 2640, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix12 : transfer (suf.drop 12)=sufS12 := by
  change rowMatrix suf[12]! * transfer (suf.drop 13)=sufS12
  rw [suf_suffix13]
  decide
def sufS11 : ZMat := !![10818, 23301, 35784, 0, 0, 0; 10818, 23301, 35784, 0, 0, 0; 10818, 23301, 35784, 0, 0, 0; 5808, 12510, 19212, 0, 0, 0; 2202, 4743, 7284, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix11 : transfer (suf.drop 11)=sufS11 := by
  change rowMatrix suf[11]! * transfer (suf.drop 12)=sufS11
  rw [suf_suffix12]
  decide
def sufS10 : ZMat := !![0, 0, 0, 0, 0, 0; 38262, 82413, 126564, 0, 0, 0; 27444, 59112, 90780, 0, 0, 0; 16626, 35811, 54996, 0, 0, 0; 5808, 12510, 19212, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix10 : transfer (suf.drop 10)=sufS10 := by
  change rowMatrix suf[10]! * transfer (suf.drop 11)=sufS10
  rw [suf_suffix11]
  decide
def sufS9 : ZMat := !![88140, 189846, 291552, 0, 0, 0; 88140, 189846, 291552, 0, 0, 0; 88140, 189846, 291552, 0, 0, 0; 49878, 107433, 164988, 0, 0, 0; 22434, 48321, 74208, 0, 0, 0; 5808, 12510, 19212, 0, 0, 0]
theorem suf_suffix9 : transfer (suf.drop 9)=sufS9 := by
  change rowMatrix suf[9]! * transfer (suf.drop 10)=sufS9
  rw [suf_suffix10]
  decide
def sufS8 : ZMat := !![0, 0, 0, 0, 0, 0; 314298, 676971, 1039644, 0, 0, 0; 226158, 487125, 748092, 0, 0, 0; 138018, 297279, 456540, 0, 0, 0; 49878, 107433, 164988, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix8 : transfer (suf.drop 8)=sufS8 := by
  change rowMatrix suf[8]! * transfer (suf.drop 9)=sufS8
  rw [suf_suffix9]
  decide
def sufS7 : ZMat := !![678474, 1461375, 2244276, 0, 0, 0; 678474, 1461375, 2244276, 0, 0, 0; 678474, 1461375, 2244276, 0, 0, 0; 364176, 784404, 1204632, 0, 0, 0; 138018, 297279, 456540, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix7 : transfer (suf.drop 7)=sufS7 := by
  change rowMatrix suf[7]! * transfer (suf.drop 8)=sufS7
  rw [suf_suffix8]
  decide
def sufS6 : ZMat := !![0, 0, 0, 0, 0, 0; 2399598, 5168529, 7937460, 0, 0, 0; 1721124, 3707154, 5693184, 0, 0, 0; 1042650, 2245779, 3448908, 0, 0, 0; 364176, 784404, 1204632, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix6 : transfer (suf.drop 6)=sufS6 := by
  change rowMatrix suf[6]! * transfer (suf.drop 7)=sufS6
  rw [suf_suffix7]
  decide
def sufS5 : ZMat := !![5527548, 11905866, 18284184, 0, 0, 0; 5527548, 11905866, 18284184, 0, 0, 0; 5527548, 11905866, 18284184, 0, 0, 0; 3127950, 6737337, 10346724, 0, 0, 0; 1406826, 3030183, 4653540, 0, 0, 0; 364176, 784404, 1204632, 0, 0, 0]
theorem suf_suffix5 : transfer (suf.drop 5)=sufS5 := by
  change rowMatrix suf[5]! * transfer (suf.drop 6)=sufS5
  rw [suf_suffix6]
  decide
def sufS4 : ZMat := !![0, 0, 0, 0, 0, 0; 19710594, 42454935, 65199276, 0, 0, 0; 14183046, 30549069, 46915092, 0, 0, 0; 8655498, 18643203, 28630908, 0, 0, 0; 3127950, 6737337, 10346724, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix4 : transfer (suf.drop 4)=sufS4 := by
  change rowMatrix suf[4]! * transfer (suf.drop 5)=sufS4
  rw [suf_suffix5]
  decide
def sufS3 : ZMat := !![0, 0, 0, 0, 0, 0; 42549138, 91647207, 140745276, 0, 0, 0; 42549138, 91647207, 140745276, 0, 0, 0; 22838544, 49192272, 75546000, 0, 0, 0; 8655498, 18643203, 28630908, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix3 : transfer (suf.drop 3)=sufS3 := by
  change rowMatrix suf[3]! * transfer (suf.drop 4)=sufS3
  rw [suf_suffix4]
  decide
def sufS2 : ZMat := !![107936820, 232486686, 357036552, 0, 0, 0; 107936820, 232486686, 357036552, 0, 0, 0; 107936820, 232486686, 357036552, 0, 0, 0; 65387682, 140839479, 216291276, 0, 0, 0; 22838544, 49192272, 75546000, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix2 : transfer (suf.drop 2)=sufS2 := by
  change rowMatrix suf[2]! * transfer (suf.drop 3)=sufS2
  rw [suf_suffix3]
  decide
def sufS1 : ZMat := !![0, 0, 0, 0, 0, 0; 412036686, 887491809, 1362946932, 0, 0, 0; 304099866, 655005123, 1005910380, 0, 0, 0; 196163046, 422518437, 648873828, 0, 0, 0; 88226226, 190031751, 291837276, 0, 0, 0; 22838544, 49192272, 75546000, 0, 0, 0]
theorem suf_suffix1 : transfer (suf.drop 1)=sufS1 := by
  change rowMatrix suf[1]! * transfer (suf.drop 2)=sufS1
  rw [suf_suffix2]
  decide
def sufS0 : ZMat := !![912299598, 1965015369, 3017731140, 0, 0, 0; 912299598, 1965015369, 3017731140, 0, 0, 0; 912299598, 1965015369, 3017731140, 0, 0, 0; 500262912, 1077523560, 1654784208, 0, 0, 0; 196163046, 422518437, 648873828, 0, 0, 0; 0, 0, 0, 0, 0, 0]
theorem suf_suffix0 : transfer (suf.drop 0)=sufS0 := by
  change rowMatrix suf[0]! * transfer (suf.drop 1)=sufS0
  rw [suf_suffix1]
  decide
def blockP0 : ZMat := !![1, 0, 0, 0, 0, 0; 0, 1, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 1, 0; 0, 0, 0, 0, 0, 1]
theorem block_prefix0 : transfer (block.take 0)=blockP0 := by
  decide
def blockP1 : ZMat := !![1, 1, 1, 1, 0, 0; 1, 1, 1, 1, 0, 0; 0, 1, 1, 1, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 0, 0]
theorem block_prefix1 : transfer (block.take 1)=blockP1 := by
  have hs : block.take 1=block.take 0++[block[0]!] := rfl
  rw [hs, transfer_append, block_prefix0]
  decide
def blockP2 : ZMat := !![1, 2, 3, 3, 3, 0; 1, 2, 3, 3, 3, 0; 1, 2, 3, 3, 3, 0; 0, 1, 2, 2, 2, 0; 0, 0, 1, 1, 1, 0; 0, 0, 0, 0, 0, 0]
theorem block_prefix2 : transfer (block.take 2)=blockP2 := by
  have hs : block.take 2=block.take 1++[block[1]!] := rfl
  rw [hs, transfer_append, block_prefix1]
  decide
def blockP3 : ZMat := !![3, 6, 9, 12, 0, 0; 3, 6, 9, 12, 0, 0; 3, 6, 9, 12, 0, 0; 1, 3, 5, 7, 0, 0; 0, 1, 2, 3, 0, 0; 0, 0, 0, 0, 0, 0]
theorem block_prefix3 : transfer (block.take 3)=blockP3 := by
  have hs : block.take 3=block.take 2++[block[2]!] := rfl
  rw [hs, transfer_append, block_prefix2]
  decide
def blockP4 : ZMat := !![6, 15, 27, 27, 0, 0; 6, 15, 27, 27, 0, 0; 6, 15, 27, 27, 0, 0; 3, 8, 15, 15, 0, 0; 1, 3, 6, 6, 0, 0; 0, 0, 0, 0, 0, 0]
theorem block_prefix4 : transfer (block.take 4)=blockP4 := by
  have hs : block.take 4=block.take 3++[block[3]!] := rfl
  rw [hs, transfer_append, block_prefix3]
  decide
def blockP5 : ZMat := !![15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 8, 23, 38, 38, 0, 0; 3, 9, 15, 15, 0, 0; 0, 0, 0, 0, 0, 0]
theorem block_prefix5 : transfer (block.take 5)=blockP5 := by
  have hs : block.take 5=block.take 4++[block[4]!] := rfl
  rw [hs, transfer_append, block_prefix4]
  decide
def blockS5 : ZMat := !![1, 0, 0, 0, 0, 0; 0, 1, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 1, 0; 0, 0, 0, 0, 0, 1]
theorem block_suffix5 : transfer (block.drop 5)=blockS5 := by
  decide
def blockS4 : ZMat := !![0, 0, 0, 0, 0, 0; 1, 1, 1, 1, 0, 0; 0, 1, 1, 1, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 0, 0]
theorem block_suffix4 : transfer (block.drop 4)=blockS4 := by
  change rowMatrix block[4]! * transfer (block.drop 5)=blockS4
  rw [block_suffix5]
  decide
def blockS3 : ZMat := !![0, 0, 0, 0, 0, 0; 1, 2, 3, 3, 0, 0; 1, 2, 3, 3, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 0, 0, 0]
theorem block_suffix3 : transfer (block.drop 3)=blockS3 := by
  change rowMatrix block[3]! * transfer (block.drop 4)=blockS3
  rw [block_suffix4]
  decide
def blockS2 : ZMat := !![2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 1, 3, 5, 5, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 0, 0, 0, 0]
theorem block_suffix2 : transfer (block.drop 2)=blockS2 := by
  change rowMatrix block[2]! * transfer (block.drop 3)=blockS2
  rw [block_suffix3]
  decide
def blockS1 : ZMat := !![0, 0, 0, 0, 0, 0; 7, 19, 31, 31, 0, 0; 5, 14, 23, 23, 0, 0; 3, 9, 15, 15, 0, 0; 1, 4, 7, 7, 0, 0; 0, 1, 2, 2, 0, 0]
theorem block_suffix1 : transfer (block.drop 1)=blockS1 := by
  change rowMatrix block[1]! * transfer (block.drop 2)=blockS1
  rw [block_suffix2]
  decide
def blockS0 : ZMat := !![15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 8, 23, 38, 38, 0, 0; 3, 9, 15, 15, 0, 0; 0, 0, 0, 0, 0, 0]
theorem block_suffix0 : transfer (block.drop 0)=blockS0 := by
  change rowMatrix block[0]! * transfer (block.drop 1)=blockS0
  rw [block_suffix1]
  decide
def select3 : ZMat := fun i j => if i=3 ∧ j=3 then 1 else 0
def select2 : ZMat := fun i j => if i=2 ∧ j=2 then 1 else 0
end OneThird.TransferCache5
