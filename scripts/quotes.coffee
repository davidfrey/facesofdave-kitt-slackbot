# Description
#   Is a website url down?

request = require('request')

userInfo = (robot, username) ->
  return new Promise (resolve, reject) ->
    robot.slack.users.list({ presence: true }).then (res) ->
      users = res.members.filter (u) -> u.name == username
      resolve users[0]
    .catch (error) ->
      reject error

module.exports = (robot) ->
  robot.respond /I need (ya|you) buddy/i, (res) ->
    userInfo(robot, res.envelope.user.name).then (user) ->
      res.send "Right away #{user.profile.first_name}\nhttps://68.media.tumblr.com/1475ab7feb2d0b79652e5109fde42da3/tumblr_mgliqm5wGL1qicagco1_400.gif"
    .catch (error) ->
      console.log error

  robot.respond /Where are you?/i, (res) ->
    userInfo(robot, res.envelope.user.name).then (user) ->
      res.send "I'm in your parking space, #{user.profile.first_name}. Where else would I be?"
    .catch (error) ->
      console.log error

  robot.respond /.* pal.*/i, (res) ->
    res.send "I'm not your pal"

  robot.hear /Kitt\?/i, (res) ->
    userInfo(robot, res.envelope.user.name).then (user) ->
      res.send "Yes, #{user.profile.first_name}?"
    .catch (error) ->
      console.log error

  robot.hear /.* ready to deploy.*\?/i, (res) ->
    res.send "Don't touch Turbo Boost. Something tells me you shouldn't touch Turbo Boost."
