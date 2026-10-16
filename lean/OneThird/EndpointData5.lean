module
public import OneThird.EndpointSemantics5
@[expose] public section
namespace OneThird.EndpointData5
open Matrix Structure MatrixBounds CertificateChecker CertificateData4 CircuitSemantics5 SpectralBridge4 EndpointSemantics5
set_option maxHeartbeats 0
set_option maxRecDepth 100000
noncomputable def eu : Circuit tailLo tailHi := fixed tailLo tailHi !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 357036552, 1005910380, 1654784208, 1654784208, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] (by decide)
theorem eu_model : Realizes eu (fun _ => embedRow uE) [] := by
  apply fixed_realizes
  decide
noncomputable def nu : Circuit tailLo tailHi := fixed tailLo tailHi !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 124549866, 350905257, 577260648, 577260648, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] (by decide)
theorem nu_model : Realizes nu (fun _ => embedRow uN) [] := by
  apply fixed_realizes
  decide
noncomputable def vv : Circuit tailLo tailHi := fixed tailLo tailHi !![0, 0, 3017731140, 0, 0, 0; 0, 0, 3017731140, 0, 0, 0; 0, 0, 3017731140, 0, 0, 0; 0, 0, 1654784208, 0, 0, 0; 0, 0, 648873828, 0, 0, 0; 0, 0, 0, 0, 0, 0] (by decide)
theorem vv_model : Realizes vv (fun _ => embedCol v) [] := by
  apply fixed_realizes
  decide
noncomputable def mat : Circuit tailLo tailHi := fixed tailLo tailHi !![6375, 17967, 29559, 29559, 0, 0; 6375, 17967, 29559, 29559, 0, 0; 6375, 17967, 29559, 29559, 0, 0; 3496, 9853, 16210, 16210, 0, 0; 1371, 3864, 6357, 6357, 0, 0; 0, 0, 0, 0, 0, 0] (by decide)
theorem mat_model : Realizes mat (fun _ => M) [] := by
  apply fixed_realizes
  decide
