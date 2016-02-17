# Description
#   TeamCity notifications triggered by webhooks plugin
#
# URLs:
#   POST /hubot/teamcity-builds/<room> (message=<message>)

module.exports = (robot) ->
  robot.router.post '/hubot/teamcity-builds/:room', (req, res) ->
    robot.logger.info req
    room =    req.params.room
    message = req.body
    robot.messageRoom 'training-grounds', "This is a test"
    res.end
