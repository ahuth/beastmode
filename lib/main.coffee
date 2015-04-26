Beastmode = require './beastmode'
{CompositeDisposable} = require 'atom'

module.exports =
  beastmode: null
  subscriptions: null

  activate: ->
    @beastmode = new Beastmode(atom.workspace)
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:toggle": => @beastmode.toggle()
    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:clear": => @beastmode.clear()

  deactivate: ->
    @subscriptions?.dispose()
    @beastmode?.destroy()
    @beastmode = null
