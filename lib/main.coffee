Beastmode = require './beastmode'
{CompositeDisposable} = require 'atom'

module.exports =
  beastmode: undefined
  subscriptions: undefined

  activate: ->
    @beastmode = new Beastmode(atom.workspace)
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:toggle": =>
      atom.views.getView(atom.workspace.getActiveTextEditor()).classList.toggle("beastmode")
      @beastmode.toggle()
    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:clear": =>
      atom.views.getView(atom.workspace.getActiveTextEditor()).classList.remove("beastmode")
      @beastmode.leave()

  deactivate: ->
    @subscriptions?.dispose()
    @beastmode?.destroy()
    @beastmode = null
