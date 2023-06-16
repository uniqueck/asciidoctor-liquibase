const ospath = require('path')
const fs = require('fs')

module.exports = {
    deleteDirWithFiles: function (path) {
        if (fs.existsSync(path)) {
            fs.readdirSync(path).forEach((file) => {
                const curPath = ospath.join(path, file)
                fs.unlinkSync(curPath)
            })
            fs.rmdirSync(path)
        }
    },
    fixturePath: (...paths) => ospath.join(__dirname, 'fixtures', ...paths),
    readFixture: (...paths) => fs.readFileSync(ospath.join(__dirname, 'fixtures', ...paths), 'utf-8')
}