noncomputable def variable0 : Circuit tailLo tailHi := input tailLo tailHi tail_nonneg 0
theorem variable0_model : Realizes variable0 (fun n => A^(n 0)) [0] := input_realizes _ _
noncomputable def eu0 : Circuit tailLo tailHi := checkpoint eu variable0 !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 357092064603983850436706114791560649572, 1005917810316313357543108764089535383124, 1654743556026037948486347619087581772272, 1654743556026037948486347619087581772272, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 357092064607541013215023905744705802872, 1005917810316789480850685762419161518712, 1654743556028642864649511413400164715788, 1654743556028642864649511413400164715788, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] (by decide) (by decide)
theorem eu0_model : Realizes eu0 (fun n => (embedRow uE * A^(n 0))) [0] := mul_realizes eu_model variable0_model _ _ _ _
noncomputable def eu1 : Circuit tailLo tailHi := checkpoint eu0 mat !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 25023161594149915290380057200880506882533912, 70524164151337355662663524691873177324056072, 116025166708524796034946992182865847765578232, 116025166708524796034946992182865847765578232, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 25023161594201340616624226296217680084641348, 70524164151482290481428013128692786560121888, 116025166708763240346231799961167893035602428, 116025166708763240346231799961167893035602428, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] (by decide) (by decide)
theorem eu1_model : Realizes eu1 (fun n => ((embedRow uE * A^(n 0)) * M)) [0] := mul_realizes eu0_model mat_model _ _ _ _
noncomputable def eu2 : Circuit tailLo tailHi := checkpoint eu1 variable0 !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 25036077978415858250365151952999373528910698335101930076833450820674190720, 70525892998731161055047944657314594011231113320008668945505763083812876152, 116015708018863826972462359044816210232699000528513710649964925732791329776, 116015708018863826972462359044816210232699000528513710649964925732791329776, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 25036077978716711279305109413447122312008532083834956031398742684949771984, 70525892998909481566346023770353361156233472749497930817098911996468484908, 116015708019284888740655691783173034496008948398760483123051402790443672876, 116015708019284888740655691783173034496008948398760483123051402790443672876, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] (by decide) (by decide)
theorem eu2_model : Realizes eu2 (fun n => (((embedRow uE * A^(n 0)) * M) * A^(n 0))) [0, 0] := mul_realizes eu1_model variable0_model _ _ _ _
noncomputable def eu3 : Circuit tailLo tailHi := checkpoint eu2 vv !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 830465511944740693566973018193963267174315876481382619454158772590839242686586196128, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 830465511948154128055152749625475554331504355180127544197160486880360742430109317728, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] (by decide) (by decide)
theorem eu3_model : Realizes eu3 (fun n => ((((embedRow uE * A^(n 0)) * M) * A^(n 0)) * embedCol v)) [0, 0] := mul_realizes eu2_model vv_model _ _ _ _
noncomputable def nu0 : Circuit tailLo tailHi := checkpoint nu variable0 !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 124569231209810845573478632128929940039, 350907849017380611029434086489685307175, 577246466824041668519080267045757161020, 577246466824041668519080267045757161020, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 124569231211051738543404495646895160090, 350907849017546703531242381347378876326, 577246466824950376485389540854855148445, 577246466824950376485389540854855148445, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] (by decide) (by decide)
theorem nu0_model : Realizes nu0 (fun n => (embedRow uN * A^(n 0))) [0] := mul_realizes nu_model variable0_model _ _ _ _
noncomputable def nu1 : Circuit tailLo tailHi := checkpoint nu0 mat !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 8729166260468460845795409897202341137417670, 24601893407486788118985345844633624366270338, 40474620554505115392175281792064907595123006, 40474620554505115392175281792064907595123006, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 8729166260486400234513153998616772152452595, 24601893407537347682578717465538191842026172, 40474620554588295130644280932459611531599749, 40474620554588295130644280932459611531599749, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] (by decide) (by decide)
theorem nu1_model : Realizes nu1 (fun n => ((embedRow uN * A^(n 0)) * M)) [0] := mul_realizes nu0_model mat_model _ _ _ _
noncomputable def nu2 : Circuit tailLo tailHi := checkpoint nu1 variable0 !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 8733672056641230407535331868057400077588675157226706333674069238430651552, 24602496504592752260250313331294315495479109031650453444663837313679169502, 40471320952480562429361220218087444099961897751384914190360111768768160636, 40471320952480562429361220218087444099961897751384914190360111768768160636, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 8733672056746181018979913855470329848015896921651769071952110746289455844, 24602496504654958204328024943162242545321402043727164386591595700819405825, 40471320952627447073280341541888047572505053996333285833929031953968690461, 40471320952627447073280341541888047572505053996333285833929031953968690461, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] (by decide) (by decide)
theorem nu2_model : Realizes nu2 (fun n => (((embedRow uN * A^(n 0)) * M) * A^(n 0))) [0, 0] := mul_realizes nu1_model variable0_model _ _ _ _
noncomputable def nu3 : Circuit tailLo tailHi := checkpoint nu2 vv !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 289702462259824192945659483668096669660433611136126946507966413931276497319922862888, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] !![0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 289702462261014947241611857283001590309962303216749803180139622944160310518977368088, 0, 0, 0; 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0] (by decide) (by decide)
theorem nu3_model : Realizes nu3 (fun n => ((((embedRow uN * A^(n 0)) * M) * A^(n 0)) * embedCol v)) [0, 0] := mul_realizes nu2_model vv_model _ _ _ _
theorem numeric_separator : 0<eu3.lo 3 2 ∧ 100000*(nu3.lo 3 2)>34884*(eu3.hi 3 2) ∧ 2*(nu3.hi 3 2)<eu3.lo 3 2 := by decide
theorem E_value (m : ℕ) :
    eu3.value (fun _ => scaledPower m) 3 2=weight [0,0] (fun _ => m)*(OneThird.E m : ℝ) := by
  have h := congrArg (fun a : RMat => a 3 2) (eu3_model (fun _ => m))
  simpa [Matrix.smul_apply,smul_eq_mul,MatrixBounds.cast,Matrix.map_apply,Int.castRingHom,
    embed_scalar,OneThird.E] using h
theorem N_value (m : ℕ) :
    nu3.value (fun _ => scaledPower m) 3 2=weight [0,0] (fun _ => m)*(OneThird.N m : ℝ) := by
  have h := congrArg (fun a : RMat => a 3 2) (nu3_model (fun _ => m))
  simpa [Matrix.smul_apply,smul_eq_mul,MatrixBounds.cast,Matrix.map_apply,Int.castRingHom,
    embed_scalar,OneThird.N] using h

/-- Explicit infinite-range endpoint bounds, for every m>=4. -/
theorem endpoint_ratio (m : ℕ) (hm : 4≤m) :
    0<(OneThird.E m : ℝ) ∧
    (34884 : ℝ)/100000<(OneThird.N m : ℝ)/OneThird.E m ∧
    (OneThird.N m : ℝ)/OneThird.E m<1/2 := by
  have he := eu3.sound (fun _ => scaledPower m) (fun _ => scaledPower_enclosed m hm) 3 2
  have hn := nu3.sound (fun _ => scaledPower m) (fun _ => scaledPower_enclosed m hm) 3 2
  have hb := endpoint_bounds numeric_separator he hn
  rw [E_value,N_value] at hb
  have hw := weight_pos [0,0] (fun _ => m)
  refine ⟨(mul_pos_iff_of_pos_left hw).mp hb.1, ?_⟩
  simpa only [mul_div_mul_left _ _ (ne_of_gt hw)] using hb.2
end OneThird.EndpointData5
