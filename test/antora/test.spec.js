/* global describe it before */
const rimrafSync = require('rimraf')
const generateSite = require('@antora/site-generator-default')
const path = require('path')

describe('Antora integration', function () {
  this.timeout(10000)

  before(async function () {
    /* eslint-disable n/handle-callback-err */
    rimrafSync(path.join(__dirname, 'public'), function (error) {
    })
    await generateSite([`--playbook=${path.join(__dirname, 'antora-playbook.yml')}`])
  })

  it('blockmacro', async () => {

  })
})
