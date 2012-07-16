process.env.NODE_ENV = 'test'
app     = require "./../../../app"
User    = require "./../../../app/models/user"

describe "User", ->

  it "should be able to find a user by his login", ->
    expect(typeof User.find('somelogin').done).toBe 'function'

    User.find('admin').done (user) -> expect(user.login).toBe 'admin'
    User.find('nobody').done (user) -> expect(user).toBe null
