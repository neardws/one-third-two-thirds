module
public import OneThird.FiniteTransfer7
@[expose] public section
namespace OneThird.FiniteTransferData7_3
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
def p34 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![81002455633908, 206421492858696, 331840530083484, 331840530083484, 331840530083484, 0]
def p35 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![287423948492604, 619264478576088, 951105008659572, 1282945538743056, 0, 0]
def p36 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![619264478576088, 1570369487235660, 2853315025978716, 2853315025978716, 0, 0]
def p37 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1570369487235660, 4423684513214376, 7276999539193092, 7276999539193092, 0, 0]
def p38 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![5994054000450036, 13271053539643128, 20548053078836220, 20548053078836220, 0, 0]
def p39 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![13271053539643128, 33819106618479348, 54367159697315568, 54367159697315568, 54367159697315568, 0]
def p40 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![47090160158122476, 101457319855438044, 155824479552753612, 210191639250069180, 0, 0]
def p41 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![101457319855438044, 257281799408191656, 467473438658260836, 467473438658260836, 0, 0]
def p42 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![257281799408191656, 724755238066452492, 1192228676724713328, 1192228676724713328, 0, 0]
def p43 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![982037037474644148, 2174265714199357476, 3366494390924070804, 3366494390924070804, 0, 0]
def p44 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![2174265714199357476, 5540760105123428280, 8907254496047499084, 8907254496047499084, 0, 0]
def p45 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![5540760105123428280, 14448014601170927364, 23355269097218426448, 23355269097218426448, 23355269097218426448, 0]
def p46 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![19988774706294355644, 43344043803512782092, 66699312900731208540, 90054581997949634988, 0, 0]
def p47 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![43344043803512782092, 110043356704243990632, 200097938702193625620, 200097938702193625620, 0, 0]
def p48 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![110043356704243990632, 310141295406437616252, 510239234108631241872, 510239234108631241872, 0, 0]
def p49 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![420184652110681606884, 930423886219312848756, 1440663120327944090628, 1440663120327944090628, 0, 0]
def p50 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![930423886219312848756, 2371087006547256939384, 3811750126875201030012, 3811750126875201030012, 3811750126875201030012, 0]
def p51 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![3301510892766569788140, 7113261019641770818152, 10925011146516971848164, 14736761273392172878176, 0, 0]
def p52 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![7113261019641770818152, 18038272166158742666316, 32775033439550915544492, 32775033439550915544492, 0, 0]
def p53 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![18038272166158742666316, 50813305605709658210808, 83588339045260573755300, 83588339045260573755300, 0, 0]
def p54 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![68851577771868400877124, 152439916817128974632424, 236028255862389548387724, 236028255862389548387724, 0, 0]
def p55 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![152439916817128974632424, 388468172679518523020148, 624496428541908071407872, 624496428541908071407872, 624496428541908071407872, 0]
def p56 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![540908089496647497652572, 1165404518038555569060444, 1789900946580463640468316, 2414397375122371711876188, 0, 0]
def p57 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1165404518038555569060444, 2955305464619019209528760, 5369702839741390921404948, 5369702839741390921404948, 0, 0]
def p58 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![2955305464619019209528760, 8325008304360410130933708, 13694711144101801052338656, 13694711144101801052338656, 0, 0]
def p59 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![11280313768979429340462468, 24975024913081230392801124, 38669736057183031445139780, 38669736057183031445139780, 0, 0]
def p60 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![24975024913081230392801124, 63644760970264261837940904, 102314497027447293283080684, 102314497027447293283080684, 102314497027447293283080684, 0]
def p61 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![88619785883345492230742028, 190934282910792785513822712, 293248779938240078796903396, 395563276965687372079984080, 0, 0]
def p62 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![190934282910792785513822712, 484183062849032864310726108, 879746339814720236390710188, 879746339814720236390710188, 0, 0]
def p63 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![484183062849032864310726108, 1363929402663753100701436296, 2243675742478473337092146484, 2243675742478473337092146484, 0, 0]
def p64 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1848112465512785965012162404, 4091788207991259302104308888, 6335463950469732639196455372, 6335463950469732639196455372, 0, 0]
def p65 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![4091788207991259302104308888, 10427252158460991941300764260, 16762716108930724580497219632, 16762716108930724580497219632, 16762716108930724580497219632, 0]
def p66 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![14519040366452251243405073148, 31281756475382975823902292780, 48044472584313700404399512412, 64807188693244424984896732044, 0, 0]
def p67 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![31281756475382975823902292780, 79326229059696676228301805192, 144133417752941101213198537236, 144133417752941101213198537236, 0, 0]
def p68 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![79326229059696676228301805192, 223459646812637777441500342428, 367593064565578878654698879664, 367593064565578878654698879664, 0, 0]
def p69 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![302785875872334453669802147620, 670378940437913332324501027284, 1037972005003492210979199906948, 1037972005003492210979199906948, 1037972005003492210979199906948, 0]
def p70 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![670378940437913332324501027284, 1708350945441405543303700934232, 2746322950444897754282900841180, 3784294955448389965262100748128, 0, 0]
def p71 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![2378729885879318875628201961516, 5125052836324216629911102802696, 8909347791772606595173203550824, 8909347791772606595173203550824, 0, 0]
def p72 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![5125052836324216629911102802696, 14034400628096823225084306353520, 22943748419869429820257509904344, 22943748419869429820257509904344, 0, 0]
def p73 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![19159453464421039854995409156216, 42103201884290469675252919060560, 65046950304159899495510428964904, 65046950304159899495510428964904, 65046950304159899495510428964904, 0]
def p74 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![42103201884290469675252919060560, 107150152188450369170763348025464, 172197102492610268666273776990368, 237244052796770168161784205955272, 0, 0]
def p75 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![149253354072740838846016267086024, 321450456565351107512290044076392, 558694509362121275674074250031664, 558694509362121275674074250031664, 0, 0]
def p76 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![321450456565351107512290044076392, 880144965927472383186364294108056, 1438839475289593658860438544139720, 1438839475289593658860438544139720, 0, 0]
def p77 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1201595422492823490698654338184448, 2640434897782417149559092882324168, 4079274373072010808419531426463888, 4079274373072010808419531426463888, 4079274373072010808419531426463888, 0]
def p78 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![2640434897782417149559092882324168, 6719709270854427957978624308788056, 10798983643926438766398155735251944, 14878258016998449574817687161715832, 0, 0]
def p79 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![9360144168636845107537717191112224, 20159127812563283873935872926364168, 35037385829561733448753560088080000, 35037385829561733448753560088080000, 35037385829561733448753560088080000, 0]
def p80 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![20159127812563283873935872926364168, 55196513642125017322689433014444168, 90233899471686750771442993102524168, 125271285301248484220196553190604168, 0, 0]
def p81 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![75355641454688301196625305940808336, 165589540926375051968068299043332504, 290860826227623536188264852233936672, 290860826227623536188264852233936672, 0, 0]
def p82 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![165589540926375051968068299043332504, 456450367153998588156333151277269176, 747311193381622124344598003511205848, 747311193381622124344598003511205848, 0, 0]
def p83 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![622039908080373640124401450320601680, 1369351101461995764468999453831807528, 2116662294843617888813597457343013376, 2116662294843617888813597457343013376, 0, 0]
def p84 : Matrix (Fin 1) (Fin 6) ℤ := fun _ => ![1369351101461995764468999453831807528, 3486013396305613653282596911174820904, 5602675691149231542096194368517834280, 5602675691149231542096194368517834280, 0, 0]
def g0 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 0, 0, 16060715880066072501943985102042296992, 5602675691149231542096194368517834280, 0] d
def g1 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 0, 10458040188916840959847790733524462712, 5602675691149231542096194368517834280, 2116662294843617888813597457343013376, 0] d
def g2 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 4855364497767609417751596365006628432, 3486013396305613653282596911174820904, 2116662294843617888813597457343013376, 747311193381622124344598003511205848, 0] d
def g3 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![1369351101461995764468999453831807528, 1369351101461995764468999453831807528, 1369351101461995764468999453831807528, 747311193381622124344598003511205848, 290860826227623536188264852233936672, 0] d
def g4 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 622039908080373640124401450320601680, 456450367153998588156333151277269176, 290860826227623536188264852233936672, 125271285301248484220196553190604168, 35037385829561733448753560088080000] d
def g5 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![165589540926375051968068299043332504, 165589540926375051968068299043332504, 165589540926375051968068299043332504, 90233899471686750771442993102524168, 35037385829561733448753560088080000, 0] d
def g6 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 75355641454688301196625305940808336, 55196513642125017322689433014444168, 35037385829561733448753560088080000, 14878258016998449574817687161715832, 4079274373072010808419531426463888] d
def g7 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![20159127812563283873935872926364168, 20159127812563283873935872926364168, 20159127812563283873935872926364168, 10798983643926438766398155735251944, 4079274373072010808419531426463888, 0] d
def g8 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 9360144168636845107537717191112224, 6719709270854427957978624308788056, 4079274373072010808419531426463888, 1438839475289593658860438544139720, 0] d
def g9 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![2640434897782417149559092882324168, 2640434897782417149559092882324168, 2640434897782417149559092882324168, 1438839475289593658860438544139720, 558694509362121275674074250031664, 0] d
def g10 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1201595422492823490698654338184448, 880144965927472383186364294108056, 558694509362121275674074250031664, 237244052796770168161784205955272, 65046950304159899495510428964904] d
def g11 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![321450456565351107512290044076392, 321450456565351107512290044076392, 321450456565351107512290044076392, 172197102492610268666273776990368, 65046950304159899495510428964904, 0] d
def g12 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 149253354072740838846016267086024, 107150152188450369170763348025464, 65046950304159899495510428964904, 22943748419869429820257509904344, 0] d
def g13 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![42103201884290469675252919060560, 42103201884290469675252919060560, 42103201884290469675252919060560, 22943748419869429820257509904344, 8909347791772606595173203550824, 0] d
def g14 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 19159453464421039854995409156216, 14034400628096823225084306353520, 8909347791772606595173203550824, 3784294955448389965262100748128, 1037972005003492210979199906948] d
def g15 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![5125052836324216629911102802696, 5125052836324216629911102802696, 5125052836324216629911102802696, 2746322950444897754282900841180, 1037972005003492210979199906948, 0] d
def g16 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 2378729885879318875628201961516, 1708350945441405543303700934232, 1037972005003492210979199906948, 367593064565578878654698879664, 0] d
def g17 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![670378940437913332324501027284, 670378940437913332324501027284, 670378940437913332324501027284, 367593064565578878654698879664, 144133417752941101213198537236, 0] d
def g18 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 302785875872334453669802147620, 223459646812637777441500342428, 144133417752941101213198537236, 64807188693244424984896732044, 16762716108930724580497219632] d
def g19 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![79326229059696676228301805192, 79326229059696676228301805192, 79326229059696676228301805192, 48044472584313700404399512412, 16762716108930724580497219632, 0] d
def g20 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 31281756475382975823902292780, 31281756475382975823902292780, 16762716108930724580497219632, 6335463950469732639196455372, 0] d
def g21 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 14519040366452251243405073148, 10427252158460991941300764260, 6335463950469732639196455372, 2243675742478473337092146484, 0] d
def g22 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![4091788207991259302104308888, 4091788207991259302104308888, 4091788207991259302104308888, 2243675742478473337092146484, 879746339814720236390710188, 0] d
def g23 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1848112465512785965012162404, 1363929402663753100701436296, 879746339814720236390710188, 395563276965687372079984080, 102314497027447293283080684] d
def g24 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![484183062849032864310726108, 484183062849032864310726108, 484183062849032864310726108, 293248779938240078796903396, 102314497027447293283080684, 0] d
def g25 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 190934282910792785513822712, 190934282910792785513822712, 102314497027447293283080684, 38669736057183031445139780, 0] d
def g26 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 88619785883345492230742028, 63644760970264261837940904, 38669736057183031445139780, 13694711144101801052338656, 0] d
def g27 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![24975024913081230392801124, 24975024913081230392801124, 24975024913081230392801124, 13694711144101801052338656, 5369702839741390921404948, 0] d
def g28 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 11280313768979429340462468, 8325008304360410130933708, 5369702839741390921404948, 2414397375122371711876188, 624496428541908071407872] d
def g29 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![2955305464619019209528760, 2955305464619019209528760, 2955305464619019209528760, 1789900946580463640468316, 624496428541908071407872, 0] d
def g30 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1165404518038555569060444, 1165404518038555569060444, 624496428541908071407872, 236028255862389548387724, 0] d
def g31 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 540908089496647497652572, 388468172679518523020148, 236028255862389548387724, 83588339045260573755300, 0] d
def g32 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![152439916817128974632424, 152439916817128974632424, 152439916817128974632424, 83588339045260573755300, 32775033439550915544492, 0] d
def g33 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 68851577771868400877124, 50813305605709658210808, 32775033439550915544492, 14736761273392172878176, 3811750126875201030012] d
def g34 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![18038272166158742666316, 18038272166158742666316, 18038272166158742666316, 10925011146516971848164, 3811750126875201030012, 0] d
def g35 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 7113261019641770818152, 7113261019641770818152, 3811750126875201030012, 1440663120327944090628, 0] d
def g36 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 3301510892766569788140, 2371087006547256939384, 1440663120327944090628, 510239234108631241872, 0] d
def g37 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![930423886219312848756, 930423886219312848756, 930423886219312848756, 510239234108631241872, 200097938702193625620, 0] d
def g38 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 420184652110681606884, 310141295406437616252, 200097938702193625620, 90054581997949634988, 23355269097218426448] d
def g39 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![110043356704243990632, 110043356704243990632, 110043356704243990632, 66699312900731208540, 23355269097218426448, 0] d
def g40 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 43344043803512782092, 43344043803512782092, 23355269097218426448, 8907254496047499084, 0] d
def g41 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 19988774706294355644, 14448014601170927364, 8907254496047499084, 3366494390924070804, 0] d
def g42 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![5540760105123428280, 5540760105123428280, 5540760105123428280, 3366494390924070804, 1192228676724713328, 0] d
def g43 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 2174265714199357476, 2174265714199357476, 1192228676724713328, 467473438658260836, 0] d
def g44 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 982037037474644148, 724755238066452492, 467473438658260836, 210191639250069180, 54367159697315568] d
def g45 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![257281799408191656, 257281799408191656, 257281799408191656, 155824479552753612, 54367159697315568, 0] d
def g46 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 101457319855438044, 101457319855438044, 54367159697315568, 20548053078836220, 0] d
def g47 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 47090160158122476, 33819106618479348, 20548053078836220, 7276999539193092, 0] d
def g48 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![13271053539643128, 13271053539643128, 13271053539643128, 7276999539193092, 2853315025978716, 0] d
def g49 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 5994054000450036, 4423684513214376, 2853315025978716, 1282945538743056, 331840530083484] d
def g50 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![1570369487235660, 1570369487235660, 1570369487235660, 951105008659572, 331840530083484, 0] d
def g51 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 619264478576088, 619264478576088, 331840530083484, 125419037224788, 0] d
def g52 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 287423948492604, 206421492858696, 125419037224788, 44416581590880, 0] d
def g53 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![81002455633908, 81002455633908, 81002455633908, 44416581590880, 17415763046244, 0] d
def g54 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 36585874043028, 27000818544636, 17415763046244, 7830707547852, 2025453199104] d
def g55 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![9585055498392, 9585055498392, 9585055498392, 5805254348748, 2025453199104, 0] d
def g56 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 3779801149644, 3779801149644, 2025453199104, 765519482556, 0] d
def g57 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1754347950540, 1259933716548, 765519482556, 271105248564, 0] d
def g58 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![494414233992, 494414233992, 494414233992, 271105248564, 106300503900, 0] d
def g59 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 223308985428, 164804744664, 106300503900, 47796263136, 12362761836] d
def g60 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![58504240764, 58504240764, 58504240764, 35433501300, 12362761836, 0] d
def g61 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 23070739464, 23070739464, 12362761836, 4672515348, 0] d
def g62 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 10707977628, 7690246488, 4672515348, 1654784208, 0] d
def g63 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![3017731140, 3017731140, 3017731140, 1654784208, 648873828, 0] d
def g64 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1362946932, 1005910380, 648873828, 291837276, 75546000] d
def g65 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![357036552, 357036552, 357036552, 216291276, 75546000, 0] d
def g66 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 140745276, 140745276, 75546000, 28630908, 0] d
def g67 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 65199276, 46915092, 28630908, 10346724, 0] d
def g68 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![18284184, 18284184, 18284184, 10346724, 4653540, 1204632] d
def g69 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 7937460, 5693184, 3448908, 1204632, 0] d
def g70 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![2244276, 2244276, 2244276, 1204632, 456540, 0] d
def g71 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 1039644, 748092, 456540, 164988, 0] d
def g72 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![291552, 291552, 291552, 164988, 74208, 19212] d
def g73 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 126564, 90780, 54996, 19212, 0] d
def g74 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![35784, 35784, 35784, 19212, 7284, 0] d
def g75 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 16572, 11928, 7284, 2640, 0] d
def g76 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![4644, 4644, 4644, 2640, 1198, 318] d
def g77 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 2004, 1442, 880, 318, 0] d
def g78 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![562, 562, 562, 318, 143, 37] d
def g79 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 244, 175, 106, 37, 0] d
def g80 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![69, 69, 69, 37, 14, 0] d
def g81 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 32, 23, 14, 5, 0] d
def g82 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![9, 9, 9, 5, 2, 0] d
def g83 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 4, 3, 2, 1, 0] d
def g84 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![1, 1, 1, 1, 0, 0] d
def g85 : Matrix (Fin 6) (Fin 1) ℤ := fun d _ => ![0, 0, 1, 0, 0, 0] d
theorem fr0 : p1=p0*rowMatrix (rowMask 3 0) := by decide
theorem fr1 : p2=p1*rowMatrix (rowMask 3 1) := by decide
theorem fr2 : p3=p2*rowMatrix (rowMask 3 2) := by decide
theorem fr3 : p4=p3*rowMatrix (rowMask 3 3) := by decide
theorem fr4 : p5=p4*rowMatrix (rowMask 3 4) := by decide
theorem fr5 : p6=p5*rowMatrix (rowMask 3 5) := by decide
theorem fr6 : p7=p6*rowMatrix (rowMask 3 6) := by decide
theorem fr7 : p8=p7*rowMatrix (rowMask 3 7) := by decide
theorem fr8 : p9=p8*rowMatrix (rowMask 3 8) := by decide
theorem fr9 : p10=p9*rowMatrix (rowMask 3 9) := by decide
theorem fr10 : p11=p10*rowMatrix (rowMask 3 10) := by decide
theorem fr11 : p12=p11*rowMatrix (rowMask 3 11) := by decide
theorem fr12 : p13=p12*rowMatrix (rowMask 3 12) := by decide
theorem fr13 : p14=p13*rowMatrix (rowMask 3 13) := by decide
theorem fr14 : p15=p14*rowMatrix (rowMask 3 14) := by decide
theorem fr15 : p16=p15*rowMatrix (rowMask 3 15) := by decide
theorem fr16 : p17=p16*rowMatrix (rowMask 3 16) := by decide
theorem fr17 : p18=p17*rowMatrix (rowMask 3 17) := by decide
theorem fr18 : p19=p18*rowMatrix (rowMask 3 18) := by decide
theorem fr19 : p20=p19*rowMatrix (rowMask 3 19) := by decide
theorem fr20 : p21=p20*rowMatrix (rowMask 3 20) := by decide
theorem fr21 : p22=p21*rowMatrix (rowMask 3 21) := by decide
theorem fr22 : p23=p22*rowMatrix (rowMask 3 22) := by decide
theorem fr23 : p24=p23*rowMatrix (rowMask 3 23) := by decide
theorem fr24 : p25=p24*rowMatrix (rowMask 3 24) := by decide
theorem fr25 : p26=p25*rowMatrix (rowMask 3 25) := by decide
theorem fr26 : p27=p26*rowMatrix (rowMask 3 26) := by decide
theorem fr27 : p28=p27*rowMatrix (rowMask 3 27) := by decide
theorem fr28 : p29=p28*rowMatrix (rowMask 3 28) := by decide
theorem fr29 : p30=p29*rowMatrix (rowMask 3 29) := by decide
theorem fr30 : p31=p30*rowMatrix (rowMask 3 30) := by decide
theorem fr31 : p32=p31*rowMatrix (rowMask 3 31) := by decide
theorem fr32 : p33=p32*rowMatrix (rowMask 3 32) := by decide
theorem fr33 : p34=p33*rowMatrix (rowMask 3 33) := by decide
theorem fr34 : p35=p34*rowMatrix (rowMask 3 34) := by decide
theorem fr35 : p36=p35*rowMatrix (rowMask 3 35) := by decide
theorem fr36 : p37=p36*rowMatrix (rowMask 3 36) := by decide
theorem fr37 : p38=p37*rowMatrix (rowMask 3 37) := by decide
theorem fr38 : p39=p38*rowMatrix (rowMask 3 38) := by decide
theorem fr39 : p40=p39*rowMatrix (rowMask 3 39) := by decide
theorem fr40 : p41=p40*rowMatrix (rowMask 3 40) := by decide
theorem fr41 : p42=p41*rowMatrix (rowMask 3 41) := by decide
theorem fr42 : p43=p42*rowMatrix (rowMask 3 42) := by decide
theorem fr43 : p44=p43*rowMatrix (rowMask 3 43) := by decide
theorem fr44 : p45=p44*rowMatrix (rowMask 3 44) := by decide
theorem fr45 : p46=p45*rowMatrix (rowMask 3 45) := by decide
theorem fr46 : p47=p46*rowMatrix (rowMask 3 46) := by decide
theorem fr47 : p48=p47*rowMatrix (rowMask 3 47) := by decide
theorem fr48 : p49=p48*rowMatrix (rowMask 3 48) := by decide
theorem fr49 : p50=p49*rowMatrix (rowMask 3 49) := by decide
theorem fr50 : p51=p50*rowMatrix (rowMask 3 50) := by decide
theorem fr51 : p52=p51*rowMatrix (rowMask 3 51) := by decide
theorem fr52 : p53=p52*rowMatrix (rowMask 3 52) := by decide
theorem fr53 : p54=p53*rowMatrix (rowMask 3 53) := by decide
theorem fr54 : p55=p54*rowMatrix (rowMask 3 54) := by decide
theorem fr55 : p56=p55*rowMatrix (rowMask 3 55) := by decide
theorem fr56 : p57=p56*rowMatrix (rowMask 3 56) := by decide
theorem fr57 : p58=p57*rowMatrix (rowMask 3 57) := by decide
theorem fr58 : p59=p58*rowMatrix (rowMask 3 58) := by decide
theorem fr59 : p60=p59*rowMatrix (rowMask 3 59) := by decide
theorem fr60 : p61=p60*rowMatrix (rowMask 3 60) := by decide
theorem fr61 : p62=p61*rowMatrix (rowMask 3 61) := by decide
theorem fr62 : p63=p62*rowMatrix (rowMask 3 62) := by decide
theorem fr63 : p64=p63*rowMatrix (rowMask 3 63) := by decide
theorem fr64 : p65=p64*rowMatrix (rowMask 3 64) := by decide
theorem fr65 : p66=p65*rowMatrix (rowMask 3 65) := by decide
theorem fr66 : p67=p66*rowMatrix (rowMask 3 66) := by decide
theorem fr67 : p68=p67*rowMatrix (rowMask 3 67) := by decide
theorem fr68 : p69=p68*rowMatrix (rowMask 3 68) := by decide
theorem fr69 : p70=p69*rowMatrix (rowMask 3 69) := by decide
theorem fr70 : p71=p70*rowMatrix (rowMask 3 70) := by decide
theorem fr71 : p72=p71*rowMatrix (rowMask 3 71) := by decide
theorem fr72 : p73=p72*rowMatrix (rowMask 3 72) := by decide
theorem fr73 : p74=p73*rowMatrix (rowMask 3 73) := by decide
theorem fr74 : p75=p74*rowMatrix (rowMask 3 74) := by decide
theorem fr75 : p76=p75*rowMatrix (rowMask 3 75) := by decide
theorem fr76 : p77=p76*rowMatrix (rowMask 3 76) := by decide
theorem fr77 : p78=p77*rowMatrix (rowMask 3 77) := by decide
theorem fr78 : p79=p78*rowMatrix (rowMask 3 78) := by decide
theorem fr79 : p80=p79*rowMatrix (rowMask 3 79) := by decide
theorem fr80 : p81=p80*rowMatrix (rowMask 3 80) := by decide
theorem fr81 : p82=p81*rowMatrix (rowMask 3 81) := by decide
theorem fr82 : p83=p82*rowMatrix (rowMask 3 82) := by decide
theorem fr83 : p84=p83*rowMatrix (rowMask 3 83) := by decide
theorem br0 : g0=rowMatrix (rowMask 3 0)*g1 := by decide
theorem br1 : g1=rowMatrix (rowMask 3 1)*g2 := by decide
theorem br2 : g2=rowMatrix (rowMask 3 2)*g3 := by decide
theorem br3 : g3=rowMatrix (rowMask 3 3)*g4 := by decide
theorem br4 : g4=rowMatrix (rowMask 3 4)*g5 := by decide
theorem br5 : g5=rowMatrix (rowMask 3 5)*g6 := by decide
theorem br6 : g6=rowMatrix (rowMask 3 6)*g7 := by decide
theorem br7 : g7=rowMatrix (rowMask 3 7)*g8 := by decide
theorem br8 : g8=rowMatrix (rowMask 3 8)*g9 := by decide
theorem br9 : g9=rowMatrix (rowMask 3 9)*g10 := by decide
theorem br10 : g10=rowMatrix (rowMask 3 10)*g11 := by decide
theorem br11 : g11=rowMatrix (rowMask 3 11)*g12 := by decide
theorem br12 : g12=rowMatrix (rowMask 3 12)*g13 := by decide
theorem br13 : g13=rowMatrix (rowMask 3 13)*g14 := by decide
theorem br14 : g14=rowMatrix (rowMask 3 14)*g15 := by decide
theorem br15 : g15=rowMatrix (rowMask 3 15)*g16 := by decide
theorem br16 : g16=rowMatrix (rowMask 3 16)*g17 := by decide
theorem br17 : g17=rowMatrix (rowMask 3 17)*g18 := by decide
theorem br18 : g18=rowMatrix (rowMask 3 18)*g19 := by decide
theorem br19 : g19=rowMatrix (rowMask 3 19)*g20 := by decide
theorem br20 : g20=rowMatrix (rowMask 3 20)*g21 := by decide
theorem br21 : g21=rowMatrix (rowMask 3 21)*g22 := by decide
theorem br22 : g22=rowMatrix (rowMask 3 22)*g23 := by decide
theorem br23 : g23=rowMatrix (rowMask 3 23)*g24 := by decide
theorem br24 : g24=rowMatrix (rowMask 3 24)*g25 := by decide
theorem br25 : g25=rowMatrix (rowMask 3 25)*g26 := by decide
theorem br26 : g26=rowMatrix (rowMask 3 26)*g27 := by decide
theorem br27 : g27=rowMatrix (rowMask 3 27)*g28 := by decide
theorem br28 : g28=rowMatrix (rowMask 3 28)*g29 := by decide
theorem br29 : g29=rowMatrix (rowMask 3 29)*g30 := by decide
theorem br30 : g30=rowMatrix (rowMask 3 30)*g31 := by decide
theorem br31 : g31=rowMatrix (rowMask 3 31)*g32 := by decide
theorem br32 : g32=rowMatrix (rowMask 3 32)*g33 := by decide
theorem br33 : g33=rowMatrix (rowMask 3 33)*g34 := by decide
theorem br34 : g34=rowMatrix (rowMask 3 34)*g35 := by decide
theorem br35 : g35=rowMatrix (rowMask 3 35)*g36 := by decide
theorem br36 : g36=rowMatrix (rowMask 3 36)*g37 := by decide
theorem br37 : g37=rowMatrix (rowMask 3 37)*g38 := by decide
theorem br38 : g38=rowMatrix (rowMask 3 38)*g39 := by decide
theorem br39 : g39=rowMatrix (rowMask 3 39)*g40 := by decide
theorem br40 : g40=rowMatrix (rowMask 3 40)*g41 := by decide
theorem br41 : g41=rowMatrix (rowMask 3 41)*g42 := by decide
theorem br42 : g42=rowMatrix (rowMask 3 42)*g43 := by decide
theorem br43 : g43=rowMatrix (rowMask 3 43)*g44 := by decide
theorem br44 : g44=rowMatrix (rowMask 3 44)*g45 := by decide
theorem br45 : g45=rowMatrix (rowMask 3 45)*g46 := by decide
theorem br46 : g46=rowMatrix (rowMask 3 46)*g47 := by decide
theorem br47 : g47=rowMatrix (rowMask 3 47)*g48 := by decide
theorem br48 : g48=rowMatrix (rowMask 3 48)*g49 := by decide
theorem br49 : g49=rowMatrix (rowMask 3 49)*g50 := by decide
theorem br50 : g50=rowMatrix (rowMask 3 50)*g51 := by decide
theorem br51 : g51=rowMatrix (rowMask 3 51)*g52 := by decide
theorem br52 : g52=rowMatrix (rowMask 3 52)*g53 := by decide
theorem br53 : g53=rowMatrix (rowMask 3 53)*g54 := by decide
theorem br54 : g54=rowMatrix (rowMask 3 54)*g55 := by decide
theorem br55 : g55=rowMatrix (rowMask 3 55)*g56 := by decide
theorem br56 : g56=rowMatrix (rowMask 3 56)*g57 := by decide
theorem br57 : g57=rowMatrix (rowMask 3 57)*g58 := by decide
theorem br58 : g58=rowMatrix (rowMask 3 58)*g59 := by decide
theorem br59 : g59=rowMatrix (rowMask 3 59)*g60 := by decide
theorem br60 : g60=rowMatrix (rowMask 3 60)*g61 := by decide
theorem br61 : g61=rowMatrix (rowMask 3 61)*g62 := by decide
theorem br62 : g62=rowMatrix (rowMask 3 62)*g63 := by decide
theorem br63 : g63=rowMatrix (rowMask 3 63)*g64 := by decide
theorem br64 : g64=rowMatrix (rowMask 3 64)*g65 := by decide
theorem br65 : g65=rowMatrix (rowMask 3 65)*g66 := by decide
theorem br66 : g66=rowMatrix (rowMask 3 66)*g67 := by decide
theorem br67 : g67=rowMatrix (rowMask 3 67)*g68 := by decide
theorem br68 : g68=rowMatrix (rowMask 3 68)*g69 := by decide
theorem br69 : g69=rowMatrix (rowMask 3 69)*g70 := by decide
theorem br70 : g70=rowMatrix (rowMask 3 70)*g71 := by decide
theorem br71 : g71=rowMatrix (rowMask 3 71)*g72 := by decide
theorem br72 : g72=rowMatrix (rowMask 3 72)*g73 := by decide
theorem br73 : g73=rowMatrix (rowMask 3 73)*g74 := by decide
theorem br74 : g74=rowMatrix (rowMask 3 74)*g75 := by decide
theorem br75 : g75=rowMatrix (rowMask 3 75)*g76 := by decide
theorem br76 : g76=rowMatrix (rowMask 3 76)*g77 := by decide
theorem br77 : g77=rowMatrix (rowMask 3 77)*g78 := by decide
theorem br78 : g78=rowMatrix (rowMask 3 78)*g79 := by decide
theorem br79 : g79=rowMatrix (rowMask 3 79)*g80 := by decide
theorem br80 : g80=rowMatrix (rowMask 3 80)*g81 := by decide
theorem br81 : g81=rowMatrix (rowMask 3 81)*g82 := by decide
theorem br82 : g82=rowMatrix (rowMask 3 82)*g83 := by decide
theorem br83 : g83=rowMatrix (rowMask 3 83)*g84 := by decide
theorem br84 : g84=rowMatrix (rowMask 3 84)*g85 := by decide
theorem ev0 : ∀d : Fin 7,
    (p0*eventRow (rowMask 3 0) ((d.val : ℤ)-3)*g1) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 1 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev1 : ∀d : Fin 7,
    (p1*eventRow (rowMask 3 1) ((d.val : ℤ)-3)*g2) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 2 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev2 : ∀d : Fin 7,
    (p2*eventRow (rowMask 3 2) ((d.val : ℤ)-3)*g3) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 3 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev3 : ∀d : Fin 7,
    (p3*eventRow (rowMask 3 3) ((d.val : ℤ)-3)*g4) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 4 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev4 : ∀d : Fin 7,
    (p4*eventRow (rowMask 3 4) ((d.val : ℤ)-3)*g5) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 5 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev5 : ∀d : Fin 7,
    (p5*eventRow (rowMask 3 5) ((d.val : ℤ)-3)*g6) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 6 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev6 : ∀d : Fin 7,
    (p6*eventRow (rowMask 3 6) ((d.val : ℤ)-3)*g7) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 7 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev7 : ∀d : Fin 7,
    (p7*eventRow (rowMask 3 7) ((d.val : ℤ)-3)*g8) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 8 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev8 : ∀d : Fin 7,
    (p8*eventRow (rowMask 3 8) ((d.val : ℤ)-3)*g9) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 9 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev9 : ∀d : Fin 7,
    (p9*eventRow (rowMask 3 9) ((d.val : ℤ)-3)*g10) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 10 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev10 : ∀d : Fin 7,
    (p10*eventRow (rowMask 3 10) ((d.val : ℤ)-3)*g11) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 11 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev11 : ∀d : Fin 7,
    (p11*eventRow (rowMask 3 11) ((d.val : ℤ)-3)*g12) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 12 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev12 : ∀d : Fin 7,
    (p12*eventRow (rowMask 3 12) ((d.val : ℤ)-3)*g13) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 13 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev13 : ∀d : Fin 7,
    (p13*eventRow (rowMask 3 13) ((d.val : ℤ)-3)*g14) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 14 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev14 : ∀d : Fin 7,
    (p14*eventRow (rowMask 3 14) ((d.val : ℤ)-3)*g15) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 15 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev15 : ∀d : Fin 7,
    (p15*eventRow (rowMask 3 15) ((d.val : ℤ)-3)*g16) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 16 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev16 : ∀d : Fin 7,
    (p16*eventRow (rowMask 3 16) ((d.val : ℤ)-3)*g17) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 17 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev17 : ∀d : Fin 7,
    (p17*eventRow (rowMask 3 17) ((d.val : ℤ)-3)*g18) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 18 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev18 : ∀d : Fin 7,
    (p18*eventRow (rowMask 3 18) ((d.val : ℤ)-3)*g19) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 19 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev19 : ∀d : Fin 7,
    (p19*eventRow (rowMask 3 19) ((d.val : ℤ)-3)*g20) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 20 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev20 : ∀d : Fin 7,
    (p20*eventRow (rowMask 3 20) ((d.val : ℤ)-3)*g21) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 21 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev21 : ∀d : Fin 7,
    (p21*eventRow (rowMask 3 21) ((d.val : ℤ)-3)*g22) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 22 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev22 : ∀d : Fin 7,
    (p22*eventRow (rowMask 3 22) ((d.val : ℤ)-3)*g23) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 23 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev23 : ∀d : Fin 7,
    (p23*eventRow (rowMask 3 23) ((d.val : ℤ)-3)*g24) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 24 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev24 : ∀d : Fin 7,
    (p24*eventRow (rowMask 3 24) ((d.val : ℤ)-3)*g25) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 25 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev25 : ∀d : Fin 7,
    (p25*eventRow (rowMask 3 25) ((d.val : ℤ)-3)*g26) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 26 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev26 : ∀d : Fin 7,
    (p26*eventRow (rowMask 3 26) ((d.val : ℤ)-3)*g27) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 27 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev27 : ∀d : Fin 7,
    (p27*eventRow (rowMask 3 27) ((d.val : ℤ)-3)*g28) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 28 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev28 : ∀d : Fin 7,
    (p28*eventRow (rowMask 3 28) ((d.val : ℤ)-3)*g29) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 29 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev29 : ∀d : Fin 7,
    (p29*eventRow (rowMask 3 29) ((d.val : ℤ)-3)*g30) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 30 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev30 : ∀d : Fin 7,
    (p30*eventRow (rowMask 3 30) ((d.val : ℤ)-3)*g31) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 31 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev31 : ∀d : Fin 7,
    (p31*eventRow (rowMask 3 31) ((d.val : ℤ)-3)*g32) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 32 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev32 : ∀d : Fin 7,
    (p32*eventRow (rowMask 3 32) ((d.val : ℤ)-3)*g33) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 33 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev33 : ∀d : Fin 7,
    (p33*eventRow (rowMask 3 33) ((d.val : ℤ)-3)*g34) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 34 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev34 : ∀d : Fin 7,
    (p34*eventRow (rowMask 3 34) ((d.val : ℤ)-3)*g35) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 35 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev35 : ∀d : Fin 7,
    (p35*eventRow (rowMask 3 35) ((d.val : ℤ)-3)*g36) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 36 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev36 : ∀d : Fin 7,
    (p36*eventRow (rowMask 3 36) ((d.val : ℤ)-3)*g37) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 37 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev37 : ∀d : Fin 7,
    (p37*eventRow (rowMask 3 37) ((d.val : ℤ)-3)*g38) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 38 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev38 : ∀d : Fin 7,
    (p38*eventRow (rowMask 3 38) ((d.val : ℤ)-3)*g39) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 39 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev39 : ∀d : Fin 7,
    (p39*eventRow (rowMask 3 39) ((d.val : ℤ)-3)*g40) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 40 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev40 : ∀d : Fin 7,
    (p40*eventRow (rowMask 3 40) ((d.val : ℤ)-3)*g41) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 41 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev41 : ∀d : Fin 7,
    (p41*eventRow (rowMask 3 41) ((d.val : ℤ)-3)*g42) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 42 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev42 : ∀d : Fin 7,
    (p42*eventRow (rowMask 3 42) ((d.val : ℤ)-3)*g43) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 43 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev43 : ∀d : Fin 7,
    (p43*eventRow (rowMask 3 43) ((d.val : ℤ)-3)*g44) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 44 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev44 : ∀d : Fin 7,
    (p44*eventRow (rowMask 3 44) ((d.val : ℤ)-3)*g45) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 45 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev45 : ∀d : Fin 7,
    (p45*eventRow (rowMask 3 45) ((d.val : ℤ)-3)*g46) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 46 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev46 : ∀d : Fin 7,
    (p46*eventRow (rowMask 3 46) ((d.val : ℤ)-3)*g47) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 47 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev47 : ∀d : Fin 7,
    (p47*eventRow (rowMask 3 47) ((d.val : ℤ)-3)*g48) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 48 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev48 : ∀d : Fin 7,
    (p48*eventRow (rowMask 3 48) ((d.val : ℤ)-3)*g49) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 49 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev49 : ∀d : Fin 7,
    (p49*eventRow (rowMask 3 49) ((d.val : ℤ)-3)*g50) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 50 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev50 : ∀d : Fin 7,
    (p50*eventRow (rowMask 3 50) ((d.val : ℤ)-3)*g51) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 51 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev51 : ∀d : Fin 7,
    (p51*eventRow (rowMask 3 51) ((d.val : ℤ)-3)*g52) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 52 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev52 : ∀d : Fin 7,
    (p52*eventRow (rowMask 3 52) ((d.val : ℤ)-3)*g53) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 53 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev53 : ∀d : Fin 7,
    (p53*eventRow (rowMask 3 53) ((d.val : ℤ)-3)*g54) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 54 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev54 : ∀d : Fin 7,
    (p54*eventRow (rowMask 3 54) ((d.val : ℤ)-3)*g55) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 55 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev55 : ∀d : Fin 7,
    (p55*eventRow (rowMask 3 55) ((d.val : ℤ)-3)*g56) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 56 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev56 : ∀d : Fin 7,
    (p56*eventRow (rowMask 3 56) ((d.val : ℤ)-3)*g57) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 57 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev57 : ∀d : Fin 7,
    (p57*eventRow (rowMask 3 57) ((d.val : ℤ)-3)*g58) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 58 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev58 : ∀d : Fin 7,
    (p58*eventRow (rowMask 3 58) ((d.val : ℤ)-3)*g59) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 59 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev59 : ∀d : Fin 7,
    (p59*eventRow (rowMask 3 59) ((d.val : ℤ)-3)*g60) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 60 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev60 : ∀d : Fin 7,
    (p60*eventRow (rowMask 3 60) ((d.val : ℤ)-3)*g61) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 61 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev61 : ∀d : Fin 7,
    (p61*eventRow (rowMask 3 61) ((d.val : ℤ)-3)*g62) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 62 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev62 : ∀d : Fin 7,
    (p62*eventRow (rowMask 3 62) ((d.val : ℤ)-3)*g63) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 63 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev63 : ∀d : Fin 7,
    (p63*eventRow (rowMask 3 63) ((d.val : ℤ)-3)*g64) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 64 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev64 : ∀d : Fin 7,
    (p64*eventRow (rowMask 3 64) ((d.val : ℤ)-3)*g65) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 65 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev65 : ∀d : Fin 7,
    (p65*eventRow (rowMask 3 65) ((d.val : ℤ)-3)*g66) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 66 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev66 : ∀d : Fin 7,
    (p66*eventRow (rowMask 3 66) ((d.val : ℤ)-3)*g67) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 67 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev67 : ∀d : Fin 7,
    (p67*eventRow (rowMask 3 67) ((d.val : ℤ)-3)*g68) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 68 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev68 : ∀d : Fin 7,
    (p68*eventRow (rowMask 3 68) ((d.val : ℤ)-3)*g69) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 69 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev69 : ∀d : Fin 7,
    (p69*eventRow (rowMask 3 69) ((d.val : ℤ)-3)*g70) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 70 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev70 : ∀d : Fin 7,
    (p70*eventRow (rowMask 3 70) ((d.val : ℤ)-3)*g71) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 71 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev71 : ∀d : Fin 7,
    (p71*eventRow (rowMask 3 71) ((d.val : ℤ)-3)*g72) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 72 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev72 : ∀d : Fin 7,
    (p72*eventRow (rowMask 3 72) ((d.val : ℤ)-3)*g73) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 73 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev73 : ∀d : Fin 7,
    (p73*eventRow (rowMask 3 73) ((d.val : ℤ)-3)*g74) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 74 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev74 : ∀d : Fin 7,
    (p74*eventRow (rowMask 3 74) ((d.val : ℤ)-3)*g75) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 75 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev75 : ∀d : Fin 7,
    (p75*eventRow (rowMask 3 75) ((d.val : ℤ)-3)*g76) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 76 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev76 : ∀d : Fin 7,
    (p76*eventRow (rowMask 3 76) ((d.val : ℤ)-3)*g77) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 77 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev77 : ∀d : Fin 7,
    (p77*eventRow (rowMask 3 77) ((d.val : ℤ)-3)*g78) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 78 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev78 : ∀d : Fin 7,
    (p78*eventRow (rowMask 3 78) ((d.val : ℤ)-3)*g79) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 79 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev79 : ∀d : Fin 7,
    (p79*eventRow (rowMask 3 79) ((d.val : ℤ)-3)*g80) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 80 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev80 : ∀d : Fin 7,
    (p80*eventRow (rowMask 3 80) ((d.val : ℤ)-3)*g81) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 81 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev81 : ∀d : Fin 7,
    (p81*eventRow (rowMask 3 81) ((d.val : ℤ)-3)*g82) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 82 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev82 : ∀d : Fin 7,
    (p82*eventRow (rowMask 3 82) ((d.val : ℤ)-3)*g83) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 83 d : ℤ) := by
  intro d; fin_cases d <;> decide
