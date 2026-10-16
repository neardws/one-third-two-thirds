module
public import OneThird.TransferCache5
@[expose] public section
namespace OneThird.CircuitBindings5
open Matrix Structure MatrixBounds CertificateChecker CertificateData4 CircuitSemantics5 TransferCache5
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
set_option linter.unusedSimpArgs false
theorem binding0 : Realizes f0 (fun n => (select3 * transfer (pre.take 0))) [] := by
  apply fixed_realizes
  rw [pre_prefix0]
  decide
theorem binding1 : Realizes f1 (fun n => transfer (pre.drop 1)) [] := by
  apply fixed_realizes
  rw [pre_suffix1]
  decide
theorem binding2 : Realizes v0 (fun n => A^(n 0)) [0] := by
  exact input_realizes _ 0
theorem binding3 : Realizes f2 (fun n => transfer mid) [] := by
  apply fixed_realizes
  rw [mid_eq_M]
  decide
theorem binding4 : Realizes f3 (fun n => (transfer suf * select2)) [] := by
  apply fixed_realizes
  rw [show suf=suf.take 22 from rfl, suf_prefix22]
  decide
theorem binding5 : Realizes n0 (fun n => (A^(n 0) * (transfer suf * select2))) [0] := by
  exact mul_realizes binding2 binding4 _ _ _ _
