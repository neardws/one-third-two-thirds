module
public import OneThird.FiniteGrid4
@[expose] public section
namespace OneThird.GridData4_0
open FiniteGrid4
set_option maxHeartbeats 0
set_option maxRecDepth 100000
set_option linter.unusedSimpArgs false
def f : Table 54 := ![![0, 0, 0, 1, 1, 0],
![0, 0, 1, 2, 2, 0],
![0, 1, 3, 5, 5, 0],
![1, 4, 9, 14, 14, 0],
![0, 9, 23, 37, 37, 37],
![9, 32, 69, 106, 143, 0],
![0, 69, 175, 318, 318, 318],
![69, 244, 562, 880, 1198, 0],
![0, 562, 1442, 2640, 2640, 0],
![562, 2004, 4644, 7284, 7284, 0],
![0, 4644, 11928, 19212, 19212, 19212],
![4644, 16572, 35784, 54996, 74208, 0],
![0, 35784, 90780, 164988, 164988, 0],
![35784, 126564, 291552, 456540, 456540, 0],
![0, 291552, 748092, 1204632, 1204632, 1204632],
![291552, 1039644, 2244276, 3448908, 4653540, 0],
![0, 2244276, 5693184, 10346724, 10346724, 0],
![2244276, 7937460, 18284184, 28630908, 28630908, 0],
![0, 18284184, 46915092, 75546000, 75546000, 75546000],
![18284184, 65199276, 140745276, 216291276, 291837276, 0],
![0, 140745276, 357036552, 648873828, 648873828, 0],
![0, 357036552, 1005910380, 1654784208, 1654784208, 0],
![357036552, 1362946932, 3017731140, 4672515348, 4672515348, 0],
![0, 3017731140, 7690246488, 12362761836, 12362761836, 12362761836],
![3017731140, 10707977628, 23070739464, 35433501300, 47796263136, 0],
![0, 23070739464, 58504240764, 106300503900, 106300503900, 0],
![0, 58504240764, 164804744664, 271105248564, 271105248564, 0],
![58504240764, 223308985428, 494414233992, 765519482556, 765519482556, 0],
![0, 494414233992, 1259933716548, 2025453199104, 2025453199104, 0],
![0, 1259933716548, 3285386915652, 5310840114756, 5310840114756, 5310840114756],
![1259933716548, 4545320632200, 9856160746956, 15167000861712, 20477840976468, 0],
![0, 9856160746956, 25023161608668, 45501002585136, 45501002585136, 0],
![0, 25023161608668, 70524164193804, 116025166778940, 116025166778940, 0],
![25023161608668, 95547325802472, 211572492581412, 327597659360352, 327597659360352, 0],
![0, 211572492581412, 539170151941764, 866767811302116, 866767811302116, 866767811302116],
![211572492581412, 750742644523176, 1617510455825292, 2484278267127408, 3351046078429524, 0],
![0, 1617510455825292, 4101788722952700, 7452834801382224, 7452834801382224, 0],
![0, 4101788722952700, 11554623524334924, 19007458325717148, 19007458325717148, 0],
![4101788722952700, 15656412247287624, 34663870573004772, 53671328898721920, 53671328898721920, 53671328898721920],
![0, 34663870573004772, 88335199471726692, 142006528370448612, 195677857269170532, 0],
![34663870573004772, 122999070044731464, 265005598415180076, 460683455684350608, 460683455684350608, 0],
![0, 265005598415180076, 725689054099530684, 1186372509783881292, 1186372509783881292, 0],
![265005598415180076, 990694652514710760, 2177067162298592052, 3363439672082473344, 3363439672082473344, 3363439672082473344],
![0, 2177067162298592052, 5540506834381065396, 8903946506463538740, 12267386178546012084, 0],
![2177067162298592052, 7717573996679657448, 16621520503143196188, 28888906681689208272, 28888906681689208272, 0],
![0, 16621520503143196188, 45510427184832404460, 74399333866521612732, 74399333866521612732, 0],
![16621520503143196188, 62131947687975600648, 136531281554497213380, 210930615421018826112, 210930615421018826112, 210930615421018826112],
![0, 136531281554497213380, 347461896975516039492, 558392512396534865604, 769323127817553691716, 0],
![136531281554497213380, 483993178530013252872, 1042385690926548118476, 1811708818744101810192, 1811708818744101810192, 1811708818744101810192],
![0, 1042385690926548118476, 2854094509670649928668, 4665803328414751738860, 6477512147158853549052, 0],
![1042385690926548118476, 3896480200597198047144, 8562283529011949786004, 15039795676170803335056, 15039795676170803335056, 0],
![0, 8562283529011949786004, 23602079205182753121060, 38641874881353556456116, 38641874881353556456116, 0],
![8562283529011949786004, 32164362734194702907064, 70806237615548259363180, 109448112496901815819296, 109448112496901815819296, 0],
![0, 70806237615548259363180, 180254350112450075182476, 289702462609351891001772, 289702462609351891001772, 0],
![70806237615548259363180, 251060587727998334545656, 540763050337350225547428, 830465512946702116549200, 0, 0]]
def g : Table 54 := ![![0, 0, 0, 830465512946702116549200, 289702462609351891001772, 0],
![0, 0, 540763050337350225547428, 289702462609351891001772, 109448112496901815819296, 0],
![0, 251060587727998334545656, 180254350112450075182476, 109448112496901815819296, 38641874881353556456116, 0],
![70806237615548259363180, 70806237615548259363180, 70806237615548259363180, 38641874881353556456116, 15039795676170803335056, 0],
![0, 32164362734194702907064, 23602079205182753121060, 15039795676170803335056, 6477512147158853549052, 1811708818744101810192],
![8562283529011949786004, 8562283529011949786004, 8562283529011949786004, 4665803328414751738860, 1811708818744101810192, 0],
![0, 3896480200597198047144, 2854094509670649928668, 1811708818744101810192, 769323127817553691716, 210930615421018826112],
![1042385690926548118476, 1042385690926548118476, 1042385690926548118476, 558392512396534865604, 210930615421018826112, 0],
![0, 483993178530013252872, 347461896975516039492, 210930615421018826112, 74399333866521612732, 0],
![136531281554497213380, 136531281554497213380, 136531281554497213380, 74399333866521612732, 28888906681689208272, 0],
![0, 62131947687975600648, 45510427184832404460, 28888906681689208272, 12267386178546012084, 3363439672082473344],
![16621520503143196188, 16621520503143196188, 16621520503143196188, 8903946506463538740, 3363439672082473344, 0],
![0, 7717573996679657448, 5540506834381065396, 3363439672082473344, 1186372509783881292, 0],
![2177067162298592052, 2177067162298592052, 2177067162298592052, 1186372509783881292, 460683455684350608, 0],
![0, 990694652514710760, 725689054099530684, 460683455684350608, 195677857269170532, 53671328898721920],
![265005598415180076, 265005598415180076, 265005598415180076, 142006528370448612, 53671328898721920, 0],
![0, 122999070044731464, 88335199471726692, 53671328898721920, 19007458325717148, 0],
![34663870573004772, 34663870573004772, 34663870573004772, 19007458325717148, 7452834801382224, 0],
![0, 15656412247287624, 11554623524334924, 7452834801382224, 3351046078429524, 866767811302116],
![4101788722952700, 4101788722952700, 4101788722952700, 2484278267127408, 866767811302116, 0],
![0, 1617510455825292, 1617510455825292, 866767811302116, 327597659360352, 0],
![0, 750742644523176, 539170151941764, 327597659360352, 116025166778940, 0],
![211572492581412, 211572492581412, 211572492581412, 116025166778940, 45501002585136, 0],
![0, 95547325802472, 70524164193804, 45501002585136, 20477840976468, 5310840114756],
![25023161608668, 25023161608668, 25023161608668, 15167000861712, 5310840114756, 0],
![0, 9856160746956, 9856160746956, 5310840114756, 2025453199104, 0],
![0, 4545320632200, 3285386915652, 2025453199104, 765519482556, 0],
![1259933716548, 1259933716548, 1259933716548, 765519482556, 271105248564, 0],
![0, 494414233992, 494414233992, 271105248564, 106300503900, 0],
![0, 223308985428, 164804744664, 106300503900, 47796263136, 12362761836],
![58504240764, 58504240764, 58504240764, 35433501300, 12362761836, 0],
![0, 23070739464, 23070739464, 12362761836, 4672515348, 0],
![0, 10707977628, 7690246488, 4672515348, 1654784208, 0],
![3017731140, 3017731140, 3017731140, 1654784208, 648873828, 0],
![0, 1362946932, 1005910380, 648873828, 291837276, 75546000],
![357036552, 357036552, 357036552, 216291276, 75546000, 0],
![0, 140745276, 140745276, 75546000, 28630908, 0],
![0, 65199276, 46915092, 28630908, 10346724, 0],
![18284184, 18284184, 18284184, 10346724, 4653540, 1204632],
![0, 7937460, 5693184, 3448908, 1204632, 0],
![2244276, 2244276, 2244276, 1204632, 456540, 0],
![0, 1039644, 748092, 456540, 164988, 0],
![291552, 291552, 291552, 164988, 74208, 19212],
![0, 126564, 90780, 54996, 19212, 0],
![35784, 35784, 35784, 19212, 7284, 0],
![0, 16572, 11928, 7284, 2640, 0],
![4644, 4644, 4644, 2640, 1198, 318],
![0, 2004, 1442, 880, 318, 0],
![562, 562, 562, 318, 143, 37],
![0, 244, 175, 106, 37, 0],
![69, 69, 69, 37, 14, 0],
![0, 32, 23, 14, 5, 0],
![9, 9, 9, 5, 2, 0],
![0, 4, 3, 2, 1, 0],
![1, 1, 1, 1, 0, 0]]
theorem fr0 : forwardRow 0 f ⟨0,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br0 : backwardRow 0 g ⟨0,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr1 : forwardRow 0 f ⟨1,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br1 : backwardRow 0 g ⟨1,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr2 : forwardRow 0 f ⟨2,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br2 : backwardRow 0 g ⟨2,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr3 : forwardRow 0 f ⟨3,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br3 : backwardRow 0 g ⟨3,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr4 : forwardRow 0 f ⟨4,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br4 : backwardRow 0 g ⟨4,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr5 : forwardRow 0 f ⟨5,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br5 : backwardRow 0 g ⟨5,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr6 : forwardRow 0 f ⟨6,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br6 : backwardRow 0 g ⟨6,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr7 : forwardRow 0 f ⟨7,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br7 : backwardRow 0 g ⟨7,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr8 : forwardRow 0 f ⟨8,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br8 : backwardRow 0 g ⟨8,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr9 : forwardRow 0 f ⟨9,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br9 : backwardRow 0 g ⟨9,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr10 : forwardRow 0 f ⟨10,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br10 : backwardRow 0 g ⟨10,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr11 : forwardRow 0 f ⟨11,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br11 : backwardRow 0 g ⟨11,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr12 : forwardRow 0 f ⟨12,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br12 : backwardRow 0 g ⟨12,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr13 : forwardRow 0 f ⟨13,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br13 : backwardRow 0 g ⟨13,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr14 : forwardRow 0 f ⟨14,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br14 : backwardRow 0 g ⟨14,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr15 : forwardRow 0 f ⟨15,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br15 : backwardRow 0 g ⟨15,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr16 : forwardRow 0 f ⟨16,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br16 : backwardRow 0 g ⟨16,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr17 : forwardRow 0 f ⟨17,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br17 : backwardRow 0 g ⟨17,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr18 : forwardRow 0 f ⟨18,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br18 : backwardRow 0 g ⟨18,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr19 : forwardRow 0 f ⟨19,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br19 : backwardRow 0 g ⟨19,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr20 : forwardRow 0 f ⟨20,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br20 : backwardRow 0 g ⟨20,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr21 : forwardRow 0 f ⟨21,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br21 : backwardRow 0 g ⟨21,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr22 : forwardRow 0 f ⟨22,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br22 : backwardRow 0 g ⟨22,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr23 : forwardRow 0 f ⟨23,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br23 : backwardRow 0 g ⟨23,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr24 : forwardRow 0 f ⟨24,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br24 : backwardRow 0 g ⟨24,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr25 : forwardRow 0 f ⟨25,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br25 : backwardRow 0 g ⟨25,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr26 : forwardRow 0 f ⟨26,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br26 : backwardRow 0 g ⟨26,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr27 : forwardRow 0 f ⟨27,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br27 : backwardRow 0 g ⟨27,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr28 : forwardRow 0 f ⟨28,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br28 : backwardRow 0 g ⟨28,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr29 : forwardRow 0 f ⟨29,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br29 : backwardRow 0 g ⟨29,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr30 : forwardRow 0 f ⟨30,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br30 : backwardRow 0 g ⟨30,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr31 : forwardRow 0 f ⟨31,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br31 : backwardRow 0 g ⟨31,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr32 : forwardRow 0 f ⟨32,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br32 : backwardRow 0 g ⟨32,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr33 : forwardRow 0 f ⟨33,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br33 : backwardRow 0 g ⟨33,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr34 : forwardRow 0 f ⟨34,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br34 : backwardRow 0 g ⟨34,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr35 : forwardRow 0 f ⟨35,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br35 : backwardRow 0 g ⟨35,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr36 : forwardRow 0 f ⟨36,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br36 : backwardRow 0 g ⟨36,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr37 : forwardRow 0 f ⟨37,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br37 : backwardRow 0 g ⟨37,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr38 : forwardRow 0 f ⟨38,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br38 : backwardRow 0 g ⟨38,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr39 : forwardRow 0 f ⟨39,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br39 : backwardRow 0 g ⟨39,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr40 : forwardRow 0 f ⟨40,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br40 : backwardRow 0 g ⟨40,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr41 : forwardRow 0 f ⟨41,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br41 : backwardRow 0 g ⟨41,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr42 : forwardRow 0 f ⟨42,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br42 : backwardRow 0 g ⟨42,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr43 : forwardRow 0 f ⟨43,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br43 : backwardRow 0 g ⟨43,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr44 : forwardRow 0 f ⟨44,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br44 : backwardRow 0 g ⟨44,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr45 : forwardRow 0 f ⟨45,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br45 : backwardRow 0 g ⟨45,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr46 : forwardRow 0 f ⟨46,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br46 : backwardRow 0 g ⟨46,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr47 : forwardRow 0 f ⟨47,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br47 : backwardRow 0 g ⟨47,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr48 : forwardRow 0 f ⟨48,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br48 : backwardRow 0 g ⟨48,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr49 : forwardRow 0 f ⟨49,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br49 : backwardRow 0 g ⟨49,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr50 : forwardRow 0 f ⟨50,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br50 : backwardRow 0 g ⟨50,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr51 : forwardRow 0 f ⟨51,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br51 : backwardRow 0 g ⟨51,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr52 : forwardRow 0 f ⟨52,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br52 : backwardRow 0 g ⟨52,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr53 : forwardRow 0 f ⟨53,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br53 : backwardRow 0 g ⟨53,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr54 : forwardRow 0 f ⟨54,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br54 : backwardRow 0 g ⟨54,by decide⟩  := by intro j; fin_cases j <;> decide
theorem pr1 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 1 d := by intro d; fin_cases d <;> decide
theorem pr2 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 2 d := by intro d; fin_cases d <;> decide
theorem pr3 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 3 d := by intro d; fin_cases d <;> decide
theorem pr4 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 4 d := by intro d; fin_cases d <;> decide
theorem pr5 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 5 d := by intro d; fin_cases d <;> decide
theorem pr6 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 6 d := by intro d; fin_cases d <;> decide
theorem pr7 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 7 d := by intro d; fin_cases d <;> decide
theorem pr8 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 8 d := by intro d; fin_cases d <;> decide
theorem pr9 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 9 d := by intro d; fin_cases d <;> decide
theorem pr10 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 10 d := by intro d; fin_cases d <;> decide
theorem pr11 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 11 d := by intro d; fin_cases d <;> decide
theorem pr12 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 12 d := by intro d; fin_cases d <;> decide
theorem pr13 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 13 d := by intro d; fin_cases d <;> decide
theorem pr14 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 14 d := by intro d; fin_cases d <;> decide
theorem pr15 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 15 d := by intro d; fin_cases d <;> decide
theorem pr16 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 16 d := by intro d; fin_cases d <;> decide
theorem pr17 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 17 d := by intro d; fin_cases d <;> decide
theorem pr18 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 18 d := by intro d; fin_cases d <;> decide
theorem pr19 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 19 d := by intro d; fin_cases d <;> decide
theorem pr20 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 20 d := by intro d; fin_cases d <;> decide
theorem pr21 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 21 d := by intro d; fin_cases d <;> decide
theorem pr22 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 22 d := by intro d; fin_cases d <;> decide
theorem pr23 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 23 d := by intro d; fin_cases d <;> decide
theorem pr24 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 24 d := by intro d; fin_cases d <;> decide
theorem pr25 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 25 d := by intro d; fin_cases d <;> decide
theorem pr26 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 26 d := by intro d; fin_cases d <;> decide
theorem pr27 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 27 d := by intro d; fin_cases d <;> decide
theorem pr28 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 28 d := by intro d; fin_cases d <;> decide
theorem pr29 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 29 d := by intro d; fin_cases d <;> decide
theorem pr30 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 30 d := by intro d; fin_cases d <;> decide
theorem pr31 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 31 d := by intro d; fin_cases d <;> decide
theorem pr32 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 32 d := by intro d; fin_cases d <;> decide
theorem pr33 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 33 d := by intro d; fin_cases d <;> decide
theorem pr34 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 34 d := by intro d; fin_cases d <;> decide
theorem pr35 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 35 d := by intro d; fin_cases d <;> decide
theorem pr36 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 36 d := by intro d; fin_cases d <;> decide
theorem pr37 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 37 d := by intro d; fin_cases d <;> decide
theorem pr38 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 38 d := by intro d; fin_cases d <;> decide
theorem pr39 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 39 d := by intro d; fin_cases d <;> decide
theorem pr40 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 40 d := by intro d; fin_cases d <;> decide
theorem pr41 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 41 d := by intro d; fin_cases d <;> decide
theorem pr42 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 42 d := by intro d; fin_cases d <;> decide
theorem pr43 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 43 d := by intro d; fin_cases d <;> decide
theorem pr44 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 44 d := by intro d; fin_cases d <;> decide
theorem pr45 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 45 d := by intro d; fin_cases d <;> decide
theorem pr46 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 46 d := by intro d; fin_cases d <;> decide
theorem pr47 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 47 d := by intro d; fin_cases d <;> decide
theorem pr48 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 48 d := by intro d; fin_cases d <;> decide
theorem pr49 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 49 d := by intro d; fin_cases d <;> decide
theorem pr50 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 50 d := by intro d; fin_cases d <;> decide
theorem pr51 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 51 d := by intro d; fin_cases d <;> decide
theorem pr52 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 52 d := by intro d; fin_cases d <;> decide
theorem pr53 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 53 d := by intro d; fin_cases d <;> decide
theorem pr54 : ∀d : Fin 7, pairCheck f g 830465512946702116549200 289702462609351891001772 54 d := by intro d; fin_cases d <;> decide
def checked : Checked 0 where
  f := f
  g := g
  E := 830465512946702116549200
  N := 289702462609351891001772
  total := by decide
  minority := by decide
  positive := by decide
  forward := by
    intro i
    fin_cases i
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
    exact fr54
  backward := by
    intro i
    fin_cases i
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
  pairs := by
    intro i
    fin_cases i
    exact pr1
    exact pr2
    exact pr3
    exact pr4
    exact pr5
    exact pr6
    exact pr7
    exact pr8
    exact pr9
    exact pr10
    exact pr11
    exact pr12
    exact pr13
    exact pr14
    exact pr15
    exact pr16
    exact pr17
    exact pr18
    exact pr19
    exact pr20
    exact pr21
    exact pr22
    exact pr23
    exact pr24
    exact pr25
    exact pr26
    exact pr27
    exact pr28
    exact pr29
    exact pr30
    exact pr31
    exact pr32
    exact pr33
    exact pr34
    exact pr35
    exact pr36
    exact pr37
    exact pr38
    exact pr39
    exact pr40
    exact pr41
    exact pr42
    exact pr43
    exact pr44
    exact pr45
    exact pr46
    exact pr47
    exact pr48
    exact pr49
    exact pr50
    exact pr51
    exact pr52
    exact pr53
    exact pr54
end OneThird.GridData4_0
