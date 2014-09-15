# Description
#   Show your disapproval of anything your friends do.
#
# Commands:
#   OVER - That is so OVER!

over = [
  "http://i.imgur.com/sIY1WP5.gif"
  "http://i.imgur.com/nrb9sDo.gif"
  "http://stream1.gifsoup.com/view4/2031440/it-s-over-o.gif"
  "http://i.imgur.com/48Mk1kf.gif"
  "http://i.imgur.com/z0W8tEE.gif"
  "http://i.imgur.com/px0hk2O.gif"
  "http://i.imgur.com/iCAREX0.gif"
]

module.exports = (robot) ->
  robot.hear /(\W|^)OVER(\W|$)/, (msg) ->
    msg.send msg.random over
