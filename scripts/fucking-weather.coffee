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

_ = require('underscore')

weather = (msg, query, cb) ->
  monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  msg.http('http://thefuckingweather.com/Where/' + query)
    .header('User-Agent', 'Mozilla/5.0')
    .get() (err, res, body) ->
      topRemark = body.match(/<span class="temperature" tempf="\d*">(-?\d+)/)?[1] || "temp not found"
      remark = body.match(/<p class="remark jsRemark">(.*)</)?[1] || "remark not found"
      cb(topRemark, remark)

module.exports = (robot) ->
  robot.respond /((what's|how's) |(what|how) is )?((the )?(fucking )?weather|(it )?outside)\??/i, (msg) ->
    weather msg, msg.match[2], (topRemark, remark) ->
      msg.send _.unescape(topRemark).replace(/\&#39;/, "'")
      msg.send _.unescape(remark).replace(/\&#39;/, "'")
