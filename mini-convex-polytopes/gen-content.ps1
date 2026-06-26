$base = "$PSScriptRoot"
$src = "$base\MiniConvexPolytopes"

# Helper to write file content
function Write-LeanFile($relPath, $content) {
    $fullPath = Join-Path $base $relPath
    $parent = Split-Path $fullPath -Parent
    if (-not (Test-Path $parent)) { New-Item -ItemType Directory -Force -Path $parent | Out-Null }
    [System.IO.File]::WriteAllText($fullPath, $content.TrimStart(), [System.Text.UTF8Encoding]::new($false))
}

Write-LeanFile "MiniConvexPolytopes.lean" @'
import MiniConvexPolytopes.Core.Basic
import MiniConvexPolytopes.Core.Laws
import MiniConvexPolytopes.Core.Objects
import MiniConvexPolytopes.Morphisms.Hom
import MiniConvexPolytopes.Morphisms.Iso
import MiniConvexPolytopes.Morphisms.Equiv
import MiniConvexPolytopes.Constructions.Products
import MiniConvexPolytopes.Constructions.Quotients
import MiniConvexPolytopes.Constructions.Subobjects
import MiniConvexPolytopes.Constructions.Universal
import MiniConvexPolytopes.Properties.Invariants
import MiniConvexPolytopes.Properties.Preservation
import MiniConvexPolytopes.Properties.ClassificationData
import MiniConvexPolytopes.Theorems.Basic
import MiniConvexPolytopes.Theorems.Classification
import MiniConvexPolytopes.Theorems.Main
import MiniConvexPolytopes.Theorems.UniversalProperties
import MiniConvexPolytopes.Examples.Standard
import MiniConvexPolytopes.Examples.Counterexamples
import MiniConvexPolytopes.Bridges.ToAlgebra
import MiniConvexPolytopes.Bridges.ToTopology
import MiniConvexPolytopes.Bridges.ToGeometry
import MiniConvexPolytopes.Bridges.ToComputation
'@

Write-LeanFile "Main.lean" @'
import MiniConvexPolytopes

def main : IO Unit :=
  IO.println s!"mini-convex-polytopes - Convex Polytopes: vertices faces facets f-vectors h-vectors Euler relation Gale diagrams shellability and polytope theory"
'@

Write-Host "Top-level files written."
