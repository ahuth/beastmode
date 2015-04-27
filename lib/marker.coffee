{View} = require 'atom-space-pen-views'

module.exports =
class Marker extends View
  @content: (key) ->
    @div class: "beastmode-motion-marker", =>
      @span key, class: "beastmode-motion-key"
