# Description:
#   Fuck with people who think they are g.o.d.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   god*
#
# Author:
#   nitrag

module.exports = (robot) ->
  robot.hear /(am i|whos|who's|who is) (.* )?god/i, (msg)->
    name   = msg.match[1]
    users = robot.brain.usersForFuzzyName(name)
    sender = "Unknown"
    if users.length is 1
      sender = users[0].name
    deal = [
       "My sincerest apologies " + sender + ", it is without a doubt NOT you!",
       "Heh, go away peasant!",
       "Sir Ryan most likely",
       "That third nipple of yours...NOT!",
       sender + " do you really think you could comprehend that answer",
       sender + " if your brain was as big as your butthole then you might be able to comprehend",
       "It is unlikely that you will ever know",
       "WWNHD",
       "http://cdn-img1.imagechef.com/w/150527/memeaa20151e7bff8f16.jpg"
    ]
    msg.send msg.random deal
