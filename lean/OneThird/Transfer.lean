module
public import OneThird.Structure

@[expose] public section
namespace OneThird.Structure
open Matrix
set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- Closed row-scan formula: enter at e+1 and propagate through allowed cells to d. -/
def rowMatrix (S : Mask) : Mat6 := fun d e =>
  if d.val ≤ e.val+1 ∧ e.val+1 < 6 ∧
    (∀t : Fin 6, d.val ≤ t.val → t.val ≤ e.val+1 → t ∈ S) then 1 else 0

def transfer (w : List Mask) : Mat6 := (w.map rowMatrix).prod

theorem transfer_append (w z : List Mask) : transfer (w++z) = transfer w * transfer z := by
  simp [transfer, List.map_append, List.prod_append]

theorem transfer_repeat (w : List Mask) (m : ℕ) :
    transfer (List.replicate m w).flatten = (transfer w)^m := by
  simp [transfer, List.map_flatten, List.prod_flatten, List.map_replicate, List.prod_replicate]

private def preC0 : Mat6 := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 357036552, 1005910380, 1654784208, 1654784208, 0, 0; 124549866, 350905257, 577260648, 577260648, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC1 : Mat6 := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 232486686, 655005123, 1077523560, 1077523560, 0, 0; 124549866, 350905257, 577260648, 577260648, 0, 0; 47054304, 132570216, 218086128, 218086128, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC2 : Mat6 := !![0, 0, 0, 0, 0, 0; 107936820, 304099866, 500262912, 500262912, 0, 0; 77495562, 218335041, 359174520, 359174520, 0, 0; 47054304, 132570216, 218086128, 218086128, 0, 0; 16613046, 46805391, 76997736, 76997736, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC3 : Mat6 := !![30441258, 85764825, 141088392, 141088392, 0, 0; 30441258, 85764825, 141088392, 141088392, 0, 0; 30441258, 85764825, 141088392, 141088392, 0, 0; 16613046, 46805391, 76997736, 76997736, 0, 0; 6465960, 18217116, 29968272, 29968272, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC4 : Mat6 := !![0, 0, 0, 0, 0, 0; 13828212, 38959434, 64090656, 64090656, 0, 0; 10147086, 28588275, 47029464, 47029464, 0, 0; 6465960, 18217116, 29968272, 29968272, 0, 0; 2784834, 7845957, 12907080, 12907080, 0, 0; 778896, 2194452, 3610008, 3610008, 0, 0]
private def preC5 : Mat6 := !![3681126, 10371159, 17061192, 17061192, 0, 0; 3681126, 10371159, 17061192, 17061192, 0, 0; 3681126, 10371159, 17061192, 17061192, 0, 0; 2005938, 5651505, 9297072, 9297072, 0, 0; 778896, 2194452, 3610008, 3610008, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC6 : Mat6 := !![0, 0, 0, 0, 0, 0; 1675188, 4719654, 7764120, 7764120, 0, 0; 1227042, 3457053, 5687064, 5687064, 0, 0; 778896, 2194452, 3610008, 3610008, 0, 0; 330750, 931851, 1532952, 1532952, 0, 0; 90684, 255492, 420300, 420300, 0, 0]
private def preC7 : Mat6 := !![448146, 1262601, 2077056, 2077056, 0, 0; 448146, 1262601, 2077056, 2077056, 0, 0; 448146, 1262601, 2077056, 2077056, 0, 0; 240066, 676359, 1112652, 1112652, 0, 0; 90684, 255492, 420300, 420300, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC8 : Mat6 := !![0, 0, 0, 0, 0, 0; 208080, 586242, 964404, 964404, 0, 0; 149382, 420867, 692352, 692352, 0, 0; 90684, 255492, 420300, 420300, 0, 0; 31986, 90117, 148248, 148248, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC9 : Mat6 := !![58698, 165375, 272052, 272052, 0, 0; 58698, 165375, 272052, 272052, 0, 0; 58698, 165375, 272052, 272052, 0, 0; 31986, 90117, 148248, 148248, 0, 0; 12420, 34992, 57564, 57564, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC10 : Mat6 := !![0, 0, 0, 0, 0, 0; 26712, 75258, 123804, 123804, 0, 0; 19566, 55125, 90684, 90684, 0, 0; 12420, 34992, 57564, 57564, 0, 0; 5274, 14859, 24444, 24444, 0, 0; 1446, 4074, 6702, 6702, 0, 0]
private def preC11 : Mat6 := !![7146, 20133, 33120, 33120, 0, 0; 7146, 20133, 33120, 33120, 0, 0; 7146, 20133, 33120, 33120, 0, 0; 3828, 10785, 17742, 17742, 0, 0; 1446, 4074, 6702, 6702, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC12 : Mat6 := !![0, 0, 0, 0, 0, 0; 3318, 9348, 15378, 15378, 0, 0; 2382, 6711, 11040, 11040, 0, 0; 1446, 4074, 6702, 6702, 0, 0; 510, 1437, 2364, 2364, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC13 : Mat6 := !![936, 2637, 4338, 4338, 0, 0; 936, 2637, 4338, 4338, 0, 0; 936, 2637, 4338, 4338, 0, 0; 510, 1437, 2364, 2364, 0, 0; 198, 558, 918, 918, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC14 : Mat6 := !![0, 0, 0, 0, 0, 0; 426, 1200, 1974, 1974, 0, 0; 312, 879, 1446, 1446, 0, 0; 198, 558, 918, 918, 0, 0; 84, 237, 390, 390, 0, 0; 23, 65, 107, 107, 0, 0]
private def preC15 : Mat6 := !![114, 321, 528, 528, 0, 0; 114, 321, 528, 528, 0, 0; 114, 321, 528, 528, 0, 0; 61, 172, 283, 283, 0, 0; 23, 65, 107, 107, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC16 : Mat6 := !![0, 0, 0, 0, 0, 0; 53, 149, 245, 245, 0, 0; 38, 107, 176, 176, 0, 0; 23, 65, 107, 107, 0, 0; 8, 23, 38, 38, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC17 : Mat6 := !![15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 8, 23, 38, 38, 0, 0; 3, 9, 15, 15, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC18 : Mat6 := !![0, 0, 0, 0, 0, 0; 7, 19, 31, 31, 0, 0; 5, 14, 23, 23, 0, 0; 3, 9, 15, 15, 0, 0; 1, 4, 7, 7, 0, 0; 0, 1, 2, 2, 0, 0]
private def preC19 : Mat6 := !![2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 1, 3, 5, 5, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC20 : Mat6 := !![0, 0, 0, 0, 0, 0; 1, 2, 3, 3, 0, 0; 1, 2, 3, 3, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 0, 0, 0]
private def preC21 : Mat6 := !![0, 0, 0, 0, 0, 0; 1, 1, 1, 1, 0, 0; 0, 1, 1, 1, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 0, 0]
private theorem preStep21 : rowMatrix {1,2,3,4} * (1 : Mat6) = preC21 := by decide
private theorem preStep20 : rowMatrix {1,2,3,4} * preC21 = preC20 := by decide
private theorem preStep19 : rowMatrix {0,1,2,3,4} * preC20 = preC19 := by decide
private theorem preStep18 : rowMatrix {1,2,3,4,5} * preC19 = preC18 := by decide
private theorem preStep17 : rowMatrix {0,1,2,3,4} * preC18 = preC17 := by decide
private theorem preStep16 : rowMatrix {1,2,3,4} * preC17 = preC16 := by decide
private theorem preStep15 : rowMatrix {0,1,2,3,4} * preC16 = preC15 := by decide
private theorem preStep14 : rowMatrix {1,2,3,4,5} * preC15 = preC14 := by decide
private theorem preStep13 : rowMatrix {0,1,2,3,4} * preC14 = preC13 := by decide
private theorem preStep12 : rowMatrix {1,2,3,4} * preC13 = preC12 := by decide
private theorem preStep11 : rowMatrix {0,1,2,3,4} * preC12 = preC11 := by decide
private theorem preStep10 : rowMatrix {1,2,3,4,5} * preC11 = preC10 := by decide
private theorem preStep9 : rowMatrix {0,1,2,3,4} * preC10 = preC9 := by decide
private theorem preStep8 : rowMatrix {1,2,3,4} * preC9 = preC8 := by decide
private theorem preStep7 : rowMatrix {0,1,2,3,4} * preC8 = preC7 := by decide
private theorem preStep6 : rowMatrix {1,2,3,4,5} * preC7 = preC6 := by decide
private theorem preStep5 : rowMatrix {0,1,2,3,4} * preC6 = preC5 := by decide
private theorem preStep4 : rowMatrix {1,2,3,4,5} * preC5 = preC4 := by decide
private theorem preStep3 : rowMatrix {0,1,2,3,4} * preC4 = preC3 := by decide
private theorem preStep2 : rowMatrix {1,2,3,4} * preC3 = preC2 := by decide
private theorem preStep1 : rowMatrix {2,3,4} * preC2 = preC1 := by decide
private theorem preStep0 : rowMatrix {3,4} * preC1 = preC0 := by decide

private theorem pre_transfer : transfer (pre) = preC0 := by
  simp only [pre, transfer, List.map_cons, List.map_nil, List.prod_cons, List.prod_nil]
  change rowMatrix {3,4} * (rowMatrix {2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {1,2,3,4} * (1 : Mat6)))))))))))))))))))))) = preC0
  rw [preStep21, preStep20, preStep19, preStep18, preStep17, preStep16, preStep15, preStep14, preStep13, preStep12, preStep11, preStep10, preStep9, preStep8, preStep7, preStep6, preStep5, preStep4, preStep3, preStep2, preStep1, preStep0]