theorem binding6 : Realizes n1 (fun n => (transfer mid * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding3 binding5 _ _ _ _
theorem binding7 : Realizes n2 (fun n => (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))) [0, 0] := by
  exact mul_realizes binding2 binding6 _ _ _ _
theorem binding8 : Realizes n3 (fun n => (transfer (pre.drop 1) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding1 binding7 _ _ _ _
theorem binding9 : Realizes f4 (fun n => (select3 * transfer (pre.take 1))) [] := by
  apply fixed_realizes
  rw [pre_prefix1]
  decide
theorem binding10 : Realizes f5 (fun n => transfer (pre.drop 2)) [] := by
  apply fixed_realizes
  rw [pre_suffix2]
  decide
theorem binding11 : Realizes n4 (fun n => (transfer (pre.drop 2) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding10 binding7 _ _ _ _
theorem binding12 : Realizes f6 (fun n => (select3 * transfer (pre.take 2))) [] := by
  apply fixed_realizes
  rw [pre_prefix2]
  decide
theorem binding13 : Realizes f7 (fun n => transfer (pre.drop 3)) [] := by
  apply fixed_realizes
  rw [pre_suffix3]
  decide
theorem binding14 : Realizes n5 (fun n => (transfer (pre.drop 3) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding13 binding7 _ _ _ _
theorem binding15 : Realizes f8 (fun n => (select3 * transfer (pre.take 3))) [] := by
  apply fixed_realizes
  rw [pre_prefix3]
  decide
theorem binding16 : Realizes f9 (fun n => transfer (pre.drop 4)) [] := by
  apply fixed_realizes
  rw [pre_suffix4]
  decide
theorem binding17 : Realizes n6 (fun n => (transfer (pre.drop 4) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding16 binding7 _ _ _ _
theorem binding18 : Realizes f10 (fun n => (select3 * transfer (pre.take 4))) [] := by
  apply fixed_realizes
  rw [pre_prefix4]
  decide
theorem binding19 : Realizes f11 (fun n => transfer (pre.drop 5)) [] := by
  apply fixed_realizes
  rw [pre_suffix5]
  decide
theorem binding20 : Realizes n7 (fun n => (transfer (pre.drop 5) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding19 binding7 _ _ _ _
theorem binding21 : Realizes f12 (fun n => (select3 * transfer (pre.take 5))) [] := by
  apply fixed_realizes
  rw [pre_prefix5]
  decide
theorem binding22 : Realizes f13 (fun n => transfer (pre.drop 6)) [] := by
  apply fixed_realizes
  rw [pre_suffix6]
  decide
theorem binding23 : Realizes n8 (fun n => (transfer (pre.drop 6) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding22 binding7 _ _ _ _
theorem binding24 : Realizes f14 (fun n => (select3 * transfer (pre.take 6))) [] := by
  apply fixed_realizes
  rw [pre_prefix6]
  decide
theorem binding25 : Realizes f15 (fun n => transfer (pre.drop 7)) [] := by
  apply fixed_realizes
  rw [pre_suffix7]
  decide
theorem binding26 : Realizes n9 (fun n => (transfer (pre.drop 7) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding25 binding7 _ _ _ _
theorem binding27 : Realizes f16 (fun n => (select3 * transfer (pre.take 7))) [] := by
  apply fixed_realizes
  rw [pre_prefix7]
  decide
theorem binding28 : Realizes f17 (fun n => transfer (pre.drop 8)) [] := by
  apply fixed_realizes
  rw [pre_suffix8]
  decide
theorem binding29 : Realizes n10 (fun n => (transfer (pre.drop 8) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding28 binding7 _ _ _ _
theorem binding30 : Realizes f18 (fun n => (select3 * transfer (pre.take 8))) [] := by
  apply fixed_realizes
  rw [pre_prefix8]
  decide
theorem binding31 : Realizes f19 (fun n => transfer (pre.drop 9)) [] := by
  apply fixed_realizes
  rw [pre_suffix9]
  decide
theorem binding32 : Realizes n11 (fun n => (transfer (pre.drop 9) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding31 binding7 _ _ _ _
theorem binding33 : Realizes f20 (fun n => (select3 * transfer (pre.take 9))) [] := by
  apply fixed_realizes
  rw [pre_prefix9]
  decide
theorem binding34 : Realizes f21 (fun n => transfer (pre.drop 10)) [] := by
  apply fixed_realizes
  rw [pre_suffix10]
  decide
theorem binding35 : Realizes n12 (fun n => (transfer (pre.drop 10) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding34 binding7 _ _ _ _
theorem binding36 : Realizes f22 (fun n => (select3 * transfer (pre.take 10))) [] := by
  apply fixed_realizes
  rw [pre_prefix10]
  decide
theorem binding37 : Realizes f23 (fun n => transfer (pre.drop 11)) [] := by
  apply fixed_realizes
  rw [pre_suffix11]
  decide
theorem binding38 : Realizes n13 (fun n => (transfer (pre.drop 11) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding37 binding7 _ _ _ _
theorem binding39 : Realizes f24 (fun n => (select3 * transfer (pre.take 11))) [] := by
  apply fixed_realizes
  rw [pre_prefix11]
  decide
theorem binding40 : Realizes f25 (fun n => transfer (pre.drop 12)) [] := by
  apply fixed_realizes
  rw [pre_suffix12]
  decide
theorem binding41 : Realizes n14 (fun n => (transfer (pre.drop 12) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding40 binding7 _ _ _ _
theorem binding42 : Realizes f26 (fun n => (select3 * transfer (pre.take 12))) [] := by
  apply fixed_realizes
  rw [pre_prefix12]
  decide
theorem binding43 : Realizes f27 (fun n => transfer (pre.drop 13)) [] := by
  apply fixed_realizes
  rw [pre_suffix13]
  decide
theorem binding44 : Realizes n15 (fun n => (transfer (pre.drop 13) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding43 binding7 _ _ _ _
theorem binding45 : Realizes f28 (fun n => (select3 * transfer (pre.take 13))) [] := by
  apply fixed_realizes
  rw [pre_prefix13]
  decide
theorem binding46 : Realizes f29 (fun n => transfer (pre.drop 14)) [] := by
  apply fixed_realizes
  rw [pre_suffix14]
  decide
theorem binding47 : Realizes n16 (fun n => (transfer (pre.drop 14) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding46 binding7 _ _ _ _
theorem binding48 : Realizes f30 (fun n => (select3 * transfer (pre.take 14))) [] := by
  apply fixed_realizes
  rw [pre_prefix14]
  decide
theorem binding49 : Realizes f31 (fun n => transfer (pre.drop 15)) [] := by
  apply fixed_realizes
  rw [pre_suffix15]
  decide
theorem binding50 : Realizes n17 (fun n => (transfer (pre.drop 15) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding49 binding7 _ _ _ _
theorem binding51 : Realizes f32 (fun n => (select3 * transfer (pre.take 15))) [] := by
  apply fixed_realizes
  rw [pre_prefix15]
  decide
theorem binding52 : Realizes f33 (fun n => transfer (pre.drop 16)) [] := by
  apply fixed_realizes
  rw [pre_suffix16]
  decide
theorem binding53 : Realizes n18 (fun n => (transfer (pre.drop 16) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding52 binding7 _ _ _ _
theorem binding54 : Realizes f34 (fun n => (select3 * transfer (pre.take 16))) [] := by
  apply fixed_realizes
  rw [pre_prefix16]
  decide
theorem binding55 : Realizes f35 (fun n => transfer (pre.drop 17)) [] := by
  apply fixed_realizes
  rw [pre_suffix17]
  decide
theorem binding56 : Realizes n19 (fun n => (transfer (pre.drop 17) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding55 binding7 _ _ _ _
theorem binding57 : Realizes f36 (fun n => (select3 * transfer (pre.take 17))) [] := by
  apply fixed_realizes
  rw [pre_prefix17]
  decide
theorem binding58 : Realizes f37 (fun n => transfer (pre.drop 18)) [] := by
  apply fixed_realizes
  rw [pre_suffix18]
  decide
theorem binding59 : Realizes n20 (fun n => (transfer (pre.drop 18) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding58 binding7 _ _ _ _
theorem binding60 : Realizes f38 (fun n => (select3 * transfer (pre.take 18))) [] := by
  apply fixed_realizes
  rw [pre_prefix18]
  decide
theorem binding61 : Realizes f39 (fun n => transfer (pre.drop 19)) [] := by
  apply fixed_realizes
  rw [pre_suffix19]
  decide
theorem binding62 : Realizes n21 (fun n => (transfer (pre.drop 19) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding61 binding7 _ _ _ _
theorem binding63 : Realizes f40 (fun n => (select3 * transfer (pre.take 19))) [] := by
  apply fixed_realizes
  rw [pre_prefix19]
  decide
theorem binding64 : Realizes f41 (fun n => transfer (pre.drop 20)) [] := by
  apply fixed_realizes
  rw [pre_suffix20]
  decide
theorem binding65 : Realizes n22 (fun n => (transfer (pre.drop 20) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding64 binding7 _ _ _ _
theorem binding66 : Realizes f42 (fun n => (select3 * transfer (pre.take 20))) [] := by
  apply fixed_realizes
  rw [pre_prefix20]
  decide
theorem binding67 : Realizes f43 (fun n => transfer (pre.drop 21)) [] := by
  apply fixed_realizes
  rw [pre_suffix21]
  decide
theorem binding68 : Realizes n23 (fun n => (transfer (pre.drop 21) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding67 binding7 _ _ _ _
theorem binding69 : Realizes f44 (fun n => (select3 * transfer (pre.take 21))) [] := by
  apply fixed_realizes
  rw [pre_prefix21]
  decide
theorem binding70 : Realizes f45 (fun n => transfer (pre.drop 22)) [] := by
  apply fixed_realizes
  rw [pre_suffix22]
  decide
theorem binding71 : Realizes n24 (fun n => (transfer (pre.drop 22) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0, 0] := by
  exact mul_realizes binding70 binding7 _ _ _ _
theorem binding72 : Realizes f46 (fun n => (select3 * transfer pre)) [] := by
  apply fixed_realizes
  rw [show pre=pre.take 22 from rfl, pre_prefix22]
  decide
theorem binding73 : Realizes f45 (fun n => transfer (mid.take 0)) [] := by
  apply fixed_realizes
  rw [mid_prefix0]
  decide
theorem binding74 : Realizes n25 (fun n => ((select3 * transfer pre) * A^(n 0))) [0] := by
  exact mul_realizes binding72 binding2 _ _ _ _
theorem binding75 : Realizes n26 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 0))) [0] := by
  exact mul_realizes binding74 binding73 _ _ _ _
theorem binding76 : Realizes f47 (fun n => transfer (mid.drop 1)) [] := by
  apply fixed_realizes
  rw [mid_suffix1]
  decide
theorem binding77 : Realizes n27 (fun n => (transfer (mid.drop 1) * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding76 binding5 _ _ _ _
theorem binding78 : Realizes f48 (fun n => transfer (mid.take 1)) [] := by
  apply fixed_realizes
  rw [mid_prefix1]
  decide
theorem binding79 : Realizes n28 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 1))) [0] := by
  exact mul_realizes binding74 binding78 _ _ _ _
theorem binding80 : Realizes f49 (fun n => transfer (mid.drop 2)) [] := by
  apply fixed_realizes
  rw [mid_suffix2]
  decide
theorem binding81 : Realizes n29 (fun n => (transfer (mid.drop 2) * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding80 binding5 _ _ _ _
theorem binding82 : Realizes f50 (fun n => transfer (mid.take 2)) [] := by
  apply fixed_realizes
  rw [mid_prefix2]
  decide
theorem binding83 : Realizes n30 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 2))) [0] := by
  exact mul_realizes binding74 binding82 _ _ _ _
theorem binding84 : Realizes f51 (fun n => transfer (mid.drop 3)) [] := by
  apply fixed_realizes
  rw [mid_suffix3]
  decide
theorem binding85 : Realizes n31 (fun n => (transfer (mid.drop 3) * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding84 binding5 _ _ _ _
theorem binding86 : Realizes f52 (fun n => transfer (mid.take 3)) [] := by
  apply fixed_realizes
  rw [mid_prefix3]
  decide
theorem binding87 : Realizes n32 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 3))) [0] := by
  exact mul_realizes binding74 binding86 _ _ _ _
theorem binding88 : Realizes f53 (fun n => transfer (mid.drop 4)) [] := by
  apply fixed_realizes
  rw [mid_suffix4]
  decide
theorem binding89 : Realizes n33 (fun n => (transfer (mid.drop 4) * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding88 binding5 _ _ _ _
theorem binding90 : Realizes f54 (fun n => transfer (mid.take 4)) [] := by
  apply fixed_realizes
  rw [mid_prefix4]
  decide
theorem binding91 : Realizes n34 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 4))) [0] := by
  exact mul_realizes binding74 binding90 _ _ _ _
theorem binding92 : Realizes f55 (fun n => transfer (mid.drop 5)) [] := by
  apply fixed_realizes
  rw [mid_suffix5]
  decide
theorem binding93 : Realizes n35 (fun n => (transfer (mid.drop 5) * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding92 binding5 _ _ _ _
theorem binding94 : Realizes f35 (fun n => transfer (mid.take 5)) [] := by
  apply fixed_realizes
  rw [mid_prefix5]
  decide
theorem binding95 : Realizes n36 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 5))) [0] := by
  exact mul_realizes binding74 binding94 _ _ _ _
theorem binding96 : Realizes f56 (fun n => transfer (mid.drop 6)) [] := by
  apply fixed_realizes
  rw [mid_suffix6]
  decide
theorem binding97 : Realizes n37 (fun n => (transfer (mid.drop 6) * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding96 binding5 _ _ _ _
theorem binding98 : Realizes f57 (fun n => transfer (mid.take 6)) [] := by
  apply fixed_realizes
  rw [mid_prefix6]
  decide
theorem binding99 : Realizes n38 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 6))) [0] := by
  exact mul_realizes binding74 binding98 _ _ _ _
theorem binding100 : Realizes f37 (fun n => transfer (mid.drop 7)) [] := by
  apply fixed_realizes
  rw [mid_suffix7]
  decide
theorem binding101 : Realizes n39 (fun n => (transfer (mid.drop 7) * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding100 binding5 _ _ _ _
theorem binding102 : Realizes f58 (fun n => transfer (mid.take 7)) [] := by
  apply fixed_realizes
  rw [mid_prefix7]
  decide
theorem binding103 : Realizes n40 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 7))) [0] := by
  exact mul_realizes binding74 binding102 _ _ _ _
theorem binding104 : Realizes f39 (fun n => transfer (mid.drop 8)) [] := by
  apply fixed_realizes
  rw [mid_suffix8]
  decide
theorem binding105 : Realizes n41 (fun n => (transfer (mid.drop 8) * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding104 binding5 _ _ _ _
theorem binding106 : Realizes f59 (fun n => transfer (mid.take 8)) [] := by
  apply fixed_realizes
  rw [mid_prefix8]
  decide
theorem binding107 : Realizes n42 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 8))) [0] := by
  exact mul_realizes binding74 binding106 _ _ _ _
theorem binding108 : Realizes f41 (fun n => transfer (mid.drop 9)) [] := by
  apply fixed_realizes
  rw [mid_suffix9]
  decide
theorem binding109 : Realizes n43 (fun n => (transfer (mid.drop 9) * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding108 binding5 _ _ _ _
theorem binding110 : Realizes f60 (fun n => transfer (mid.take 9)) [] := by
  apply fixed_realizes
  rw [mid_prefix9]
  decide
theorem binding111 : Realizes n44 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 9))) [0] := by
  exact mul_realizes binding74 binding110 _ _ _ _
theorem binding112 : Realizes f43 (fun n => transfer (mid.drop 10)) [] := by
  apply fixed_realizes
  rw [mid_suffix10]
  decide
theorem binding113 : Realizes n45 (fun n => (transfer (mid.drop 10) * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding112 binding5 _ _ _ _
theorem binding114 : Realizes f61 (fun n => transfer (mid.take 10)) [] := by
  apply fixed_realizes
  rw [mid_prefix10]
  decide
theorem binding115 : Realizes n46 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 10))) [0] := by
  exact mul_realizes binding74 binding114 _ _ _ _
theorem binding116 : Realizes f45 (fun n => transfer (mid.drop 11)) [] := by
  apply fixed_realizes
  rw [mid_suffix11]
  decide
theorem binding117 : Realizes n47 (fun n => (transfer (mid.drop 11) * (A^(n 0) * (transfer suf * select2)))) [0] := by
  exact mul_realizes binding116 binding5 _ _ _ _
theorem binding118 : Realizes f45 (fun n => transfer (suf.take 0)) [] := by
  apply fixed_realizes
  rw [suf_prefix0]
  decide
theorem binding119 : Realizes n48 (fun n => (((select3 * transfer pre) * A^(n 0)) * transfer mid)) [0] := by
  exact mul_realizes binding74 binding3 _ _ _ _
theorem binding120 : Realizes n49 (fun n => ((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0))) [0, 0] := by
  exact mul_realizes binding119 binding2 _ _ _ _
theorem binding121 : Realizes n50 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 0))) [0, 0] := by
  exact mul_realizes binding120 binding118 _ _ _ _
theorem binding122 : Realizes f62 (fun n => (transfer (suf.drop 1) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix1]
  decide
theorem binding123 : Realizes f48 (fun n => transfer (suf.take 1)) [] := by
  apply fixed_realizes
  rw [suf_prefix1]
  decide
theorem binding124 : Realizes n51 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 1))) [0, 0] := by
  exact mul_realizes binding120 binding123 _ _ _ _
theorem binding125 : Realizes f63 (fun n => (transfer (suf.drop 2) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix2]
  decide
theorem binding126 : Realizes f50 (fun n => transfer (suf.take 2)) [] := by
  apply fixed_realizes
  rw [suf_prefix2]
  decide
theorem binding127 : Realizes n52 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 2))) [0, 0] := by
  exact mul_realizes binding120 binding126 _ _ _ _
theorem binding128 : Realizes f64 (fun n => (transfer (suf.drop 3) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix3]
  decide
theorem binding129 : Realizes f52 (fun n => transfer (suf.take 3)) [] := by
  apply fixed_realizes
  rw [suf_prefix3]
  decide
theorem binding130 : Realizes n53 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 3))) [0, 0] := by
  exact mul_realizes binding120 binding129 _ _ _ _
theorem binding131 : Realizes f65 (fun n => (transfer (suf.drop 4) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix4]
  decide
theorem binding132 : Realizes f54 (fun n => transfer (suf.take 4)) [] := by
  apply fixed_realizes
  rw [suf_prefix4]
  decide
theorem binding133 : Realizes n54 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 4))) [0, 0] := by
  exact mul_realizes binding120 binding132 _ _ _ _
theorem binding134 : Realizes f66 (fun n => (transfer (suf.drop 5) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix5]
  decide
theorem binding135 : Realizes f35 (fun n => transfer (suf.take 5)) [] := by
  apply fixed_realizes
  rw [suf_prefix5]
  decide
theorem binding136 : Realizes n55 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 5))) [0, 0] := by
  exact mul_realizes binding120 binding135 _ _ _ _
theorem binding137 : Realizes f67 (fun n => (transfer (suf.drop 6) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix6]
  decide
theorem binding138 : Realizes f68 (fun n => transfer (suf.take 6)) [] := by
  apply fixed_realizes
  rw [suf_prefix6]
  decide
theorem binding139 : Realizes n56 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 6))) [0, 0] := by
  exact mul_realizes binding120 binding138 _ _ _ _
theorem binding140 : Realizes f69 (fun n => (transfer (suf.drop 7) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix7]
  decide
theorem binding141 : Realizes f70 (fun n => transfer (suf.take 7)) [] := by
  apply fixed_realizes
  rw [suf_prefix7]
  decide
theorem binding142 : Realizes n57 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 7))) [0, 0] := by
  exact mul_realizes binding120 binding141 _ _ _ _
theorem binding143 : Realizes f71 (fun n => (transfer (suf.drop 8) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix8]
  decide
theorem binding144 : Realizes f72 (fun n => transfer (suf.take 8)) [] := by
  apply fixed_realizes
  rw [suf_prefix8]
  decide
theorem binding145 : Realizes n58 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 8))) [0, 0] := by
  exact mul_realizes binding120 binding144 _ _ _ _
theorem binding146 : Realizes f73 (fun n => (transfer (suf.drop 9) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix9]
  decide
theorem binding147 : Realizes f74 (fun n => transfer (suf.take 9)) [] := by
  apply fixed_realizes
  rw [suf_prefix9]
  decide
theorem binding148 : Realizes n59 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 9))) [0, 0] := by
  exact mul_realizes binding120 binding147 _ _ _ _
theorem binding149 : Realizes f75 (fun n => (transfer (suf.drop 10) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix10]
  decide
theorem binding150 : Realizes f76 (fun n => transfer (suf.take 10)) [] := by
  apply fixed_realizes
  rw [suf_prefix10]
  decide
theorem binding151 : Realizes n60 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 10))) [0, 0] := by
  exact mul_realizes binding120 binding150 _ _ _ _
theorem binding152 : Realizes f77 (fun n => (transfer (suf.drop 11) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix11]
  decide
theorem binding153 : Realizes f78 (fun n => transfer (suf.take 11)) [] := by
  apply fixed_realizes
  rw [suf_prefix11]
  decide
theorem binding154 : Realizes n61 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 11))) [0, 0] := by
  exact mul_realizes binding120 binding153 _ _ _ _
theorem binding155 : Realizes f79 (fun n => (transfer (suf.drop 12) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix12]
  decide
theorem binding156 : Realizes f80 (fun n => transfer (suf.take 12)) [] := by
  apply fixed_realizes
  rw [suf_prefix12]
  decide
theorem binding157 : Realizes n62 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 12))) [0, 0] := by
  exact mul_realizes binding120 binding156 _ _ _ _
theorem binding158 : Realizes f81 (fun n => (transfer (suf.drop 13) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix13]
  decide
theorem binding159 : Realizes f82 (fun n => transfer (suf.take 13)) [] := by
  apply fixed_realizes
  rw [suf_prefix13]
  decide
theorem binding160 : Realizes n63 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 13))) [0, 0] := by
  exact mul_realizes binding120 binding159 _ _ _ _
theorem binding161 : Realizes f83 (fun n => (transfer (suf.drop 14) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix14]
  decide
theorem binding162 : Realizes f84 (fun n => transfer (suf.take 14)) [] := by
  apply fixed_realizes
  rw [suf_prefix14]
  decide
theorem binding163 : Realizes n64 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 14))) [0, 0] := by
  exact mul_realizes binding120 binding162 _ _ _ _
