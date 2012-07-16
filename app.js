// Module dependencies.

var express = require('express'),
    mongo = require('mongoskin'),
    mongoStore = require('connect-mongodb'),
    coffee = require('coffee-script');

var app = module.exports = express.createServer();

// Configuration

app.configure(function(){
  app.set('views', __dirname + '/app/templates');
  app.set('view engine', 'jade');
  app.set('port', 3000);
  app.set('connection_string', "localhost:"+mongo.Connection.DEFAULT_PORT+"/soundcircle?auto_reconnect");
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.cookieParser());
  app.use(express.session({
    secret: 'hfjaisdhf746ijfid45djdiweur67w4_',
    store: new mongoStore({url: "mongodb://"+app.settings.connection_string, maxAge: 300000})
  }));
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.configure('test', function(){
  app.set('port', 3001);
  app.set('database', 'soundcircle_test');
});

app.configure('production', function(){
  if (!process.env.DB_STRING) throw "Connection string not specified";
  app.use(express.errorHandler());
  app.set('connection_string', process.env.DB_STRING);
});

// Routes

routes = require('./app/routes')(app);

app.listen(process.env.PORT || app.settings.port, function(){
  console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
});
