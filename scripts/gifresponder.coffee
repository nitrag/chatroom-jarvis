# Description:
#   Responds to random phrases with a gif
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   nitrag
#   gif's courtesy of jglovier

thumb = [
  "https://raw.githubusercontent.com/jglovier/gifs/gh-pages/thumbs-up/chuck-norris.gif",
  "https://raw.githubusercontent.com/jglovier/gifs/gh-pages/thumbs-up/jakie-chan-thumbsup.gif",
  "https://raw.githubusercontent.com/jglovier/gifs/gh-pages/thumbs-up/terminator.gif",
  "https://raw.githubusercontent.com/jglovier/gifs/gh-pages/thumbs-up/thumbs-up.gif"
]

omg = [
  "https://raw.githubusercontent.com/jglovier/gifs/gh-pages/omg/Kramer-whaaa.gif",
  "https://raw.githubusercontent.com/jglovier/gifs/gh-pages/omg/austin-powers-omg.gif",
  "https://raw.githubusercontent.com/jglovier/gifs/gh-pages/omg/omg.gif",
  "https://raw.githubusercontent.com/jglovier/gifs/gh-pages/omg/fresh-prince-omg.gif"
]

nailed = [
  "NAILED IT! https://raw.githubusercontent.com/jglovier/gifs/gh-pages/nailed-it/huge-dive.gif",
  "NAILED IT! https://raw.githubusercontent.com/jglovier/gifs/gh-pages/nailed-it/nailed-it-phone-dunk.gif",
  "NAILED IT! https://raw.githubusercontent.com/jglovier/gifs/gh-pages/nailed-it/nailed-it-bowling-pins.gif",
  "https://raw.githubusercontent.com/jglovier/gifs/gh-pages/high-five/high-five-knailed-it.gif?raw=true",
  "NAILED IT! https://media4.giphy.com/media/5AC7KaNyKgNbO/200.gif"
]

burn = [
  "https://raw.githubusercontent.com/jglovier/gifs/gh-pages/burn/ashton-kutcher-burn.gif",
  "BURN! https://raw.githubusercontent.com/jglovier/gifs/gh-pages/burn/fight-club-burn-it-down.gif",
  "https://raw.githubusercontent.com/jglovier/gifs/gh-pages/burn/hashtag-burn-neil-patrick-harris.gif"
]

badass = [
  "http://media1.giphy.com/media/l53tzQmIeblxC/giphy.gif"
]

boom = [
  "https://38.media.tumblr.com/2fcb2438fa41ec93023e33cad1c640ff/tumblr_mj8qrhhVUj1s002xfo1_500.gif"
]

interesting = [
  "http://cdn.gurl.com/wp-content/uploads/2013/07/tumblr_mhtrxlr8Kt1rkfeyuo1_500.gif"
]

azam = [
  "Yes? http://i.imgur.com/zbrPy.jpg",
  "huh? http://i.imgur.com/nHLpe.gif",
  "huh?! http://i.imgur.com/e0kab.jpg",
  "http://i.imgur.com/vFb3C.jpg",
  "http://makeameme.org/media/created/did-someone-say-hgebwr.jpg"
]

fuckedup = [
  "http://media.giphy.com/media/eP7IBbd8oi6C4/giphy.gif",
  "http://media.giphy.com/media/O5BvwlZzMNasU/giphy.gif"
]

lol = [
  "https://media2.giphy.com/media/AGFelDQ33Djzy/200.gif",
  "https://media1.giphy.com/media/IEBUnL3NMfPiM/200.gif",
  "https://media4.giphy.com/media/SQrIdCvhtXZuM/200.gif",
  "https://media4.giphy.com/media/1PgPvWLfXGkCY/200.gif",
  "https://media2.giphy.com/media/prhxPLrZG5XNu/200.gif",
  "https://media4.giphy.com/media/r1wGrCEZ4zTeU/200.gif"
]

titties = [
  "http://i.imgur.com/06GEkxm.webm"
  "http://i.imgur.com/MTJtk7N.gif",
  "http://i.imgur.com/R9FaKUe.gif",
  "http://i.imgur.com/uk0lxoT.webm",
  "http://i.imgur.com/Q6oIKzV.gif",
  "http://i.imgur.com/spPpObF.gif"
]

module.exports = (robot) ->
  robot.hear /(thumbs up|\xF0\x9F\x91\x8D)/i, (msg)->
    msg.send msg.random thumb
	
  robot.hear /omg/i, (msg)->
    msg.send msg.random omg
	
  robot.hear /nailed it/i, (msg)->
    msg.send msg.random nailed

  robot.hear /(burned|burn!)/i, (msg)->
    msg.send msg.random burn

  robot.hear /BOOM/i, (msg)->
    msg.send msg.random boom

  robot.hear /azam/i, (msg)->
    msg.send msg.random azam

  robot.hear /interesting.../i, (msg)->
    msg.send msg.random interesting
	
  robot.hear /don't you do that/i, (msg)->
    msg.send "https://media2.giphy.com/media/eCzu4k0KEStDa/200.gif"
	
  robot.hear /(LOL|ROFL)/, (msg)->
    msg.send msg.random lol