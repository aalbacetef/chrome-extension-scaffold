# Introduction 

Chrome extension scaffold.


### Structure 


#### data 


#### src/app 

The plugin/popup code. It's a Vue app.

#### src/background 

The background script, main.ts is the entrypoint and everything in the folder should get bundled into a single script.

#### src/content 

The content script. It's a Vue app.

#### src/lib 

Contains common code and types used by the above parts of the extension.

### Build process 

There's two main steps. 
The first is to build the three bundles (app, background, content).
