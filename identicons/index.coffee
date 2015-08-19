Identicon = require 'l-identicon'

module.exports = (app) ->
  app.component Identicon
  app.component IdenticonExample

class IdenticonExample
  view: __dirname + '/index'
  name: 'l-identicon-example'

  init: ->
    USERS = @model.root.get('_page.users') || USERS
    console.log 'USERS', USERS, @model.root.get('_page.users')
    @model.setNull 'users', USERS


USERS = []

alphabet = 'abcdefghijklmnopqrstuvwxyz'.toUpperCase().split('')

for firstLetter in alphabet
  for secondLetter in alphabet
    USERS.push
      name: "#{firstLetter}ales #{secondLetter}asda"
      email: 'test'
      id: "#{Math.floor(Math.random()*10000)}-123123"
