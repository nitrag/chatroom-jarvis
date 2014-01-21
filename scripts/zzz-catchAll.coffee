cleverbot = require('cleverbot-node')

module.exports = (robot) ->
  c = new cleverbot()

  robot.respond /(.*)/i, (msg) ->
    hasMatch = false
    for listener in robot.listeners
      if listener.regex.test robot.name + ' ' + msg.match[1]
        if listener.regex.toString() == new RegExp(/^[@]?Jarvis[:,]?\s*(?:(.*))/i).toString()
          break
        hasMatch = true
        break

    unless hasMatch
      data = msg.match[1]
      data = data.trim() if data
      c.write(data, (c) => msg.send(c.message))
