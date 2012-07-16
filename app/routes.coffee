index   = require('./routes/index').routes
auth    = require('./routes/auth').routes

module.exports =
  (app) ->
    app.get   '/',        index.index

    app.post  '/login',   auth.login
    app.get   '/logout',  auth.logout
