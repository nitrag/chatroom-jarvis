# Description
#   Searches Yelp for lunch recommendations
#
# Commands:
#   hubot lunch me <query> - Finds up to 5 highly rated restaurants for the query

module.exports = (robot) ->
  robot.respond /lunch me ?(.*)/i, (msg) ->
    query = msg.match[1]

    lunch msg, query


lunch = (msg, query)->
  client = require('yelp').createClient
    consumer_key: '917kMj8EvSltL5sn0uDvNg',
    consumer_secret: 'AgcdaIXZb4e9DfNBSXDwfIDR6Jg',
    token: '0PC9xfbxu-tVJKY5NzfpEDHu1aacgGfa',
    token_secret: 'WNymUBTwKgV8RF-_BHykssWtYPg',
  opts =
    term: query,
    limit: 5,
    radius_filter: 2000, # 2km
    sort: 0, # 0: best match, 1: distance, 2: rating
    location: '1400 Van Buren St NE Ste 200, Minneapolis, MN 55413-3017',
    category_filter: 'restaurants',

  now = new Date()
  friday = true if now.getDay() == 5

  client.search opts, (err, data) ->
    if err
      msg.send "I'm terribly sorry: #{err.data}"
      msg.send JSON.parse err.data
    else
      if friday
        index = 0
        for business, i in data.businesses
          if business.name == "Five Guys Burgers and Fries"
            index = i
        data.businesses.splice(index,1,{name:"Five Guys Burgers and Fries", rating:"5", url:"http://www.yelp.com/biz/five-guys-burgers-and-fries-minneapolis"})
      for business in data.businesses
        do (business) ->
          rating = 5 - parseInt(business.rating, 10)
          stars = "★★★★★☆☆☆☆☆".substring(rating,rating+5)
          msg.send "#{stars} #{business.name}: #{business.url}"
