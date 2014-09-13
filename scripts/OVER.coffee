# Description
#   Show your disapproval of anything your friends do.
#
# Commands:
#   OVER - That is so OVER!

over = [
  "http://i.imgur.com/sIY1WP5.gif"
  "http://i.imgur.com/nrb9sDo.gif"
  "http://stream1.gifsoup.com/view4/2031440/it-s-over-o.gif"
]

module.exports = (robot) ->
  robot.hear /OVER/, (msg) ->
    msg.send msg.random over
