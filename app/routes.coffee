index = require('./routes/index').routes

module.exports =
	(app) ->
		app.get '/', index.index
