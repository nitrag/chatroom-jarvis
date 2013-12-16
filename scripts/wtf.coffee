# Description
#   Anytime someone says wrong room jarvis helps them express their feelings
#
# Commands:
#   wtf - show random wtf images

wtf = [
  "http://i.imgur.com/ftE5P.jpg"
  "http://i.imgur.com/argYr.jpg"
  "http://i.imgur.com/rjzLJ.jpg"
  "http://i.imgur.com/YXBgjkw.jpg"
  "http://i.imgur.com/tXHbA17.jpg"
  "http://i.imgur.com/zw2o9aO.jpg"
  "http://i.imgur.com/obNON7e.jpg"
  "http://i.imgur.com/gZ0VVFz.jpg"
]

module.exports = (robot) ->
  robot.hear /wtf/i, (msg) ->
    msg.send msg.random wtf
