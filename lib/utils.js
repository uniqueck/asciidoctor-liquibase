module.exports = {
  stringify: (element) => {
    return JSON.stringify(element, (key, value) => {
      if (typeof value === 'object' && value !== null) {
        if (value instanceof Map) {
          return Object.fromEntries(value.entries())
        }
      }
      return value
    })
  }
}
