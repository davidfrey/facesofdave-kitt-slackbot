# Description
#   Is a website url down?

request = require('request')

module.exports = (robot) ->
  robot.hear /is (.*) down/i, (message) ->
    input   = message.match[1]
    matches = input.match(/(?:https?:\/\/)?(?:[^@\n]+@)?(?:www\.)?([^:\/\n]+)/)
    domain  = matches[1]

    request 'http://' + domain, (error, response, body) ->
      if error
        message.send "Ummm...\n```" + error + "```"
      else if response.statusCode == 200
        message.send "looks up to me."
      else
        message.send "looks down to me. Status code: " + response.statusCode