theorem binding164 : Realizes f85 (fun n => (transfer (suf.drop 15) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix15]
  decide
theorem binding165 : Realizes f86 (fun n => transfer (suf.take 15)) [] := by
  apply fixed_realizes
  rw [suf_prefix15]
  decide
theorem binding166 : Realizes n65 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 15))) [0, 0] := by
  exact mul_realizes binding120 binding165 _ _ _ _
theorem binding167 : Realizes f87 (fun n => (transfer (suf.drop 16) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix16]
  decide
theorem binding168 : Realizes f88 (fun n => transfer (suf.take 16)) [] := by
  apply fixed_realizes
  rw [suf_prefix16]
  decide
theorem binding169 : Realizes n66 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 16))) [0, 0] := by
  exact mul_realizes binding120 binding168 _ _ _ _
theorem binding170 : Realizes f89 (fun n => (transfer (suf.drop 17) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix17]
  decide
theorem binding171 : Realizes f90 (fun n => transfer (suf.take 17)) [] := by
  apply fixed_realizes
  rw [suf_prefix17]
  decide
theorem binding172 : Realizes n67 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 17))) [0, 0] := by
  exact mul_realizes binding120 binding171 _ _ _ _
theorem binding173 : Realizes f91 (fun n => (transfer (suf.drop 18) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix18]
  decide
theorem binding174 : Realizes f92 (fun n => transfer (suf.take 18)) [] := by
  apply fixed_realizes
  rw [suf_prefix18]
  decide
theorem binding175 : Realizes n68 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 18))) [0, 0] := by
  exact mul_realizes binding120 binding174 _ _ _ _
