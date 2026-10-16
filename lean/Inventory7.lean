import OneThird
import Lean
open Lean Elab Command
run_cmd do
  let env ← getEnv
  let mut entries : Array Json := #[]
  for (name, _) in env.constants.toList do
    if let some idx := env.getModuleIdxFor? name then
      let mod := env.header.moduleNames[idx.toNat]!
      if mod.toString == "OneThird" || mod.toString.startsWith "OneThird." then
        entries := entries.push (Json.mkObj [("name",toJson name.toString),("module",toJson mod.toString)])
  let ordered := entries.qsort (fun a b => a.compress < b.compress)
  liftIO <| IO.FS.writeFile "audit_inventory7.json" (Json.pretty (Json.arr ordered))
