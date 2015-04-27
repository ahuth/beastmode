Motions = require './motions'
Marker = require './marker'

module.exports =
class Beastmode
  inBeastmode: false
  iterations: 1
  markers: []
  keyCodeForZero: 48

  constructor: (workspace) ->
    @workspace = workspace

  destroy: ->
    @leave()
    @workspace = null

  toggle: ->
    if @inBeastmode then @leave() else @enter()

  enter: ->
    @_drawMarkers()
    @inBeastmode = true

  leave: ->
    @_clearMarkers()
    @iterations = 1
    @inBeastmode = false

  onNumberEntered: (event) =>
    return unless @inBeastmode
    @iterations = event.originalEvent.keyCode - @keyCodeForZero
    @_drawMarkers()

  _drawMarkers: ->
    @_clearMarkers() if @markers
    editor = @workspace.getActiveTextEditor()
    @markers.push new Marker(editor, Motions.nextWord(editor, @iterations), "w")
    @markers.push new Marker(editor, Motions.endOfWord(editor, @iterations), "e")
    @markers.push new Marker(editor, Motions.previousWordBoundary(editor, @iterations), "b")

  _clearMarkers: ->
    marker.destroy() for marker in @markers
    @markers = []
