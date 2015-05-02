Beastmode = require './beastmode'
{CompositeDisposable} = require 'atom'

module.exports =
  beastmode: undefined
  subscriptions: undefined

  activate: ->
    @beastmode = new Beastmode(atom.workspace)
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:number": @beastmode.onNumberEntered

    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:toggle": =>
      atom.views.getView(atom.workspace.getActiveTextEditor()).classList.toggle("beastmode")
      @beastmode.toggle()

    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:clear": =>
      atom.views.getView(atom.workspace.getActiveTextEditor()).classList.remove("beastmode")
      @beastmode.leave()

    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:move": (event) =>
      @beastmode.onMove(event)
      workspaceElement = atom.views.getView(atom.workspace)
      atom.commands.dispatch(workspaceElement, "beastmode:clear")

  deactivate: ->
    @subscriptions?.dispose()
    @beastmode?.destroy()
    @beastmode = null
