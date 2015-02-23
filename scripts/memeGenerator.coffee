# Description:
#   Jarvis all the memes
#
# Dependencies:
#   None
#
# Commands:
#   hubot memelist  - view all the available memes
#   hubot add meme name, image_url, regex, help (optional)  - Adds a meme to redis
#
# Author:
#   skalnik, edited by nickla

module.exports = (robot) ->
  memes = {
            'Y U NO guy': {
                help: 'Y U NO <text>',
                regex: "(Y U NO) (.+)",
                imageUrl: 'yunoguy.jpg'
            },
            'Most Interesting Man in the world': {
                help: "I don't always <text> but when I do, <text>",
                regex: "(I DON'?T ALWAYS .*) (BUT WHEN I DO,? .*)",
                imageUrl: 'mostinterestingman.jpg'
            },
            'Orly? owl': {
                help: '<text> ORLY?',
                regex: "(.*)(O\\s?RLY\\??.*)",
                imageUrl: 'http://i.imgur.com/5FciQg7.jpg'
            },
            'Success Kid': {
                help: '<text> (Success|Nailed it)',
                regex: "(.*)(SUCCESS|NAILED IT.*)",
                imageUrl: 'successkid.jpg'
            },
            '"RENT IS TOO DAMN HIGH" guy': {
                help: '<text> too damn <text>',
                regex: "(.*) (\\w+\\sTOO DAMN .*)",
                imageUrl: 'http://i.imgur.com/3uBbb51.png'
            },
            'Professor Farnsworth': {
                help: 'Good news everyone! <news>',
                regex: "(GOOD NEWS EVERYONE[,.!]?) (.*)",
                imageUrl: 'http://i.imgur.com/YXKW5Z9.jpg',
            },
            'Fry': {
                help: 'Not sure if <text> or <text>',
                regex: "(NOT SURE IF .*) (OR .*)",
                imageUrl: 'http://i.imgur.com/AQn2n24.png'
            },
            'X-Zibit': {
                help: 'Yo Dawg <text> so <text>',
                regex: "(YO DAWG .*) (SO .*)",
                imageUrl: 'xzibit.jpg'
            },
            'Zero Wing Guy': {
                help: 'ALL YOUR <text> ARE BELONG TO US',
                regex: "(ALL YOUR .*) (ARE BELONG TO US)",
                imageUrl: 'http://i.imgur.com/gzPiQ8R.jpg'
            },
            'Angry Linus': {
                help: '<text> fuck you',
                regex: "(.*) (FUCK YOU)",
                imageUrl: 'http://i.imgur.com/mo4PKMn.jpg'
            },
            'Bad Time Ski Instructor': {
                help: '<text> gonna have a bad time',
                regex: "(.*) (go(nna|ing to) have a bad time)",
                imageUrl: 'http://i.imgur.com/1CizixQ.jpg'
            },
            'Borimir': {
                help: 'One does not simply <text>',
                regex: "(ONE DOES( NOT|N'T)( SIMPLY)?) (.*)",
                imageUrl: 'onedoesnotsimply.jpg'
            },
            'Lonely Ed': {
                help: '<text> lonely <text>',
                regex: "(.*lonely ed|.*lonely) (.*)",
                imageUrl: 'http://i.imgur.com/vCSIn1r.jpg'
            },
            'Grumpy Cat': {
                help: 'grumpycat <text>, <text>',
                regex: "grumpy\\s?cat (.*),(.*)",
                imageUrl: 'grumpycat.jpg',
            },
            'Mykayla': {
                help: '<text> NOT IMPRESSED <text>',
                regex: "(.*)(NOT IMPRESSED.*)",
                imageUrl: 'http://i.imgur.com/dPPbFRv.jpg'
            },
            'Willy Wonka': {
                help: '(Oh|You) <text> (Please|Tell)',
                regex: "((Oh|You) .*) ((Please|Tell) .*)",
                imageUrl: 'http://i.imgur.com/Pj2jG4S.jpg'
            },
            'Troll Face': {
                help: '<text> trollface <text>',
                regex: "(.*)trollface(.*)",
                imageUrl: 'http://i.imgur.com/oiwc4pX.jpg'
            },
            'Yau ming': {
                help: '<text> bitch please <text>',
                regex: "(.*)\\s*bitch please\\s*(.*)",
                imageUrl: 'http://i.imgur.com/yrjhTXq.png'
            },
            'Courage Wolf': {
                help: '<text> Courage <text>',
                regex: "(.*)\\s*courage\\s*(.*)",
                imageUrl: 'http://i.imgur.com/rR3xirT.jpg'
            },
            'Brace Yourself': {
                help: '<text> Brace Yourself <text>',
                regex: "(.*)\\s*brace yourself\\s*(.*)",
                imageUrl: 'braceyourself.jpg'
            },
            'Aliens Guy': {
                help: '<text> Aliens <text>',
                regex: "(.*)aliens(.*)",
                imageUrl: 'aliensguy.jpg'
            },
            'Zoolander': {
              help: 'What is this? <text> for Ants!?',
              regex: "(WHAT IS THIS\\??)(.*FOR ANTS!?\\??)",
              imageUrl: 'http://i.imgur.com/JEjaRuz.jpg'
            }

  }

  unless robot.brain.data.memes
    robot.brain.data.memes = {}
  extend(robot.brain.data.memes, memes)

  for name, meme of robot.brain.data.memes
    memeResponder robot, meme

  robot.respond /(memegen )?add meme (.+),(.+),\s?\/(.+)\/i(\s?,\s?.+)?/i, (msg) ->
    name = msg.match[2]
    meme =
      imageUrl: msg.match[3].trim()
      regex: msg.match[4]
      help: ( msg.match[5].replace(/^\s?,\s?/, '') if msg.match[5] )

    robot.brain.data.memes[name] =  meme
    memeResponder robot, meme

  robot.respond /meme\s?list/i, (msg) ->
    response =  "Currently known memes\n"
    response += "=====================\n"
    response += "All the things:  <text> all the <text>\n"
    response += "All the things (sad):  <text> all the <text>?\n"
    response += "Captain Kirk:  khanify <text>\n"
    response += "Philosoraptor:  if <text>, <word that can start a question> <text>?\n"
    for name, meme of robot.brain.data.memes
      helptext = if meme.help then meme.help else meme.regex
      response += name + ':  ' + helptext + '\n'

    msg.send response

  robot.respond /(memegen )?(.*) (ALL the .*\??)/i, (msg) ->
    hasQ = msg.match[0].match(/\?$/)
    imageUrl = if hasQ then 'http://i.imgur.com/2bR8wv4.jpg' else 'http://i.imgur.com/FWZYIrG.jpg'
    sendMeme robot, msg, imageUrl, msg.match[2], msg.match[3]

  robot.respond /(memegen )?khanify (.*)/i, (msg) ->
    sendMeme robot, msg, "http://i.imgur.com/HPUuTD8.jpg", "_", khanify(msg.match[2])

    carls = [
      'http://i.imgur.com/ZZqmj6n.jpg',
      'http://i.imgur.com/RjGhtpE.png',
      'http://i.imgur.com/0yQOGzk.jpg',
      'http://i.imgur.com/DF3z9Od.jpg',
      'http://i.imgur.com/us2v2MM.jpg',
      'http://i.imgur.com/mKRPMqu.jpg',
      'http://i.imgur.com/KWkEIey.jpg',
      'http://i.imgur.com/D8iO3L2.gif',
    ]
    msg.send msg.random carls if msg.match[2].match(/(^|(.*)?\s)carl(\s(.*)?|$)/i)

  robot.respond /(memegen )?(IF .*), ((ARE|CAN|DO|DOES|HOW|IS|MAY|MIGHT|SHOULD|THEN|WHAT|WHEN|WHERE|WHICH|WHO|WHY|WILL|WON\'T|WOULD)[ \'N].*)/i, (msg) ->
    sendMeme robot, msg, 'http://i.imgur.com/pHUzqic.jpg', msg.match[2], msg.match[3] + (if msg.match[3].search(/\?$/)==(-1) then '?' else '')

sendMeme = (robot, msg, imageUrl, match1, match2) ->
  memeify_url msg, imageUrl, match1, match2, (url) ->
    expected_file_type = url.split('.')[-1]

    # warm the cache on memeify.com before sending it to chat
    response = robot.http(url)
    response.get() (err, res, body) ->
      if err
        msg.reply "Ugh, I got an exception trying to contact memeifier.com:", inspect(err)
        return

      # if we have a responseCode that is 400 or above, something went wrong
      responseCode = res.statusCode
      if responseCode < 400
        msg.send url
      else
        msg.reply "Sorry, I could not generate that image."


memeResponder = (robot, meme) ->
  robot.respond (new RegExp("(memegen )?" + meme.regex, 'i')), (msg) ->
    sendMeme robot, msg, meme.imageUrl, msg.match[2], msg.match[3]

memeify_url = (msg, image_url, top_text, bot_text, callback) ->
  callback "http://www.memeifier.com/" + encodeText(top_text) + "/" + encodeText(bot_text) + "/" + image_url

encodeText = (text) ->
  new_text = text.trim().replace(/\s/g, '_')
  new_text = "_" if new_text.length == 0
  encodeURIComponent new_text

khanify = (msg) ->
  msg = msg.toUpperCase()
  vowels = [ 'A', 'E', 'I', 'O', 'U' ]
  index = -1
  for v in vowels when msg.lastIndexOf(v) > index
    index = msg.lastIndexOf(v)
  "#{msg.slice 0, index}#{Array(10).join msg.charAt(index)}#{msg.slice index}!!!!!"

extend = (object, properties) ->
  for key, val of properties
    object[key] = val
  object
