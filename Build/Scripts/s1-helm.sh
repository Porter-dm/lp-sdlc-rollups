#!/bin/bash
set -o errexit

FULL_VERSION=$1
REPLACE_STRING="__VERSION__"
ZIPFILE="zebra-sdlc-rollup-$FULL_VERSION.tgz"

# IMPORTANT - use the release folder we just checked out - not the one that is local to the build pipeline
CHART_DIR="../../release/Chart"

echo "Packaging Helm Chart - $FULL_VERSION"

# Replace version number
sed -i "s/$REPLACE_STRING/$FULL_VERSION/" $CHART_DIR/Chart.yaml

# update repo index
helm repo update

# Update dependencies (e.g. download them)
helm dependency update $CHART_DIR

# Package file
helm package $CHART_DIR

# Publish
curl --header "Authorization: Bearer $JFROG_TOKEN" -T ./$ZIPFILE "https://$DOTMATICS_HELM_REGISTRY/$ZIPFILE"

# Remove zip file
rm ./$ZIPFILE