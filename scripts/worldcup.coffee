# Description:
#   Real time Wold Cup game updates.
#
# Dependencies:
#
#
# Configuration:
#   None
#
# Commands:
#   None

requestify = require 'requestify'
async = require 'async'
cron = require 'cron'
slack = require('slack-notify')('https://frankbook.slack.com/services/hooks/incoming-webhook?token=' + process.env.SLACK_WEBHOOK_TOKEN)

matchID = ""
matchScore = ""
match = undefined
prevGameID = undefined
notifiedHalf = false
notifiedNinty = false

cronJob = cron.job("*/5 * * * * *", ->

  # Get Match list
  requestify.get("http://live.mobileapp.fifa.com/api/wc/matches").then (response) ->
    matches = response.getBody().data.group
    async.filter matches, ((item, callback) ->
      callback item.b_Live is true
      return
    ), (results) ->
      match = results[0]
      if typeof match is "object"

        if match.n_HomeGoalsHalftime and not notifiedHalf
          notifiedHalf = true
          notify("The score at halftime is: " + match.c_HomeTeam_en + " " + match.c_Score + " " + match.c_AwayTeam_en)
        if match.n_HomeGoals90mins and not notifiedNinty
          notifiedNinty = true
          notify("The score at 90mins is: " + match.c_HomeTeam_en + " " + match.c_Score + " " + match.c_AwayTeam_en)

        # Got Live Match!
        unless match.n_MatchID is matchID

          # New Match just started
          matchID = match.n_MatchID
          matchScore = ""
          notifiedHalf = false
          notifiedNinty = false

          # Notify New match
          notify(match.c_HomeTeam_en + " vs " + match.c_AwayTeam_en + " is starting now.")

        else unless matchScore is match.c_Score

          # Different Score
          matchScore = match.c_Score
          notify("Scoring update! " + match.c_HomeTeam_en + " " + match.c_Score + " " + match.c_AwayTeam_en)
      return

    return

  return
)

notify = (text) ->
  slack.send
    channel: "#general"
    text: text
    username: "Jarvis"
  return

module.exports = (robot) ->

  robot.respond /start tracking the world cup/i, (msg) ->
    cronJob.start()
    msg.send "Alright, I will keep you posted on World Cup updates."

  robot.respond /stop tracking the world cup/i, (msg) ->
    cronJob.stop()
    msg.send "I'm not tracking updates to the World Cup anymore."