private def tailC0 : Mat6 := !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 232486686, 655005123, 1077523560, 1077523560, 0, 0; 124549866, 350905257, 577260648, 577260648, 0, 0; 47054304, 132570216, 218086128, 218086128, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC1 : Mat6 := !![0, 0, 0, 0, 0, 0; 107936820, 304099866, 500262912, 500262912, 0, 0; 77495562, 218335041, 359174520, 359174520, 0, 0; 47054304, 132570216, 218086128, 218086128, 0, 0; 16613046, 46805391, 76997736, 76997736, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC2 : Mat6 := !![30441258, 85764825, 141088392, 141088392, 0, 0; 30441258, 85764825, 141088392, 141088392, 0, 0; 30441258, 85764825, 141088392, 141088392, 0, 0; 16613046, 46805391, 76997736, 76997736, 0, 0; 6465960, 18217116, 29968272, 29968272, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC3 : Mat6 := !![0, 0, 0, 0, 0, 0; 13828212, 38959434, 64090656, 64090656, 0, 0; 10147086, 28588275, 47029464, 47029464, 0, 0; 6465960, 18217116, 29968272, 29968272, 0, 0; 2784834, 7845957, 12907080, 12907080, 0, 0; 778896, 2194452, 3610008, 3610008, 0, 0]
private def tailC4 : Mat6 := !![3681126, 10371159, 17061192, 17061192, 0, 0; 3681126, 10371159, 17061192, 17061192, 0, 0; 3681126, 10371159, 17061192, 17061192, 0, 0; 2005938, 5651505, 9297072, 9297072, 0, 0; 778896, 2194452, 3610008, 3610008, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC5 : Mat6 := !![0, 0, 0, 0, 0, 0; 1675188, 4719654, 7764120, 7764120, 0, 0; 1227042, 3457053, 5687064, 5687064, 0, 0; 778896, 2194452, 3610008, 3610008, 0, 0; 330750, 931851, 1532952, 1532952, 0, 0; 90684, 255492, 420300, 420300, 0, 0]
private def tailC6 : Mat6 := !![448146, 1262601, 2077056, 2077056, 0, 0; 448146, 1262601, 2077056, 2077056, 0, 0; 448146, 1262601, 2077056, 2077056, 0, 0; 240066, 676359, 1112652, 1112652, 0, 0; 90684, 255492, 420300, 420300, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC7 : Mat6 := !![0, 0, 0, 0, 0, 0; 208080, 586242, 964404, 964404, 0, 0; 149382, 420867, 692352, 692352, 0, 0; 90684, 255492, 420300, 420300, 0, 0; 31986, 90117, 148248, 148248, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC8 : Mat6 := !![58698, 165375, 272052, 272052, 0, 0; 58698, 165375, 272052, 272052, 0, 0; 58698, 165375, 272052, 272052, 0, 0; 31986, 90117, 148248, 148248, 0, 0; 12420, 34992, 57564, 57564, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC9 : Mat6 := !![0, 0, 0, 0, 0, 0; 26712, 75258, 123804, 123804, 0, 0; 19566, 55125, 90684, 90684, 0, 0; 12420, 34992, 57564, 57564, 0, 0; 5274, 14859, 24444, 24444, 0, 0; 1446, 4074, 6702, 6702, 0, 0]
private def tailC10 : Mat6 := !![7146, 20133, 33120, 33120, 0, 0; 7146, 20133, 33120, 33120, 0, 0; 7146, 20133, 33120, 33120, 0, 0; 3828, 10785, 17742, 17742, 0, 0; 1446, 4074, 6702, 6702, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC11 : Mat6 := !![0, 0, 0, 0, 0, 0; 3318, 9348, 15378, 15378, 0, 0; 2382, 6711, 11040, 11040, 0, 0; 1446, 4074, 6702, 6702, 0, 0; 510, 1437, 2364, 2364, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC12 : Mat6 := !![936, 2637, 4338, 4338, 0, 0; 936, 2637, 4338, 4338, 0, 0; 936, 2637, 4338, 4338, 0, 0; 510, 1437, 2364, 2364, 0, 0; 198, 558, 918, 918, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC13 : Mat6 := !![0, 0, 0, 0, 0, 0; 426, 1200, 1974, 1974, 0, 0; 312, 879, 1446, 1446, 0, 0; 198, 558, 918, 918, 0, 0; 84, 237, 390, 390, 0, 0; 23, 65, 107, 107, 0, 0]
private def tailC14 : Mat6 := !![114, 321, 528, 528, 0, 0; 114, 321, 528, 528, 0, 0; 114, 321, 528, 528, 0, 0; 61, 172, 283, 283, 0, 0; 23, 65, 107, 107, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC15 : Mat6 := !![0, 0, 0, 0, 0, 0; 53, 149, 245, 245, 0, 0; 38, 107, 176, 176, 0, 0; 23, 65, 107, 107, 0, 0; 8, 23, 38, 38, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC16 : Mat6 := !![15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 8, 23, 38, 38, 0, 0; 3, 9, 15, 15, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC17 : Mat6 := !![0, 0, 0, 0, 0, 0; 7, 19, 31, 31, 0, 0; 5, 14, 23, 23, 0, 0; 3, 9, 15, 15, 0, 0; 1, 4, 7, 7, 0, 0; 0, 1, 2, 2, 0, 0]
private def tailC18 : Mat6 := !![2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 1, 3, 5, 5, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC19 : Mat6 := !![0, 0, 0, 0, 0, 0; 1, 2, 3, 3, 0, 0; 1, 2, 3, 3, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 0, 0, 0]
private def tailC20 : Mat6 := !![0, 0, 0, 0, 0, 0; 1, 1, 1, 1, 0, 0; 0, 1, 1, 1, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 0, 0]
private theorem tailStep20 : rowMatrix {1,2,3,4} * (1 : Mat6) = tailC20 := by decide
private theorem tailStep19 : rowMatrix {1,2,3,4} * tailC20 = tailC19 := by decide
private theorem tailStep18 : rowMatrix {0,1,2,3,4} * tailC19 = tailC18 := by decide
private theorem tailStep17 : rowMatrix {1,2,3,4,5} * tailC18 = tailC17 := by decide
private theorem tailStep16 : rowMatrix {0,1,2,3,4} * tailC17 = tailC16 := by decide
private theorem tailStep15 : rowMatrix {1,2,3,4} * tailC16 = tailC15 := by decide
private theorem tailStep14 : rowMatrix {0,1,2,3,4} * tailC15 = tailC14 := by decide
private theorem tailStep13 : rowMatrix {1,2,3,4,5} * tailC14 = tailC13 := by decide
private theorem tailStep12 : rowMatrix {0,1,2,3,4} * tailC13 = tailC12 := by decide
private theorem tailStep11 : rowMatrix {1,2,3,4} * tailC12 = tailC11 := by decide
private theorem tailStep10 : rowMatrix {0,1,2,3,4} * tailC11 = tailC10 := by decide
private theorem tailStep9 : rowMatrix {1,2,3,4,5} * tailC10 = tailC9 := by decide
private theorem tailStep8 : rowMatrix {0,1,2,3,4} * tailC9 = tailC8 := by decide
private theorem tailStep7 : rowMatrix {1,2,3,4} * tailC8 = tailC7 := by decide
private theorem tailStep6 : rowMatrix {0,1,2,3,4} * tailC7 = tailC6 := by decide
private theorem tailStep5 : rowMatrix {1,2,3,4,5} * tailC6 = tailC5 := by decide
private theorem tailStep4 : rowMatrix {0,1,2,3,4} * tailC5 = tailC4 := by decide
private theorem tailStep3 : rowMatrix {1,2,3,4,5} * tailC4 = tailC3 := by decide
private theorem tailStep2 : rowMatrix {0,1,2,3,4} * tailC3 = tailC2 := by decide
private theorem tailStep1 : rowMatrix {1,2,3,4} * tailC2 = tailC1 := by decide
private theorem tailStep0 : rowMatrix {2,3,4} * tailC1 = tailC0 := by decide

private theorem tail_transfer : transfer (pre.tail) = tailC0 := by
  simp only [pre, List.tail_cons, transfer, List.map_cons, List.map_nil, List.prod_cons, List.prod_nil]
  change rowMatrix {2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {1,2,3,4} * (1 : Mat6))))))))))))))))))))) = tailC0
  rw [tailStep20, tailStep19, tailStep18, tailStep17, tailStep16, tailStep15, tailStep14, tailStep13, tailStep12, tailStep11, tailStep10, tailStep9, tailStep8, tailStep7, tailStep6, tailStep5, tailStep4, tailStep3, tailStep2, tailStep1, tailStep0]

