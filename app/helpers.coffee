app = require '../app'


current_user = (req, res) ->
  req.session.user

is_authenticated = (req, res) ->
  current_user(req, res)?


module.exports =
  app.dynamicHelpers { current_user, is_authenticated }
