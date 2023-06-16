/* global describe it before */
const asciidoctorLiquibase = require('../lib/asciidoctor-liquibase.js')
const asciidoctor = require('@asciidoctor/core')()

const { readFixture, fixturePath, deleteDirWithFiles } = require('./utils.js')

const chai = require('chai')
const expect = chai.expect

describe('Registration', () => {
    it('should register the extention', () => {
        const registry = asciidoctor.Extensions.create()
        expect(registry['$block_macros?']()).to.be.false
        asciidoctorLiquibase.register(registry)
        expect(registry['$block_macros?']()).to.be.true
        expect(registry['$registered_for_block_macro?']('liquibase')).to.be.an('object')
    })
})

describe('Conversion', () => {
    before(() => {
        Opal.Asciidoctor.LoggerManager.getLogger().setLevel(1)
    })


    describe('When extension is registered', () => {
      it('should handle addModifyColumn correct', () => {
          const file = fixturePath('liquibase', 'modifyDataType.yaml')
          const registry = asciidoctor.Extensions.create()
          asciidoctorLiquibase.register(registry)
          const html = asciidoctor.convert(`liquibase::${file}[]`, { extension_registry: registry })
          console.log(html)
      })


    })

})