private def blockC0 : Mat6 := !![15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 8, 23, 38, 38, 0, 0; 3, 9, 15, 15, 0, 0; 0, 0, 0, 0, 0, 0]
private def blockC1 : Mat6 := !![0, 0, 0, 0, 0, 0; 7, 19, 31, 31, 0, 0; 5, 14, 23, 23, 0, 0; 3, 9, 15, 15, 0, 0; 1, 4, 7, 7, 0, 0; 0, 1, 2, 2, 0, 0]
private def blockC2 : Mat6 := !![2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 1, 3, 5, 5, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 0, 0, 0, 0]
private def blockC3 : Mat6 := !![0, 0, 0, 0, 0, 0; 1, 2, 3, 3, 0, 0; 1, 2, 3, 3, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 0, 0, 0]
private def blockC4 : Mat6 := !![0, 0, 0, 0, 0, 0; 1, 1, 1, 1, 0, 0; 0, 1, 1, 1, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 0, 0]
private theorem blockStep4 : rowMatrix {1,2,3,4} * (1 : Mat6) = blockC4 := by decide
private theorem blockStep3 : rowMatrix {1,2,3,4} * blockC4 = blockC3 := by decide
private theorem blockStep2 : rowMatrix {0,1,2,3,4} * blockC3 = blockC2 := by decide
private theorem blockStep1 : rowMatrix {1,2,3,4,5} * blockC2 = blockC1 := by decide
private theorem blockStep0 : rowMatrix {0,1,2,3,4} * blockC1 = blockC0 := by decide

