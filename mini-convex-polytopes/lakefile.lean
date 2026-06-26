import Lake
open Lake DSL

package «mini-convex-polytopes» where

@[default_target]
lean_lib «MiniConvexPolytopes» where
  roots := #[`MiniConvexPolytopes]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
