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
  jax: "RfCSdfNZ0LFPrHSm0ublXdzhdrDFhtmHhN1u-gM,lrNoCwjIAcOZ_QzBZBLoBmmkaHbqUbN1b0TJaP0fdxAx4sqzJCx_6QWqfoDsq3xnZtwyCMEtCipOkQCoW8YMIKR8WQUOxMEFPpJSLkzhMz0krSNN6FgkIB7NCg0H6B3UJ1gQPfEPp0A0zQGMJIvl5YqPRsxf4V6p3n2cJzwmuaCLlY2D"
defaultPlace = "jax"


module.exports = (robot) ->
  robot.respond /traffic$/i, (msg) ->
    id =  defaultPlace
    if id
      msg.send "https://www.google.com/maps/vt/data=#{id}##{Date.now()}.png"
    else
      msg.send "I only have traffic configured for: #{Object.keys(data).join(', ')}"
