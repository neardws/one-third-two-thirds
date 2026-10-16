module
public import OneThird.FiniteGrid4
@[expose] public section
namespace OneThird.GridData4_2
open FiniteGrid4
set_option maxHeartbeats 0
set_option maxRecDepth 100000
set_option linter.unusedSimpArgs false
def f : Table 74 := ![![0, 0, 0, 1, 1, 0],
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
![0, 81002455633908, 206421492858696, 331840530083484, 331840530083484, 331840530083484],
![81002455633908, 287423948492604, 619264478576088, 951105008659572, 1282945538743056, 0],
![0, 619264478576088, 1570369487235660, 2853315025978716, 2853315025978716, 0],
![0, 1570369487235660, 4423684513214376, 7276999539193092, 7276999539193092, 0],
![1570369487235660, 5994054000450036, 13271053539643128, 20548053078836220, 20548053078836220, 0],
![0, 13271053539643128, 33819106618479348, 54367159697315568, 54367159697315568, 0],
![0, 33819106618479348, 88186266315794916, 142553426013110484, 142553426013110484, 142553426013110484],
![33819106618479348, 122005372934274264, 264558798947384748, 407112224960495232, 549665650973605716, 0],
![0, 264558798947384748, 671671023907879980, 1221336674881485696, 1221336674881485696, 0],
![0, 671671023907879980, 1893007698789365676, 3114344373670851372, 3114344373670851372, 0],
![671671023907879980, 2564678722697245656, 5679023096368097028, 8793367470038948400, 8793367470038948400, 0],
![0, 5679023096368097028, 14472390566407045428, 23265758036445993828, 23265758036445993828, 23265758036445993828],
![5679023096368097028, 20151413662775142456, 43417171699221136284, 66682929735667130112, 89948687772113123940, 0],
![0, 43417171699221136284, 110100101434888266396, 200048789207001390336, 200048789207001390336, 0],
![0, 110100101434888266396, 310148890641889656732, 510197679848891047068, 510197679848891047068, 0],
![110100101434888266396, 420248992076777923128, 930446671925668970196, 1440644351774560017264, 1440644351774560017264, 0],
![0, 930446671925668970196, 2371091023700228987460, 3811735375474789004724, 3811735375474789004724, 3811735375474789004724],
![930446671925668970196, 3301537695625897957656, 7113273071100686962380, 10925008446575475967104, 14736743822050264971828, 0],
![0, 7113273071100686962380, 18038281517676162929484, 32775025339726427901312, 32775025339726427901312, 0],
![0, 18038281517676162929484, 50813306857402590830796, 83588332197129018732108, 83588332197129018732108, 0],
![18038281517676162929484, 68851588375078753760280, 152439920572207772492388, 236028252769336791224496, 236028252769336791224496, 0],
![0, 152439920572207772492388, 388468173341544563716884, 624496426110881354941380, 624496426110881354941380, 624496426110881354941380],
![152439920572207772492388, 540908093913752336209272, 1165404520024633691150652, 1789900946135515046092032, 2414397372246396401033412, 0],
![0, 1165404520024633691150652, 2955305466160148737242684, 5369702838406545138276096, 5369702838406545138276096, 0],
![0, 2955305466160148737242684, 8325008304566693875518780, 13694711142973239013794876, 13694711142973239013794876, 0],
![2955305466160148737242684, 11280313770726842612761464, 24975024913700081626556340, 38669736056673320640351216, 38669736056673320640351216, 38669736056673320640351216],
![0, 24975024913700081626556340, 63644760970373402266907556, 102314497027046722907258772, 140984233083720043547609988, 0],
![24975024913700081626556340, 88619785884073483893463896, 190934282911120206800722668, 331918515994840250348332656, 331918515994840250348332656, 0],
![0, 190934282911120206800722668, 522852798905960457149055324, 854771314900800707497387980, 854771314900800707497387980, 0],
![190934282911120206800722668, 713787081817080663949777992, 1568558396717881371447165972, 2423329711618682078944553952, 2423329711618682078944553952, 2423329711618682078944553952],
![0, 1568558396717881371447165972, 3991888108336563450391719924, 6415217819955245529336273876, 8838547531573927608280827828, 0],
![1568558396717881371447165972, 5560446505054444821838885896, 11975664325009690351175159772, 20814211856583617959455987600, 20814211856583617959455987600, 0],
![0, 11975664325009690351175159772, 32789876181593308310631147372, 53604088038176926270087134972, 53604088038176926270087134972, 0],
![11975664325009690351175159772, 44765540506602998661806307144, 98369628544779924931893442116, 151973716582956851201980577088, 151973716582956851201980577088, 151973716582956851201980577088],
![0, 98369628544779924931893442116, 250343345127736776133874019204, 402317061710693627335854596292, 554290778293650478537835173380, 0],
![98369628544779924931893442116, 348712973672516701065767461320, 751030035383210328401622057612, 1305320813676860806939457230992, 1305320813676860806939457230992, 1305320813676860806939457230992],
![0, 751030035383210328401622057612, 2056350849060071135341079288604, 3361671662736931942280536519596, 4666992476413792749219993750588, 0],
![751030035383210328401622057612, 2807380884443281463742701346216, 6169052547180213406023237865812, 10836045023594006155243231616400, 10836045023594006155243231616400, 0],
![0, 6169052547180213406023237865812, 17005097570774219561266469482212, 27841142594368225716509701098612, 27841142594368225716509701098612, 0],
![6169052547180213406023237865812, 23174150117954432967289707348024, 51015292712322658683799408446636, 78856435306690884400309109545248, 78856435306690884400309109545248, 0],
![0, 51015292712322658683799408446636, 129871728019013543084108517991884, 208728163325704427484417627537132, 208728163325704427484417627537132, 0],
![51015292712322658683799408446636, 180887020731336201767907926438520, 389615184057040629252325553975652, 598343347382745056736743181512784, 0, 0]]
def g : Table 74 := ![![0, 0, 0, 598343347382745056736743181512784, 208728163325704427484417627537132, 0],
![0, 0, 389615184057040629252325553975652, 208728163325704427484417627537132, 78856435306690884400309109545248, 0],
![0, 180887020731336201767907926438520, 129871728019013543084108517991884, 78856435306690884400309109545248, 27841142594368225716509701098612, 0],
![51015292712322658683799408446636, 51015292712322658683799408446636, 51015292712322658683799408446636, 27841142594368225716509701098612, 10836045023594006155243231616400, 0],
![0, 23174150117954432967289707348024, 17005097570774219561266469482212, 10836045023594006155243231616400, 4666992476413792749219993750588, 1305320813676860806939457230992],
![6169052547180213406023237865812, 6169052547180213406023237865812, 6169052547180213406023237865812, 3361671662736931942280536519596, 1305320813676860806939457230992, 0],
![0, 2807380884443281463742701346216, 2056350849060071135341079288604, 1305320813676860806939457230992, 554290778293650478537835173380, 151973716582956851201980577088],
![751030035383210328401622057612, 751030035383210328401622057612, 751030035383210328401622057612, 402317061710693627335854596292, 151973716582956851201980577088, 0],
![0, 348712973672516701065767461320, 250343345127736776133874019204, 151973716582956851201980577088, 53604088038176926270087134972, 0],
![98369628544779924931893442116, 98369628544779924931893442116, 98369628544779924931893442116, 53604088038176926270087134972, 20814211856583617959455987600, 0],
![0, 44765540506602998661806307144, 32789876181593308310631147372, 20814211856583617959455987600, 8838547531573927608280827828, 2423329711618682078944553952],
![11975664325009690351175159772, 11975664325009690351175159772, 11975664325009690351175159772, 6415217819955245529336273876, 2423329711618682078944553952, 0],
![0, 5560446505054444821838885896, 3991888108336563450391719924, 2423329711618682078944553952, 854771314900800707497387980, 0],
![1568558396717881371447165972, 1568558396717881371447165972, 1568558396717881371447165972, 854771314900800707497387980, 331918515994840250348332656, 0],
![0, 713787081817080663949777992, 522852798905960457149055324, 331918515994840250348332656, 140984233083720043547609988, 38669736056673320640351216],
![190934282911120206800722668, 190934282911120206800722668, 190934282911120206800722668, 102314497027046722907258772, 38669736056673320640351216, 0],
![0, 88619785884073483893463896, 63644760970373402266907556, 38669736056673320640351216, 13694711142973239013794876, 0],
![24975024913700081626556340, 24975024913700081626556340, 24975024913700081626556340, 13694711142973239013794876, 5369702838406545138276096, 0],
![0, 11280313770726842612761464, 8325008304566693875518780, 5369702838406545138276096, 2414397372246396401033412, 624496426110881354941380],
![2955305466160148737242684, 2955305466160148737242684, 2955305466160148737242684, 1789900946135515046092032, 624496426110881354941380, 0],
![0, 1165404520024633691150652, 1165404520024633691150652, 624496426110881354941380, 236028252769336791224496, 0],
![0, 540908093913752336209272, 388468173341544563716884, 236028252769336791224496, 83588332197129018732108, 0],
![152439920572207772492388, 152439920572207772492388, 152439920572207772492388, 83588332197129018732108, 32775025339726427901312, 0],
![0, 68851588375078753760280, 50813306857402590830796, 32775025339726427901312, 14736743822050264971828, 3811735375474789004724],
![18038281517676162929484, 18038281517676162929484, 18038281517676162929484, 10925008446575475967104, 3811735375474789004724, 0],
![0, 7113273071100686962380, 7113273071100686962380, 3811735375474789004724, 1440644351774560017264, 0],
![0, 3301537695625897957656, 2371091023700228987460, 1440644351774560017264, 510197679848891047068, 0],
![930446671925668970196, 930446671925668970196, 930446671925668970196, 510197679848891047068, 200048789207001390336, 0],
![0, 420248992076777923128, 310148890641889656732, 200048789207001390336, 89948687772113123940, 23265758036445993828],
![110100101434888266396, 110100101434888266396, 110100101434888266396, 66682929735667130112, 23265758036445993828, 0],
![0, 43417171699221136284, 43417171699221136284, 23265758036445993828, 8793367470038948400, 0],
![0, 20151413662775142456, 14472390566407045428, 8793367470038948400, 3114344373670851372, 0],
![5679023096368097028, 5679023096368097028, 5679023096368097028, 3114344373670851372, 1221336674881485696, 0],
![0, 2564678722697245656, 1893007698789365676, 1221336674881485696, 549665650973605716, 142553426013110484],
![671671023907879980, 671671023907879980, 671671023907879980, 407112224960495232, 142553426013110484, 0],
![0, 264558798947384748, 264558798947384748, 142553426013110484, 54367159697315568, 0],
![0, 122005372934274264, 88186266315794916, 54367159697315568, 20548053078836220, 0],
![33819106618479348, 33819106618479348, 33819106618479348, 20548053078836220, 7276999539193092, 0],
![0, 13271053539643128, 13271053539643128, 7276999539193092, 2853315025978716, 0],
![0, 5994054000450036, 4423684513214376, 2853315025978716, 1282945538743056, 331840530083484],
![1570369487235660, 1570369487235660, 1570369487235660, 951105008659572, 331840530083484, 0],
![0, 619264478576088, 619264478576088, 331840530083484, 125419037224788, 0],
![0, 287423948492604, 206421492858696, 125419037224788, 44416581590880, 0],
![81002455633908, 81002455633908, 81002455633908, 44416581590880, 17415763046244, 0],
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
theorem fr0 : forwardRow 2 f ⟨0,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br0 : backwardRow 2 g ⟨0,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr1 : forwardRow 2 f ⟨1,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br1 : backwardRow 2 g ⟨1,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr2 : forwardRow 2 f ⟨2,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br2 : backwardRow 2 g ⟨2,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr3 : forwardRow 2 f ⟨3,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br3 : backwardRow 2 g ⟨3,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr4 : forwardRow 2 f ⟨4,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br4 : backwardRow 2 g ⟨4,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr5 : forwardRow 2 f ⟨5,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br5 : backwardRow 2 g ⟨5,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr6 : forwardRow 2 f ⟨6,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br6 : backwardRow 2 g ⟨6,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr7 : forwardRow 2 f ⟨7,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br7 : backwardRow 2 g ⟨7,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr8 : forwardRow 2 f ⟨8,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br8 : backwardRow 2 g ⟨8,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr9 : forwardRow 2 f ⟨9,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br9 : backwardRow 2 g ⟨9,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr10 : forwardRow 2 f ⟨10,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br10 : backwardRow 2 g ⟨10,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr11 : forwardRow 2 f ⟨11,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br11 : backwardRow 2 g ⟨11,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr12 : forwardRow 2 f ⟨12,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br12 : backwardRow 2 g ⟨12,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr13 : forwardRow 2 f ⟨13,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br13 : backwardRow 2 g ⟨13,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr14 : forwardRow 2 f ⟨14,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br14 : backwardRow 2 g ⟨14,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr15 : forwardRow 2 f ⟨15,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br15 : backwardRow 2 g ⟨15,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr16 : forwardRow 2 f ⟨16,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br16 : backwardRow 2 g ⟨16,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr17 : forwardRow 2 f ⟨17,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br17 : backwardRow 2 g ⟨17,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr18 : forwardRow 2 f ⟨18,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br18 : backwardRow 2 g ⟨18,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr19 : forwardRow 2 f ⟨19,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br19 : backwardRow 2 g ⟨19,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr20 : forwardRow 2 f ⟨20,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br20 : backwardRow 2 g ⟨20,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr21 : forwardRow 2 f ⟨21,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br21 : backwardRow 2 g ⟨21,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr22 : forwardRow 2 f ⟨22,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br22 : backwardRow 2 g ⟨22,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr23 : forwardRow 2 f ⟨23,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br23 : backwardRow 2 g ⟨23,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr24 : forwardRow 2 f ⟨24,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br24 : backwardRow 2 g ⟨24,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr25 : forwardRow 2 f ⟨25,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br25 : backwardRow 2 g ⟨25,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr26 : forwardRow 2 f ⟨26,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br26 : backwardRow 2 g ⟨26,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr27 : forwardRow 2 f ⟨27,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br27 : backwardRow 2 g ⟨27,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr28 : forwardRow 2 f ⟨28,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br28 : backwardRow 2 g ⟨28,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr29 : forwardRow 2 f ⟨29,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br29 : backwardRow 2 g ⟨29,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr30 : forwardRow 2 f ⟨30,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br30 : backwardRow 2 g ⟨30,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr31 : forwardRow 2 f ⟨31,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br31 : backwardRow 2 g ⟨31,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr32 : forwardRow 2 f ⟨32,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br32 : backwardRow 2 g ⟨32,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr33 : forwardRow 2 f ⟨33,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br33 : backwardRow 2 g ⟨33,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr34 : forwardRow 2 f ⟨34,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br34 : backwardRow 2 g ⟨34,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr35 : forwardRow 2 f ⟨35,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br35 : backwardRow 2 g ⟨35,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr36 : forwardRow 2 f ⟨36,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br36 : backwardRow 2 g ⟨36,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr37 : forwardRow 2 f ⟨37,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br37 : backwardRow 2 g ⟨37,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr38 : forwardRow 2 f ⟨38,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br38 : backwardRow 2 g ⟨38,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr39 : forwardRow 2 f ⟨39,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br39 : backwardRow 2 g ⟨39,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr40 : forwardRow 2 f ⟨40,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br40 : backwardRow 2 g ⟨40,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr41 : forwardRow 2 f ⟨41,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br41 : backwardRow 2 g ⟨41,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr42 : forwardRow 2 f ⟨42,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br42 : backwardRow 2 g ⟨42,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr43 : forwardRow 2 f ⟨43,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br43 : backwardRow 2 g ⟨43,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr44 : forwardRow 2 f ⟨44,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br44 : backwardRow 2 g ⟨44,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr45 : forwardRow 2 f ⟨45,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br45 : backwardRow 2 g ⟨45,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr46 : forwardRow 2 f ⟨46,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br46 : backwardRow 2 g ⟨46,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr47 : forwardRow 2 f ⟨47,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br47 : backwardRow 2 g ⟨47,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr48 : forwardRow 2 f ⟨48,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br48 : backwardRow 2 g ⟨48,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr49 : forwardRow 2 f ⟨49,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br49 : backwardRow 2 g ⟨49,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr50 : forwardRow 2 f ⟨50,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br50 : backwardRow 2 g ⟨50,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr51 : forwardRow 2 f ⟨51,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br51 : backwardRow 2 g ⟨51,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr52 : forwardRow 2 f ⟨52,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br52 : backwardRow 2 g ⟨52,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr53 : forwardRow 2 f ⟨53,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br53 : backwardRow 2 g ⟨53,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr54 : forwardRow 2 f ⟨54,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br54 : backwardRow 2 g ⟨54,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr55 : forwardRow 2 f ⟨55,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br55 : backwardRow 2 g ⟨55,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr56 : forwardRow 2 f ⟨56,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br56 : backwardRow 2 g ⟨56,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr57 : forwardRow 2 f ⟨57,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br57 : backwardRow 2 g ⟨57,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr58 : forwardRow 2 f ⟨58,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br58 : backwardRow 2 g ⟨58,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr59 : forwardRow 2 f ⟨59,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br59 : backwardRow 2 g ⟨59,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr60 : forwardRow 2 f ⟨60,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br60 : backwardRow 2 g ⟨60,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr61 : forwardRow 2 f ⟨61,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br61 : backwardRow 2 g ⟨61,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr62 : forwardRow 2 f ⟨62,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br62 : backwardRow 2 g ⟨62,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr63 : forwardRow 2 f ⟨63,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br63 : backwardRow 2 g ⟨63,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr64 : forwardRow 2 f ⟨64,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br64 : backwardRow 2 g ⟨64,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr65 : forwardRow 2 f ⟨65,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br65 : backwardRow 2 g ⟨65,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr66 : forwardRow 2 f ⟨66,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br66 : backwardRow 2 g ⟨66,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr67 : forwardRow 2 f ⟨67,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br67 : backwardRow 2 g ⟨67,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr68 : forwardRow 2 f ⟨68,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br68 : backwardRow 2 g ⟨68,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr69 : forwardRow 2 f ⟨69,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br69 : backwardRow 2 g ⟨69,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr70 : forwardRow 2 f ⟨70,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br70 : backwardRow 2 g ⟨70,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr71 : forwardRow 2 f ⟨71,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br71 : backwardRow 2 g ⟨71,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr72 : forwardRow 2 f ⟨72,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br72 : backwardRow 2 g ⟨72,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr73 : forwardRow 2 f ⟨73,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br73 : backwardRow 2 g ⟨73,by decide⟩  := by intro j; fin_cases j <;> decide
theorem fr74 : forwardRow 2 f ⟨74,by decide⟩  := by intro j; fin_cases j <;> decide
theorem br74 : backwardRow 2 g ⟨74,by decide⟩  := by intro j; fin_cases j <;> decide
theorem pr1 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 1 d := by intro d; fin_cases d <;> decide
theorem pr2 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 2 d := by intro d; fin_cases d <;> decide
theorem pr3 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 3 d := by intro d; fin_cases d <;> decide
theorem pr4 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 4 d := by intro d; fin_cases d <;> decide
theorem pr5 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 5 d := by intro d; fin_cases d <;> decide
theorem pr6 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 6 d := by intro d; fin_cases d <;> decide
theorem pr7 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 7 d := by intro d; fin_cases d <;> decide
theorem pr8 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 8 d := by intro d; fin_cases d <;> decide
theorem pr9 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 9 d := by intro d; fin_cases d <;> decide
theorem pr10 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 10 d := by intro d; fin_cases d <;> decide
theorem pr11 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 11 d := by intro d; fin_cases d <;> decide
theorem pr12 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 12 d := by intro d; fin_cases d <;> decide
theorem pr13 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 13 d := by intro d; fin_cases d <;> decide
theorem pr14 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 14 d := by intro d; fin_cases d <;> decide
theorem pr15 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 15 d := by intro d; fin_cases d <;> decide
theorem pr16 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 16 d := by intro d; fin_cases d <;> decide
theorem pr17 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 17 d := by intro d; fin_cases d <;> decide
theorem pr18 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 18 d := by intro d; fin_cases d <;> decide
theorem pr19 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 19 d := by intro d; fin_cases d <;> decide
theorem pr20 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 20 d := by intro d; fin_cases d <;> decide
theorem pr21 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 21 d := by intro d; fin_cases d <;> decide
theorem pr22 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 22 d := by intro d; fin_cases d <;> decide
theorem pr23 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 23 d := by intro d; fin_cases d <;> decide
theorem pr24 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 24 d := by intro d; fin_cases d <;> decide
theorem pr25 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 25 d := by intro d; fin_cases d <;> decide
theorem pr26 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 26 d := by intro d; fin_cases d <;> decide
theorem pr27 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 27 d := by intro d; fin_cases d <;> decide
theorem pr28 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 28 d := by intro d; fin_cases d <;> decide
theorem pr29 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 29 d := by intro d; fin_cases d <;> decide
theorem pr30 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 30 d := by intro d; fin_cases d <;> decide
theorem pr31 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 31 d := by intro d; fin_cases d <;> decide
theorem pr32 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 32 d := by intro d; fin_cases d <;> decide
theorem pr33 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 33 d := by intro d; fin_cases d <;> decide
theorem pr34 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 34 d := by intro d; fin_cases d <;> decide
theorem pr35 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 35 d := by intro d; fin_cases d <;> decide
theorem pr36 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 36 d := by intro d; fin_cases d <;> decide
theorem pr37 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 37 d := by intro d; fin_cases d <;> decide
theorem pr38 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 38 d := by intro d; fin_cases d <;> decide
theorem pr39 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 39 d := by intro d; fin_cases d <;> decide
theorem pr40 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 40 d := by intro d; fin_cases d <;> decide
theorem pr41 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 41 d := by intro d; fin_cases d <;> decide
theorem pr42 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 42 d := by intro d; fin_cases d <;> decide
theorem pr43 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 43 d := by intro d; fin_cases d <;> decide
theorem pr44 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 44 d := by intro d; fin_cases d <;> decide
theorem pr45 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 45 d := by intro d; fin_cases d <;> decide
theorem pr46 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 46 d := by intro d; fin_cases d <;> decide
theorem pr47 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 47 d := by intro d; fin_cases d <;> decide
theorem pr48 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 48 d := by intro d; fin_cases d <;> decide
theorem pr49 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 49 d := by intro d; fin_cases d <;> decide
theorem pr50 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 50 d := by intro d; fin_cases d <;> decide
theorem pr51 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 51 d := by intro d; fin_cases d <;> decide
theorem pr52 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 52 d := by intro d; fin_cases d <;> decide
theorem pr53 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 53 d := by intro d; fin_cases d <;> decide
theorem pr54 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 54 d := by intro d; fin_cases d <;> decide
theorem pr55 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 55 d := by intro d; fin_cases d <;> decide
theorem pr56 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 56 d := by intro d; fin_cases d <;> decide
theorem pr57 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 57 d := by intro d; fin_cases d <;> decide
theorem pr58 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 58 d := by intro d; fin_cases d <;> decide
theorem pr59 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 59 d := by intro d; fin_cases d <;> decide
theorem pr60 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 60 d := by intro d; fin_cases d <;> decide
theorem pr61 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 61 d := by intro d; fin_cases d <;> decide
theorem pr62 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 62 d := by intro d; fin_cases d <;> decide
theorem pr63 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 63 d := by intro d; fin_cases d <;> decide
theorem pr64 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 64 d := by intro d; fin_cases d <;> decide
theorem pr65 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 65 d := by intro d; fin_cases d <;> decide
theorem pr66 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 66 d := by intro d; fin_cases d <;> decide
theorem pr67 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 67 d := by intro d; fin_cases d <;> decide
theorem pr68 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 68 d := by intro d; fin_cases d <;> decide
theorem pr69 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 69 d := by intro d; fin_cases d <;> decide
theorem pr70 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 70 d := by intro d; fin_cases d <;> decide
theorem pr71 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 71 d := by intro d; fin_cases d <;> decide
theorem pr72 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 72 d := by intro d; fin_cases d <;> decide
theorem pr73 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 73 d := by intro d; fin_cases d <;> decide
theorem pr74 : ∀d : Fin 7, pairCheck f g 598343347382745056736743181512784 208728163325704427484417627537132 74 d := by intro d; fin_cases d <;> decide
def checked : Checked 2 where
  f := f
  g := g
  E := 598343347382745056736743181512784
  N := 208728163325704427484417627537132
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
    exact fr65
    exact fr66
    exact fr67
    exact fr68
    exact fr69
    exact fr70
    exact fr71
    exact fr72
    exact fr73
    exact fr74
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
    exact br65
    exact br66
    exact br67
    exact br68
    exact br69
    exact br70
    exact br71
    exact br72
    exact br73
    exact br74
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
    exact pr65
    exact pr66
    exact pr67
    exact pr68
    exact pr69
    exact pr70
    exact pr71
    exact pr72
    exact pr73
    exact pr74
end OneThird.GridData4_2
