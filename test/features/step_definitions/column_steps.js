const { When, Then, Given } = require('@cucumber/cucumber')
const { assert } = require('referee')

Given('{string} based column changeset', function (changesetType) {
  this.currentFile = `currentFile.${changesetType}`
  if (changesetType === 'yaml') {
    this.element = { name: 'columnName', type: 'varchar' }
  } else if (changesetType === 'xml') {
    this.element = { $: { name: 'columnName', type: 'int' } }
  } else {
    return 'pending'
  }
})

When('extractor column is called', function () {
  const { extract } = require('../../../lib/extractor/column')
  this.column = extract(this.element, this.currentFile, this.loggerMock)
})

Then('extracted primaryKey information is set to true', function () {
  assert(this.column.primaryKey === true)
})

Then('extracted primaryKey information is set to false', function () {
  assert(this.column.primaryKey === false)
})

Then('extracted column type is {string}', function (type) {
  assert(this.column.type === type)
})

Then('extracted column name is {string}', function (columName) {
  assert(this.column.name === columName)
})

Given('sub tag {string} exists', function (subTag) {
  if (this.currentFile === 'currentFile.yaml') {
    if (subTag === 'constraints') {
      this.element[subTag] = { primaryKey: true }
    }
  } else if (this.currentFile === 'currentFile.xml') {
    if (subTag === 'constraints') {
      this.element.$$ = []
      this.element.$$[0] = { '#name': 'constraints', $: { primaryKey: true } }
    }
  }
})

Given('foreign key information are present', function () {
  if (this.currentFile === 'currentFile.yaml') {
    this.element.constraints.referencedColumnNames = 'referencedColumnName'
    this.element.constraints.referencedTableName = 'referencedTableName'
  } else if (this.currentFile === 'currentFile.xml') {
    this.element.$$[0].$.referencedColumnNames = 'referencedColumnName'
    this.element.$$[0].$.referencedTableName = 'referencedTableName'
  } else {
    return 'pending'
  }
})

Then('extracted foreign key information is set', function () {
  assert(this.column.referencedColumnNames === 'referencedColumnName')
  assert(this.column.referencedTableName === 'referencedTableName')
})
