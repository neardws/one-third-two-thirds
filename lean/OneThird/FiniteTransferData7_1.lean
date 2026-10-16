module
public import OneThird.FiniteTransfer7
@[expose] public section
namespace OneThird.FiniteTransferData7_1
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
def p29 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![494414233992, 1259933716548, 2025453199104, 2025453199104, 2025453199104, 0]
def p30 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1754347950540, 3779801149644, 5805254348748, 7830707547852, 0, 0]
def p31 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![3779801149644, 9585055498392, 17415763046244, 17415763046244, 0, 0]
def p32 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![9585055498392, 27000818544636, 44416581590880, 44416581590880, 0, 0]
def p33 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![36585874043028, 81002455633908, 125419037224788, 125419037224788, 0, 0]
def p34 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![81002455633908, 206421492858696, 331840530083484, 331840530083484, 0, 0]
def p35 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![206421492858696, 538262022942180, 870102553025664, 870102553025664, 870102553025664, 0]
def p36 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![744683515800876, 1614786068826540, 2484888621852204, 3354991174877868, 0, 0]
def p37 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1614786068826540, 4099674690678744, 7454665865556612, 7454665865556612, 0, 0]
def p38 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![4099674690678744, 11554340556235356, 19009006421791968, 19009006421791968, 0, 0]
def p39 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![15654015246914100, 34663021668706068, 53672028090498036, 53672028090498036, 0, 0]
def p40 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![34663021668706068, 88335049759204104, 142007077849702140, 142007077849702140, 142007077849702140, 0]
def p41 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![122998071427910172, 265005149277612312, 407012227127314452, 549019304977016592, 0, 0]
def p42 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![265005149277612312, 672017376404926764, 1221036681381943356, 1221036681381943356, 0, 0]
def p43 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![672017376404926764, 1893054057786870120, 3114090739168813476, 3114090739168813476, 0, 0]
def p44 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![2565071434191796884, 5679162173360610360, 8793252912529423836, 8793252912529423836, 0, 0]
def p45 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![5679162173360610360, 14472415085890034196, 23265667998419458032, 23265667998419458032, 23265667998419458032, 0]
def p46 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![20151577259250644556, 43417245257670102588, 66682913256089560620, 89948581254509018652, 0, 0]
def p47 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![43417245257670102588, 110100158513759663208, 200048739768268681860, 200048739768268681860, 0, 0]
def p48 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![110100158513759663208, 310148898282028345068, 510197638050297026928, 510197638050297026928, 0, 0]
def p49 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![420249056795788008276, 930446694846085035204, 1440644332896382062132, 1440644332896382062132, 1440644332896382062132, 0]
def p50 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![930446694846085035204, 2371091027742467097336, 3811735360638849159468, 5252379693535231221600, 0, 0]
def p51 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![3301537722588552132540, 7113273083227401292008, 12365652776762632513608, 12365652776762632513608, 0, 0]
def p52 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![7113273083227401292008, 19478925859990033805616, 31844578636752666319224, 31844578636752666319224, 0, 0]
def p53 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![26592198943217435097624, 58436777579970101416848, 90281356216722767736072, 90281356216722767736072, 90281356216722767736072, 0]
def p54 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![58436777579970101416848, 148718133796692869152920, 238999490013415636888992, 329280846230138404625064, 0, 0]
def p55 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![207154911376662970569768, 446154401390078607458760, 775435247620217012083824, 775435247620217012083824, 0, 0]
def p56 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![446154401390078607458760, 1221589649010295619542584, 1997024896630512631626408, 1997024896630512631626408, 0, 0]
def p57 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1667744050400374227001344, 3664768947030886858627752, 5661793843661399490254160, 5661793843661399490254160, 5661793843661399490254160, 0]
def p58 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![3664768947030886858627752, 9326562790692286348881912, 14988356634353685839136072, 20650150478015085329390232, 0, 0]
def p59 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![12991331737723173207509664, 27979688372076859046645736, 48629838850091944376035968, 48629838850091944376035968, 48629838850091944376035968, 0]
def p60 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![27979688372076859046645736, 76609527222168803422681704, 125239366072260747798717672, 173869204922352692174753640, 0, 0]
def p61 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![104589215594245662469327440, 229828581666506410268045112, 403697786588859102442798752, 403697786588859102442798752, 0, 0]
def p62 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![229828581666506410268045112, 633526368255365512710843864, 1037224154844224615153642616, 1037224154844224615153642616, 0, 0]
def p63 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![863354949921871922978888976, 1900579104766096538132531592, 2937803259610321153286174208, 2937803259610321153286174208, 0, 0]
def p64 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1900579104766096538132531592, 4838382364376417691418705800, 7776185623986738844704880008, 7776185623986738844704880008, 0, 0]
def g0 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 0, 0, 22291332717115991918960997408, 7776185623986738844704880008, 0] d
def g1 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 0, 14515147093129253074256117400, 7776185623986738844704880008, 2937803259610321153286174208, 0] d
def g2 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 6738961469142514229551237392, 4838382364376417691418705800, 2937803259610321153286174208, 1037224154844224615153642616, 0] d
def g3 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![1900579104766096538132531592, 1900579104766096538132531592, 1900579104766096538132531592, 1037224154844224615153642616, 403697786588859102442798752, 0] d
def g4 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 863354949921871922978888976, 633526368255365512710843864, 403697786588859102442798752, 173869204922352692174753640, 48629838850091944376035968] d
def g5 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![229828581666506410268045112, 229828581666506410268045112, 229828581666506410268045112, 125239366072260747798717672, 48629838850091944376035968, 0] d
def g6 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 104589215594245662469327440, 76609527222168803422681704, 48629838850091944376035968, 20650150478015085329390232, 5661793843661399490254160] d
def g7 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![27979688372076859046645736, 27979688372076859046645736, 27979688372076859046645736, 14988356634353685839136072, 5661793843661399490254160, 0] d
def g8 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 12991331737723173207509664, 9326562790692286348881912, 5661793843661399490254160, 1997024896630512631626408, 0] d
def g9 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![3664768947030886858627752, 3664768947030886858627752, 3664768947030886858627752, 1997024896630512631626408, 775435247620217012083824, 0] d
def g10 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1667744050400374227001344, 1221589649010295619542584, 775435247620217012083824, 329280846230138404625064, 90281356216722767736072] d
def g11 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![446154401390078607458760, 446154401390078607458760, 446154401390078607458760, 238999490013415636888992, 90281356216722767736072, 0] d
def g12 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 207154911376662970569768, 148718133796692869152920, 90281356216722767736072, 31844578636752666319224, 0] d
def g13 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![58436777579970101416848, 58436777579970101416848, 58436777579970101416848, 31844578636752666319224, 12365652776762632513608, 0] d
def g14 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 26592198943217435097624, 19478925859990033805616, 12365652776762632513608, 5252379693535231221600, 1440644332896382062132] d
def g15 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![7113273083227401292008, 7113273083227401292008, 7113273083227401292008, 3811735360638849159468, 1440644332896382062132, 0] d
def g16 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 3301537722588552132540, 2371091027742467097336, 1440644332896382062132, 510197638050297026928, 0] d
def g17 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![930446694846085035204, 930446694846085035204, 930446694846085035204, 510197638050297026928, 200048739768268681860, 0] d
def g18 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 420249056795788008276, 310148898282028345068, 200048739768268681860, 89948581254509018652, 23265667998419458032] d
def g19 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![110100158513759663208, 110100158513759663208, 110100158513759663208, 66682913256089560620, 23265667998419458032, 0] d
def g20 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 43417245257670102588, 43417245257670102588, 23265667998419458032, 8793252912529423836, 0] d
def g21 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 20151577259250644556, 14472415085890034196, 8793252912529423836, 3114090739168813476, 0] d
def g22 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![5679162173360610360, 5679162173360610360, 5679162173360610360, 3114090739168813476, 1221036681381943356, 0] d
def g23 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 2565071434191796884, 1893054057786870120, 1221036681381943356, 549019304977016592, 142007077849702140] d
def g24 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![672017376404926764, 672017376404926764, 672017376404926764, 407012227127314452, 142007077849702140, 0] d
def g25 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 265005149277612312, 265005149277612312, 142007077849702140, 53672028090498036, 0] d
def g26 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 122998071427910172, 88335049759204104, 53672028090498036, 19009006421791968, 0] d
def g27 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![34663021668706068, 34663021668706068, 34663021668706068, 19009006421791968, 7454665865556612, 0] d
def g28 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 15654015246914100, 11554340556235356, 7454665865556612, 3354991174877868, 870102553025664] d
def g29 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![4099674690678744, 4099674690678744, 4099674690678744, 2484888621852204, 870102553025664, 0] d
def g30 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1614786068826540, 1614786068826540, 870102553025664, 331840530083484, 0] d
def g31 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 744683515800876, 538262022942180, 331840530083484, 125419037224788, 0] d
def g32 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![206421492858696, 206421492858696, 206421492858696, 125419037224788, 44416581590880, 0] d
def g33 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 81002455633908, 81002455633908, 44416581590880, 17415763046244, 0] d
def g34 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 36585874043028, 27000818544636, 17415763046244, 7830707547852, 2025453199104] d
def g35 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![9585055498392, 9585055498392, 9585055498392, 5805254348748, 2025453199104, 0] d
def g36 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 3779801149644, 3779801149644, 2025453199104, 765519482556, 0] d
def g37 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1754347950540, 1259933716548, 765519482556, 271105248564, 0] d
def g38 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![494414233992, 494414233992, 494414233992, 271105248564, 106300503900, 0] d
def g39 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 223308985428, 164804744664, 106300503900, 47796263136, 12362761836] d
def g40 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![58504240764, 58504240764, 58504240764, 35433501300, 12362761836, 0] d
def g41 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 23070739464, 23070739464, 12362761836, 4672515348, 0] d
def g42 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 10707977628, 7690246488, 4672515348, 1654784208, 0] d
def g43 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![3017731140, 3017731140, 3017731140, 1654784208, 648873828, 0] d
def g44 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1362946932, 1005910380, 648873828, 291837276, 75546000] d
def g45 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![357036552, 357036552, 357036552, 216291276, 75546000, 0] d
def g46 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 140745276, 140745276, 75546000, 28630908, 0] d
def g47 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 65199276, 46915092, 28630908, 10346724, 0] d
def g48 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![18284184, 18284184, 18284184, 10346724, 4653540, 1204632] d
def g49 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 7937460, 5693184, 3448908, 1204632, 0] d
def g50 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![2244276, 2244276, 2244276, 1204632, 456540, 0] d
def g51 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1039644, 748092, 456540, 164988, 0] d
def g52 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![291552, 291552, 291552, 164988, 74208, 19212] d
def g53 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 126564, 90780, 54996, 19212, 0] d
def g54 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![35784, 35784, 35784, 19212, 7284, 0] d
def g55 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 16572, 11928, 7284, 2640, 0] d
def g56 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![4644, 4644, 4644, 2640, 1198, 318] d
def g57 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 2004, 1442, 880, 318, 0] d
def g58 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![562, 562, 562, 318, 143, 37] d
def g59 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 244, 175, 106, 37, 0] d
def g60 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![69, 69, 69, 37, 14, 0] d
def g61 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 32, 23, 14, 5, 0] d
def g62 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![9, 9, 9, 5, 2, 0] d
def g63 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 4, 3, 2, 1, 0] d
def g64 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![1, 1, 1, 1, 0, 0] d
def g65 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 0, 1, 0, 0, 0] d
theorem fr0 : p1=p0*rowMatrix (rowMask 1 0) := by decide
theorem fr1 : p2=p1*rowMatrix (rowMask 1 1) := by decide
theorem fr2 : p3=p2*rowMatrix (rowMask 1 2) := by decide
theorem fr3 : p4=p3*rowMatrix (rowMask 1 3) := by decide
theorem fr4 : p5=p4*rowMatrix (rowMask 1 4) := by decide
theorem fr5 : p6=p5*rowMatrix (rowMask 1 5) := by decide
theorem fr6 : p7=p6*rowMatrix (rowMask 1 6) := by decide
theorem fr7 : p8=p7*rowMatrix (rowMask 1 7) := by decide
theorem fr8 : p9=p8*rowMatrix (rowMask 1 8) := by decide
theorem fr9 : p10=p9*rowMatrix (rowMask 1 9) := by decide
theorem fr10 : p11=p10*rowMatrix (rowMask 1 10) := by decide
theorem fr11 : p12=p11*rowMatrix (rowMask 1 11) := by decide
theorem fr12 : p13=p12*rowMatrix (rowMask 1 12) := by decide
theorem fr13 : p14=p13*rowMatrix (rowMask 1 13) := by decide
theorem fr14 : p15=p14*rowMatrix (rowMask 1 14) := by decide
theorem fr15 : p16=p15*rowMatrix (rowMask 1 15) := by decide
theorem fr16 : p17=p16*rowMatrix (rowMask 1 16) := by decide
theorem fr17 : p18=p17*rowMatrix (rowMask 1 17) := by decide
theorem fr18 : p19=p18*rowMatrix (rowMask 1 18) := by decide
theorem fr19 : p20=p19*rowMatrix (rowMask 1 19) := by decide
theorem fr20 : p21=p20*rowMatrix (rowMask 1 20) := by decide
theorem fr21 : p22=p21*rowMatrix (rowMask 1 21) := by decide
theorem fr22 : p23=p22*rowMatrix (rowMask 1 22) := by decide
theorem fr23 : p24=p23*rowMatrix (rowMask 1 23) := by decide
theorem fr24 : p25=p24*rowMatrix (rowMask 1 24) := by decide
theorem fr25 : p26=p25*rowMatrix (rowMask 1 25) := by decide
theorem fr26 : p27=p26*rowMatrix (rowMask 1 26) := by decide
theorem fr27 : p28=p27*rowMatrix (rowMask 1 27) := by decide
theorem fr28 : p29=p28*rowMatrix (rowMask 1 28) := by decide
theorem fr29 : p30=p29*rowMatrix (rowMask 1 29) := by decide
theorem fr30 : p31=p30*rowMatrix (rowMask 1 30) := by decide
theorem fr31 : p32=p31*rowMatrix (rowMask 1 31) := by decide
theorem fr32 : p33=p32*rowMatrix (rowMask 1 32) := by decide
theorem fr33 : p34=p33*rowMatrix (rowMask 1 33) := by decide
theorem fr34 : p35=p34*rowMatrix (rowMask 1 34) := by decide
theorem fr35 : p36=p35*rowMatrix (rowMask 1 35) := by decide
theorem fr36 : p37=p36*rowMatrix (rowMask 1 36) := by decide
theorem fr37 : p38=p37*rowMatrix (rowMask 1 37) := by decide
theorem fr38 : p39=p38*rowMatrix (rowMask 1 38) := by decide
theorem fr39 : p40=p39*rowMatrix (rowMask 1 39) := by decide
theorem fr40 : p41=p40*rowMatrix (rowMask 1 40) := by decide
theorem fr41 : p42=p41*rowMatrix (rowMask 1 41) := by decide
theorem fr42 : p43=p42*rowMatrix (rowMask 1 42) := by decide
theorem fr43 : p44=p43*rowMatrix (rowMask 1 43) := by decide
theorem fr44 : p45=p44*rowMatrix (rowMask 1 44) := by decide
theorem fr45 : p46=p45*rowMatrix (rowMask 1 45) := by decide
theorem fr46 : p47=p46*rowMatrix (rowMask 1 46) := by decide
theorem fr47 : p48=p47*rowMatrix (rowMask 1 47) := by decide
theorem fr48 : p49=p48*rowMatrix (rowMask 1 48) := by decide
theorem fr49 : p50=p49*rowMatrix (rowMask 1 49) := by decide
theorem fr50 : p51=p50*rowMatrix (rowMask 1 50) := by decide
theorem fr51 : p52=p51*rowMatrix (rowMask 1 51) := by decide
theorem fr52 : p53=p52*rowMatrix (rowMask 1 52) := by decide
theorem fr53 : p54=p53*rowMatrix (rowMask 1 53) := by decide
theorem fr54 : p55=p54*rowMatrix (rowMask 1 54) := by decide
theorem fr55 : p56=p55*rowMatrix (rowMask 1 55) := by decide
theorem fr56 : p57=p56*rowMatrix (rowMask 1 56) := by decide
theorem fr57 : p58=p57*rowMatrix (rowMask 1 57) := by decide
theorem fr58 : p59=p58*rowMatrix (rowMask 1 58) := by decide
theorem fr59 : p60=p59*rowMatrix (rowMask 1 59) := by decide
theorem fr60 : p61=p60*rowMatrix (rowMask 1 60) := by decide
theorem fr61 : p62=p61*rowMatrix (rowMask 1 61) := by decide
theorem fr62 : p63=p62*rowMatrix (rowMask 1 62) := by decide
theorem fr63 : p64=p63*rowMatrix (rowMask 1 63) := by decide
theorem br0 : g0=rowMatrix (rowMask 1 0)*g1 := by decide
theorem br1 : g1=rowMatrix (rowMask 1 1)*g2 := by decide
theorem br2 : g2=rowMatrix (rowMask 1 2)*g3 := by decide
theorem br3 : g3=rowMatrix (rowMask 1 3)*g4 := by decide
theorem br4 : g4=rowMatrix (rowMask 1 4)*g5 := by decide
theorem br5 : g5=rowMatrix (rowMask 1 5)*g6 := by decide
theorem br6 : g6=rowMatrix (rowMask 1 6)*g7 := by decide
theorem br7 : g7=rowMatrix (rowMask 1 7)*g8 := by decide
theorem br8 : g8=rowMatrix (rowMask 1 8)*g9 := by decide
theorem br9 : g9=rowMatrix (rowMask 1 9)*g10 := by decide
theorem br10 : g10=rowMatrix (rowMask 1 10)*g11 := by decide
theorem br11 : g11=rowMatrix (rowMask 1 11)*g12 := by decide
theorem br12 : g12=rowMatrix (rowMask 1 12)*g13 := by decide
theorem br13 : g13=rowMatrix (rowMask 1 13)*g14 := by decide
theorem br14 : g14=rowMatrix (rowMask 1 14)*g15 := by decide
theorem br15 : g15=rowMatrix (rowMask 1 15)*g16 := by decide
theorem br16 : g16=rowMatrix (rowMask 1 16)*g17 := by decide
theorem br17 : g17=rowMatrix (rowMask 1 17)*g18 := by decide
theorem br18 : g18=rowMatrix (rowMask 1 18)*g19 := by decide
theorem br19 : g19=rowMatrix (rowMask 1 19)*g20 := by decide
theorem br20 : g20=rowMatrix (rowMask 1 20)*g21 := by decide
theorem br21 : g21=rowMatrix (rowMask 1 21)*g22 := by decide
theorem br22 : g22=rowMatrix (rowMask 1 22)*g23 := by decide
theorem br23 : g23=rowMatrix (rowMask 1 23)*g24 := by decide
theorem br24 : g24=rowMatrix (rowMask 1 24)*g25 := by decide
theorem br25 : g25=rowMatrix (rowMask 1 25)*g26 := by decide
theorem br26 : g26=rowMatrix (rowMask 1 26)*g27 := by decide
theorem br27 : g27=rowMatrix (rowMask 1 27)*g28 := by decide
theorem br28 : g28=rowMatrix (rowMask 1 28)*g29 := by decide
theorem br29 : g29=rowMatrix (rowMask 1 29)*g30 := by decide
theorem br30 : g30=rowMatrix (rowMask 1 30)*g31 := by decide
theorem br31 : g31=rowMatrix (rowMask 1 31)*g32 := by decide
theorem br32 : g32=rowMatrix (rowMask 1 32)*g33 := by decide
theorem br33 : g33=rowMatrix (rowMask 1 33)*g34 := by decide
theorem br34 : g34=rowMatrix (rowMask 1 34)*g35 := by decide
theorem br35 : g35=rowMatrix (rowMask 1 35)*g36 := by decide
theorem br36 : g36=rowMatrix (rowMask 1 36)*g37 := by decide
theorem br37 : g37=rowMatrix (rowMask 1 37)*g38 := by decide
theorem br38 : g38=rowMatrix (rowMask 1 38)*g39 := by decide
theorem br39 : g39=rowMatrix (rowMask 1 39)*g40 := by decide
theorem br40 : g40=rowMatrix (rowMask 1 40)*g41 := by decide
theorem br41 : g41=rowMatrix (rowMask 1 41)*g42 := by decide
theorem br42 : g42=rowMatrix (rowMask 1 42)*g43 := by decide
theorem br43 : g43=rowMatrix (rowMask 1 43)*g44 := by decide
theorem br44 : g44=rowMatrix (rowMask 1 44)*g45 := by decide
theorem br45 : g45=rowMatrix (rowMask 1 45)*g46 := by decide
theorem br46 : g46=rowMatrix (rowMask 1 46)*g47 := by decide
theorem br47 : g47=rowMatrix (rowMask 1 47)*g48 := by decide
theorem br48 : g48=rowMatrix (rowMask 1 48)*g49 := by decide
theorem br49 : g49=rowMatrix (rowMask 1 49)*g50 := by decide
theorem br50 : g50=rowMatrix (rowMask 1 50)*g51 := by decide
theorem br51 : g51=rowMatrix (rowMask 1 51)*g52 := by decide
theorem br52 : g52=rowMatrix (rowMask 1 52)*g53 := by decide
theorem br53 : g53=rowMatrix (rowMask 1 53)*g54 := by decide
theorem br54 : g54=rowMatrix (rowMask 1 54)*g55 := by decide
theorem br55 : g55=rowMatrix (rowMask 1 55)*g56 := by decide
theorem br56 : g56=rowMatrix (rowMask 1 56)*g57 := by decide
theorem br57 : g57=rowMatrix (rowMask 1 57)*g58 := by decide
theorem br58 : g58=rowMatrix (rowMask 1 58)*g59 := by decide
theorem br59 : g59=rowMatrix (rowMask 1 59)*g60 := by decide
theorem br60 : g60=rowMatrix (rowMask 1 60)*g61 := by decide
theorem br61 : g61=rowMatrix (rowMask 1 61)*g62 := by decide
theorem br62 : g62=rowMatrix (rowMask 1 62)*g63 := by decide
theorem br63 : g63=rowMatrix (rowMask 1 63)*g64 := by decide
theorem br64 : g64=rowMatrix (rowMask 1 64)*g65 := by decide
theorem ev0 : ∀d : Fin 7,
    (p0*eventRow (rowMask 1 0) ((d.val : ℤ)-3)*g1) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 1 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev1 : ∀d : Fin 7,
    (p1*eventRow (rowMask 1 1) ((d.val : ℤ)-3)*g2) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 2 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev2 : ∀d : Fin 7,
    (p2*eventRow (rowMask 1 2) ((d.val : ℤ)-3)*g3) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 3 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev3 : ∀d : Fin 7,
    (p3*eventRow (rowMask 1 3) ((d.val : ℤ)-3)*g4) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 4 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev4 : ∀d : Fin 7,
    (p4*eventRow (rowMask 1 4) ((d.val : ℤ)-3)*g5) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 5 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev5 : ∀d : Fin 7,
    (p5*eventRow (rowMask 1 5) ((d.val : ℤ)-3)*g6) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 6 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev6 : ∀d : Fin 7,
    (p6*eventRow (rowMask 1 6) ((d.val : ℤ)-3)*g7) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 7 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev7 : ∀d : Fin 7,
    (p7*eventRow (rowMask 1 7) ((d.val : ℤ)-3)*g8) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 8 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev8 : ∀d : Fin 7,
    (p8*eventRow (rowMask 1 8) ((d.val : ℤ)-3)*g9) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 9 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev9 : ∀d : Fin 7,
    (p9*eventRow (rowMask 1 9) ((d.val : ℤ)-3)*g10) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 10 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev10 : ∀d : Fin 7,
    (p10*eventRow (rowMask 1 10) ((d.val : ℤ)-3)*g11) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 11 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev11 : ∀d : Fin 7,
    (p11*eventRow (rowMask 1 11) ((d.val : ℤ)-3)*g12) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 12 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev12 : ∀d : Fin 7,
    (p12*eventRow (rowMask 1 12) ((d.val : ℤ)-3)*g13) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 13 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev13 : ∀d : Fin 7,
    (p13*eventRow (rowMask 1 13) ((d.val : ℤ)-3)*g14) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 14 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev14 : ∀d : Fin 7,
    (p14*eventRow (rowMask 1 14) ((d.val : ℤ)-3)*g15) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 15 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev15 : ∀d : Fin 7,
    (p15*eventRow (rowMask 1 15) ((d.val : ℤ)-3)*g16) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 16 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev16 : ∀d : Fin 7,
    (p16*eventRow (rowMask 1 16) ((d.val : ℤ)-3)*g17) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 17 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev17 : ∀d : Fin 7,
    (p17*eventRow (rowMask 1 17) ((d.val : ℤ)-3)*g18) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 18 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev18 : ∀d : Fin 7,
    (p18*eventRow (rowMask 1 18) ((d.val : ℤ)-3)*g19) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 19 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev19 : ∀d : Fin 7,
    (p19*eventRow (rowMask 1 19) ((d.val : ℤ)-3)*g20) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 20 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev20 : ∀d : Fin 7,
    (p20*eventRow (rowMask 1 20) ((d.val : ℤ)-3)*g21) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 21 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev21 : ∀d : Fin 7,
    (p21*eventRow (rowMask 1 21) ((d.val : ℤ)-3)*g22) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 22 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev22 : ∀d : Fin 7,
    (p22*eventRow (rowMask 1 22) ((d.val : ℤ)-3)*g23) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 23 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev23 : ∀d : Fin 7,
    (p23*eventRow (rowMask 1 23) ((d.val : ℤ)-3)*g24) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 24 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev24 : ∀d : Fin 7,
    (p24*eventRow (rowMask 1 24) ((d.val : ℤ)-3)*g25) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 25 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev25 : ∀d : Fin 7,
    (p25*eventRow (rowMask 1 25) ((d.val : ℤ)-3)*g26) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 26 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev26 : ∀d : Fin 7,
    (p26*eventRow (rowMask 1 26) ((d.val : ℤ)-3)*g27) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 27 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev27 : ∀d : Fin 7,
    (p27*eventRow (rowMask 1 27) ((d.val : ℤ)-3)*g28) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 28 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev28 : ∀d : Fin 7,
    (p28*eventRow (rowMask 1 28) ((d.val : ℤ)-3)*g29) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 29 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev29 : ∀d : Fin 7,
    (p29*eventRow (rowMask 1 29) ((d.val : ℤ)-3)*g30) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 30 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev30 : ∀d : Fin 7,
    (p30*eventRow (rowMask 1 30) ((d.val : ℤ)-3)*g31) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 31 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev31 : ∀d : Fin 7,
    (p31*eventRow (rowMask 1 31) ((d.val : ℤ)-3)*g32) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 32 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev32 : ∀d : Fin 7,
    (p32*eventRow (rowMask 1 32) ((d.val : ℤ)-3)*g33) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 33 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev33 : ∀d : Fin 7,
    (p33*eventRow (rowMask 1 33) ((d.val : ℤ)-3)*g34) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 34 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev34 : ∀d : Fin 7,
    (p34*eventRow (rowMask 1 34) ((d.val : ℤ)-3)*g35) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 35 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev35 : ∀d : Fin 7,
    (p35*eventRow (rowMask 1 35) ((d.val : ℤ)-3)*g36) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 36 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev36 : ∀d : Fin 7,
    (p36*eventRow (rowMask 1 36) ((d.val : ℤ)-3)*g37) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 37 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev37 : ∀d : Fin 7,
    (p37*eventRow (rowMask 1 37) ((d.val : ℤ)-3)*g38) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 38 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev38 : ∀d : Fin 7,
    (p38*eventRow (rowMask 1 38) ((d.val : ℤ)-3)*g39) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 39 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev39 : ∀d : Fin 7,
    (p39*eventRow (rowMask 1 39) ((d.val : ℤ)-3)*g40) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 40 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev40 : ∀d : Fin 7,
    (p40*eventRow (rowMask 1 40) ((d.val : ℤ)-3)*g41) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 41 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev41 : ∀d : Fin 7,
    (p41*eventRow (rowMask 1 41) ((d.val : ℤ)-3)*g42) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 42 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev42 : ∀d : Fin 7,
    (p42*eventRow (rowMask 1 42) ((d.val : ℤ)-3)*g43) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 43 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev43 : ∀d : Fin 7,
    (p43*eventRow (rowMask 1 43) ((d.val : ℤ)-3)*g44) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 44 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev44 : ∀d : Fin 7,
    (p44*eventRow (rowMask 1 44) ((d.val : ℤ)-3)*g45) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 45 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev45 : ∀d : Fin 7,
    (p45*eventRow (rowMask 1 45) ((d.val : ℤ)-3)*g46) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 46 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev46 : ∀d : Fin 7,
    (p46*eventRow (rowMask 1 46) ((d.val : ℤ)-3)*g47) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 47 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev47 : ∀d : Fin 7,
    (p47*eventRow (rowMask 1 47) ((d.val : ℤ)-3)*g48) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 48 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev48 : ∀d : Fin 7,
    (p48*eventRow (rowMask 1 48) ((d.val : ℤ)-3)*g49) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 49 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev49 : ∀d : Fin 7,
    (p49*eventRow (rowMask 1 49) ((d.val : ℤ)-3)*g50) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 50 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev50 : ∀d : Fin 7,
    (p50*eventRow (rowMask 1 50) ((d.val : ℤ)-3)*g51) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 51 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev51 : ∀d : Fin 7,
    (p51*eventRow (rowMask 1 51) ((d.val : ℤ)-3)*g52) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 52 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev52 : ∀d : Fin 7,
    (p52*eventRow (rowMask 1 52) ((d.val : ℤ)-3)*g53) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 53 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev53 : ∀d : Fin 7,
    (p53*eventRow (rowMask 1 53) ((d.val : ℤ)-3)*g54) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 54 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev54 : ∀d : Fin 7,
    (p54*eventRow (rowMask 1 54) ((d.val : ℤ)-3)*g55) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 55 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev55 : ∀d : Fin 7,
    (p55*eventRow (rowMask 1 55) ((d.val : ℤ)-3)*g56) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 56 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev56 : ∀d : Fin 7,
    (p56*eventRow (rowMask 1 56) ((d.val : ℤ)-3)*g57) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 57 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev57 : ∀d : Fin 7,
    (p57*eventRow (rowMask 1 57) ((d.val : ℤ)-3)*g58) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 58 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev58 : ∀d : Fin 7,
    (p58*eventRow (rowMask 1 58) ((d.val : ℤ)-3)*g59) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 59 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev59 : ∀d : Fin 7,
    (p59*eventRow (rowMask 1 59) ((d.val : ℤ)-3)*g60) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 60 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev60 : ∀d : Fin 7,
    (p60*eventRow (rowMask 1 60) ((d.val : ℤ)-3)*g61) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 61 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev61 : ∀d : Fin 7,
    (p61*eventRow (rowMask 1 61) ((d.val : ℤ)-3)*g62) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 62 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev62 : ∀d : Fin 7,
    (p62*eventRow (rowMask 1 62) ((d.val : ℤ)-3)*g63) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 63 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev63 : ∀d : Fin 7,
    (p63*eventRow (rowMask 1 63) ((d.val : ℤ)-3)*g64) 0 0=
      (eventCount GridData4_1.f GridData4_1.g 64 d : ℤ) := by
  intro d; fin_cases d <;> decide
def checked : FiniteTransfer7.Checked ⟨1,by decide⟩ where
  pref := fun r => ![p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, p39, p40, p41, p42, p43, p44, p45, p46, p47, p48, p49, p50, p51, p52, p53, p54, p55, p56, p57, p58, p59, p60, p61, p62, p63, p64] r
  suff := fun r => ![g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31, g32, g33, g34, g35, g36, g37, g38, g39, g40, g41, g42, g43, g44, g45, g46, g47, g48, g49, g50, g51, g52, g53, g54, g55, g56, g57, g58, g59, g60, g61, g62, g63, g64, g65] r
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
    exact ev54
    exact ev55
    exact ev56
    exact ev57
    exact ev58
    exact ev59
    exact ev60
    exact ev61
    exact ev62
    exact ev63
end OneThird.FiniteTransferData7_1