theorem ev83 : ∀d : Fin 7,
    (p83*eventRow (rowMask 3 83) ((d.val : ℤ)-3)*g84) 0 0=
      (eventCount GridData4_3.f GridData4_3.g 84 d : ℤ) := by
  intro d; fin_cases d <;> decide
def checked : FiniteTransfer7.Checked ⟨3,by decide⟩ where
  pref := fun r => ![p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36, p37, p38, p39, p40, p41, p42, p43, p44, p45, p46, p47, p48, p49, p50, p51, p52, p53, p54, p55, p56, p57, p58, p59, p60, p61, p62, p63, p64, p65, p66, p67, p68, p69, p70, p71, p72, p73, p74, p75, p76, p77, p78, p79, p80, p81, p82, p83, p84] r
  suff := fun r => ![g0, g1, g2, g3, g4, g5, g6, g7, g8, g9, g10, g11, g12, g13, g14, g15, g16, g17, g18, g19, g20, g21, g22, g23, g24, g25, g26, g27, g28, g29, g30, g31, g32, g33, g34, g35, g36, g37, g38, g39, g40, g41, g42, g43, g44, g45, g46, g47, g48, g49, g50, g51, g52, g53, g54, g55, g56, g57, g58, g59, g60, g61, g62, g63, g64, g65, g66, g67, g68, g69, g70, g71, g72, g73, g74, g75, g76, g77, g78, g79, g80, g81, g82, g83, g84, g85] r
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
    exact fr75
    exact fr76
    exact fr77
    exact fr78
    exact fr79
    exact fr80
    exact fr81
    exact fr82
    exact fr83
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
    exact br75
    exact br76
    exact br77
    exact br78
    exact br79
    exact br80
    exact br81
    exact br82
    exact br83
    exact br84
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
    exact ev64
    exact ev65
    exact ev66
    exact ev67
    exact ev68
    exact ev69
    exact ev70
    exact ev71
    exact ev72
    exact ev73
    exact ev74
    exact ev75
    exact ev76
    exact ev77
    exact ev78
    exact ev79
    exact ev80
    exact ev81
    exact ev82
    exact ev83
end OneThird.FiniteTransferData7_3
