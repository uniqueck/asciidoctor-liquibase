// *** WARNING: DO NOT MODIFY *** This is a generated JavaScript source code!
//
// Generated by LF-ET 2.2.1 (230826a), https://www.lohrfink.de/lfet
// From decision table
// "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/modifyDataType.lfet"
// 10.09.2023 22:24
//
// Changes to this code resulting from refactorings can be synchronised
// with LF-ET using the function "Scrapbook Import".
//
// Prolog Decision Table ---->
const { stringify } = require('../utils')

function modifyDataType (element, currentFile, processModel, logger, vfs) {
  // Prolog Decision Table <----
  // Condition B01/01: definition is based on ... format / yaml / yaml definition
  if (currentFile.endsWith('yaml')) {
    // Rule R01 ---->
    // Trace ---->
    logger.info(`modifyDataType - 20230910.222411 - 1 / 3 - ${currentFile} - ${stringify(processModel)}`)
    // Trace <----
    // Action A01/01: extract ... / yaml / extract table on yaml definition
    const tableName = element.modifyDataType.tableName
    const columnName = element.modifyDataType.columnName
    const newColumnType = element.modifyDataType.newDataType
    processModel.tables.get(tableName).columns.get(columnName).type = newColumnType
    // Rule R01 <----
  // Condition B01/02: definition is based on ... format / xml / xml definition
  } else if (currentFile.endsWith('xml')) {
    // Rule R02 ---->
    // Trace ---->
    logger.info(`modifyDataType - 20230910.222411 - 2 / 3 - ${currentFile} - ${stringify(processModel)}`)
    // Trace <----
    // Action A01/02: extract ... / xml / extract on xml definition
    const tableName = element.$.tableName
    const columnName = element.$.columnName
    const newColumnType = element.$.newDataType
    processModel.tables.get(tableName).columns.get(columnName).type = newColumnType
    // Rule R02 <----
  } else {
    // Rule R03 ---->
    // Trace ---->
    logger.info(`modifyDataType - 20230910.222411 - 3 / 3 - ${currentFile} - ${stringify(processModel)}`)
    // Trace <----
    // Action A02/01: error / X / execute action
    logger.error(`modifyDataType - 20230910.222411 - Format for ${currentFile} is not supported.`)
    // Rule R03 <----
  }
  // Epilog Decision Table ---->
}

module.exports = {
  extract: (element, currentFile, processModel, logger, vfs) => {
    return modifyDataType(element, currentFile, processModel, logger, vfs)
  }
}
// Epilog Decision Table <----

// End of generated JavaScript source code
// Generated by LF-ET 2.2.1 (230826a), https://www.lohrfink.de/lfet
