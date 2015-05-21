# Description:
#   Responds to AWAW
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands
#   AWAW - displays a "awaw" tag
#
# Author:
#   nitrag

tags = [
   "sluts",
   "f-in whore!",
   "don't worry bro, she was meant to be a cumguzzler",
   "AWAW.fo.show",
   "AWAW we're here for ya Bro",
   "BRO's before HO's"
]

module.exports = (robot) ->
   robot.hear /awaw/i, (msg)->
      msg.send msg.random tag