theorem binding176 : Realizes f93 (fun n => (transfer (suf.drop 19) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix19]
  decide
theorem binding177 : Realizes f94 (fun n => transfer (suf.take 19)) [] := by
  apply fixed_realizes
  rw [suf_prefix19]
  decide
theorem binding178 : Realizes n69 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 19))) [0, 0] := by
  exact mul_realizes binding120 binding177 _ _ _ _
theorem binding179 : Realizes f95 (fun n => (transfer (suf.drop 20) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix20]
  decide
theorem binding180 : Realizes f96 (fun n => transfer (suf.take 20)) [] := by
  apply fixed_realizes
  rw [suf_prefix20]
  decide
theorem binding181 : Realizes n70 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 20))) [0, 0] := by
  exact mul_realizes binding120 binding180 _ _ _ _
theorem binding182 : Realizes f97 (fun n => (transfer (suf.drop 21) * select2)) [] := by
  apply fixed_realizes
  rw [suf_suffix21]
  decide
theorem binding183 : Realizes f45 (fun n => A^0) [] := by
  apply fixed_realizes
  decide
theorem binding184 : Realizes v2 (fun n => A^(n 2)) [2] := by
  exact input_realizes _ 2
theorem binding185 : Realizes f45 (fun n => transfer (block.take 0)) [] := by
  apply fixed_realizes
  rw [block_prefix0]
  decide
theorem binding186 : Realizes n71 (fun n => ((select3 * transfer pre) * A^0)) [] := by
  exact mul_realizes binding72 binding183 _ _ _ _
theorem binding187 : Realizes n72 (fun n => (((select3 * transfer pre) * A^0) * transfer (block.take 0))) [] := by
  exact mul_realizes binding186 binding185 _ _ _ _
theorem binding188 : Realizes f37 (fun n => transfer (block.drop 1)) [] := by
  apply fixed_realizes
  rw [block_suffix1]
  decide
theorem binding189 : Realizes n73 (fun n => (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))) [2, 0] := by
  exact mul_realizes binding184 binding6 _ _ _ _
theorem binding190 : Realizes n74 (fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [2, 0] := by
  exact mul_realizes binding188 binding189 _ _ _ _
theorem binding191 : Realizes n75 (fun n => ((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^0)) [0] := by
  exact mul_realizes binding119 binding183 _ _ _ _
theorem binding192 : Realizes n76 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^0) * transfer (block.take 0))) [0] := by
  exact mul_realizes binding191 binding185 _ _ _ _
theorem binding193 : Realizes n77 (fun n => (A^(n 2) * (transfer suf * select2))) [2] := by
  exact mul_realizes binding184 binding4 _ _ _ _
theorem binding194 : Realizes n78 (fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer suf * select2)))) [2] := by
  exact mul_realizes binding188 binding193 _ _ _ _
theorem binding195 : Realizes f48 (fun n => transfer (block.take 1)) [] := by
  apply fixed_realizes
  rw [block_prefix1]
  decide
theorem binding196 : Realizes n79 (fun n => (((select3 * transfer pre) * A^0) * transfer (block.take 1))) [] := by
  exact mul_realizes binding186 binding195 _ _ _ _
theorem binding197 : Realizes f39 (fun n => transfer (block.drop 2)) [] := by
  apply fixed_realizes
  rw [block_suffix2]
  decide
theorem binding198 : Realizes n80 (fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [2, 0] := by
  exact mul_realizes binding197 binding189 _ _ _ _
theorem binding199 : Realizes n81 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^0) * transfer (block.take 1))) [0] := by
  exact mul_realizes binding191 binding195 _ _ _ _
theorem binding200 : Realizes n82 (fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer suf * select2)))) [2] := by
  exact mul_realizes binding197 binding193 _ _ _ _
theorem binding201 : Realizes f50 (fun n => transfer (block.take 2)) [] := by
  apply fixed_realizes
  rw [block_prefix2]
  decide
theorem binding202 : Realizes n83 (fun n => (((select3 * transfer pre) * A^0) * transfer (block.take 2))) [] := by
  exact mul_realizes binding186 binding201 _ _ _ _
theorem binding203 : Realizes f41 (fun n => transfer (block.drop 3)) [] := by
  apply fixed_realizes
  rw [block_suffix3]
  decide
theorem binding204 : Realizes n84 (fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [2, 0] := by
  exact mul_realizes binding203 binding189 _ _ _ _
theorem binding205 : Realizes n85 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^0) * transfer (block.take 2))) [0] := by
  exact mul_realizes binding191 binding201 _ _ _ _
theorem binding206 : Realizes n86 (fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer suf * select2)))) [2] := by
  exact mul_realizes binding203 binding193 _ _ _ _
theorem binding207 : Realizes f52 (fun n => transfer (block.take 3)) [] := by
  apply fixed_realizes
  rw [block_prefix3]
  decide
theorem binding208 : Realizes n87 (fun n => (((select3 * transfer pre) * A^0) * transfer (block.take 3))) [] := by
  exact mul_realizes binding186 binding207 _ _ _ _
theorem binding209 : Realizes f43 (fun n => transfer (block.drop 4)) [] := by
  apply fixed_realizes
  rw [block_suffix4]
  decide
theorem binding210 : Realizes n88 (fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [2, 0] := by
  exact mul_realizes binding209 binding189 _ _ _ _
theorem binding211 : Realizes n89 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^0) * transfer (block.take 3))) [0] := by
  exact mul_realizes binding191 binding207 _ _ _ _
theorem binding212 : Realizes n90 (fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer suf * select2)))) [2] := by
  exact mul_realizes binding209 binding193 _ _ _ _
theorem binding213 : Realizes f54 (fun n => transfer (block.take 4)) [] := by
  apply fixed_realizes
  rw [block_prefix4]
  decide
theorem binding214 : Realizes n91 (fun n => (((select3 * transfer pre) * A^0) * transfer (block.take 4))) [] := by
  exact mul_realizes binding186 binding213 _ _ _ _
