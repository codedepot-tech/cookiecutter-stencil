{
  "name": "blah",
  "version": "0.0.1",
  "description": "Stencil Component Starter",
  "main": "dist/index.cjs.js",
  "module": "dist/custom-elements/index.js",
  "es2015": "dist/esm/index.mjs",
  "es2017": "dist/esm/index.mjs",
  "types": "dist/custom-elements/index.d.ts",
  "collection": "dist/collection/collection-manifest.json",
  "collection:main": "dist/collection/index.js",
  "unpkg": "dist/blah/blah.esm.js",
  "files": [
    "dist/",
    "loader/"
  ],
  "scripts": {
    "build": "stencil build --docs",
    "start": "stencil build --dev --watch --serve",
    "test": "stencil test --spec --e2e",
    "test.watch": "stencil test --spec --e2e --watchAll",
    "generate": "stencil generate"
  },
  "dependencies": {
    "@stencil/core": "^2.7.0",
    "apollo-client": "^2.6.10",
    "graphql": "^15.5.3"
  },
  "devDependencies": {
    "@types/jest": "^26.0.24",
    "jest": "^26.6.3",
    "jest-cli": "^26.6.3",
    "nodejs": "0.0.0",
    "npm": "^7.23.0",
    "stencil": "0.0.5",
    "yarn": "^1.22.11"
  },
  "license": "MIT"
}
