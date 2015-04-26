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
    @_markMotion(Motions.endOfWord(editor), "e", editor)
    @_markMotion(Motions.previousWordBoundary(editor), "b", editor)
    @_markMotion(Motions.endOfLine(editor), "$", editor)
    @_markMotion(Motions.startOfLine(editor), "0", editor)
    @_markMotion(Motions.firstCharacterOfLine(editor), "^", editor)

    @inBeastmode = true

  leave: ->
    marker.destroy() for marker in @markers
    @markers = []
    @inBeastmode = false

  _markMotion: (position, key, editor) ->
    marker = editor.markBufferPosition(position)
    @markers.push(marker)
    editor.decorateMarker(marker, {type: "overlay", item: new MotionMarker(key)})
