Overlay = require './overlay'
{CompositeDisposable} = require 'atom'

module.exports =
class Beastmode
  constructor: (workspace) ->
    @workspace = workspace
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:toggle": => @toggle()

    @overlay = new Overlay
    @modalPanel = atom.workspace.addModalPanel(item: @overlay.get(0), visible: false)

  destroy: ->
    @workspace = null
    @subscriptions.dispose()

  toggle: ->
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