theorem binding215 : Realizes f45 (fun n => transfer (block.drop 5)) [] := by
  apply fixed_realizes
  rw [block_suffix5]
  decide
theorem binding216 : Realizes n92 (fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [2, 0] := by
  exact mul_realizes binding215 binding189 _ _ _ _
theorem binding217 : Realizes n93 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^0) * transfer (block.take 4))) [0] := by
  exact mul_realizes binding191 binding213 _ _ _ _
theorem binding218 : Realizes n94 (fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer suf * select2)))) [2] := by
  exact mul_realizes binding215 binding193 _ _ _ _
theorem binding219 : Realizes f35 (fun n => A^1) [] := by
  apply fixed_realizes
  decide
theorem binding220 : Realizes n95 (fun n => ((select3 * transfer pre) * A^1)) [] := by
  exact mul_realizes binding72 binding219 _ _ _ _
theorem binding221 : Realizes n96 (fun n => (((select3 * transfer pre) * A^1) * transfer (block.take 0))) [] := by
  exact mul_realizes binding220 binding185 _ _ _ _
theorem binding222 : Realizes n97 (fun n => ((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^1)) [0] := by
  exact mul_realizes binding119 binding219 _ _ _ _
theorem binding223 : Realizes n98 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^1) * transfer (block.take 0))) [0] := by
  exact mul_realizes binding222 binding185 _ _ _ _
theorem binding224 : Realizes n99 (fun n => (((select3 * transfer pre) * A^1) * transfer (block.take 1))) [] := by
  exact mul_realizes binding220 binding195 _ _ _ _
theorem binding225 : Realizes n100 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^1) * transfer (block.take 1))) [0] := by
  exact mul_realizes binding222 binding195 _ _ _ _
theorem binding226 : Realizes n101 (fun n => (((select3 * transfer pre) * A^1) * transfer (block.take 2))) [] := by
  exact mul_realizes binding220 binding201 _ _ _ _
theorem binding227 : Realizes n102 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^1) * transfer (block.take 2))) [0] := by
  exact mul_realizes binding222 binding201 _ _ _ _
theorem binding228 : Realizes n103 (fun n => (((select3 * transfer pre) * A^1) * transfer (block.take 3))) [] := by
  exact mul_realizes binding220 binding207 _ _ _ _
theorem binding229 : Realizes n104 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^1) * transfer (block.take 3))) [0] := by
  exact mul_realizes binding222 binding207 _ _ _ _
theorem binding230 : Realizes n105 (fun n => (((select3 * transfer pre) * A^1) * transfer (block.take 4))) [] := by
  exact mul_realizes binding220 binding213 _ _ _ _
theorem binding231 : Realizes n106 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^1) * transfer (block.take 4))) [0] := by
  exact mul_realizes binding222 binding213 _ _ _ _
theorem binding232 : Realizes f98 (fun n => A^2) [] := by
  apply fixed_realizes
  decide
theorem binding233 : Realizes n107 (fun n => ((select3 * transfer pre) * A^2)) [] := by
  exact mul_realizes binding72 binding232 _ _ _ _
theorem binding234 : Realizes n108 (fun n => (((select3 * transfer pre) * A^2) * transfer (block.take 0))) [] := by
  exact mul_realizes binding233 binding185 _ _ _ _
theorem binding235 : Realizes n109 (fun n => ((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^2)) [0] := by
  exact mul_realizes binding119 binding232 _ _ _ _
theorem binding236 : Realizes n110 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^2) * transfer (block.take 0))) [0] := by
  exact mul_realizes binding235 binding185 _ _ _ _
theorem binding237 : Realizes n111 (fun n => (((select3 * transfer pre) * A^2) * transfer (block.take 1))) [] := by
  exact mul_realizes binding233 binding195 _ _ _ _
theorem binding238 : Realizes n112 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^2) * transfer (block.take 1))) [0] := by
  exact mul_realizes binding235 binding195 _ _ _ _
theorem binding239 : Realizes n113 (fun n => (((select3 * transfer pre) * A^2) * transfer (block.take 2))) [] := by
  exact mul_realizes binding233 binding201 _ _ _ _
theorem binding240 : Realizes n114 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^2) * transfer (block.take 2))) [0] := by
  exact mul_realizes binding235 binding201 _ _ _ _
theorem binding241 : Realizes n115 (fun n => (((select3 * transfer pre) * A^2) * transfer (block.take 3))) [] := by
  exact mul_realizes binding233 binding207 _ _ _ _
theorem binding242 : Realizes n116 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^2) * transfer (block.take 3))) [0] := by
  exact mul_realizes binding235 binding207 _ _ _ _
theorem binding243 : Realizes n117 (fun n => (((select3 * transfer pre) * A^2) * transfer (block.take 4))) [] := by
  exact mul_realizes binding233 binding213 _ _ _ _
theorem binding244 : Realizes n118 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^2) * transfer (block.take 4))) [0] := by
  exact mul_realizes binding235 binding213 _ _ _ _
theorem binding245 : Realizes f99 (fun n => A^3) [] := by
  apply fixed_realizes
  decide
theorem binding246 : Realizes n119 (fun n => ((select3 * transfer pre) * A^3)) [] := by
  exact mul_realizes binding72 binding245 _ _ _ _
theorem binding247 : Realizes n120 (fun n => (((select3 * transfer pre) * A^3) * transfer (block.take 0))) [] := by
  exact mul_realizes binding246 binding185 _ _ _ _
theorem binding248 : Realizes n121 (fun n => ((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^3)) [0] := by
  exact mul_realizes binding119 binding245 _ _ _ _
theorem binding249 : Realizes n122 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^3) * transfer (block.take 0))) [0] := by
  exact mul_realizes binding248 binding185 _ _ _ _
theorem binding250 : Realizes n123 (fun n => (((select3 * transfer pre) * A^3) * transfer (block.take 1))) [] := by
  exact mul_realizes binding246 binding195 _ _ _ _
theorem binding251 : Realizes n124 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^3) * transfer (block.take 1))) [0] := by
  exact mul_realizes binding248 binding195 _ _ _ _
theorem binding252 : Realizes n125 (fun n => (((select3 * transfer pre) * A^3) * transfer (block.take 2))) [] := by
  exact mul_realizes binding246 binding201 _ _ _ _
theorem binding253 : Realizes n126 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^3) * transfer (block.take 2))) [0] := by
  exact mul_realizes binding248 binding201 _ _ _ _
theorem binding254 : Realizes n127 (fun n => (((select3 * transfer pre) * A^3) * transfer (block.take 3))) [] := by
  exact mul_realizes binding246 binding207 _ _ _ _
theorem binding255 : Realizes n128 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^3) * transfer (block.take 3))) [0] := by
  exact mul_realizes binding248 binding207 _ _ _ _
theorem binding256 : Realizes n129 (fun n => (((select3 * transfer pre) * A^3) * transfer (block.take 4))) [] := by
  exact mul_realizes binding246 binding213 _ _ _ _
theorem binding257 : Realizes n130 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^3) * transfer (block.take 4))) [0] := by
  exact mul_realizes binding248 binding213 _ _ _ _
theorem binding258 : Realizes v1 (fun n => A^(n 1)) [1] := by
  exact input_realizes _ 1
theorem binding259 : Realizes n131 (fun n => ((select3 * transfer pre) * A^(n 1))) [1] := by
  exact mul_realizes binding72 binding258 _ _ _ _
theorem binding260 : Realizes n132 (fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 0))) [1] := by
  exact mul_realizes binding259 binding185 _ _ _ _
theorem binding261 : Realizes n133 (fun n => (A^0 * (transfer mid * (A^(n 0) * (transfer suf * select2))))) [0] := by
  exact mul_realizes binding183 binding6 _ _ _ _
theorem binding262 : Realizes n134 (fun n => (transfer (block.drop 1) * (A^0 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding188 binding261 _ _ _ _
theorem binding263 : Realizes n135 (fun n => ((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1))) [0, 1] := by
  exact mul_realizes binding119 binding258 _ _ _ _
theorem binding264 : Realizes n136 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 0))) [0, 1] := by
  exact mul_realizes binding263 binding185 _ _ _ _
