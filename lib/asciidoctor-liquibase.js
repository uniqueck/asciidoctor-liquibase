/* global Opal */
// @ts-check

const { XMLParser } = require('fast-xml-parser');



function liquibaseBlockMacro (name, context) {
    return function () {
        const self = this
        self.named(name)
        self.process((parent, target, attrs) => {
            let vfs = context.vfs
            target = parent.applySubstitutions(target, ['attributes'])
            const doc = parent.getDocument()

            return undefined
        })
    }
}

module.exports.register = function (registry, context = {}) {

    if (typeof context.contentCatalog !== 'undefined' && typeof context.contentCatalog.addFile === 'function' && typeof context.file !== 'undefined') {
        console.log('Patch')
        context.vfs = require('./antora-adapter.js')(context.file, context.contentCatalog, context.vfs)
    }
    context.logger = Opal.Asciidoctor.LoggerManager.getLogger()
    const names = [
        'liquibase',
    ]

    if (typeof registry.register === 'function') {
        registry.register(function () {
          for (const name of names) {
            this.blockMacro(liquibaseBlockMacro(name, context))
          }
        })
      } else if (typeof registry.block === 'function') {
        for (const name of names) {
            registry.blockMacro(liquibaseBlockMacro(name, context))
        }
      }
      return registry
}