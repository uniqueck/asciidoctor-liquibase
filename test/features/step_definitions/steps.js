const { When, Then, Given, Before, After } = require('@cucumber/cucumber')
const { liquibaseElement } = require('../../../lib/liquibase-elements')
const { assert } = require('referee')

After(function () {
  this.attach(this.loggerMock.infoMessages.join('\n'))
  if (this.loggerMock.errorMessages.join('\n') !== '') {
    this.attach(this.loggerMock.errorMessages.join('\n'))
  }
  if (this.loggerMock.warnMessages.join('\n') !== '') {
    this.attach(this.loggerMock.warnMessages.join('\n'))
  }
})

Before(function () {
  this.processModel = { finishedProcessing: false, tillTag: undefined }
  this.processModel.tables = new Map()

  this.loggerMock = {
    warnMessages: [],
    infoMessages: [],
    errorMessages: [],
    info: function (message) {
      this.infoMessages.push(message)
    },
    warn: function (message) {
      this.warnMessages.push(message)
    },
    error: function (message) {
      this.errorMessages.push(message)
    }
  }

  this.vfs = {

    read: function (changelogfile) {
      if (changelogfile === 'include.yaml') {
        return `databaseChangeLog:
          - changeSet:
              changes:
                - tagDatabase:
                  tag: includeTag        
        `
      } else if (changelogfile === 'include.xml') {
        return `<?xml version="1.0" encoding="UTF-8"?>
          <databaseChangeLog xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
            http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.1.xsd">

            <changeSet author="author@x.de" id="tag-4.0">
              <tagDatabase tag="4.0"/>
            </changeSet>
          </databaseChangeLog>`
      }
    },

    createRelativeResourceId: function (currentFile, changelogFile) {
      return changelogFile
    }

  }
})

Given('xml based liquibase element name is {string}', function (_elementName) {
  this.element = {
    '#name': _elementName
  }
})

Given('xml based liquibase element name is {string} with tag {string}', function (_elementName, tag) {
  this.element = {
    '#name': _elementName,
    $: {
      tag
    }
  }
})

Given('yaml based liquibase element name is {string} with tag {string}', function (_elementName, tag) {
  this.element = {}
  this.element[_elementName] = { tag }
})

Given('yaml based liquibase element name is {string}', function (_elementName) {
  this.element = {}
  this.element[_elementName] = {}
})

Given('define xml element name callback function', function () {
  this.elementNameCallback = (_element, _elementName) => { return _element['#name'] === _elementName }
})

Given('xml tag value callback function is provided', function () {
  this.tagValueCallback = (_element) => { return _element.$.tag }
})

Given('yaml tag value callback function is provided', function () {
  this.tagValueCallback = (_element) => { return _element.tagDatabase.tag }
})

Given('define yaml element name callback function', function () {
  this.elementNameCallback = (_element, _elementName) => { return _element[_elementName] }
})

When('liquibase-elements is called without tillTag defined', function () {
  this.elementInfo = liquibaseElement(this.element, this.loggerMock, undefined, this.elementNameCallback, this.tagValueCallback)
})

When('liquibase-elements is called with tillTag {string}', function (tillTag) {
  this.elementInfo = liquibaseElement(this.element, this.loggerMock, tillTag, this.elementNameCallback, this.tagValueCallback)
})

Then('Check that ignore message is logged', function () {
  assert(this.loggerMock.infoMessages.includes(`Liquibase element '${JSON.stringify(this.element)}' ignored`))
})

Then('Check that not supported message is logged', function () {
  assert(this.loggerMock.warnMessages.includes(`Unsupported liquibase element '${JSON.stringify(this.element)}' detected`))
})

Then('element should ignored from processing', function () {
  assert(this.elementInfo.ignore === true)
})

Then('processing is not finished', function () {
  assert(this.elementInfo.finishedProcessing === false)
})

Then('processing is finished', function () {
  assert(this.elementInfo.finishedProcessing === true)
})

Then('element name is {string}', function (elementName) {
  assert(this.elementInfo.elementName === elementName)
})

When('extractor {string} is called', function (extractorName) {
  const { extract } = require(`../../../lib/extractor/${extractorName}`)
  extract(this.element, this.currentFile, this.processModel, this.loggerMock, this.vfs)
})

Given('{string} based include changeset with target include file extension {string}', function (format, targetIncludeFileExtension) {
  this.currentFile = `currentFile.${format}`
  this.targetIncludeFile = `include.${targetIncludeFileExtension}`
  if (format === 'yaml') {
    this.element = { include: { file: this.targetIncludeFile } }
  } else if (format === 'xml') {
    this.element = { $: { file: this.targetIncludeFile } }
  }
})

