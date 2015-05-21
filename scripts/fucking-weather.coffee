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
      temp = body.match(/<span class="temperature" tempf="\d*">(-?\d+)/)?[1] || ""
      remark = body.match(/<p class="remark">(.*)</)?[1] || "remark not found"
      flavor = body.match(/<p class="flavor">(.*)</)?[1] || "flavor not found"
      cb(temp, remark, flavor)

module.exports = (robot) ->
  robot.hear /((what's|how's) |(what|how) is )?((the )?(fucking )?weather|(it )?outside)\??/i, (msg) ->
    weather msg, (temp, remark, flavor) ->
      out = temp + " degrees " + remark + "\n" + flavor
      msg.send out
