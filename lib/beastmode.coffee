Motions = require './motions'
MotionMarker = require './motion-marker'

module.exports =
class Beastmode
  inBeastmode: false
  markers: []

  constructor: (workspace) ->
    @workspace = workspace

  destroy: ->
    @clear()
    @workspace = null

  toggle: ->
    if @inBeastmode then @clear() else @enter()

  enter: ->
    editor = @workspace.getActiveTextEditor()
    cursor = editor.cursors[0]

    # Next word
    nextWordPosition = Motions.nextWord(cursor)
    marker = editor.markBufferPosition(nextWordPosition)
    @markers.push(marker)
    editor.decorateMarker(marker, {type: "overlay", item: new MotionMarker("w")})

    # End of word
    endOfWordPosition = Motions.endOfWord(cursor)
    marker = editor.markBufferPosition(endOfWordPosition)
    @markers.push(marker)
    editor.decorateMarker(marker, {type: "overlay", item: new MotionMarker("e")})

    @inBeastmode = true

  clear: ->
    marker.destroy() for marker in @markers
    @markers = []
    @inBeastmode = false
