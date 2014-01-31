# Description
# Loads Sean McCabe Images from Dribbble
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#     hubot mccabe me - brings you a random McCabe shot
#     hubot mccabe bomb - brings you multiple McCabe Shots
#
# Author:
#   kevinmarx


requestImage = (msg) ->
  msg.http("http://api.dribbble.com/players/4754/shots")
    .get() (err, res, body) ->
      data = JSON.parse(body)
      idx = Math.random() * (data.shots.length - 1) | 0
      msg.send data.shots[idx].image_url

module.exports = (robot) ->
  robot.respond /mccabe me/i, (msg) ->
    requestImage(msg)

  robot.respond /mccabe bomb( (\d+))?/i, (msg) ->
    i = 0
    count = msg.match[2] || 3
    while i < count
      requestImage(msg)
      i++