theorem binding265 : Realizes n137 (fun n => (A^0 * (transfer suf * select2))) [] := by
  exact mul_realizes binding183 binding4 _ _ _ _
theorem binding266 : Realizes n138 (fun n => (transfer (block.drop 1) * (A^0 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding188 binding265 _ _ _ _
theorem binding267 : Realizes n139 (fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 1))) [1] := by
  exact mul_realizes binding259 binding195 _ _ _ _
theorem binding268 : Realizes n140 (fun n => (transfer (block.drop 2) * (A^0 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding197 binding261 _ _ _ _
theorem binding269 : Realizes n141 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 1))) [0, 1] := by
  exact mul_realizes binding263 binding195 _ _ _ _
theorem binding270 : Realizes n142 (fun n => (transfer (block.drop 2) * (A^0 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding197 binding265 _ _ _ _
theorem binding271 : Realizes n143 (fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 2))) [1] := by
  exact mul_realizes binding259 binding201 _ _ _ _
theorem binding272 : Realizes n144 (fun n => (transfer (block.drop 3) * (A^0 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding203 binding261 _ _ _ _
theorem binding273 : Realizes n145 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 2))) [0, 1] := by
  exact mul_realizes binding263 binding201 _ _ _ _
theorem binding274 : Realizes n146 (fun n => (transfer (block.drop 3) * (A^0 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding203 binding265 _ _ _ _
theorem binding275 : Realizes n147 (fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 3))) [1] := by
  exact mul_realizes binding259 binding207 _ _ _ _
theorem binding276 : Realizes n148 (fun n => (transfer (block.drop 4) * (A^0 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding209 binding261 _ _ _ _
theorem binding277 : Realizes n149 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 3))) [0, 1] := by
  exact mul_realizes binding263 binding207 _ _ _ _
theorem binding278 : Realizes n150 (fun n => (transfer (block.drop 4) * (A^0 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding209 binding265 _ _ _ _
theorem binding279 : Realizes n151 (fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 4))) [1] := by
  exact mul_realizes binding259 binding213 _ _ _ _
theorem binding280 : Realizes n152 (fun n => (transfer (block.drop 5) * (A^0 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding215 binding261 _ _ _ _
theorem binding281 : Realizes n153 (fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 4))) [0, 1] := by
  exact mul_realizes binding263 binding213 _ _ _ _
theorem binding282 : Realizes n154 (fun n => (transfer (block.drop 5) * (A^0 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding215 binding265 _ _ _ _
theorem binding283 : Realizes n155 (fun n => (A^1 * (transfer mid * (A^(n 0) * (transfer suf * select2))))) [0] := by
  exact mul_realizes binding219 binding6 _ _ _ _
theorem binding284 : Realizes n156 (fun n => (transfer (block.drop 1) * (A^1 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding188 binding283 _ _ _ _
theorem binding285 : Realizes n157 (fun n => (A^1 * (transfer suf * select2))) [] := by
  exact mul_realizes binding219 binding4 _ _ _ _
theorem binding286 : Realizes n158 (fun n => (transfer (block.drop 1) * (A^1 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding188 binding285 _ _ _ _
theorem binding287 : Realizes n159 (fun n => (transfer (block.drop 2) * (A^1 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding197 binding283 _ _ _ _
theorem binding288 : Realizes n160 (fun n => (transfer (block.drop 2) * (A^1 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding197 binding285 _ _ _ _
theorem binding289 : Realizes n161 (fun n => (transfer (block.drop 3) * (A^1 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding203 binding283 _ _ _ _
theorem binding290 : Realizes n162 (fun n => (transfer (block.drop 3) * (A^1 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding203 binding285 _ _ _ _
theorem binding291 : Realizes n163 (fun n => (transfer (block.drop 4) * (A^1 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding209 binding283 _ _ _ _
theorem binding292 : Realizes n164 (fun n => (transfer (block.drop 4) * (A^1 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding209 binding285 _ _ _ _
theorem binding293 : Realizes n165 (fun n => (transfer (block.drop 5) * (A^1 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding215 binding283 _ _ _ _
theorem binding294 : Realizes n166 (fun n => (transfer (block.drop 5) * (A^1 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding215 binding285 _ _ _ _
theorem binding295 : Realizes n167 (fun n => (A^2 * (transfer mid * (A^(n 0) * (transfer suf * select2))))) [0] := by
  exact mul_realizes binding232 binding6 _ _ _ _
theorem binding296 : Realizes n168 (fun n => (transfer (block.drop 1) * (A^2 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding188 binding295 _ _ _ _
theorem binding297 : Realizes n169 (fun n => (A^2 * (transfer suf * select2))) [] := by
  exact mul_realizes binding232 binding4 _ _ _ _
theorem binding298 : Realizes n170 (fun n => (transfer (block.drop 1) * (A^2 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding188 binding297 _ _ _ _
theorem binding299 : Realizes n171 (fun n => (transfer (block.drop 2) * (A^2 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding197 binding295 _ _ _ _
theorem binding300 : Realizes n172 (fun n => (transfer (block.drop 2) * (A^2 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding197 binding297 _ _ _ _
theorem binding301 : Realizes n173 (fun n => (transfer (block.drop 3) * (A^2 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding203 binding295 _ _ _ _
theorem binding302 : Realizes n174 (fun n => (transfer (block.drop 3) * (A^2 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding203 binding297 _ _ _ _
theorem binding303 : Realizes n175 (fun n => (transfer (block.drop 4) * (A^2 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding209 binding295 _ _ _ _
theorem binding304 : Realizes n176 (fun n => (transfer (block.drop 4) * (A^2 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding209 binding297 _ _ _ _
theorem binding305 : Realizes n177 (fun n => (transfer (block.drop 5) * (A^2 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding215 binding295 _ _ _ _
theorem binding306 : Realizes n178 (fun n => (transfer (block.drop 5) * (A^2 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding215 binding297 _ _ _ _
theorem binding307 : Realizes n179 (fun n => (A^3 * (transfer mid * (A^(n 0) * (transfer suf * select2))))) [0] := by
  exact mul_realizes binding245 binding6 _ _ _ _
theorem binding308 : Realizes n180 (fun n => (transfer (block.drop 1) * (A^3 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding188 binding307 _ _ _ _
theorem binding309 : Realizes n181 (fun n => (A^3 * (transfer suf * select2))) [] := by
  exact mul_realizes binding245 binding4 _ _ _ _
theorem binding310 : Realizes n182 (fun n => (transfer (block.drop 1) * (A^3 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding188 binding309 _ _ _ _
theorem binding311 : Realizes n183 (fun n => (transfer (block.drop 2) * (A^3 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding197 binding307 _ _ _ _
theorem binding312 : Realizes n184 (fun n => (transfer (block.drop 2) * (A^3 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding197 binding309 _ _ _ _
theorem binding313 : Realizes n185 (fun n => (transfer (block.drop 3) * (A^3 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding203 binding307 _ _ _ _
theorem binding314 : Realizes n186 (fun n => (transfer (block.drop 3) * (A^3 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding203 binding309 _ _ _ _
theorem binding315 : Realizes n187 (fun n => (transfer (block.drop 4) * (A^3 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding209 binding307 _ _ _ _
theorem binding316 : Realizes n188 (fun n => (transfer (block.drop 4) * (A^3 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding209 binding309 _ _ _ _
theorem binding317 : Realizes n189 (fun n => (transfer (block.drop 5) * (A^3 * (transfer mid * (A^(n 0) * (transfer suf * select2)))))) [0] := by
  exact mul_realizes binding215 binding307 _ _ _ _
theorem binding318 : Realizes n190 (fun n => (transfer (block.drop 5) * (A^3 * (transfer suf * select2)))) [] := by
  exact mul_realizes binding215 binding309 _ _ _ _
def leftSpec : Fin 144 → (ℕ → ℕ) → ZMat := ![fun n => (select3 * transfer (pre.take 0)), fun n => (select3 * transfer (pre.take 1)), fun n => (select3 * transfer (pre.take 2)), fun n => (select3 * transfer (pre.take 3)), fun n => (select3 * transfer (pre.take 4)), fun n => (select3 * transfer (pre.take 5)), fun n => (select3 * transfer (pre.take 6)), fun n => (select3 * transfer (pre.take 7)), fun n => (select3 * transfer (pre.take 8)), fun n => (select3 * transfer (pre.take 9)), fun n => (select3 * transfer (pre.take 10)), fun n => (select3 * transfer (pre.take 11)), fun n => (select3 * transfer (pre.take 12)), fun n => (select3 * transfer (pre.take 13)), fun n => (select3 * transfer (pre.take 14)), fun n => (select3 * transfer (pre.take 15)), fun n => (select3 * transfer (pre.take 16)), fun n => (select3 * transfer (pre.take 17)), fun n => (select3 * transfer (pre.take 18)), fun n => (select3 * transfer (pre.take 19)), fun n => (select3 * transfer (pre.take 20)), fun n => (select3 * transfer (pre.take 21)), fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 0)), fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 1)), fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 2)), fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 3)), fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 4)), fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 5)), fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 6)), fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 7)), fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 8)), fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 9)), fun n => (((select3 * transfer pre) * A^(n 0)) * transfer (mid.take 10)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 0)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 1)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 2)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 3)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 4)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 5)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 6)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 7)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 8)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 9)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 10)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 11)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 12)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 13)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 14)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 15)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 16)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 17)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 18)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 19)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 0)) * transfer (suf.take 20)), fun n => (((select3 * transfer pre) * A^0) * transfer (block.take 0)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^0) * transfer (block.take 0)), fun n => (((select3 * transfer pre) * A^0) * transfer (block.take 1)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^0) * transfer (block.take 1)), fun n => (((select3 * transfer pre) * A^0) * transfer (block.take 2)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^0) * transfer (block.take 2)), fun n => (((select3 * transfer pre) * A^0) * transfer (block.take 3)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^0) * transfer (block.take 3)), fun n => (((select3 * transfer pre) * A^0) * transfer (block.take 4)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^0) * transfer (block.take 4)), fun n => (((select3 * transfer pre) * A^1) * transfer (block.take 0)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^1) * transfer (block.take 0)), fun n => (((select3 * transfer pre) * A^1) * transfer (block.take 1)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^1) * transfer (block.take 1)), fun n => (((select3 * transfer pre) * A^1) * transfer (block.take 2)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^1) * transfer (block.take 2)), fun n => (((select3 * transfer pre) * A^1) * transfer (block.take 3)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^1) * transfer (block.take 3)), fun n => (((select3 * transfer pre) * A^1) * transfer (block.take 4)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^1) * transfer (block.take 4)), fun n => (((select3 * transfer pre) * A^2) * transfer (block.take 0)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^2) * transfer (block.take 0)), fun n => (((select3 * transfer pre) * A^2) * transfer (block.take 1)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^2) * transfer (block.take 1)), fun n => (((select3 * transfer pre) * A^2) * transfer (block.take 2)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^2) * transfer (block.take 2)), fun n => (((select3 * transfer pre) * A^2) * transfer (block.take 3)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^2) * transfer (block.take 3)), fun n => (((select3 * transfer pre) * A^2) * transfer (block.take 4)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^2) * transfer (block.take 4)), fun n => (((select3 * transfer pre) * A^3) * transfer (block.take 0)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^3) * transfer (block.take 0)), fun n => (((select3 * transfer pre) * A^3) * transfer (block.take 1)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^3) * transfer (block.take 1)), fun n => (((select3 * transfer pre) * A^3) * transfer (block.take 2)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^3) * transfer (block.take 2)), fun n => (((select3 * transfer pre) * A^3) * transfer (block.take 3)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^3) * transfer (block.take 3)), fun n => (((select3 * transfer pre) * A^3) * transfer (block.take 4)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^3) * transfer (block.take 4)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 0)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 0)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 1)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 1)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 2)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 2)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 3)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 3)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 4)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 4)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 0)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 0)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 1)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 1)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 2)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 2)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 3)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 3)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 4)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 4)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 0)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 0)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 1)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 1)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 2)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 2)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 3)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 3)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 4)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 4)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 0)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 0)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 1)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 1)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 2)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 2)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 3)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 3)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 4)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 4)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 0)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 0)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 1)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 1)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 2)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 2)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 3)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 3)), fun n => (((select3 * transfer pre) * A^(n 1)) * transfer (block.take 4)), fun n => (((((select3 * transfer pre) * A^(n 0)) * transfer mid) * A^(n 1)) * transfer (block.take 4))]
def leftUses : Fin 144 → List ℕ := ![[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1], [1], [0, 1]]
theorem left_binding (i : Fin 144) : Realizes (cells i).left (leftSpec i) (leftUses i) := by
  fin_cases i
  exact binding0
  exact binding9
  exact binding12
  exact binding15
  exact binding18
  exact binding21
  exact binding24
  exact binding27
  exact binding30
  exact binding33
  exact binding36
  exact binding39
  exact binding42
  exact binding45
  exact binding48
  exact binding51
  exact binding54
  exact binding57
  exact binding60
  exact binding63
  exact binding66
  exact binding69
  exact binding75
  exact binding79
  exact binding83
  exact binding87
  exact binding91
  exact binding95
  exact binding99
  exact binding103
  exact binding107
  exact binding111
  exact binding115
  exact binding121
  exact binding124
  exact binding127
  exact binding130
  exact binding133
  exact binding136
  exact binding139
  exact binding142
  exact binding145
  exact binding148
  exact binding151
  exact binding154
  exact binding157
  exact binding160
  exact binding163
  exact binding166
  exact binding169
  exact binding172
  exact binding175
  exact binding178
  exact binding181
  exact binding187
  exact binding192
  exact binding196
  exact binding199
  exact binding202
  exact binding205
  exact binding208
  exact binding211
  exact binding214
  exact binding217
  exact binding221
  exact binding223
  exact binding224
  exact binding225
  exact binding226
  exact binding227
  exact binding228
  exact binding229
  exact binding230
  exact binding231
  exact binding234
  exact binding236
  exact binding237
  exact binding238
  exact binding239
  exact binding240
  exact binding241
  exact binding242
  exact binding243
  exact binding244
  exact binding247
  exact binding249
  exact binding250
  exact binding251
  exact binding252
  exact binding253
  exact binding254
  exact binding255
  exact binding256
  exact binding257
  exact binding260
  exact binding264
  exact binding267
  exact binding269
  exact binding271
  exact binding273
  exact binding275
  exact binding277
  exact binding279
  exact binding281
  exact binding260
  exact binding264
  exact binding267
  exact binding269
  exact binding271
  exact binding273
  exact binding275
  exact binding277
  exact binding279
  exact binding281
  exact binding260
  exact binding264
  exact binding267
  exact binding269
  exact binding271
  exact binding273
  exact binding275
  exact binding277
  exact binding279
  exact binding281
  exact binding260
  exact binding264
  exact binding267
  exact binding269
  exact binding271
  exact binding273
  exact binding275
  exact binding277
  exact binding279
  exact binding281
  exact binding260
  exact binding264
  exact binding267
  exact binding269
  exact binding271
  exact binding273
  exact binding275
  exact binding277
  exact binding279
  exact binding281
