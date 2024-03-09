#!/bin/bash

# Exit if any of the following commands exit with non-0, and echo our commands back
# set -ex

# Compile TypeScript into "temp" (defined is tsconfig.json)
npx tsc

# Install production dependencies under "temp"
cp package*.json temp
(cd temp && npm install --omit=dev)

# Create Lambda zipfile under "dist"
(cd temp && zip -r ../dist/lambda.zip *)

# # Clean up
rm -rf temp