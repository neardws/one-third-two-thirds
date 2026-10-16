module
public import OneThird.FiniteTransfer7
@[expose] public section
namespace OneThird.FiniteTransferData7_0
open Matrix Structure FiniteGrid4 FiniteTransfer7
set_option maxHeartbeats 0
set_option maxRecDepth 100000
def p0 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![0, 0, 0, 1, 0, 0]
def p1 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![0, 0, 1, 1, 0, 0]
def p2 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![0, 1, 2, 2, 0, 0]
def p3 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1, 3, 5, 5, 0, 0]
def p4 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![4, 9, 14, 14, 0, 0]
def p5 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![9, 23, 37, 37, 37, 0]
def p6 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![32, 69, 106, 143, 0, 0]
def p7 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![69, 175, 318, 318, 318, 0]
def p8 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![244, 562, 880, 1198, 0, 0]
def p9 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![562, 1442, 2640, 2640, 0, 0]
def p10 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![2004, 4644, 7284, 7284, 0, 0]
def p11 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![4644, 11928, 19212, 19212, 19212, 0]
def p12 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![16572, 35784, 54996, 74208, 0, 0]
def p13 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![35784, 90780, 164988, 164988, 0, 0]
def p14 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![126564, 291552, 456540, 456540, 0, 0]
def p15 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![291552, 748092, 1204632, 1204632, 1204632, 0]
def p16 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1039644, 2244276, 3448908, 4653540, 0, 0]
def p17 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![2244276, 5693184, 10346724, 10346724, 0, 0]
def p18 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![7937460, 18284184, 28630908, 28630908, 0, 0]
def p19 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![18284184, 46915092, 75546000, 75546000, 75546000, 0]
def p20 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![65199276, 140745276, 216291276, 291837276, 0, 0]
def p21 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![140745276, 357036552, 648873828, 648873828, 0, 0]
def p22 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![357036552, 1005910380, 1654784208, 1654784208, 0, 0]
def p23 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1362946932, 3017731140, 4672515348, 4672515348, 0, 0]
def p24 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![3017731140, 7690246488, 12362761836, 12362761836, 12362761836, 0]
def p25 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![10707977628, 23070739464, 35433501300, 47796263136, 0, 0]
def p26 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![23070739464, 58504240764, 106300503900, 106300503900, 0, 0]
def p27 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![58504240764, 164804744664, 271105248564, 271105248564, 0, 0]
def p28 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![223308985428, 494414233992, 765519482556, 765519482556, 0, 0]
def p29 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![494414233992, 1259933716548, 2025453199104, 2025453199104, 0, 0]
def p30 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1259933716548, 3285386915652, 5310840114756, 5310840114756, 5310840114756, 0]
def p31 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![4545320632200, 9856160746956, 15167000861712, 20477840976468, 0, 0]
def p32 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![9856160746956, 25023161608668, 45501002585136, 45501002585136, 0, 0]
def p33 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![25023161608668, 70524164193804, 116025166778940, 116025166778940, 0, 0]
def p34 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![95547325802472, 211572492581412, 327597659360352, 327597659360352, 0, 0]
def p35 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![211572492581412, 539170151941764, 866767811302116, 866767811302116, 866767811302116, 0]
def p36 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![750742644523176, 1617510455825292, 2484278267127408, 3351046078429524, 0, 0]
def p37 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1617510455825292, 4101788722952700, 7452834801382224, 7452834801382224, 0, 0]
def p38 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![4101788722952700, 11554623524334924, 19007458325717148, 19007458325717148, 0, 0]
def p39 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![15656412247287624, 34663870573004772, 53671328898721920, 53671328898721920, 53671328898721920, 0]
def p40 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![34663870573004772, 88335199471726692, 142006528370448612, 195677857269170532, 0, 0]
def p41 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![122999070044731464, 265005598415180076, 460683455684350608, 460683455684350608, 0, 0]
def p42 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![265005598415180076, 725689054099530684, 1186372509783881292, 1186372509783881292, 0, 0]
def p43 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![990694652514710760, 2177067162298592052, 3363439672082473344, 3363439672082473344, 3363439672082473344, 0]
def p44 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![2177067162298592052, 5540506834381065396, 8903946506463538740, 12267386178546012084, 0, 0]
def p45 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![7717573996679657448, 16621520503143196188, 28888906681689208272, 28888906681689208272, 0, 0]
def p46 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![16621520503143196188, 45510427184832404460, 74399333866521612732, 74399333866521612732, 0, 0]
def p47 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![62131947687975600648, 136531281554497213380, 210930615421018826112, 210930615421018826112, 210930615421018826112, 0]
def p48 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![136531281554497213380, 347461896975516039492, 558392512396534865604, 769323127817553691716, 0, 0]
def p49 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![483993178530013252872, 1042385690926548118476, 1811708818744101810192, 1811708818744101810192, 1811708818744101810192, 0]
def p50 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1042385690926548118476, 2854094509670649928668, 4665803328414751738860, 6477512147158853549052, 0, 0]
def p51 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![3896480200597198047144, 8562283529011949786004, 15039795676170803335056, 15039795676170803335056, 0, 0]
def p52 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![8562283529011949786004, 23602079205182753121060, 38641874881353556456116, 38641874881353556456116, 0, 0]
def p53 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![32164362734194702907064, 70806237615548259363180, 109448112496901815819296, 109448112496901815819296, 0, 0]
def p54 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![70806237615548259363180, 180254350112450075182476, 289702462609351891001772, 289702462609351891001772, 0, 0]
def g0 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 0, 0, 830465512946702116549200, 289702462609351891001772, 0] d
def g1 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 0, 540763050337350225547428, 289702462609351891001772, 109448112496901815819296, 0] d
def g2 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 251060587727998334545656, 180254350112450075182476, 109448112496901815819296, 38641874881353556456116, 0] d
def g3 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![70806237615548259363180, 70806237615548259363180, 70806237615548259363180, 38641874881353556456116, 15039795676170803335056, 0] d
def g4 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 32164362734194702907064, 23602079205182753121060, 15039795676170803335056, 6477512147158853549052, 1811708818744101810192] d
def g5 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![8562283529011949786004, 8562283529011949786004, 8562283529011949786004, 4665803328414751738860, 1811708818744101810192, 0] d
def g6 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 3896480200597198047144, 2854094509670649928668, 1811708818744101810192, 769323127817553691716, 210930615421018826112] d
def g7 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![1042385690926548118476, 1042385690926548118476, 1042385690926548118476, 558392512396534865604, 210930615421018826112, 0] d
def g8 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 483993178530013252872, 347461896975516039492, 210930615421018826112, 74399333866521612732, 0] d
def g9 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![136531281554497213380, 136531281554497213380, 136531281554497213380, 74399333866521612732, 28888906681689208272, 0] d
def g10 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 62131947687975600648, 45510427184832404460, 28888906681689208272, 12267386178546012084, 3363439672082473344] d
def g11 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![16621520503143196188, 16621520503143196188, 16621520503143196188, 8903946506463538740, 3363439672082473344, 0] d
def g12 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 7717573996679657448, 5540506834381065396, 3363439672082473344, 1186372509783881292, 0] d
def g13 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![2177067162298592052, 2177067162298592052, 2177067162298592052, 1186372509783881292, 460683455684350608, 0] d
def g14 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 990694652514710760, 725689054099530684, 460683455684350608, 195677857269170532, 53671328898721920] d
def g15 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![265005598415180076, 265005598415180076, 265005598415180076, 142006528370448612, 53671328898721920, 0] d
def g16 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 122999070044731464, 88335199471726692, 53671328898721920, 19007458325717148, 0] d
def g17 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![34663870573004772, 34663870573004772, 34663870573004772, 19007458325717148, 7452834801382224, 0] d
def g18 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 15656412247287624, 11554623524334924, 7452834801382224, 3351046078429524, 866767811302116] d
def g19 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![4101788722952700, 4101788722952700, 4101788722952700, 2484278267127408, 866767811302116, 0] d
def g20 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1617510455825292, 1617510455825292, 866767811302116, 327597659360352, 0] d
def g21 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 750742644523176, 539170151941764, 327597659360352, 116025166778940, 0] d
def g22 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![211572492581412, 211572492581412, 211572492581412, 116025166778940, 45501002585136, 0] d
def g23 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 95547325802472, 70524164193804, 45501002585136, 20477840976468, 5310840114756] d
def g24 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![25023161608668, 25023161608668, 25023161608668, 15167000861712, 5310840114756, 0] d
def g25 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 9856160746956, 9856160746956, 5310840114756, 2025453199104, 0] d
def g26 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 4545320632200, 3285386915652, 2025453199104, 765519482556, 0] d
def g27 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![1259933716548, 1259933716548, 1259933716548, 765519482556, 271105248564, 0] d
def g28 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 494414233992, 494414233992, 271105248564, 106300503900, 0] d
def g29 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 223308985428, 164804744664, 106300503900, 47796263136, 12362761836] d
def g30 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![58504240764, 58504240764, 58504240764, 35433501300, 12362761836, 0] d
def g31 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 23070739464, 23070739464, 12362761836, 4672515348, 0] d
def g32 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 10707977628, 7690246488, 4672515348, 1654784208, 0] d
def g33 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![3017731140, 3017731140, 3017731140, 1654784208, 648873828, 0] d
def g34 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1362946932, 1005910380, 648873828, 291837276, 75546000] d
def g35 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![357036552, 357036552, 357036552, 216291276, 75546000, 0] d
def g36 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 140745276, 140745276, 75546000, 28630908, 0] d
def g37 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 65199276, 46915092, 28630908, 10346724, 0] d
def g38 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![18284184, 18284184, 18284184, 10346724, 4653540, 1204632] d
def g39 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 7937460, 5693184, 3448908, 1204632, 0] d
def g40 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![2244276, 2244276, 2244276, 1204632, 456540, 0] d
def g41 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1039644, 748092, 456540, 164988, 0] d
def g42 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![291552, 291552, 291552, 164988, 74208, 19212] d
def g43 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 126564, 90780, 54996, 19212, 0] d
def g44 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![35784, 35784, 35784, 19212, 7284, 0] d
def g45 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 16572, 11928, 7284, 2640, 0] d
def g46 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![4644, 4644, 4644, 2640, 1198, 318] d
def g47 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 2004, 1442, 880, 318, 0] d
def g48 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![562, 562, 562, 318, 143, 37] d
def g49 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 244, 175, 106, 37, 0] d
def g50 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![69, 69, 69, 37, 14, 0] d
def g51 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 32, 23, 14, 5, 0] d
def g52 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![9, 9, 9, 5, 2, 0] d
def g53 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 4, 3, 2, 1, 0] d
def g54 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![1, 1, 1, 1, 0, 0] d
def g55 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 0, 1, 0, 0, 0] d
theorem fr0 : p1=p0*rowMatrix (rowMask 0 0) := by decide
theorem fr1 : p2=p1*rowMatrix (rowMask 0 1) := by decide
theorem fr2 : p3=p2*rowMatrix (rowMask 0 2) := by decide
theorem fr3 : p4=p3*rowMatrix (rowMask 0 3) := by decide
theorem fr4 : p5=p4*rowMatrix (rowMask 0 4) := by decide
theorem fr5 : p6=p5*rowMatrix (rowMask 0 5) := by decide
theorem fr6 : p7=p6*rowMatrix (rowMask 0 6) := by decide
theorem fr7 : p8=p7*rowMatrix (rowMask 0 7) := by decide
theorem fr8 : p9=p8*rowMatrix (rowMask 0 8) := by decide
theorem fr9 : p10=p9*rowMatrix (rowMask 0 9) := by decide
theorem fr10 : p11=p10*rowMatrix (rowMask 0 10) := by decide
theorem fr11 : p12=p11*rowMatrix (rowMask 0 11) := by decide
theorem fr12 : p13=p12*rowMatrix (rowMask 0 12) := by decide
theorem fr13 : p14=p13*rowMatrix (rowMask 0 13) := by decide
theorem fr14 : p15=p14*rowMatrix (rowMask 0 14) := by decide
theorem fr15 : p16=p15*rowMatrix (rowMask 0 15) := by decide
theorem fr16 : p17=p16*rowMatrix (rowMask 0 16) := by decide
theorem fr17 : p18=p17*rowMatrix (rowMask 0 17) := by decide
theorem fr18 : p19=p18*rowMatrix (rowMask 0 18) := by decide
theorem fr19 : p20=p19*rowMatrix (rowMask 0 19) := by decide
theorem fr20 : p21=p20*rowMatrix (rowMask 0 20) := by decide
theorem fr21 : p22=p21*rowMatrix (rowMask 0 21) := by decide
theorem fr22 : p23=p22*rowMatrix (rowMask 0 22) := by decide
theorem fr23 : p24=p23*rowMatrix (rowMask 0 23) := by decide
theorem fr24 : p25=p24*rowMatrix (rowMask 0 24) := by decide
theorem fr25 : p26=p25*rowMatrix (rowMask 0 25) := by decide
theorem fr26 : p27=p26*rowMatrix (rowMask 0 26) := by decide
theorem fr27 : p28=p27*rowMatrix (rowMask 0 27) := by decide
theorem fr28 : p29=p28*rowMatrix (rowMask 0 28) := by decide
theorem fr29 : p30=p29*rowMatrix (rowMask 0 29) := by decide
theorem fr30 : p31=p30*rowMatrix (rowMask 0 30) := by decide
theorem fr31 : p32=p31*rowMatrix (rowMask 0 31) := by decide
theorem fr32 : p33=p32*rowMatrix (rowMask 0 32) := by decide
theorem fr33 : p34=p33*rowMatrix (rowMask 0 33) := by decide
theorem fr34 : p35=p34*rowMatrix (rowMask 0 34) := by decide
theorem fr35 : p36=p35*rowMatrix (rowMask 0 35) := by decide
theorem fr36 : p37=p36*rowMatrix (rowMask 0 36) := by decide
theorem fr37 : p38=p37*rowMatrix (rowMask 0 37) := by decide
theorem fr38 : p39=p38*rowMatrix (rowMask 0 38) := by decide
theorem fr39 : p40=p39*rowMatrix (rowMask 0 39) := by decide
theorem fr40 : p41=p40*rowMatrix (rowMask 0 40) := by decide
theorem fr41 : p42=p41*rowMatrix (rowMask 0 41) := by decide
theorem fr42 : p43=p42*rowMatrix (rowMask 0 42) := by decide
theorem fr43 : p44=p43*rowMatrix (rowMask 0 43) := by decide
theorem fr44 : p45=p44*rowMatrix (rowMask 0 44) := by decide
theorem fr45 : p46=p45*rowMatrix (rowMask 0 45) := by decide
theorem fr46 : p47=p46*rowMatrix (rowMask 0 46) := by decide
theorem fr47 : p48=p47*rowMatrix (rowMask 0 47) := by decide
theorem fr48 : p49=p48*rowMatrix (rowMask 0 48) := by decide
theorem fr49 : p50=p49*rowMatrix (rowMask 0 49) := by decide
theorem fr50 : p51=p50*rowMatrix (rowMask 0 50) := by decide
theorem fr51 : p52=p51*rowMatrix (rowMask 0 51) := by decide
theorem fr52 : p53=p52*rowMatrix (rowMask 0 52) := by decide
theorem fr53 : p54=p53*rowMatrix (rowMask 0 53) := by decide
theorem br0 : g0=rowMatrix (rowMask 0 0)*g1 := by decide
theorem br1 : g1=rowMatrix (rowMask 0 1)*g2 := by decide
theorem br2 : g2=rowMatrix (rowMask 0 2)*g3 := by decide
theorem br3 : g3=rowMatrix (rowMask 0 3)*g4 := by decide
theorem br4 : g4=rowMatrix (rowMask 0 4)*g5 := by decide
theorem br5 : g5=rowMatrix (rowMask 0 5)*g6 := by decide
theorem br6 : g6=rowMatrix (rowMask 0 6)*g7 := by decide
theorem br7 : g7=rowMatrix (rowMask 0 7)*g8 := by decide
theorem br8 : g8=rowMatrix (rowMask 0 8)*g9 := by decide
theorem br9 : g9=rowMatrix (rowMask 0 9)*g10 := by decide
theorem br10 : g10=rowMatrix (rowMask 0 10)*g11 := by decide
theorem br11 : g11=rowMatrix (rowMask 0 11)*g12 := by decide
theorem br12 : g12=rowMatrix (rowMask 0 12)*g13 := by decide
theorem br13 : g13=rowMatrix (rowMask 0 13)*g14 := by decide
theorem br14 : g14=rowMatrix (rowMask 0 14)*g15 := by decide
theorem br15 : g15=rowMatrix (rowMask 0 15)*g16 := by decide
theorem br16 : g16=rowMatrix (rowMask 0 16)*g17 := by decide
theorem br17 : g17=rowMatrix (rowMask 0 17)*g18 := by decide
theorem br18 : g18=rowMatrix (rowMask 0 18)*g19 := by decide
theorem br19 : g19=rowMatrix (rowMask 0 19)*g20 := by decide
theorem br20 : g20=rowMatrix (rowMask 0 20)*g21 := by decide
theorem br21 : g21=rowMatrix (rowMask 0 21)*g22 := by decide
theorem br22 : g22=rowMatrix (rowMask 0 22)*g23 := by decide
theorem br23 : g23=rowMatrix (rowMask 0 23)*g24 := by decide
theorem br24 : g24=rowMatrix (rowMask 0 24)*g25 := by decide
theorem br25 : g25=rowMatrix (rowMask 0 25)*g26 := by decide
theorem br26 : g26=rowMatrix (rowMask 0 26)*g27 := by decide
theorem br27 : g27=rowMatrix (rowMask 0 27)*g28 := by decide
theorem br28 : g28=rowMatrix (rowMask 0 28)*g29 := by decide
theorem br29 : g29=rowMatrix (rowMask 0 29)*g30 := by decide
theorem br30 : g30=rowMatrix (rowMask 0 30)*g31 := by decide
theorem br31 : g31=rowMatrix (rowMask 0 31)*g32 := by decide
theorem br32 : g32=rowMatrix (rowMask 0 32)*g33 := by decide
theorem br33 : g33=rowMatrix (rowMask 0 33)*g34 := by decide
theorem br34 : g34=rowMatrix (rowMask 0 34)*g35 := by decide
theorem br35 : g35=rowMatrix (rowMask 0 35)*g36 := by decide
theorem br36 : g36=rowMatrix (rowMask 0 36)*g37 := by decide
theorem br37 : g37=rowMatrix (rowMask 0 37)*g38 := by decide
theorem br38 : g38=rowMatrix (rowMask 0 38)*g39 := by decide
theorem br39 : g39=rowMatrix (rowMask 0 39)*g40 := by decide
theorem br40 : g40=rowMatrix (rowMask 0 40)*g41 := by decide
theorem br41 : g41=rowMatrix (rowMask 0 41)*g42 := by decide
theorem br42 : g42=rowMatrix (rowMask 0 42)*g43 := by decide
theorem br43 : g43=rowMatrix (rowMask 0 43)*g44 := by decide
theorem br44 : g44=rowMatrix (rowMask 0 44)*g45 := by decide
theorem br45 : g45=rowMatrix (rowMask 0 45)*g46 := by decide
theorem br46 : g46=rowMatrix (rowMask 0 46)*g47 := by decide
theorem br47 : g47=rowMatrix (rowMask 0 47)*g48 := by decide
theorem br48 : g48=rowMatrix (rowMask 0 48)*g49 := by decide
theorem br49 : g49=rowMatrix (rowMask 0 49)*g50 := by decide
theorem br50 : g50=rowMatrix (rowMask 0 50)*g51 := by decide
theorem br51 : g51=rowMatrix (rowMask 0 51)*g52 := by decide
theorem br52 : g52=rowMatrix (rowMask 0 52)*g53 := by decide
theorem br53 : g53=rowMatrix (rowMask 0 53)*g54 := by decide
theorem br54 : g54=rowMatrix (rowMask 0 54)*g55 := by decide
theorem ev0 : ∀d : Fin 7,
    (p0*eventRow (rowMask 0 0) ((d.val : ℤ)-3)*g1) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 1 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev1 : ∀d : Fin 7,
    (p1*eventRow (rowMask 0 1) ((d.val : ℤ)-3)*g2) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 2 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev2 : ∀d : Fin 7,
    (p2*eventRow (rowMask 0 2) ((d.val : ℤ)-3)*g3) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 3 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev3 : ∀d : Fin 7,
    (p3*eventRow (rowMask 0 3) ((d.val : ℤ)-3)*g4) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 4 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev4 : ∀d : Fin 7,
    (p4*eventRow (rowMask 0 4) ((d.val : ℤ)-3)*g5) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 5 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev5 : ∀d : Fin 7,
    (p5*eventRow (rowMask 0 5) ((d.val : ℤ)-3)*g6) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 6 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev6 : ∀d : Fin 7,
    (p6*eventRow (rowMask 0 6) ((d.val : ℤ)-3)*g7) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 7 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev7 : ∀d : Fin 7,
    (p7*eventRow (rowMask 0 7) ((d.val : ℤ)-3)*g8) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 8 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev8 : ∀d : Fin 7,
    (p8*eventRow (rowMask 0 8) ((d.val : ℤ)-3)*g9) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 9 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev9 : ∀d : Fin 7,
    (p9*eventRow (rowMask 0 9) ((d.val : ℤ)-3)*g10) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 10 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev10 : ∀d : Fin 7,
    (p10*eventRow (rowMask 0 10) ((d.val : ℤ)-3)*g11) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 11 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev11 : ∀d : Fin 7,
    (p11*eventRow (rowMask 0 11) ((d.val : ℤ)-3)*g12) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 12 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev12 : ∀d : Fin 7,
    (p12*eventRow (rowMask 0 12) ((d.val : ℤ)-3)*g13) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 13 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev13 : ∀d : Fin 7,
    (p13*eventRow (rowMask 0 13) ((d.val : ℤ)-3)*g14) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 14 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev14 : ∀d : Fin 7,
    (p14*eventRow (rowMask 0 14) ((d.val : ℤ)-3)*g15) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 15 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev15 : ∀d : Fin 7,
    (p15*eventRow (rowMask 0 15) ((d.val : ℤ)-3)*g16) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 16 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev16 : ∀d : Fin 7,
    (p16*eventRow (rowMask 0 16) ((d.val : ℤ)-3)*g17) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 17 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev17 : ∀d : Fin 7,
    (p17*eventRow (rowMask 0 17) ((d.val : ℤ)-3)*g18) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 18 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev18 : ∀d : Fin 7,
    (p18*eventRow (rowMask 0 18) ((d.val : ℤ)-3)*g19) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 19 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev19 : ∀d : Fin 7,
    (p19*eventRow (rowMask 0 19) ((d.val : ℤ)-3)*g20) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 20 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev20 : ∀d : Fin 7,
    (p20*eventRow (rowMask 0 20) ((d.val : ℤ)-3)*g21) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 21 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev21 : ∀d : Fin 7,
    (p21*eventRow (rowMask 0 21) ((d.val : ℤ)-3)*g22) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 22 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev22 : ∀d : Fin 7,
    (p22*eventRow (rowMask 0 22) ((d.val : ℤ)-3)*g23) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 23 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev23 : ∀d : Fin 7,
    (p23*eventRow (rowMask 0 23) ((d.val : ℤ)-3)*g24) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 24 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev24 : ∀d : Fin 7,
    (p24*eventRow (rowMask 0 24) ((d.val : ℤ)-3)*g25) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 25 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev25 : ∀d : Fin 7,
    (p25*eventRow (rowMask 0 25) ((d.val : ℤ)-3)*g26) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 26 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev26 : ∀d : Fin 7,
    (p26*eventRow (rowMask 0 26) ((d.val : ℤ)-3)*g27) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 27 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev27 : ∀d : Fin 7,
    (p27*eventRow (rowMask 0 27) ((d.val : ℤ)-3)*g28) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 28 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev28 : ∀d : Fin 7,
    (p28*eventRow (rowMask 0 28) ((d.val : ℤ)-3)*g29) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 29 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev29 : ∀d : Fin 7,
    (p29*eventRow (rowMask 0 29) ((d.val : ℤ)-3)*g30) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 30 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev30 : ∀d : Fin 7,
    (p30*eventRow (rowMask 0 30) ((d.val : ℤ)-3)*g31) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 31 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev31 : ∀d : Fin 7,
    (p31*eventRow (rowMask 0 31) ((d.val : ℤ)-3)*g32) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 32 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev32 : ∀d : Fin 7,
    (p32*eventRow (rowMask 0 32) ((d.val : ℤ)-3)*g33) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 33 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev33 : ∀d : Fin 7,
    (p33*eventRow (rowMask 0 33) ((d.val : ℤ)-3)*g34) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 34 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev34 : ∀d : Fin 7,
    (p34*eventRow (rowMask 0 34) ((d.val : ℤ)-3)*g35) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 35 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev35 : ∀d : Fin 7,
    (p35*eventRow (rowMask 0 35) ((d.val : ℤ)-3)*g36) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 36 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev36 : ∀d : Fin 7,
    (p36*eventRow (rowMask 0 36) ((d.val : ℤ)-3)*g37) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 37 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev37 : ∀d : Fin 7,
    (p37*eventRow (rowMask 0 37) ((d.val : ℤ)-3)*g38) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 38 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev38 : ∀d : Fin 7,
    (p38*eventRow (rowMask 0 38) ((d.val : ℤ)-3)*g39) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 39 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev39 : ∀d : Fin 7,
    (p39*eventRow (rowMask 0 39) ((d.val : ℤ)-3)*g40) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 40 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev40 : ∀d : Fin 7,
    (p40*eventRow (rowMask 0 40) ((d.val : ℤ)-3)*g41) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 41 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev41 : ∀d : Fin 7,
    (p41*eventRow (rowMask 0 41) ((d.val : ℤ)-3)*g42) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 42 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev42 : ∀d : Fin 7,
    (p42*eventRow (rowMask 0 42) ((d.val : ℤ)-3)*g43) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 43 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev43 : ∀d : Fin 7,
    (p43*eventRow (rowMask 0 43) ((d.val : ℤ)-3)*g44) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 44 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev44 : ∀d : Fin 7,
    (p44*eventRow (rowMask 0 44) ((d.val : ℤ)-3)*g45) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 45 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev45 : ∀d : Fin 7,
    (p45*eventRow (rowMask 0 45) ((d.val : ℤ)-3)*g46) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 46 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev46 : ∀d : Fin 7,
    (p46*eventRow (rowMask 0 46) ((d.val : ℤ)-3)*g47) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 47 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev47 : ∀d : Fin 7,
    (p47*eventRow (rowMask 0 47) ((d.val : ℤ)-3)*g48) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 48 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev48 : ∀d : Fin 7,
    (p48*eventRow (rowMask 0 48) ((d.val : ℤ)-3)*g49) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 49 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev49 : ∀d : Fin 7,
    (p49*eventRow (rowMask 0 49) ((d.val : ℤ)-3)*g50) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 50 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev50 : ∀d : Fin 7,
    (p50*eventRow (rowMask 0 50) ((d.val : ℤ)-3)*g51) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 51 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev51 : ∀d : Fin 7,
    (p51*eventRow (rowMask 0 51) ((d.val : ℤ)-3)*g52) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 52 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev52 : ∀d : Fin 7,
    (p52*eventRow (rowMask 0 52) ((d.val : ℤ)-3)*g53) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 53 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev53 : ∀d : Fin 7,
    (p53*eventRow (rowMask 0 53) ((d.val : ℤ)-3)*g54) 0 0=
      (eventCount GridData4_0.f GridData4_0.g 54 d : ℤ) := by
  intro d; fin_cases d <;> decide
