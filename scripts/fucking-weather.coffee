# Description:
#   Returns the weather from thefuckingweather.com
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot what's the weather for <city> - Get the weather for a location
#   hubot what's the weather for <zip> - Get the weather for a zipcode
#
# Author:
#   aaronott

weather = (msg, query, cb) ->
  monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  msg.http('http://thefuckingweather.com/' + monthNames[new Date().getMonth()] + '/' + query)
    .header('User-Agent', 'Mozilla/5.0')
    .get() (err, res, body) ->
      topRemark = body.match(/<h1 class="topRemark">(.*)</)?[1] || "weather not found"
      remark = body.match(/<h2 class="remark">(.*)</)?[1] || "remark not found"
      cb(topRemark, remark)

module.exports = (robot) ->
  robot.respond /(what's|what is) the weather for (.*)/i, (msg) ->
    weather msg, msg.match[2], (topRemark, remark) ->
      msg.send topRemark
      msg.send remark
