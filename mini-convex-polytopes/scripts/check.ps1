$ErrorActionPreference = "Stop"
Write-Host "Building mini-convex-polytopes..."
lake build
if ($LASTEXITCODE -eq 0) {
    Write-Host "Build succeeded."
    lake env lean --run Test/Smoke.lean
} else {
    Write-Host "Build failed."
    exit 1
}
