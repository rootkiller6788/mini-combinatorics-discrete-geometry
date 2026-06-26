$base = "$PSScriptRoot"
$srcDir = "$base\MiniConvexPolytopes"

function Write-LeanFile($relPath, $content) {
    $fullPath = Join-Path $base $relPath
    $parent = Split-Path $fullPath -Parent
    if (-not (Test-Path $parent)) { New-Item -ItemType Directory -Force -Path $parent | Out-Null }
    [System.IO.File]::WriteAllText($fullPath, $content, [System.Text.UTF8Encoding]::new($false))
}

function Write-FromFile($leanPath, $txtName) {
    $txtPath = Join-Path $base $txtName
    $content = [System.IO.File]::ReadAllText($txtPath, [System.Text.UTF8Encoding]::new($false))
    Write-LeanFile $leanPath $content
    Write-Host "$leanPath written."
}

Write-FromFile "$srcDir/Core/Laws.lean" "core-laws.txt"
Write-FromFile "$srcDir/Core/Objects.lean" "core-objects.txt"
Write-FromFile "$srcDir/Morphisms/Hom.lean" "morph-hom.txt"
Write-FromFile "$srcDir/Morphisms/Iso.lean" "morph-iso.txt"
Write-FromFile "$srcDir/Morphisms/Equiv.lean" "morph-equiv.txt"
Write-FromFile "$srcDir/Constructions/Products.lean" "const-products.txt"
Write-FromFile "$srcDir/Constructions/Quotients.lean" "const-quotients.txt"
Write-FromFile "$srcDir/Constructions/Subobjects.lean" "const-subobjects.txt"
Write-FromFile "$srcDir/Constructions/Universal.lean" "const-universal.txt"
Write-FromFile "$srcDir/Properties/Invariants.lean" "prop-invariants.txt"
Write-FromFile "$srcDir/Properties/Preservation.lean" "prop-preservation.txt"
Write-FromFile "$srcDir/Properties/ClassificationData.lean" "prop-classification.txt"
Write-FromFile "$srcDir/Theorems/Basic.lean" "theorems-basic.txt"
Write-FromFile "$srcDir/Theorems/Classification.lean" "theorems-classification.txt"
Write-FromFile "$srcDir/Theorems/Main.lean" "theorems-main.txt"
Write-FromFile "$srcDir/Theorems/UniversalProperties.lean" "theorems-universalproperties.txt"
Write-FromFile "$srcDir/Examples/Standard.lean" "examples-standard.txt"
Write-FromFile "$srcDir/Examples/Counterexamples.lean" "examples-counterexamples.txt"
Write-FromFile "$srcDir/Bridges/ToAlgebra.lean" "bridges-toalgebra.txt"
Write-FromFile "$srcDir/Bridges/ToTopology.lean" "bridges-totopology.txt"
Write-FromFile "$srcDir/Bridges/ToGeometry.lean" "bridges-togeometry.txt"
Write-FromFile "$srcDir/Bridges/ToComputation.lean" "bridges-tocomputation.txt"
