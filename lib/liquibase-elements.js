const { stringify } = require('./utils')
const { DecisionTableLogic, Log_IGNORE, Log_NOT_SUPPORTED } = require('./generated/LiquibaseElementsIface')

class LiquibaseElements extends DecisionTableLogic {
  constructor (elementNameCallback, tagValueCallback, logger) {
    super()
    this.elementNameCallback = elementNameCallback
    this.tagValueCallback = tagValueCallback
    this.logger = logger
  }

  execute (element, tillTag) {
    const liquibaseElementResult = { ignore: false, elementName: undefined, finishedProcessing: true }
    const model = {
      element,
      tillTag,
      liquibaseElementResult,
      logger: this.logger,

      toJSON: function () {
        const result = {}
        for (const x in this) {
          if (x !== 'logger') {
            result[x] = this[x]
          }
        }
        return result
      }
    }
    const LiquibaseElementsDecisionLogic = require('./generated/LiquibaseElementsDecisionLogic')
    new LiquibaseElementsDecisionLogic().execute(this, model)
    return liquibaseElementResult
  }

  isLiquibaseElementNameIs (arg, model) {
    return this.elementNameCallback(model.element, arg.getSymbol())
  }

  isTagEqualTillTag (model) {
    return this.tagValueCallback(model.element) === model.tillTag
  }

  doSetFinishProcessing (arg, model) {
    model.liquibaseElementResult.finishedProcessing = arg.getSymbol() === 'true'
  }

  doSetElementName (arg, model) {
    model.liquibaseElementResult.elementName = arg.getSymbol()
  }

  doSetElementToIgnore (arg, model) {
    model.liquibaseElementResult.ignore = arg.getSymbol() === 'true'
  }

  doLog (arg, model) {
    if (arg === Log_IGNORE) {
      this.logger.info(`Liquibase element '${stringify(model.element)}' ignored`)
    } else if (arg === Log_NOT_SUPPORTED) {
      this.logger.warn(`Unsupported liquibase element '${stringify(model.element)}' detected`)
    }
  }
}

module.exports = {
  liquibaseElement: (element, logger, tillTag, elementNameCallback, tagValueCallback) => {
    return new LiquibaseElements(elementNameCallback, tagValueCallback, logger).execute(element, tillTag)
  }
}
