module
public import OneThird.FiniteGrid4
@[expose] public section
namespace OneThird.GridData4_1
open FiniteGrid4
set_option maxHeartbeats 0
set_option maxRecDepth 100000
set_option linter.unusedSimpArgs false
def f : Table 64 := ![![0, 0, 0, 1, 1, 0],
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
![0, 494414233992, 1259933716548, 2025453199104, 2025453199104, 2025453199104],
![494414233992, 1754347950540, 3779801149644, 5805254348748, 7830707547852, 0],
![0, 3779801149644, 9585055498392, 17415763046244, 17415763046244, 0],
![0, 9585055498392, 27000818544636, 44416581590880, 44416581590880, 0],
![9585055498392, 36585874043028, 81002455633908, 125419037224788, 125419037224788, 0],
![0, 81002455633908, 206421492858696, 331840530083484, 331840530083484, 0],
![0, 206421492858696, 538262022942180, 870102553025664, 870102553025664, 870102553025664],
![206421492858696, 744683515800876, 1614786068826540, 2484888621852204, 3354991174877868, 0],
![0, 1614786068826540, 4099674690678744, 7454665865556612, 7454665865556612, 0],
![0, 4099674690678744, 11554340556235356, 19009006421791968, 19009006421791968, 0],
![4099674690678744, 15654015246914100, 34663021668706068, 53672028090498036, 53672028090498036, 0],
![0, 34663021668706068, 88335049759204104, 142007077849702140, 142007077849702140, 142007077849702140],
![34663021668706068, 122998071427910172, 265005149277612312, 407012227127314452, 549019304977016592, 0],
![0, 265005149277612312, 672017376404926764, 1221036681381943356, 1221036681381943356, 0],
![0, 672017376404926764, 1893054057786870120, 3114090739168813476, 3114090739168813476, 0],
![672017376404926764, 2565071434191796884, 5679162173360610360, 8793252912529423836, 8793252912529423836, 0],
![0, 5679162173360610360, 14472415085890034196, 23265667998419458032, 23265667998419458032, 23265667998419458032],
![5679162173360610360, 20151577259250644556, 43417245257670102588, 66682913256089560620, 89948581254509018652, 0],
![0, 43417245257670102588, 110100158513759663208, 200048739768268681860, 200048739768268681860, 0],
![0, 110100158513759663208, 310148898282028345068, 510197638050297026928, 510197638050297026928, 0],
![110100158513759663208, 420249056795788008276, 930446694846085035204, 1440644332896382062132, 1440644332896382062132, 1440644332896382062132],
![0, 930446694846085035204, 2371091027742467097336, 3811735360638849159468, 5252379693535231221600, 0],
![930446694846085035204, 3301537722588552132540, 7113273083227401292008, 12365652776762632513608, 12365652776762632513608, 0],
![0, 7113273083227401292008, 19478925859990033805616, 31844578636752666319224, 31844578636752666319224, 0],
![7113273083227401292008, 26592198943217435097624, 58436777579970101416848, 90281356216722767736072, 90281356216722767736072, 90281356216722767736072],
![0, 58436777579970101416848, 148718133796692869152920, 238999490013415636888992, 329280846230138404625064, 0],
![58436777579970101416848, 207154911376662970569768, 446154401390078607458760, 775435247620217012083824, 775435247620217012083824, 0],
![0, 446154401390078607458760, 1221589649010295619542584, 1997024896630512631626408, 1997024896630512631626408, 0],
![446154401390078607458760, 1667744050400374227001344, 3664768947030886858627752, 5661793843661399490254160, 5661793843661399490254160, 5661793843661399490254160],
![0, 3664768947030886858627752, 9326562790692286348881912, 14988356634353685839136072, 20650150478015085329390232, 0],
![3664768947030886858627752, 12991331737723173207509664, 27979688372076859046645736, 48629838850091944376035968, 48629838850091944376035968, 48629838850091944376035968],
![0, 27979688372076859046645736, 76609527222168803422681704, 125239366072260747798717672, 173869204922352692174753640, 0],
![27979688372076859046645736, 104589215594245662469327440, 229828581666506410268045112, 403697786588859102442798752, 403697786588859102442798752, 0],
![0, 229828581666506410268045112, 633526368255365512710843864, 1037224154844224615153642616, 1037224154844224615153642616, 0],
![229828581666506410268045112, 863354949921871922978888976, 1900579104766096538132531592, 2937803259610321153286174208, 2937803259610321153286174208, 0],
![0, 1900579104766096538132531592, 4838382364376417691418705800, 7776185623986738844704880008, 7776185623986738844704880008, 0],
![1900579104766096538132531592, 6738961469142514229551237392, 14515147093129253074256117400, 22291332717115991918960997408, 0, 0]]
def g : Table 64 := ![![0, 0, 0, 22291332717115991918960997408, 7776185623986738844704880008, 0],
![0, 0, 14515147093129253074256117400, 7776185623986738844704880008, 2937803259610321153286174208, 0],
![0, 6738961469142514229551237392, 4838382364376417691418705800, 2937803259610321153286174208, 1037224154844224615153642616, 0],
![1900579104766096538132531592, 1900579104766096538132531592, 1900579104766096538132531592, 1037224154844224615153642616, 403697786588859102442798752, 0],
![0, 863354949921871922978888976, 633526368255365512710843864, 403697786588859102442798752, 173869204922352692174753640, 48629838850091944376035968],
![229828581666506410268045112, 229828581666506410268045112, 229828581666506410268045112, 125239366072260747798717672, 48629838850091944376035968, 0],
![0, 104589215594245662469327440, 76609527222168803422681704, 48629838850091944376035968, 20650150478015085329390232, 5661793843661399490254160],
![27979688372076859046645736, 27979688372076859046645736, 27979688372076859046645736, 14988356634353685839136072, 5661793843661399490254160, 0],
![0, 12991331737723173207509664, 9326562790692286348881912, 5661793843661399490254160, 1997024896630512631626408, 0],
![3664768947030886858627752, 3664768947030886858627752, 3664768947030886858627752, 1997024896630512631626408, 775435247620217012083824, 0],
![0, 1667744050400374227001344, 1221589649010295619542584, 775435247620217012083824, 329280846230138404625064, 90281356216722767736072],
![446154401390078607458760, 446154401390078607458760, 446154401390078607458760, 238999490013415636888992, 90281356216722767736072, 0],
![0, 207154911376662970569768, 148718133796692869152920, 90281356216722767736072, 31844578636752666319224, 0],
![58436777579970101416848, 58436777579970101416848, 58436777579970101416848, 31844578636752666319224, 12365652776762632513608, 0],
![0, 26592198943217435097624, 19478925859990033805616, 12365652776762632513608, 5252379693535231221600, 1440644332896382062132],
![7113273083227401292008, 7113273083227401292008, 7113273083227401292008, 3811735360638849159468, 1440644332896382062132, 0],
![0, 3301537722588552132540, 2371091027742467097336, 1440644332896382062132, 510197638050297026928, 0],
![930446694846085035204, 930446694846085035204, 930446694846085035204, 510197638050297026928, 200048739768268681860, 0],
![0, 420249056795788008276, 310148898282028345068, 200048739768268681860, 89948581254509018652, 23265667998419458032],
![110100158513759663208, 110100158513759663208, 110100158513759663208, 66682913256089560620, 23265667998419458032, 0],
![0, 43417245257670102588, 43417245257670102588, 23265667998419458032, 8793252912529423836, 0],
![0, 20151577259250644556, 14472415085890034196, 8793252912529423836, 3114090739168813476, 0],
![5679162173360610360, 5679162173360610360, 5679162173360610360, 3114090739168813476, 1221036681381943356, 0],
![0, 2565071434191796884, 1893054057786870120, 1221036681381943356, 549019304977016592, 142007077849702140],
![672017376404926764, 672017376404926764, 672017376404926764, 407012227127314452, 142007077849702140, 0],
![0, 265005149277612312, 265005149277612312, 142007077849702140, 53672028090498036, 0],
![0, 122998071427910172, 88335049759204104, 53672028090498036, 19009006421791968, 0],
![34663021668706068, 34663021668706068, 34663021668706068, 19009006421791968, 7454665865556612, 0],
![0, 15654015246914100, 11554340556235356, 7454665865556612, 3354991174877868, 870102553025664],
![4099674690678744, 4099674690678744, 4099674690678744, 2484888621852204, 870102553025664, 0],
![0, 1614786068826540, 1614786068826540, 870102553025664, 331840530083484, 0],
![0, 744683515800876, 538262022942180, 331840530083484, 125419037224788, 0],
![206421492858696, 206421492858696, 206421492858696, 125419037224788, 44416581590880, 0],
![0, 81002455633908, 81002455633908, 44416581590880, 17415763046244, 0],
![0, 36585874043028, 27000818544636, 17415763046244, 7830707547852, 2025453199104],
![9585055498392, 9585055498392, 9585055498392, 5805254348748, 2025453199104, 0],
![0, 3779801149644, 3779801149644, 2025453199104, 765519482556, 0],
![0, 1754347950540, 1259933716548, 765519482556, 271105248564, 0],
![494414233992, 494414233992, 494414233992, 271105248564, 106300503900, 0],
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
theorem fr0 : forwardRow 1 f ⟨0,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br0 : backwardRow 1 g ⟨0,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr1 : forwardRow 1 f ⟨1,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br1 : backwardRow 1 g ⟨1,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr2 : forwardRow 1 f ⟨2,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br2 : backwardRow 1 g ⟨2,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr3 : forwardRow 1 f ⟨3,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br3 : backwardRow 1 g ⟨3,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr4 : forwardRow 1 f ⟨4,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br4 : backwardRow 1 g ⟨4,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr5 : forwardRow 1 f ⟨5,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br5 : backwardRow 1 g ⟨5,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr6 : forwardRow 1 f ⟨6,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br6 : backwardRow 1 g ⟨6,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr7 : forwardRow 1 f ⟨7,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br7 : backwardRow 1 g ⟨7,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr8 : forwardRow 1 f ⟨8,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br8 : backwardRow 1 g ⟨8,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr9 : forwardRow 1 f ⟨9,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br9 : backwardRow 1 g ⟨9,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr10 : forwardRow 1 f ⟨10,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br10 : backwardRow 1 g ⟨10,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr11 : forwardRow 1 f ⟨11,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br11 : backwardRow 1 g ⟨11,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr12 : forwardRow 1 f ⟨12,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br12 : backwardRow 1 g ⟨12,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr13 : forwardRow 1 f ⟨13,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br13 : backwardRow 1 g ⟨13,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr14 : forwardRow 1 f ⟨14,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br14 : backwardRow 1 g ⟨14,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr15 : forwardRow 1 f ⟨15,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br15 : backwardRow 1 g ⟨15,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr16 : forwardRow 1 f ⟨16,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br16 : backwardRow 1 g ⟨16,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr17 : forwardRow 1 f ⟨17,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br17 : backwardRow 1 g ⟨17,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr18 : forwardRow 1 f ⟨18,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br18 : backwardRow 1 g ⟨18,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr19 : forwardRow 1 f ⟨19,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br19 : backwardRow 1 g ⟨19,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr20 : forwardRow 1 f ⟨20,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br20 : backwardRow 1 g ⟨20,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr21 : forwardRow 1 f ⟨21,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br21 : backwardRow 1 g ⟨21,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr22 : forwardRow 1 f ⟨22,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br22 : backwardRow 1 g ⟨22,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr23 : forwardRow 1 f ⟨23,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br23 : backwardRow 1 g ⟨23,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr24 : forwardRow 1 f ⟨24,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br24 : backwardRow 1 g ⟨24,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr25 : forwardRow 1 f ⟨25,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br25 : backwardRow 1 g ⟨25,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr26 : forwardRow 1 f ⟨26,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br26 : backwardRow 1 g ⟨26,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr27 : forwardRow 1 f ⟨27,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br27 : backwardRow 1 g ⟨27,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr28 : forwardRow 1 f ⟨28,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br28 : backwardRow 1 g ⟨28,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr29 : forwardRow 1 f ⟨29,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br29 : backwardRow 1 g ⟨29,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr30 : forwardRow 1 f ⟨30,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br30 : backwardRow 1 g ⟨30,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr31 : forwardRow 1 f ⟨31,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br31 : backwardRow 1 g ⟨31,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr32 : forwardRow 1 f ⟨32,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br32 : backwardRow 1 g ⟨32,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr33 : forwardRow 1 f ⟨33,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br33 : backwardRow 1 g ⟨33,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr34 : forwardRow 1 f ⟨34,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br34 : backwardRow 1 g ⟨34,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr35 : forwardRow 1 f ⟨35,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br35 : backwardRow 1 g ⟨35,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr36 : forwardRow 1 f ⟨36,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br36 : backwardRow 1 g ⟨36,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr37 : forwardRow 1 f ⟨37,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br37 : backwardRow 1 g ⟨37,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr38 : forwardRow 1 f ⟨38,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br38 : backwardRow 1 g ⟨38,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr39 : forwardRow 1 f ⟨39,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br39 : backwardRow 1 g ⟨39,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr40 : forwardRow 1 f ⟨40,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br40 : backwardRow 1 g ⟨40,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr41 : forwardRow 1 f ⟨41,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br41 : backwardRow 1 g ⟨41,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr42 : forwardRow 1 f ⟨42,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br42 : backwardRow 1 g ⟨42,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr43 : forwardRow 1 f ⟨43,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br43 : backwardRow 1 g ⟨43,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr44 : forwardRow 1 f ⟨44,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br44 : backwardRow 1 g ⟨44,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr45 : forwardRow 1 f ⟨45,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br45 : backwardRow 1 g ⟨45,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr46 : forwardRow 1 f ⟨46,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br46 : backwardRow 1 g ⟨46,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr47 : forwardRow 1 f ⟨47,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br47 : backwardRow 1 g ⟨47,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr48 : forwardRow 1 f ⟨48,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br48 : backwardRow 1 g ⟨48,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr49 : forwardRow 1 f ⟨49,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br49 : backwardRow 1 g ⟨49,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr50 : forwardRow 1 f ⟨50,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br50 : backwardRow 1 g ⟨50,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr51 : forwardRow 1 f ⟨51,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br51 : backwardRow 1 g ⟨51,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr52 : forwardRow 1 f ⟨52,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br52 : backwardRow 1 g ⟨52,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr53 : forwardRow 1 f ⟨53,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br53 : backwardRow 1 g ⟨53,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr54 : forwardRow 1 f ⟨54,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br54 : backwardRow 1 g ⟨54,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr55 : forwardRow 1 f ⟨55,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br55 : backwardRow 1 g ⟨55,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr56 : forwardRow 1 f ⟨56,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br56 : backwardRow 1 g ⟨56,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr57 : forwardRow 1 f ⟨57,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br57 : backwardRow 1 g ⟨57,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr58 : forwardRow 1 f ⟨58,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br58 : backwardRow 1 g ⟨58,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr59 : forwardRow 1 f ⟨59,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br59 : backwardRow 1 g ⟨59,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr60 : forwardRow 1 f ⟨60,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br60 : backwardRow 1 g ⟨60,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr61 : forwardRow 1 f ⟨61,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br61 : backwardRow 1 g ⟨61,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr62 : forwardRow 1 f ⟨62,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br62 : backwardRow 1 g ⟨62,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr63 : forwardRow 1 f ⟨63,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br63 : backwardRow 1 g ⟨63,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr64 : forwardRow 1 f ⟨64,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br64 : backwardRow 1 g ⟨64,by decide⟩  := by intro j; fin_cases j <;> decide
theorem pr1 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 1 d := by intro d; fin_cases d <;> decide
theorem pr2 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 2 d := by intro d; fin_cases d <;> decide
theorem pr3 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 3 d := by intro d; fin_cases d <;> decide
theorem pr4 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 4 d := by intro d; fin_cases d <;> decide
theorem pr5 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 5 d := by intro d; fin_cases d <;> decide
theorem pr6 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 6 d := by intro d; fin_cases d <;> decide
theorem pr7 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 7 d := by intro d; fin_cases d <;> decide
theorem pr8 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 8 d := by intro d; fin_cases d <;> decide
theorem pr9 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 9 d := by intro d; fin_cases d <;> decide
theorem pr10 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 10 d := by intro d; fin_cases d <;> decide
theorem pr11 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 11 d := by intro d; fin_cases d <;> decide
theorem pr12 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 12 d := by intro d; fin_cases d <;> decide
theorem pr13 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 13 d := by intro d; fin_cases d <;> decide
theorem pr14 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 14 d := by intro d; fin_cases d <;> decide
theorem pr15 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 15 d := by intro d; fin_cases d <;> decide
theorem pr16 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 16 d := by intro d; fin_cases d <;> decide
theorem pr17 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 17 d := by intro d; fin_cases d <;> decide
theorem pr18 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 18 d := by intro d; fin_cases d <;> decide
theorem pr19 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 19 d := by intro d; fin_cases d <;> decide
theorem pr20 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 20 d := by intro d; fin_cases d <;> decide
theorem pr21 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 21 d := by intro d; fin_cases d <;> decide
theorem pr22 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 22 d := by intro d; fin_cases d <;> decide
theorem pr23 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 23 d := by intro d; fin_cases d <;> decide
theorem pr24 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 24 d := by intro d; fin_cases d <;> decide
theorem pr25 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 25 d := by intro d; fin_cases d <;> decide
theorem pr26 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 26 d := by intro d; fin_cases d <;> decide
theorem pr27 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 27 d := by intro d; fin_cases d <;> decide
theorem pr28 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 28 d := by intro d; fin_cases d <;> decide
theorem pr29 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 29 d := by intro d; fin_cases d <;> decide
theorem pr30 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 30 d := by intro d; fin_cases d <;> decide
theorem pr31 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 31 d := by intro d; fin_cases d <;> decide
theorem pr32 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 32 d := by intro d; fin_cases d <;> decide
theorem pr33 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 33 d := by intro d; fin_cases d <;> decide
theorem pr34 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 34 d := by intro d; fin_cases d <;> decide
theorem pr35 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 35 d := by intro d; fin_cases d <;> decide
theorem pr36 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 36 d := by intro d; fin_cases d <;> decide
theorem pr37 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 37 d := by intro d; fin_cases d <;> decide
theorem pr38 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 38 d := by intro d; fin_cases d <;> decide
theorem pr39 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 39 d := by intro d; fin_cases d <;> decide
theorem pr40 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 40 d := by intro d; fin_cases d <;> decide
theorem pr41 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 41 d := by intro d; fin_cases d <;> decide
theorem pr42 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 42 d := by intro d; fin_cases d <;> decide
theorem pr43 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 43 d := by intro d; fin_cases d <;> decide
theorem pr44 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 44 d := by intro d; fin_cases d <;> decide
theorem pr45 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 45 d := by intro d; fin_cases d <;> decide
theorem pr46 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 46 d := by intro d; fin_cases d <;> decide
theorem pr47 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 47 d := by intro d; fin_cases d <;> decide
theorem pr48 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 48 d := by intro d; fin_cases d <;> decide
theorem pr49 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 49 d := by intro d; fin_cases d <;> decide
theorem pr50 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 50 d := by intro d; fin_cases d <;> decide
theorem pr51 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 51 d := by intro d; fin_cases d <;> decide
theorem pr52 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 52 d := by intro d; fin_cases d <;> decide
theorem pr53 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 53 d := by intro d; fin_cases d <;> decide
theorem pr54 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 54 d := by intro d; fin_cases d <;> decide
theorem pr55 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 55 d := by intro d; fin_cases d <;> decide
theorem pr56 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 56 d := by intro d; fin_cases d <;> decide
theorem pr57 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 57 d := by intro d; fin_cases d <;> decide
theorem pr58 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 58 d := by intro d; fin_cases d <;> decide
theorem pr59 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 59 d := by intro d; fin_cases d <;> decide
theorem pr60 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 60 d := by intro d; fin_cases d <;> decide
theorem pr61 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 61 d := by intro d; fin_cases d <;> decide
theorem pr62 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 62 d := by intro d; fin_cases d <;> decide
theorem pr63 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 63 d := by intro d; fin_cases d <;> decide
theorem pr64 : ∀d : Fin 7, pairCheck f g 22291332717115991918960997408 7776185623986738844704880008 64 d := by intro d; fin_cases d <;> decide
def checked : Checked 1 where
  f := f
  g := g
  E := 22291332717115991918960997408
  N := 7776185623986738844704880008
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
    exact fr55
    exact fr56
    exact fr57
    exact fr58
    exact fr59
    exact fr60
    exact fr61
    exact fr62
    exact fr63
    exact fr64
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
    exact br55
    exact br56
    exact br57
    exact br58
    exact br59
    exact br60
    exact br61
    exact br62
    exact br63
    exact br64
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
    exact pr55
    exact pr56
    exact pr57
    exact pr58
    exact pr59
    exact pr60
    exact pr61
    exact pr62
    exact pr63
    exact pr64
end OneThird.GridData4_1
