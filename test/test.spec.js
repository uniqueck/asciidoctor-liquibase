/* global describe it before */
const asciidoctorLiquibase = require('../lib/asciidoctor-liquibase.js')
const asciidoctor = require('@asciidoctor/core')()

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