private theorem block_transfer : transfer (block) = blockC0 := by
  simp only [block, transfer, List.map_cons, List.map_nil, List.prod_cons, List.prod_nil]
  change rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {1,2,3,4} * (1 : Mat6))))) = blockC0
  rw [blockStep4, blockStep3, blockStep2, blockStep1, blockStep0]

private def midC0 : Mat6 := !![6375, 17967, 29559, 29559, 0, 0; 6375, 17967, 29559, 29559, 0, 0; 6375, 17967, 29559, 29559, 0, 0; 3496, 9853, 16210, 16210, 0, 0; 1371, 3864, 6357, 6357, 0, 0; 0, 0, 0, 0, 0, 0]
private def midC1 : Mat6 := !![0, 0, 0, 0, 0, 0; 2879, 8114, 13349, 13349, 0, 0; 2125, 5989, 9853, 9853, 0, 0; 1371, 3864, 6357, 6357, 0, 0; 617, 1739, 2861, 2861, 0, 0; 160, 451, 742, 742, 0, 0]
private def midC2 : Mat6 := !![754, 2125, 3496, 3496, 0, 0; 754, 2125, 3496, 3496, 0, 0; 754, 2125, 3496, 3496, 0, 0; 457, 1288, 2119, 2119, 0, 0; 160, 451, 742, 742, 0, 0; 0, 0, 0, 0, 0, 0]
private def midC3 : Mat6 := !![0, 0, 0, 0, 0, 0; 297, 837, 1377, 1377, 0, 0; 297, 837, 1377, 1377, 0, 0; 160, 451, 742, 742, 0, 0; 61, 172, 283, 283, 0, 0; 0, 0, 0, 0, 0, 0]
private def midC4 : Mat6 := !![0, 0, 0, 0, 0, 0; 137, 386, 635, 635, 0, 0; 99, 279, 459, 459, 0, 0; 61, 172, 283, 283, 0, 0; 23, 65, 107, 107, 0, 0; 0, 0, 0, 0, 0, 0]
private def midC5 : Mat6 := !![38, 107, 176, 176, 0, 0; 38, 107, 176, 176, 0, 0; 38, 107, 176, 176, 0, 0; 23, 65, 107, 107, 0, 0; 8, 23, 38, 38, 0, 0; 0, 0, 0, 0, 0, 0]
private def midC6 : Mat6 := !![0, 0, 0, 0, 0, 0; 15, 42, 69, 69, 0, 0; 15, 42, 69, 69, 0, 0; 8, 23, 38, 38, 0, 0; 3, 9, 15, 15, 0, 0; 0, 0, 0, 0, 0, 0]
private def midC7 : Mat6 := !![0, 0, 0, 0, 0, 0; 7, 19, 31, 31, 0, 0; 5, 14, 23, 23, 0, 0; 3, 9, 15, 15, 0, 0; 1, 4, 7, 7, 0, 0; 0, 1, 2, 2, 0, 0]
private def midC8 : Mat6 := !![2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 2, 5, 8, 8, 0, 0; 1, 3, 5, 5, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 0, 0, 0, 0]
private def midC9 : Mat6 := !![0, 0, 0, 0, 0, 0; 1, 2, 3, 3, 0, 0; 1, 2, 3, 3, 0, 0; 0, 1, 2, 2, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 0, 0, 0]
private def midC10 : Mat6 := !![0, 0, 0, 0, 0, 0; 1, 1, 1, 1, 0, 0; 0, 1, 1, 1, 0, 0; 0, 0, 1, 1, 0, 0; 0, 0, 0, 1, 0, 0; 0, 0, 0, 0, 0, 0]
private theorem midStep10 : rowMatrix {1,2,3,4} * (1 : Mat6) = midC10 := by decide
private theorem midStep9 : rowMatrix {1,2,3,4} * midC10 = midC9 := by decide
private theorem midStep8 : rowMatrix {0,1,2,3,4} * midC9 = midC8 := by decide
private theorem midStep7 : rowMatrix {1,2,3,4,5} * midC8 = midC7 := by decide
private theorem midStep6 : rowMatrix {1,2,3,4} * midC7 = midC6 := by decide
private theorem midStep5 : rowMatrix {0,1,2,3,4} * midC6 = midC5 := by decide
private theorem midStep4 : rowMatrix {1,2,3,4} * midC5 = midC4 := by decide
private theorem midStep3 : rowMatrix {1,2,3,4} * midC4 = midC3 := by decide
private theorem midStep2 : rowMatrix {0,1,2,3,4} * midC3 = midC2 := by decide
private theorem midStep1 : rowMatrix {1,2,3,4,5} * midC2 = midC1 := by decide
private theorem midStep0 : rowMatrix {0,1,2,3,4} * midC1 = midC0 := by decide

