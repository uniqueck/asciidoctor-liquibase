const { When, Then, Given, Before } = require('@cucumber/cucumber')
const { liquibaseElement } = require('../../../lib/liquibase-elements')
const assert = require('referee').assert
let elementNameCallback
let tagValueCallback
let element
let loggerMock
let elementInfo

Before(function () {
  loggerMock = {
    warnMessages: [],
    infoMessages: [],
    info: function (message) {
      this.infoMessages.push(message)
    },
    warn: function (message) {
      this.warnMessages.push(message)
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
