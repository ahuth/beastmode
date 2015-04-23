BeastmodeView = require './beastmode-view'
{CompositeDisposable} = require 'atom'

module.exports = Beastmode =
  beastmodeView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @beastmodeView = new BeastmodeView(state.beastmodeViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @beastmodeView.getElement(), visible: false)
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'beastmode:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @beastmodeView.destroy()

  serialize: ->
    beastmodeViewState: @beastmodeView.serialize()

  toggle: ->
    console.log 'Beastmode was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
