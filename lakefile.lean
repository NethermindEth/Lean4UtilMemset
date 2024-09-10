import Lake
open Lake DSL

require alloy from git "https://github.com/NethermindEth/lean4-alloy"@"main"

package «FastMemset» where

module_data alloy.c.o.export : BuildJob FilePath
module_data alloy.c.o.noexport : BuildJob FilePath

@[default_target]
lean_lib «FastMemset» where
  precompileModules := true
  nativeFacets := fun shouldExport =>
    if shouldExport then
      #[Module.oExportFacet, `alloy.c.o.export]
    else
      #[Module.oNoExportFacet, `alloy.c.o.noexport]
