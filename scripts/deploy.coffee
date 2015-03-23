# Description:
#   Deploy is used to deploy from git repositories to servers.
#
# Commands:
#   hubot deploy <repo>
#
# Author:
#   johnthepink
#
#  from : http://www.johnpinkerton.me/2014/09/24/deploy-from-github-to-heroku-using-hipchat/

util = require "util"
exec = require("child_process").exec

module.exports = (robot) ->
  robot.respond /deploy (.*)/i, (msg) ->

    # return unless deploy role
    unless robot.auth.hasRole(msg.envelope.user,'deploy')
      msg.send 'You do not have the deploy permissions. Contact the admin.'
      return

    repo = msg.match[1]

    # you can extend this if statement to deploy more than one app
    if repo == 'app'
      msg.send "Deploying #{repo}"

      child = exec "./deploy-app.sh", (err, stdout, stderr) ->
        msg.send err if err
        msg.send stderr if stderr
        msg.send stdout
    else
      msg.send 'I do not know him'
