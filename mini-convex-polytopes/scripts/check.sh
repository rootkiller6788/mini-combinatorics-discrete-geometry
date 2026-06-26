#!/bin/bash
set -e
echo "Building mini-convex-polytopes..."
lake build
echo "Build succeeded."
lake env lean --run Test/Smoke.lean
