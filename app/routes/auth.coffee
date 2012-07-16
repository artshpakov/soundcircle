User = require "../models/user"

exports.routes = 

  login: (req, res) ->
    User.find(req.body.login).done (user) ->
      res.send("User #{req.body.login} not found", 404) unless user
      req.session.user = user
      res.redirect '/'

  logout: (req, res) ->
    req.session.regenerate (err) ->
      res.redirect '/'