private theorem mid_transfer : transfer (mid) = midC0 := by
  simp only [mid, transfer, List.map_cons, List.map_nil, List.prod_cons, List.prod_nil]
  change rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {1,2,3,4} * (1 : Mat6))))))))))) = midC0
  rw [midStep10, midStep9, midStep8, midStep7, midStep6, midStep5, midStep4, midStep3, midStep2, midStep1, midStep0]

private def sufC0 : Mat6 := !![912299598, 1965015369, 3017731140, 0, 0, 0; 912299598, 1965015369, 3017731140, 0, 0, 0; 912299598, 1965015369, 3017731140, 0, 0, 0; 500262912, 1077523560, 1654784208, 0, 0, 0; 196163046, 422518437, 648873828, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC1 : Mat6 := !![0, 0, 0, 0, 0, 0; 412036686, 887491809, 1362946932, 0, 0, 0; 304099866, 655005123, 1005910380, 0, 0, 0; 196163046, 422518437, 648873828, 0, 0, 0; 88226226, 190031751, 291837276, 0, 0, 0; 22838544, 49192272, 75546000, 0, 0, 0]
private def sufC2 : Mat6 := !![107936820, 232486686, 357036552, 0, 0, 0; 107936820, 232486686, 357036552, 0, 0, 0; 107936820, 232486686, 357036552, 0, 0, 0; 65387682, 140839479, 216291276, 0, 0, 0; 22838544, 49192272, 75546000, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC3 : Mat6 := !![0, 0, 0, 0, 0, 0; 42549138, 91647207, 140745276, 0, 0, 0; 42549138, 91647207, 140745276, 0, 0, 0; 22838544, 49192272, 75546000, 0, 0, 0; 8655498, 18643203, 28630908, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC4 : Mat6 := !![0, 0, 0, 0, 0, 0; 19710594, 42454935, 65199276, 0, 0, 0; 14183046, 30549069, 46915092, 0, 0, 0; 8655498, 18643203, 28630908, 0, 0, 0; 3127950, 6737337, 10346724, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC5 : Mat6 := !![5527548, 11905866, 18284184, 0, 0, 0; 5527548, 11905866, 18284184, 0, 0, 0; 5527548, 11905866, 18284184, 0, 0, 0; 3127950, 6737337, 10346724, 0, 0, 0; 1406826, 3030183, 4653540, 0, 0, 0; 364176, 784404, 1204632, 0, 0, 0]
private def sufC6 : Mat6 := !![0, 0, 0, 0, 0, 0; 2399598, 5168529, 7937460, 0, 0, 0; 1721124, 3707154, 5693184, 0, 0, 0; 1042650, 2245779, 3448908, 0, 0, 0; 364176, 784404, 1204632, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC7 : Mat6 := !![678474, 1461375, 2244276, 0, 0, 0; 678474, 1461375, 2244276, 0, 0, 0; 678474, 1461375, 2244276, 0, 0, 0; 364176, 784404, 1204632, 0, 0, 0; 138018, 297279, 456540, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC8 : Mat6 := !![0, 0, 0, 0, 0, 0; 314298, 676971, 1039644, 0, 0, 0; 226158, 487125, 748092, 0, 0, 0; 138018, 297279, 456540, 0, 0, 0; 49878, 107433, 164988, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC9 : Mat6 := !![88140, 189846, 291552, 0, 0, 0; 88140, 189846, 291552, 0, 0, 0; 88140, 189846, 291552, 0, 0, 0; 49878, 107433, 164988, 0, 0, 0; 22434, 48321, 74208, 0, 0, 0; 5808, 12510, 19212, 0, 0, 0]
private def sufC10 : Mat6 := !![0, 0, 0, 0, 0, 0; 38262, 82413, 126564, 0, 0, 0; 27444, 59112, 90780, 0, 0, 0; 16626, 35811, 54996, 0, 0, 0; 5808, 12510, 19212, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC11 : Mat6 := !![10818, 23301, 35784, 0, 0, 0; 10818, 23301, 35784, 0, 0, 0; 10818, 23301, 35784, 0, 0, 0; 5808, 12510, 19212, 0, 0, 0; 2202, 4743, 7284, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC12 : Mat6 := !![0, 0, 0, 0, 0, 0; 5010, 10791, 16572, 0, 0, 0; 3606, 7767, 11928, 0, 0, 0; 2202, 4743, 7284, 0, 0, 0; 798, 1719, 2640, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC13 : Mat6 := !![1404, 3024, 4644, 0, 0, 0; 1404, 3024, 4644, 0, 0, 0; 1404, 3024, 4644, 0, 0, 0; 798, 1719, 2640, 0, 0, 0; 362, 780, 1198, 0, 0, 0; 96, 207, 318, 0, 0, 0]
private def sufC14 : Mat6 := !![0, 0, 0, 0, 0, 0; 606, 1305, 2004, 0, 0, 0; 436, 939, 1442, 0, 0, 0; 266, 573, 880, 0, 0, 0; 96, 207, 318, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC15 : Mat6 := !![170, 366, 562, 0, 0, 0; 170, 366, 562, 0, 0, 0; 170, 366, 562, 0, 0, 0; 96, 207, 318, 0, 0, 0; 43, 93, 143, 0, 0, 0; 11, 24, 37, 0, 0, 0]
private def sufC16 : Mat6 := !![0, 0, 0, 0, 0, 0; 74, 159, 244, 0, 0, 0; 53, 114, 175, 0, 0, 0; 32, 69, 106, 0, 0, 0; 11, 24, 37, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC17 : Mat6 := !![21, 45, 69, 0, 0, 0; 21, 45, 69, 0, 0, 0; 21, 45, 69, 0, 0, 0; 11, 24, 37, 0, 0, 0; 4, 9, 14, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC18 : Mat6 := !![0, 0, 0, 0, 0, 0; 10, 21, 32, 0, 0, 0; 7, 15, 23, 0, 0, 0; 4, 9, 14, 0, 0, 0; 1, 3, 5, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC19 : Mat6 := !![3, 6, 9, 0, 0, 0; 3, 6, 9, 0, 0, 0; 3, 6, 9, 0, 0, 0; 1, 3, 5, 0, 0, 0; 0, 1, 2, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC20 : Mat6 := !![0, 0, 0, 0, 0, 0; 2, 3, 4, 0, 0, 0; 1, 2, 3, 0, 0, 0; 0, 1, 2, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private def sufC21 : Mat6 := !![1, 1, 1, 0, 0, 0; 1, 1, 1, 0, 0, 0; 0, 1, 1, 0, 0, 0; 0, 0, 1, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0]
private theorem sufStep21 : rowMatrix {0,1,2,3} * (1 : Mat6) = sufC21 := by decide
private theorem sufStep20 : rowMatrix {1,2,3,4} * sufC21 = sufC20 := by decide
private theorem sufStep19 : rowMatrix {0,1,2,3,4} * sufC20 = sufC19 := by decide
private theorem sufStep18 : rowMatrix {1,2,3,4} * sufC19 = sufC18 := by decide
private theorem sufStep17 : rowMatrix {0,1,2,3,4} * sufC18 = sufC17 := by decide
private theorem sufStep16 : rowMatrix {1,2,3,4} * sufC17 = sufC16 := by decide
private theorem sufStep15 : rowMatrix {0,1,2,3,4,5} * sufC16 = sufC15 := by decide
private theorem sufStep14 : rowMatrix {1,2,3,4} * sufC15 = sufC14 := by decide
private theorem sufStep13 : rowMatrix {0,1,2,3,4,5} * sufC14 = sufC13 := by decide
private theorem sufStep12 : rowMatrix {1,2,3,4} * sufC13 = sufC12 := by decide
private theorem sufStep11 : rowMatrix {0,1,2,3,4} * sufC12 = sufC11 := by decide
private theorem sufStep10 : rowMatrix {1,2,3,4} * sufC11 = sufC10 := by decide
private theorem sufStep9 : rowMatrix {0,1,2,3,4,5} * sufC10 = sufC9 := by decide
private theorem sufStep8 : rowMatrix {1,2,3,4} * sufC9 = sufC8 := by decide
private theorem sufStep7 : rowMatrix {0,1,2,3,4} * sufC8 = sufC7 := by decide
private theorem sufStep6 : rowMatrix {1,2,3,4} * sufC7 = sufC6 := by decide
private theorem sufStep5 : rowMatrix {0,1,2,3,4,5} * sufC6 = sufC5 := by decide
private theorem sufStep4 : rowMatrix {1,2,3,4} * sufC5 = sufC4 := by decide
private theorem sufStep3 : rowMatrix {1,2,3,4} * sufC4 = sufC3 := by decide
private theorem sufStep2 : rowMatrix {0,1,2,3,4} * sufC3 = sufC2 := by decide
private theorem sufStep1 : rowMatrix {1,2,3,4,5} * sufC2 = sufC1 := by decide
private theorem sufStep0 : rowMatrix {0,1,2,3,4} * sufC1 = sufC0 := by decide

private theorem suf_transfer : transfer (suf) = sufC0 := by
  simp only [suf, transfer, List.map_cons, List.map_nil, List.prod_cons, List.prod_nil]
  change rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4,5} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4,5} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4,5} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4,5} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4,5} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3,4} * (rowMatrix {1,2,3,4} * (rowMatrix {0,1,2,3} * (1 : Mat6)))))))))))))))))))))) = sufC0
  rw [sufStep21, sufStep20, sufStep19, sufStep18, sufStep17, sufStep16, sufStep15, sufStep14, sufStep13, sufStep12, sufStep11, sufStep10, sufStep9, sufStep8, sufStep7, sufStep6, sufStep5, sufStep4, sufStep3, sufStep2, sufStep1, sufStep0]

