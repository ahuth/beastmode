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
    nextWordPosition = cursor.getBeginningOfNextWordBufferPosition()
    marker = editor.markBufferPosition(nextWordPosition)
    @markers.push(marker)
    decoration = editor.decorateMarker(marker, {type: "overlay", item: new MotionMarker("w")})
    @inBeastmode = true

  clear: ->
    marker.destroy() for marker in @markers
    @markers = []
    @inBeastmode = false
