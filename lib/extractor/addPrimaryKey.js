// *** WARNING: DO NOT MODIFY *** This is a generated JavaScript source code! 
// 
// Generated by LF-ET 2.2.1 (230526A), https://www.lohrfink.de/lfet
// From decision table
// "/opt/data/github/asciidoctor/asciidoctor-liquibase/lfet/extractor/addPrimaryKey.lfet"
// 11.06.2023 13:34
// 
// Changes to this code resulting from refactorings can be synchronised
// with LF-ET using the function "Scrapbook Import".
// 
// Prolog Decision Table ---->
function addPrimaryKey(element, currentFile, processModel, logger, vfs) {
    // Prolog Decision Table <----
    // Condition B01/01: definition is based on ... format / yaml / yaml definition
    if (
    currentFile.endsWith('yaml')
    )
    {
        // Rule R01 ---->
        // Trace ---->
        logger.info(`addPrimaryKey - 20230611.133403 - 1 / 3 - ${currentFile} - ${JSON.stringify(processModel)}`)
        // Trace <----
        // Action A01/01: extract ... / yaml / extract table on yaml definition
        let tableName = element.dropColumn.tableName
        let columnName = element.dropColumn.columnName
        processModel.tables.get(tableName).columns.delete(columnName)
        // Rule R01 <----
    // Condition B01/02: definition is based on ... format / xml / xml definition
    }
    else if (
    currentFile.endsWith('xml')
    )
    {
        // Rule R02 ---->
        // Trace ---->
        logger.info(`addPrimaryKey - 20230611.133403 - 2 / 3 - ${currentFile} - ${JSON.stringify(processModel)}`)
        // Trace <----
        // Action A01/02: extract ... / xml / extract on xml definition
        let table = processModel.tables.get(element.$['tableName'])
        let columnNames = element.$['columnNames']
        table.columns.get(columnNames).primaryKey = true
        // Rule R02 <----
    }
    else
    {
        // Rule R03 ---->
        // Trace ---->
        logger.info(`addPrimaryKey - 20230611.133403 - 3 / 3 - ${currentFile} - ${JSON.stringify(processModel)}`)
        // Trace <----
        // Action A02: error
        logger.error(`addPrimaryKey - 20230611.133403 - Format for ${currentFile} is not supported.`)
        // Rule R03 <----
    }
    // Epilog Decision Table ---->
}

module.exports = {
  extract: (element, currentFile, processModel, logger, vfs) => {
    return addPrimaryKey(element, currentFile, processModel, logger, vfs)
  }
}
// Epilog Decision Table <----

// End of generated JavaScript source code
// Generated by LF-ET 2.2.1 (230526A), https://www.lohrfink.de/lfet
