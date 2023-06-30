// const ospath = require('path')

module.exports = (file, contentCatalog, vfs) => {
  let baseReadFn
  if (typeof vfs === 'undefined' || typeof vfs.read !== 'function') {
    baseReadFn = require('./node-fs').read
  } else {
    baseReadFn = vfs.read
  }
  let baseDirnameFn
  if (typeof vfs === 'undefined' || typeof vfs.dirname !== 'function') {
    baseDirnameFn = require('./node-fs').dirname
  } else {
    baseDirnameFn = vfs.createRelativeResourceId
  }
  let baseExistsFn
  if (typeof vfs === 'undefined' || typeof vfs.exists !== 'function') {
    baseExistsFn = require('./node-fs').exists
  } else {
    baseExistsFn = vfs.exists
  }
  return {
    read: (resourceId, format) => {
      const target = contentCatalog.resolveResource(resourceId, file.src)
      return target ? target.contents.toString() : baseReadFn(resourceId, format)
    },
    exists: (resourceId) => {
      const target = contentCatalog.resolveResource(resourceId, file.src)
      return target ? true : baseExistsFn(resourceId)
    },
    createRelativeResourceId: (resourceId, relativeFile) => {
      const target = contentCatalog.resolveResource(resourceId, file.src)
      const directory = target.src.relative.substring(0, target.src.relative.lastIndexOf('/'))
      const newResourceId = `${target.src.version}@${target.src.component}:${target.src.module}:${target.src.family}$${directory}/${relativeFile}`
      return target ? newResourceId : baseDirnameFn(resourceId, relativeFile)
    }
  }
}
