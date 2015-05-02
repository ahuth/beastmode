{View} = require 'atom-space-pen-views'

module.exports =
class Marker extends View
  @content: (editor, position, key) ->
    @div class: "beastmode-motion-marker", =>
      @span key, class: "beastmode-motion-key"

  initialize: (editor, position, key) ->
    @bufferPosition = position
    @marker = editor.markBufferPosition(position)
    editor.decorateMarker(@marker, {type: "overlay", item: this})

  destroy: ->
    @marker.destroy()
