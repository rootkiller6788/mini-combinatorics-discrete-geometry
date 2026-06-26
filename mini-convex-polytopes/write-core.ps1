$base = "$PSScriptRoot"
$srcDir = "$base\MiniConvexPolytopes"

function Write-LeanFile($relPath, $content) {
    $fullPath = Join-Path $base $relPath
    $parent = Split-Path $fullPath -Parent
    if (-not (Test-Path $parent)) { New-Item -ItemType Directory -Force -Path $parent | Out-Null }
    [System.IO.File]::WriteAllText($fullPath, $content, [System.Text.UTF8Encoding]::new($false))
}

$coreLaws = Get-Content "$base\core-laws.txt" -Raw
Write-LeanFile "$srcDir/Core/Laws.lean" $coreLaws
Write-Host "Core/Laws.lean written."

$coreObjects = Get-Content "$base\core-objects.txt" -Raw
Write-LeanFile "$srcDir/Core/Objects.lean" $coreObjects
Write-Host "Core/Objects.lean written."

$morphismsHom = Get-Content "$base\morph-hom.txt" -Raw
Write-LeanFile "$srcDir/Morphisms/Hom.lean" $morphismsHom
Write-Host "Morphisms/Hom.lean written."

$morphismsIso = Get-Content "$base\morph-iso.txt" -Raw
Write-LeanFile "$srcDir/Morphisms/Iso.lean" $morphismsIso
Write-Host "Morphisms/Iso.lean written."

$morphismsEquiv = Get-Content "$base\morph-equiv.txt" -Raw
Write-LeanFile "$srcDir/Morphisms/Equiv.lean" $morphismsEquiv
Write-Host "Morphisms/Equiv.lean written."

$constProd = Get-Content "$base\const-products.txt" -Raw
Write-LeanFile "$srcDir/Constructions/Products.lean" $constProd
Write-Host "Constructions/Products.lean written."

$constQuot = Get-Content "$base\const-quotients.txt" -Raw
Write-LeanFile "$srcDir/Constructions/Quotients.lean" $constQuot
Write-Host "Constructions/Quotients.lean written."

$constSub = Get-Content "$base\const-subobjects.txt" -Raw
Write-LeanFile "$srcDir/Constructions/Subobjects.lean" $constSub
Write-Host "Constructions/Subobjects.lean written."

$constUniv = Get-Content "$base\const-universal.txt" -Raw
Write-LeanFile "$srcDir/Constructions/Universal.lean" $constUniv
Write-Host "Constructions/Universal.lean written."

$propInv = Get-Content "$base\prop-invariants.txt" -Raw
Write-LeanFile "$srcDir/Properties/Invariants.lean" $propInv
Write-Host "Properties/Invariants.lean written."

$propPres = Get-Content "$base\prop-preservation.txt" -Raw
Write-LeanFile "$srcDir/Properties/Preservation.lean" $propPres
Write-Host "Properties/Preservation.lean written."

$propClass = Get-Content "$base\prop-classification.txt" -Raw
Write-LeanFile "$srcDir/Properties/ClassificationData.lean" $propClass
Write-Host "Properties/ClassificationData.lean written."
