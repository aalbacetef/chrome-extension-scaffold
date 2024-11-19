# Introduction 

Chrome extension scaffold. I don't really expect anyone but me to use this, but figured I might as well make it public. It depends on fish and bun since those are what I use.


### Structure 


#### data/extension/ 

Here is where the extension manifest as well as assets go. The contents are copied over to the dist/ folder.


#### src/app/ 

The plugin/popup code. It's a Vue app.

#### src/background/ 

The background script, main.ts is the entrypoint and everything in the folder gets bundled into a single script.

#### src/content/ 

The content script. It's a Vue app.

#### src/lib/

Contains common code, types, and components used throughout the extension.

#### tasks/

Contains the build scripts. Written in fish.

### Build process 

There are two main steps: 

1. creating the bundles 
2. copying everything over to the dist/ directory.


`Make` simplifies this with `make build`.
