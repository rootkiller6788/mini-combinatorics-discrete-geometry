import Lake
open Lake DSL

package «mini-graph-theory» where
  -- Graph theory package: simple graphs, directed graphs, trees, connectivity, planarity

@[default_target]
lean_lib «MiniGraphTheory» where
  roots := #[`MiniGraphTheory]
  defaultFacets := #[ModuleFacet.oleans]
