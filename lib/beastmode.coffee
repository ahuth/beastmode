Motions = require './motions'
Marker = require './marker'

module.exports =
class Beastmode
  inBeastmode: false
  iterations: 1
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
    @markers.push new Marker(editor, Motions.nextWord(editor, @iterations), "w")
    @inBeastmode = true

  leave: ->
    @_clearMarkers()
    @iterations = 1
    @inBeastmode = false

  _clearMarkers: ->
    marker.destroy() for marker in @markers
    @markers = []
