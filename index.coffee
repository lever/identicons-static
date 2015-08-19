app = module.exports = require('derby').createApp 'component-examples', __filename
app.serverUse module, 'derby-stylus'
app.loadViews __dirname
app.loadStyles __dirname

app.use require './identicons'



app.get '/', ->
  @render 'l-identicon-example'

app.get '/:lettercombo', ->
  lettercombo = @params.lettercombo.split('')
  console.log 'rendering', lettercombo
  @model.set '_page.users', [
    {
      name: "#{lettercombo[0]}ales #{lettercombo[1]}ame"
      email: 'none'
      id: "#{Math.floor(Math.random()*10000)}-123123"
    }
  ]
  @render 'l-identicon-example'

app.post '/upload', ({req, res}) ->
  #console.log "req", req
  res.send([{importId: 1}])

app.on 'ready', (page) ->
  # For debugging purposes only
  window.MODEL = page.model
  window.APP = app
