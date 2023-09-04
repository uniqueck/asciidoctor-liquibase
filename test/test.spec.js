/* global Opal describe it before */
const asciidoctorLiquibase = require('../lib/asciidoctor-liquibase.js')
const asciidoctor = require('@asciidoctor/core')()

const { fixturePath } = require('./utils.js')

const chai = require('chai')
const expect = chai.expect

describe('Registration', () => {
  it('should register the extention', () => {
    const registry = asciidoctor.Extensions.create()
    /* eslint-disable no-unused-expressions */
    expect(registry['$block_macros?']()).to.be.false
    asciidoctorLiquibase.register(registry)
    /* eslint-disable no-unused-expressions */
    expect(registry['$block_macros?']()).to.be.true
    expect(registry['$registered_for_block_macro?']('liquibase')).to.be.an('object')
  })
})

describe('Conversion', () => {
  before(() => {
    Opal.Asciidoctor.LoggerManager.getLogger().setLevel(1)
  })

  describe('When extension is registered', () => {
    describe('should handle yaml based changesets', () => {
      it('should handle addModifyColumn correct', () => {
        const file = fixturePath('liquibase', 'modifyDataType.yaml')
        const registry = asciidoctor.Extensions.create()
        asciidoctorLiquibase.register(registry)
        const html = asciidoctor.convert(`liquibase::${file}[]`, { extension_registry: registry })
        expect(html).to.contain(`<pre>'hide the spot
hide circle
skinparam tabSize 4
' avoid problems with angled crows feet
skinparam linetype ortho
'entities
entity person {
---
\\t\\t\\tid:int
}
'relationships</pre>`)
      })

      it('should handle addColumn correct', () => {
        const file = fixturePath('liquibase', 'addColumn.yaml')
        const registry = asciidoctor.Extensions.create()
        asciidoctorLiquibase.register(registry)
        const html = asciidoctor.convert(`liquibase::${file}[]`, { extension_registry: registry })
        console.log(html)
        expect(html).to.contain(`<pre>'hide the spot
hide circle
skinparam tabSize 4
' avoid problems with angled crows feet
skinparam linetype ortho
'entities
entity person {
&lt;&lt;PK&gt;&gt;\\tid:varchar
---
\\t\\t\\tname:varchar
}
'relationships</pre>`)
      })
    })

    describe('should handle xml based changesets', () => {
      it('should handle addModifyColumn correct', () => {
        const file = fixturePath('liquibase', 'modifyDataType.xml')
        const registry = asciidoctor.Extensions.create()
        asciidoctorLiquibase.register(registry)
        const html = asciidoctor.convert(`liquibase::${file}[]`, { extension_registry: registry })
        expect(html).to.contain(`<pre>'hide the spot
hide circle
skinparam tabSize 4
' avoid problems with angled crows feet
skinparam linetype ortho
'entities
entity person {
---
\\t\\t\\tid:int
}
'relationships</pre>`)
      })

      it('should handle addColumn correct', () => {
        const file = fixturePath('liquibase', 'addColumn.xml')
        const registry = asciidoctor.Extensions.create()
        asciidoctorLiquibase.register(registry)
        const html = asciidoctor.convert(`liquibase::${file}[]`, { extension_registry: registry })
        console.log(html)
        expect(html).to.contain(`<pre>'hide the spot
hide circle
skinparam tabSize 4
' avoid problems with angled crows feet
skinparam linetype ortho
'entities
entity person {
&lt;&lt;PK&gt;&gt;\\tid:varchar
---
\\t\\t\\tname:varchar
}
'relationships</pre>`)
      })
    })
  })
})
