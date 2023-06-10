# Asciidoctor Liquibase Extension

[![Build JavaScript](https://github.com/uniqueck/asciidoctor-liquibase/actions/workflows/ci.yaml/badge.svg)](https://github.com/uniqueck/asciidoctor-liquibase/actions/workflows/ci.yaml)
[![npm version](http://img.shields.io/npm/v/asciidoctor-liquibase.svg)](https://www.npmjs.com/package/asciidoctor-liquibase)

An extension for [Asciidoctor.js](https://github.com/asciidoctor/asciidoctor.js) to convert [Liquibase](https://www.liquibase.org) changeset files to entity relationship diagrams!

* [Install](#install)
  + [Node.js](#nodejs)
  + [Antora Integration](#antora-integration)
* [Contributing](#contributing)

## Install

### Node.js

Install the dependencies:

```shell
npm i asciidoctor asciidoctor-liquibase
```

Create a file named `liquibase.js` with following content and run it:

```javascript
const asciidoctor = require('@asciidoctor/core')()
const liquibase = require('asciidoctor-liquibase')

const input = 'liquibase::db.changelog-master.yaml[]'

liquibase.register(asciidoctor.Extensions) // <1>
console.log(asciidoctor.convert(input, { safe: 'safe' }))

const registry = asciidoctor.Extensions.create()
liquibase.register(registry) // <2>
console.log(asciidoctor.convert(input, { safe: 'safe', extension_registry: registry }))
```
**<1>** Register the extension in the global registry <br/>
**<2>** Register the extension in a dedicated registry

### Antora Integration

If you are using [Antora](https://antora.org/), you can integrate Liquibase in your documentation site.

Install the extension in your playbook project:

       $ npm i asciidoctor-liquibase

2. Register the extension in your playbook file:

    ```yaml
    asciidoc:
      extensions:
        - asciidoctor-liquibase
    ```

   https://docs.antora.org/antora/2.3/playbook/configure-asciidoc/#extensions

## Contributing

### Setup

To build this project, you will need the latest active LTS of Node.js and npm (we recommend `nvm` to manage multiple active Node.js versions).
This project use decision tables to generate code, so you need a license of [https://lohrfink.de](https://lohrfink.de).

### Building

1. Install the dependencies:

```shell
npm i
```

2. Generate a distribution:

```shell
npm run dist
```

When working on a new feature or when fixing a bug, make sure to run the linter and the tests suite:

```shell
npm run lint
npm run test
```