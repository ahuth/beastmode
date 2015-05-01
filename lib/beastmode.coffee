Motions = require './motions'
Marker = require './marker'

module.exports =
class Beastmode
  inBeastmode: false
  iterations: 1
  markers: {}
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
    @_clearMarkers()
    @_drawMarkers()

  onMove: (event) =>
    return unless @inBeastmode
    keycodes = { 87: "w", 69: "e", 66: "b", 52: "$", 48: "0", 54: "^" }
    marker = @markers[keycodes[event.originalEvent.keyCode]]
    @workspace.getActiveTextEditor().setCursorBufferPosition(marker.bufferPosition)

  _drawMarkers: ->
    editor = @workspace.getActiveTextEditor()
    @markers.w =  new Marker(editor, Motions.nextWord(editor, @iterations), "w")
    @markers.e =  new Marker(editor, Motions.endOfWord(editor, @iterations), "e")
    @markers.b =  new Marker(editor, Motions.previousWordBoundary(editor, @iterations), "b")
    @markers.$ =  new Marker(editor, Motions.endOfLine(editor, @iterations), "$")
    @markers["0"] = new Marker(editor, Motions.startOfLine(editor, @iterations), "0")
    @markers["^"] = new Marker(editor, Motions.firstCharacterOfLine(editor, @iterations), "^")

  _clearMarkers: ->
    marker.destroy() for key, marker of @markers
    @markers = []
