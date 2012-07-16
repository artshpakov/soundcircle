db = require "../db"
$ = require "jquery"

class User
  @find: (login) ->
    fetching = $.Deferred()
    db.collection("users").findOne {login, active: true}, (err, user) ->
      throw err if err
      fetching.resolve user
    fetching.promise()

module.exports = User
