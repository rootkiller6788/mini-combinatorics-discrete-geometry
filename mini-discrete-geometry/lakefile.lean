import Lake
open Lake DSL

package «mini-discrete-geometry» where

require std from git "https://github.com/leanprover/std4" @ "v4.31.0"

@[default_target]
lean_lib «DiscreteGeometry» where
  roots := #[`DiscreteGeometry]