def checked : FiniteTransfer7.Checked ⟨0,by decide⟩ where
  pref := fun r => ![p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, p39, p40, p41, p42, p43, p44, p45, p46, p47, p48, p49, p50, p51, p52, p53, p54] r
  suff := fun r => ![g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31, g32, g33, g34, g35, g36, g37, g38, g39, g40, g41, g42, g43, g44, g45, g46, g47, g48, g49, g50, g51, g52, g53, g54, g55] r
  initial := by decide
  terminal := by decide
  forward := by
    intro r
    fin_cases r
    exact fr0
    exact fr1
    exact fr2
    exact fr3
    exact fr4
    exact fr5
    exact fr6
    exact fr7
    exact fr8
    exact fr9
    exact fr10
    exact fr11
    exact fr12
    exact fr13
    exact fr14
    exact fr15
    exact fr16
    exact fr17
    exact fr18
    exact fr19
    exact fr20
    exact fr21
    exact fr22
    exact fr23
    exact fr24
    exact fr25
    exact fr26
    exact fr27
    exact fr28
    exact fr29
    exact fr30
    exact fr31
    exact fr32
    exact fr33
    exact fr34
    exact fr35
    exact fr36
    exact fr37
    exact fr38
    exact fr39
    exact fr40
    exact fr41
    exact fr42
    exact fr43
    exact fr44
    exact fr45
    exact fr46
    exact fr47
    exact fr48
    exact fr49
    exact fr50
    exact fr51
    exact fr52
    exact fr53
  backward := by
    intro r
    fin_cases r
    exact br0
    exact br1
    exact br2
    exact br3
    exact br4
    exact br5
    exact br6
    exact br7
    exact br8
    exact br9
    exact br10
    exact br11
    exact br12
    exact br13
    exact br14
    exact br15
    exact br16
    exact br17
    exact br18
    exact br19
    exact br20
    exact br21
    exact br22
    exact br23
    exact br24
    exact br25
    exact br26
    exact br27
    exact br28
    exact br29
    exact br30
    exact br31
    exact br32
    exact br33
    exact br34
    exact br35
    exact br36
    exact br37
    exact br38
    exact br39
    exact br40
    exact br41
    exact br42
    exact br43
    exact br44
    exact br45
    exact br46
    exact br47
    exact br48
    exact br49
    exact br50
    exact br51
    exact br52
    exact br53
    exact br54
  event := by
    intro r
    fin_cases r
    exact ev0
    exact ev1
    exact ev2
    exact ev3
    exact ev4
    exact ev5
    exact ev6
    exact ev7
    exact ev8
    exact ev9
    exact ev10
    exact ev11
    exact ev12
    exact ev13
    exact ev14
    exact ev15
    exact ev16
    exact ev17
    exact ev18
    exact ev19
    exact ev20
    exact ev21
    exact ev22
    exact ev23
    exact ev24
    exact ev25
    exact ev26
    exact ev27
    exact ev28
    exact ev29
    exact ev30
    exact ev31
    exact ev32
    exact ev33
    exact ev34
    exact ev35
    exact ev36
    exact ev37
    exact ev38
    exact ev39
    exact ev40
    exact ev41
    exact ev42
    exact ev43
    exact ev44
    exact ev45
    exact ev46
    exact ev47
    exact ev48
    exact ev49
    exact ev50
    exact ev51
    exact ev52
    exact ev53
end OneThird.FiniteTransferData7_0
