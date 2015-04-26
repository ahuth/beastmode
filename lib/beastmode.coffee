MotionMarker = require './motion-marker'
{CompositeDisposable} = require 'atom'

module.exports =
class Beastmode
  inBeastmode: false
  marker: undefined

  constructor: (@workspace) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:toggle": => @toggle()
    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:clear": => @clear()

  destroy: ->
    @workspace = null
    @subscriptions.dispose()

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
