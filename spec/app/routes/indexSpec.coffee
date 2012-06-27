process.env.NODE_ENV = 'test'
app     = require "./../../../app"
request = require "request"

describe "Index", ->

  describe "GET index", ->
    data = {}

    beforeEach (done) ->
      request "http://localhost:#{app.settings.port}/", (err, response, body) ->
        data.response = response
        data.body = body
        done()

    it "should be sane", ->
      expect(data.response.statusCode).toEqual 200
