#!/bin/bash
FULL_VERSION=$1
REPLACE_STRING="__VERSION__"
ZIPFILE="zebra-sdlc-rollup-$FULL_VERSION.tgz"
CHART_DIR="./Chart"

echo "Packaging Helm Chart - $FULL_VERSION AS $ZIPFILE"

# Replace version number
sed -i "s/$REPLACE_STRING/$FULL_VERSION/" "$CHART_DIR/Chart.yaml"

# update repo index
helm repo update

# Update dependencies (e.g. download them)
helm dependency update "$CHART_DIR"

# Package file
helm package "$CHART_DIR"