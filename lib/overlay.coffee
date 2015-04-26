{View} = require 'atom-space-pen-views'

module.exports =
class Overlay extends View
  @content: ->
    @div class: "beastmode", =>
      @div "The Beastmode package is Alive! It's ALIVE!", class: "message"
