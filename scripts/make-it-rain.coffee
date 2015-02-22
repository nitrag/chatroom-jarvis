# Description
#   Anytime someone says `make it rain` jarvis helps them express their feelings.
#
# Commands:
#   make it rain - show random person makin' it rain

rain = [
  "http://i.imgur.com/zyeLPTY.gif",
  "http://i.imgur.com/5PuIlAh.gif",
  "http://i.imgur.com/mCnxqCR.gif",
  "http://i.imgur.com/B5d3mpi.gif",
  "http://i.imgur.com/keIlRj1.gif"
]

module.exports = (robot) ->
  robot.hear /mak(e|in'?)? it rain/i, (msg) ->
    msg.send msg.random rain
