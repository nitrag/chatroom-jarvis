# Description:
#   shibame is the most important thing in your life
#
# Dependencies:
#   "tumblrbot": "0.1.0"
#
# Configuration:
#   None
#
# Commands:
#   such doge - wow!
#   many doge - very count

tumblr = require 'tumblrbot'
url = 'muchdoge.tumblr.com'

module.exports = (robot) ->

  robot.hear /such doge/i, (msg) ->
    tumblr.photos(url).random (post) ->
      msg.send post.photos[0].original_size.url + '#.png'

  robot.hear /many doge( (\d+))?/i, (msg) ->
    i = 0
    count = msg.match[2] || 5
    while i < count
      tumblr.photos(url).random (post) ->
        msg.send post.photos[0].original_size.url + '#.png'
      i++

