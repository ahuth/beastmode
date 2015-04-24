{CompositeDisposable} = require 'atom'

module.exports =
class Beastmode
  constructor: (workspace) ->
    @workspace = workspace
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add "atom-workspace", "beastmode:toggle": => @toggle()

    element = document.createElement('div')
    element.classList.add('beastmode')

    message = document.createElement('div')
    message.textContent = "The Beastmode package is Alive! It's ALIVE!"
    message.classList.add('message')
    element.appendChild(message)

    @modalPanel = atom.workspace.addModalPanel(item: element, visible: false)

  destroy: ->
    @workspace = null
    @subscriptions.dispose()

  toggle: ->
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