Given('{string} based {string} changeset', function (format, changeSeType) {
  this.currentFile = `currentFile.${format}`
  this.element = {}
  if (format === 'yaml') {
    this.element[changeSeType] = {}
    this.element[changeSeType].tableName = 'tableName'
    this.processModel.tables.set('tableName', { columns: new Map() })
    if (changeSeType === 'addPrimaryKey') {
      this.element[changeSeType].columnNames = 'column'
      this.processModel.tables.get('tableName').columns.set('column', { type: 'bigint', primaryKey: false })
    } else if (changeSeType === 'addColumn') {
      /**
       * - addColumn:
       *   tableName: ADD_COLUMN_TEST_TABLE
       *   columns:
       *     - column:
       *       name: A_NEW_COLUMN
       *       type: int
       *       defaultValueNumeric: 1
       *       constraints:
       *         nullable: false
       *         unique: true
       *         uniqueConstraintName: uq_addcoltest1
       */
      this.element[changeSeType].columns = []
      this.element[changeSeType].columns[0] = { column: { name: 'addColumn', type: 'int' } }
    } else if (changeSeType === 'dropColumn') {
      this.element[changeSeType] = { tableName: 'tableName', columnName: 'dropColumn' }
      this.processModel.tables.set('tableName', { columns: new Map() })
      this.processModel.tables.get('tableName').columns.set('dropColumn', { type: 'int' })
    } else if (changeSeType === 'renameColumn') {
      this.element[changeSeType] = { tableName: 'tableName', oldColumnName: 'column2Rename', newColumnName: 'renamedColumn' }
      this.processModel.tables.set('tableName', { columns: new Map() })
      this.processModel.tables.get('tableName').columns.set('column2Rename', { type: 'int' })
    } else if (changeSeType === 'dropTable') {
      this.element[changeSeType] = { tableName: 'tableName' }
      this.processModel.tables.set('tableName', { columns: new Map() })
    } else if (changeSeType === 'modifyDataType') {
      this.element[changeSeType] = { tableName: 'tableName', columnName: 'columnName', newDataType: 'varchar' }
      this.processModel.tables.set('tableName', { columns: new Map() })
      this.processModel.tables.get('tableName').columns.set('columnName', { type: 'int' })
    } else if (changeSeType === 'createIndex') {
      this.element[changeSeType] = { tableName: 'tableName', indexName: 'indexName', columns: [{ column: { name: 'columnName' } }] }
      this.processModel.tables.set('tableName', { columns: new Map() })
      this.processModel.tables.get('tableName').columns.set('columnName', { type: 'int' })
    } else if (changeSeType === 'createTable') {
      this.element[changeSeType] = { tableName: 'table2Create', columns: [] }
      this.element[changeSeType].columns[0] = { column: { name: 'columnName', type: 'int' } }
    } else if (changeSeType === 'addForeignKeyConstraint') {
      this.element[changeSeType] = { baseTableName: 'baseTable', baseColumnNames: 'baseColumn', referencedTableName: 'referencedTable', referencedColumnNames: 'referencedColumn' }
      this.processModel.tables.set('baseTable', { columns: new Map() })
      this.processModel.tables.get('baseTable').columns.set('baseColumn', { type: 'int' })
      this.processModel.tables.set('referencedTable', { columns: new Map() })
      this.processModel.tables.get('referencedTable').columns.set('referencedColumn', { type: 'int' })
    } else if (changeSeType === 'changeSet') {
      this.element[changeSeType] = {}
    } else {
      return 'pending'
    }
  } else if (format === 'xml') {
    this.element.$ = {}
    this.element.$.tableName = 'tableName'
    if (changeSeType === 'addPrimaryKey') {
      this.element.$.columnNames = 'column'
      this.processModel.tables.set('tableName', { columns: new Map() })
      this.processModel.tables.get('tableName').columns.set('column', { type: 'bigint', primaryKey: false })
    } else if (changeSeType === 'addColumn') {
      this.element.column = []
      this.element.column[0] = {}
      this.element.column[0].$ = { name: 'addColumn', type: 'int' }
      this.processModel.tables.set('tableName', { columns: new Map() })
    } else if (changeSeType === 'dropColumn') {
      this.element.$ = { tableName: 'tableName', columnName: 'dropColumn' }
      this.processModel.tables.set('tableName', { columns: new Map() })
      this.processModel.tables.get('tableName').columns.set('dropColumn', { type: 'int' })
    } else if (changeSeType === 'renameColumn') {
      this.element.$ = { tableName: 'tableName', oldColumnName: 'column2Rename', newColumnName: 'renamedColumn' }
      this.processModel.tables.set('tableName', { columns: new Map() })
      this.processModel.tables.get('tableName').columns.set('column2Rename', { type: 'int' })
    } else if (changeSeType === 'modifyDataType') {
      this.element.$ = { tableName: 'tableName', columnName: 'columnName', newDataType: 'varchar' }
      this.processModel.tables.set('tableName', { columns: new Map() })
      this.processModel.tables.get('tableName').columns.set('columnName', { type: 'int' })
    } else if (changeSeType === 'dropTable') {
      this.element.$ = { tableName: 'tableName' }
    } else if (changeSeType === 'createTable') {
      this.element.$ = { tableName: 'table2Create' }
      this.element.$$ = []
      this.element.$$[0] = { $: { name: 'columnName', type: 'int' } }
    } else if (changeSeType === 'addForeignKeyConstraint') {
      this.element.$ = { baseTableName: 'baseTable', baseColumnNames: 'baseColumn', referencedTableName: 'referencedTable', referencedColumnNames: 'referencedColumn' }
      this.processModel.tables.set('baseTable', { columns: new Map() })
      this.processModel.tables.get('baseTable').columns.set('baseColumn', { type: 'int' })
      this.processModel.tables.set('referencedTable', { columns: new Map() })
      this.processModel.tables.get('referencedTable').columns.set('referencedColumn', { type: 'int' })
    } else if (changeSeType === 'changeSet') {
      this.element.$$ = [{ '#name': 'tagDatabase', $: { tag: '1.0.0' } }]
    } else {
      return 'pending'
    }
  }
})

