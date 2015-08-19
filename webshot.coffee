webshot = require('webshot')

opts =
  windowSize: {height: 26, width: 26}
  quality: 100
  renderDelay: 1000


tasks = []
letterCombinations = []
alphabet = 'abcdefghijklmnopqrstuvwxyz'.toUpperCase().split('')

for firstLetter in alphabet
  for secondLetter in alphabet
    letterCombinations.push "#{firstLetter}#{secondLetter}"


for letterCombo in letterCombinations
  createImage = (lC, cb) ->
    return (cb) ->
      console.log 'letterCombo', lC
      webshot "http://localhost:3400/#{lC}", "output/#{lC}.png", opts, (err) ->
        console.log 'Saved', lC
        return cb?()
      return

  task = createImage(letterCombo)
  tasks.push task


console.log 'Tasks', tasks.length

next = ->
  return tasks.shift()(next)

next()
