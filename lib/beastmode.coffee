Motions = require './motions'
MotionMarker = require './motion-marker'

module.exports =
class Beastmode
  inBeastmode: false
  markers: []

  constructor: (workspace) ->
    @workspace = workspace

  destroy: ->
    @leave()
    @workspace = null

  toggle: ->
    if @inBeastmode then @leave() else @enter()

  enter: ->
    editor = @workspace.getActiveTextEditor()
    @_markMotion(Motions.nextWord(editor), "w", editor)
    @inBeastmode = true

  leave: ->
    marker.destroy() for marker in @markers
    @markers = []
    @inBeastmode = false

  _markMotion: (position, key, editor) ->
    marker = editor.markBufferPosition(position)
    @markers.push(marker)
    editor.decorateMarker(marker, {type: "overlay", item: new MotionMarker(key)})