def rightSpec : Fin 144 → (ℕ → ℕ) → ZMat := ![fun n => (transfer (pre.drop 1) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 2) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 3) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 4) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 5) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 6) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 7) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 8) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 9) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 10) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 11) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 12) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 13) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 14) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 15) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 16) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 17) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 18) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 19) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 20) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 21) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (pre.drop 22) * (A^(n 0) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (mid.drop 1) * (A^(n 0) * (transfer suf * select2))), fun n => (transfer (mid.drop 2) * (A^(n 0) * (transfer suf * select2))), fun n => (transfer (mid.drop 3) * (A^(n 0) * (transfer suf * select2))), fun n => (transfer (mid.drop 4) * (A^(n 0) * (transfer suf * select2))), fun n => (transfer (mid.drop 5) * (A^(n 0) * (transfer suf * select2))), fun n => (transfer (mid.drop 6) * (A^(n 0) * (transfer suf * select2))), fun n => (transfer (mid.drop 7) * (A^(n 0) * (transfer suf * select2))), fun n => (transfer (mid.drop 8) * (A^(n 0) * (transfer suf * select2))), fun n => (transfer (mid.drop 9) * (A^(n 0) * (transfer suf * select2))), fun n => (transfer (mid.drop 10) * (A^(n 0) * (transfer suf * select2))), fun n => (transfer (mid.drop 11) * (A^(n 0) * (transfer suf * select2))), fun n => (transfer (suf.drop 1) * select2), fun n => (transfer (suf.drop 2) * select2), fun n => (transfer (suf.drop 3) * select2), fun n => (transfer (suf.drop 4) * select2), fun n => (transfer (suf.drop 5) * select2), fun n => (transfer (suf.drop 6) * select2), fun n => (transfer (suf.drop 7) * select2), fun n => (transfer (suf.drop 8) * select2), fun n => (transfer (suf.drop 9) * select2), fun n => (transfer (suf.drop 10) * select2), fun n => (transfer (suf.drop 11) * select2), fun n => (transfer (suf.drop 12) * select2), fun n => (transfer (suf.drop 13) * select2), fun n => (transfer (suf.drop 14) * select2), fun n => (transfer (suf.drop 15) * select2), fun n => (transfer (suf.drop 16) * select2), fun n => (transfer (suf.drop 17) * select2), fun n => (transfer (suf.drop 18) * select2), fun n => (transfer (suf.drop 19) * select2), fun n => (transfer (suf.drop 20) * select2), fun n => (transfer (suf.drop 21) * select2), fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 1) * (A^0 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 1) * (A^0 * (transfer suf * select2))), fun n => (transfer (block.drop 2) * (A^0 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 2) * (A^0 * (transfer suf * select2))), fun n => (transfer (block.drop 3) * (A^0 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 3) * (A^0 * (transfer suf * select2))), fun n => (transfer (block.drop 4) * (A^0 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 4) * (A^0 * (transfer suf * select2))), fun n => (transfer (block.drop 5) * (A^0 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 5) * (A^0 * (transfer suf * select2))), fun n => (transfer (block.drop 1) * (A^1 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 1) * (A^1 * (transfer suf * select2))), fun n => (transfer (block.drop 2) * (A^1 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 2) * (A^1 * (transfer suf * select2))), fun n => (transfer (block.drop 3) * (A^1 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 3) * (A^1 * (transfer suf * select2))), fun n => (transfer (block.drop 4) * (A^1 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 4) * (A^1 * (transfer suf * select2))), fun n => (transfer (block.drop 5) * (A^1 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 5) * (A^1 * (transfer suf * select2))), fun n => (transfer (block.drop 1) * (A^2 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 1) * (A^2 * (transfer suf * select2))), fun n => (transfer (block.drop 2) * (A^2 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 2) * (A^2 * (transfer suf * select2))), fun n => (transfer (block.drop 3) * (A^2 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 3) * (A^2 * (transfer suf * select2))), fun n => (transfer (block.drop 4) * (A^2 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 4) * (A^2 * (transfer suf * select2))), fun n => (transfer (block.drop 5) * (A^2 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 5) * (A^2 * (transfer suf * select2))), fun n => (transfer (block.drop 1) * (A^3 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 1) * (A^3 * (transfer suf * select2))), fun n => (transfer (block.drop 2) * (A^3 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 2) * (A^3 * (transfer suf * select2))), fun n => (transfer (block.drop 3) * (A^3 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 3) * (A^3 * (transfer suf * select2))), fun n => (transfer (block.drop 4) * (A^3 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 4) * (A^3 * (transfer suf * select2))), fun n => (transfer (block.drop 5) * (A^3 * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 5) * (A^3 * (transfer suf * select2))), fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 1) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 2) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 3) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 4) * (A^(n 2) * (transfer suf * select2))), fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer mid * (A^(n 0) * (transfer suf * select2))))), fun n => (transfer (block.drop 5) * (A^(n 2) * (transfer suf * select2)))]
def rightUses : Fin 144 → List ℕ := ![[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [0], [], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2], [2, 0], [2]]
theorem right_binding (i : Fin 144) : Realizes (cells i).right (rightSpec i) (rightUses i) := by
  fin_cases i
  exact binding8
  exact binding11
  exact binding14
  exact binding17
  exact binding20
  exact binding23
  exact binding26
  exact binding29
  exact binding32
  exact binding35
  exact binding38
  exact binding41
  exact binding44
  exact binding47
  exact binding50
  exact binding53
  exact binding56
  exact binding59
  exact binding62
  exact binding65
  exact binding68
  exact binding71
  exact binding77
  exact binding81
  exact binding85
  exact binding89
  exact binding93
  exact binding97
  exact binding101
  exact binding105
  exact binding109
  exact binding113
  exact binding117
  exact binding122
  exact binding125
  exact binding128
  exact binding131
  exact binding134
  exact binding137
  exact binding140
  exact binding143
  exact binding146
  exact binding149
  exact binding152
  exact binding155
  exact binding158
  exact binding161
  exact binding164
  exact binding167
  exact binding170
  exact binding173
  exact binding176
  exact binding179
  exact binding182
  exact binding190
  exact binding194
  exact binding198
  exact binding200
  exact binding204
  exact binding206
  exact binding210
  exact binding212
  exact binding216
  exact binding218
  exact binding190
  exact binding194
  exact binding198
  exact binding200
  exact binding204
  exact binding206
  exact binding210
  exact binding212
  exact binding216
  exact binding218
  exact binding190
  exact binding194
  exact binding198
  exact binding200
  exact binding204
  exact binding206
  exact binding210
  exact binding212
  exact binding216
  exact binding218
  exact binding190
  exact binding194
  exact binding198
  exact binding200
  exact binding204
  exact binding206
  exact binding210
  exact binding212
  exact binding216
  exact binding218
  exact binding262
  exact binding266
  exact binding268
  exact binding270
  exact binding272
  exact binding274
  exact binding276
  exact binding278
  exact binding280
  exact binding282
  exact binding284
  exact binding286
  exact binding287
  exact binding288
  exact binding289
  exact binding290
  exact binding291
  exact binding292
  exact binding293
  exact binding294
  exact binding296
  exact binding298
  exact binding299
  exact binding300
  exact binding301
  exact binding302
  exact binding303
  exact binding304
  exact binding305
  exact binding306
  exact binding308
  exact binding310
  exact binding311
  exact binding312
  exact binding313
  exact binding314
  exact binding315
  exact binding316
  exact binding317
  exact binding318
  exact binding190
  exact binding194
  exact binding198
  exact binding200
  exact binding204
  exact binding206
  exact binding210
  exact binding212
  exact binding216
  exact binding218

/-- Every certificate cell computes actual subword products, with exactly the
product of normalization factors for its tail inputs on both sides. -/
theorem all_cell_values (i : Fin 144) (n : ℕ → ℕ) (d : Fin 7) :
    totalValue (cells i) (fun k => SpectralBridge4.scaledPower (n k))=
      weight (leftUses i++rightUses i) n *
        ((leftSpec i n*(cells i).rowMap*rightSpec i n) 3 2 : ℝ) ∧
    eventValue (cells i) (fun k => SpectralBridge4.scaledPower (n k)) d=
      weight (leftUses i++rightUses i) n *
        ((leftSpec i n*cut (cells i).rowMap d.val*rightSpec i n) 3 2 : ℝ) :=
  cell_values (left_binding i) (right_binding i) n d

end OneThird.CircuitBindings5
