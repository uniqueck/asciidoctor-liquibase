// *** WARNING: DO NOT MODIFY *** This is a generated JavaScript source code!
//
// Generated by LF-ET 2.2.1 (230826a), https://www.lohrfink.de/lfet
// From decision table
// "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/asciidoctor-liquibase.lfet"
// 03.09.2023 01:16
//
// Changes to this code resulting from refactorings can be synchronised
// with LF-ET using the function "Scrapbook Import".
//
// Prolog Decision Table ---->
/* global Opal */
// @ts-check

function liquibaseBlockMacro (name, context) {
  return function () {
    const self = this
    self.named(name)
    self.positionalAttributes(['tillTag'])
    self.process((parent, target, attrs) => {
      let vfs = context.vfs
      if (typeof vfs === 'undefined' || typeof vfs.read !== 'function') {
        vfs = require('./node-fs.js')
      }
      const changelogFile = parent.applySubstitutions(target, ['attributes'])
      const doc = parent.getDocument()
      const logger = doc.getLogger()
      const processModel = { finishedProcessing: false, tillTag: attrs.tillTag || undefined }
      processModel.tables = new Map()
      let _step = 1
      let _exit = false
      do {
        _exit = true
        // $$BasicIndentLevel=4
        // Prolog Decision Table <----
        // Condition B01/01: Step / 1 / Step 1
        if (_step === 1) {
          // Condition B02/01: changeset format / xml / xml based changeset definitions
          if (changelogFile.endsWith('.xml')) {
            // Rule R01 ---->
            // Trace ---->
            logger.info('asciidoctor-liquibase - 20230903.011642 - 1 / 4')
            // Trace <----
            // Action A01/01: parse changesets / xml / parse xml based changesets
            const XMLParser = require('xml2js').Parser
            const parser = new XMLParser({ preserveChildrenOrder: true, explicitArray: true, explicitRoot: false, explicitChildren: true })
            //
            let elements = []
            parser.parseString(vfs.read(changelogFile), function (err, result) {
              if (err) {
                elements = []
              } else {
                elements = result.$$
              }
            })
            //
            require('./liquibase-parser.js').parseLiquibaseChangeSet(processModel, changelogFile, elements, logger, vfs)
            // Action A04/01: Step / + / next Step
            _step++
            _exit = false
            // Rule R01 <----
          // Condition B02/02: changeset format / yaml / yaml based changeset definitions
          } else if (changelogFile.endsWith('.yaml')) {
            // Rule R02 ---->
            // Trace ---->
            logger.info('asciidoctor-liquibase - 20230903.011642 - 2 / 4')
            // Trace <----
            // Action A01/02: parse changesets / yaml / parse yaml based changesets
            const YAML = require('yaml')
            const doc = YAML.parseDocument(vfs.read(changelogFile))
            //
            const elements = doc.toJSON().databaseChangeLog
            //
            require('./liquibase-parser.js').parseLiquibaseChangeSet(processModel, changelogFile, elements, logger, vfs)
            // Action A04/01: Step / + / next Step
            _step++
            _exit = false
            // Rule R02 <----
          } else {
            // Rule R03 ---->
            // Trace ---->
            logger.info('asciidoctor-liquibase - 20230903.011642 - 3 / 4')
            // Trace <----
            // Action A03/01: log not supported changeset definition / X / Aktion ausführen
            // TODO code statement sequence for A02 here
            // Action A04/02: Step / Ex / Exit
            _exit = true
            // Rule R03 <----
          }
        } else {
          // Rule R04 ---->
          // Trace ---->
          logger.info('asciidoctor-liquibase - 20230903.011642 - 4 / 4')
          // Trace <----
          // Action A02/01: convert to plantuml / X / Aktion ausführen
          const content = []
          content.push('[plantuml]', '----')
          content.push('\'hide the spot')
          content.push('hide circle')
          content.push('skinparam tabSize 4')
          content.push('\' avoid problems with angled crows feet')
          content.push('skinparam linetype ortho')
          content.push('\'entities')
          //
          for (const [key, value] of processModel.tables) {
            content.push(`entity ${key} {`)
            const primaryColumns = new Map(Array.from(value.columns).filter(([_key, columnData]) => columnData.primaryKey))
            //
            for (const [columnName, columnData] of primaryColumns) {
              content.push(`<<PK>>\\t${columnName}:${columnData.type}`)
            }
            //
            content.push('---')
            const nonPrimaryColumns = new Map(Array.from(value.columns).filter(([_key, columnData]) => !columnData.primaryKey))
            //
            for (const [columnName, columnData] of nonPrimaryColumns) {
              if (columnData.referencedColumn !== undefined) {
                content.push(`<<FK>>\\t${columnName}:${columnData.type}`)
              } else {
                content.push(`\\t\\t\\t${columnName}:${columnData.type}`)
              }
            }
            content.push('}')
          }
          content.push("'relationships")
          for (const [key, value] of processModel.tables) {
            Array.from(value.columns).filter(([_key, columnData]) => columnData.referencedTable !== undefined).forEach(([_key, columnData]) => {
              content.push(`${key} --- ${columnData.referencedTable} : ${_key}`)
            })
          }
          content.push('----')
          self.parseContent(parent, content.join('\n'), Opal.hash(attrs))
          // Action A04/02: Step / Ex / Exit
          _exit = true
          // Rule R04 <----
        }
        // Epilog Decision Table ---->
      } while (_exit === false)
      return undefined
    })
  }
}

module.exports.register = function (registry, context = {}) {
  if (typeof context.contentCatalog !== 'undefined' && typeof context.contentCatalog.addFile === 'function' && typeof context.file !== 'undefined') {
    context.vfs = require('./antora-adapter.js')(context.file, context.contentCatalog, context.vfs)
  }
  context.logger = Opal.Asciidoctor.LoggerManager.getLogger()
  const names = [
    'liquibase'
  ]
  //
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
// Epilog Decision Table <----

// End of generated JavaScript source code
// Generated by LF-ET 2.2.1 (230826a), https://www.lohrfink.de/lfet
