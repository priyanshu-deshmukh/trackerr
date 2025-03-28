#!/bin/bash

# Install dependencies
npm install

# Build Vite app (frontend) through npx (doesn't require global installation)
cd client
npx vite build --outDir ../dist-client

# Build our server code
cd ..
npx esbuild netlify/functions/api.ts --platform=node --packages=external --bundle --format=esm --outdir=netlify/functions/dist

# Create Netlify Function
cp netlify/functions/dist/api.js netlify/functions/api.mjs

# Make sure the public directory exists
mkdir -p public

echo "Build completed successfully!"