Given('changeSet has changes', function () {
  this.element.changeSet = { changes: [{ tagDatbase: { tag: '1.0.0' } }] }
})

Then('Error message {string} is logged', function (message) {
  assert(this.loggerMock.errorMessages.includes(message))
})

Then('{string} information is extracted', function (changeSetType) {
  if (changeSetType === 'addPrimaryKey') {
    assert(this.processModel.tables.get('tableName').columns.get('column').primaryKey === true)
  } else if (changeSetType === 'addColumn') {
    assert(this.processModel.tables.get('tableName').columns.get('addColumn') !== undefined)
    assert(this.processModel.tables.get('tableName').columns.get('addColumn').type === 'int')
  } else if (changeSetType === 'dropColumn') {
    assert(this.processModel.tables.get('tableName').columns.get('dropColumn') === undefined)
  } else if (changeSetType === 'renameColumn') {
    assert(this.processModel.tables.get('tableName').columns.get('renamedColumn') !== undefined)
    assert(this.processModel.tables.get('tableName').columns.get('renamedColumn').type === 'int')
  } else if (changeSetType === 'dropTable') {
    assert(this.processModel.tables.get('tableName') === undefined)
  } else if (changeSetType === 'modifyDataType') {
    assert(this.processModel.tables.get('tableName').columns.get('columnName').type === 'varchar')
  } else if (changeSetType === 'createIndex') {
    assert(this.processModel.tables.get('tableName').indices !== undefined)
    assert(this.processModel.tables.get('tableName').indices.get('indexName') !== undefined)
    assert(this.processModel.tables.get('tableName').indices.get('indexName').columns !== undefined)
    assert(this.processModel.tables.get('tableName').indices.get('indexName').columns.length === 1)
    assert(this.processModel.tables.get('tableName').indices.get('indexName').columns[0] === 'columnName')
  } else if (changeSetType === 'createTable') {
    assert(this.processModel.tables.get('table2Create') !== undefined)
    assert(this.processModel.tables.get('table2Create').columns !== undefined)
    assert(this.processModel.tables.get('table2Create').columns.get('columnName').type === 'int')
    assert(this.processModel.tables.get('table2Create').columns.get('columnName').primaryKey === false)
  } else if (changeSetType === 'addForeignKeyConstraint') {
    assert(this.processModel.tables.get('baseTable') !== undefined)
    assert(this.processModel.tables.get('baseTable').columns.get('baseColumn') !== undefined)
    assert(this.processModel.tables.get('referencedTable') !== undefined)
    assert(this.processModel.tables.get('referencedTable').columns.get('referencedColumn') !== undefined)
    assert(this.processModel.tables.get('baseTable').columns.get('baseColumn').referencedTable === 'referencedTable')
    assert(this.processModel.tables.get('baseTable').columns.get('baseColumn').referencedColumn === 'referencedColumn')
  } else if (changeSetType === 'changeSet') {
    // ignore noe
  } else {
    return 'pending'
  }
})
