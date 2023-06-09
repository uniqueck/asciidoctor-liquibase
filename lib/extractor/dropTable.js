// *** WARNING: DO NOT MODIFY *** This is a generated JavaScript source code!
//
// Generated by LF-ET 2.2.1 (230620A), https://www.lohrfink.de/lfet
// From decision table
// "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/dropTable.lfet"
// 20.06.2023 17:24
//
// Changes to this code resulting from refactorings can be synchronised
// with LF-ET using the function "Scrapbook Import".
//
// Prolog Decision Table ---->
function dropTable (element, currentFile, processModel, logger, vfs) {
  // Prolog Decision Table <----
  // Condition B01/01: definition is based on ... format / yaml / yaml definition
  if (currentFile.endsWith('yaml')) {
    // Rule R01 ---->
    // Trace ---->
    logger.info(`dropTable - 20230620.172416 - 1 / 3 - ${currentFile} - ${JSON.stringify(processModel)}`)
    // Trace <----
    // Action A01/01: extract ... / yaml / extract table on yaml definition
    processModel.tables.delete(element.dropTable.tableName)
    // Rule R01 <----
  // Condition B01/02: definition is based on ... format / xml / xml definition
  } else if (currentFile.endsWith('xml')) {
    // Rule R02 ---->
    // Trace ---->
    logger.info(`dropTable - 20230620.172416 - 2 / 3 - ${currentFile} - ${JSON.stringify(processModel)}`)
    // Trace <----
    // Action A01/02: extract ... / xml / extract on xml definition
    processModel.tables.delete(element.$.tableName)
    // Rule R02 <----
  } else {
    // Rule R03 ---->
    // Trace ---->
    logger.info(`dropTable - 20230620.172416 - 3 / 3 - ${currentFile} - ${JSON.stringify(processModel)}`)
    // Trace <----
    // Action A02: error
    logger.errror('dass')
    // Rule R03 <----
  }
  // Epilog Decision Table ---->
}

module.exports = {
  extract: (element, currentFile, processModel, logger, vfs) => {
    return dropTable(element, currentFile, processModel, logger, vfs)
  }
}
// Epilog Decision Table <----

// End of generated JavaScript source code
// Generated by LF-ET 2.2.1 (230620A), https://www.lohrfink.de/lfet
