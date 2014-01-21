cleverbot = require('cleverbot-node')

module.exports = (robot) ->
  c = new cleverbot()

  robot.respond /(.*)/i, (msg) ->
    data = msg.match[1]
    data = data.trim() if data
    c.write(data, (c) => msg.send(c.message))
