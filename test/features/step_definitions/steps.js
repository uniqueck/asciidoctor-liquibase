const { When, Then, Given, Before } = require('@cucumber/cucumber')
const { liquibaseElement } = require('../../../lib/liquibase-elements')
const assert = require('referee').assert
let elementNameCallback
let tagValueCallback
let element
let loggerMock
let elementInfo
let currenFile
let processModel

Before(function () {
  processModel = { finishedProcessing: false, tillTag: undefined }
  processModel.tables = new Map()

  loggerMock = {
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
})

Given('xml based liquibase element name is {string}', function (_elementName) {
  element = {
    '#name': _elementName
  }
})

Given('xml based liquibase element name is {string} with tag {string}', function (_elementName, tag) {
  element = {
    '#name': _elementName,
    $: {
      tag
    }
  }
})

Given('yaml based liquibase element name is {string} with tag {string}', function (_elementName, tag) {
  element = {}
  element[_elementName] = { tag }
})

Given('yaml based liquibase element name is {string}', function (_elementName) {
  element = {}
  element[_elementName] = {}
})

Given('define xml element name callback function', function () {
  elementNameCallback = (_element, _elementName) => { return _element['#name'] === _elementName }
})

Given('xml tag value callback function is provided', function () {
  tagValueCallback = (_element) => { return _element.$.tag }
})

Given('yaml tag value callback function is provided', function () {
  tagValueCallback = (_element) => { return _element.tagDatabase.tag }
})

Given('define yaml element name callback function', function () {
  elementNameCallback = (_element, _elementName) => { return _element[_elementName] }
})

When('liquibase-elements is called without tillTag defined', function () {
  elementInfo = liquibaseElement(element, loggerMock, undefined, elementNameCallback, tagValueCallback)
})

When('liquibase-elements is called with tillTag {string}', function (tillTag) {
  elementInfo = liquibaseElement(element, loggerMock, tillTag, elementNameCallback, tagValueCallback)
})

Then('Check that ignore message is logged', function () {
  assert(loggerMock.infoMessages.includes(`Liquibase element '${JSON.stringify(element)}' ignored`))
})

Then('Check that not supported message is logged', function () {
  assert(loggerMock.warnMessages.includes(`Unsupported liquibase element '${JSON.stringify(element)}' detected`))
})

Then('element should ignored from processing', function () {
  assert(elementInfo.ignore === true)
})

Then('processing is not finished', function () {
  assert(elementInfo.finshedProcessing === false)
})

Then('processing is finished', function () {
  assert(elementInfo.finshedProcessing === true)
})

Then('element name is {string}', function (elementName) {
  assert(elementInfo.elementName === elementName)
})

When('extractor {string} is called', function (extractorName) {
  const { extract } = require(`../../../lib/extractor/${extractorName}`)
  extract(element, currenFile, processModel, loggerMock, null)
})

Given('{string} based {string} changeset', function (format, changeSeType) {
  currenFile = `currentFile.${format}`
  element = {}
  if (format === 'yaml') {
    element[changeSeType] = {}
    element[changeSeType].tableName = 'tableName'
    element[changeSeType].columnNames = 'column'
    processModel.tables.set('tableName', { columns: new Map() })
    processModel.tables.get('tableName').columns.set('column', { type: 'bigint', primaryKey: false })
  } else if (format === 'xml') {
    element.$ = {}
    element.$.tableName = 'tableName'
    element.$.columnNames = 'column'
    processModel.tables.set('tableName', { columns: new Map() })
    processModel.tables.get('tableName').columns.set('column', { type: 'bigint', primaryKey: false })
  }
})

Then('Error message {string} is logged', function (message) {
  assert(loggerMock.errorMessages.includes(message))
})

Then('{string} information is extracted', function (changeSetType) {
  if (changeSetType === 'addPrimaryKey') {
    assert(processModel.tables.get('tableName').columns.get('column').primaryKey === true)
  }
})