theorem block_eq_A : transfer block = A := by rw [block_transfer]; decide
theorem mid_eq_M : transfer mid = M := by rw [mid_transfer]; decide

def basisRow (t : Fin 6) : Matrix (Fin 1) (Fin 6) ℤ := fun _ j => if j=t then 1 else 0
def basisCol (t : Fin 6) : Matrix (Fin 6) (Fin 1) ℤ := fun i _ => if i=t then 1 else 0

theorem pre_boundary : basisRow 3 * transfer pre = uE := by rw [pre_transfer]; decide
theorem minority_boundary : basisRow 3 * transfer pre - basisRow 2 * transfer pre.tail = uN := by
  rw [pre_transfer, tail_transfer]; decide
theorem suf_boundary : transfer suf * basisCol 2 = v := by rw [suf_transfer]; decide

/-- Matrix product of every actual row mask, for all m. -/
theorem transfer_factorization (m : ℕ) :
    transfer (rows m 0 (55+10*m)) = transfer pre * A^m * M * A^m * transfer suf := by
  rw [row_word]
  simp only [transfer_append, transfer_repeat, block_eq_A, mid_eq_M]

/-- The full corridor matrix with its terminal seed and initial coordinate equals E.
This is an identity of row-transfer products; the path-count interpretation is separate. -/
theorem corridor_eq_E (m : ℕ) :
    (basisRow 3 * transfer (rows m 0 (55+10*m)) * basisCol 2) 0 0 = E m := by
  rw [transfer_factorization]
  simp only [← Matrix.mul_assoc, pre_boundary]
  simp only [Matrix.mul_assoc, suf_boundary]
  simp only [E, Matrix.mul_assoc]

/-- Difference of the two initial boundary functionals equals N. -/
theorem corridor_eq_N (m : ℕ) :
    ((basisRow 3 * transfer pre - basisRow 2 * transfer pre.tail) *
      A^m * M * A^m * transfer suf * basisCol 2) 0 0 = N m := by
  rw [minority_boundary]
  simp only [Matrix.mul_assoc, suf_boundary, N]

end OneThird.Structure
