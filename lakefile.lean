import Lake
open Lake DSL

require alloy from git "https://github.com/Ferinko/lean4-alloy.git"

package «FastMemset» where

module_data alloy.c.o.export : BuildJob FilePath
module_data alloy.c.o.noexport : BuildJob FilePath

lean_lib «FastMemset» where
  precompileModules := true
  nativeFacets := fun shouldExport =>
    if shouldExport then
      #[Module.oExportFacet, `alloy.c.o.export]
    else
      #[Module.oNoExportFacet, `alloy.c.o.noexport]

@[default_target]  
lean_exe WW where
  supportInterpreter := true
  root := `Main
