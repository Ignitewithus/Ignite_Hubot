# Description:
#   Traffic maps
#
# Commands:
#   hubot traffic me <query>

# To get an ID:
#  1. do a google search for "<x> traffic map"
#  2. Right click the "Current traffic for <x>" image and copy source
#  3. The ID is the data= portion after the comma
# TODO: could scrape the Google search page, but that is against TOS.

places =
  jax: "P2lobNr7SWfbvXjJJ7CC7hxu20FuVZbJotPgtWVqbhw6G6nhfx1pGyH3-7oIA4uHvxFYBEWpK7ShyuMA4261IoKsGaLMV2DSOXgouHw78lMIim7RjCi5yYq17LS-sCsDfkeqH35Qv3e85DbWX38LJqkMPFpxCaCqEpYIMWnd1qaDltIXnwqWdw"
defaultPlace = "jax"


module.exports = (robot) ->
  robot.respond /traffic$/i, (msg) ->
    id =  places[defaultPlace]
    if id
      msg.send "https://www.google.com/maps/vt/data=#{id}##{Date.now()}.png"
    else
      msg.send "I only have traffic configured for: #{Object.keys(data).join(', ')}"
