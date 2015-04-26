MotionMarker = require './motion-marker'

module.exports =
class Beastmode
  inBeastmode: false
  marker: undefined

  constructor: (workspace) ->
    @workspace = workspace

  destroy: ->
    @workspace = null

  toggle: ->
    if @inBeastmode then @clear() else @enter()

  enter: ->
    editor = @workspace.getActiveTextEditor()
    cursor = editor.cursors[0]
    nextWordPosition = cursor.getBeginningOfNextWordBufferPosition()
    @marker = editor.markBufferPosition(nextWordPosition)
    decoration = editor.decorateMarker(@marker, {type: "overlay", item: new MotionMarker("w")})
    @inBeastmode = true

  clear: ->
    @marker.destroy?()
    @inBeastmode = false
