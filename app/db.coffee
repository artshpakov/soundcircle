mongo = require 'mongoskin'
app = require './../app'

module.exports = mongo.db app.settings.connection_string
