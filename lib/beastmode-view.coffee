module.exports =
class BeastmodeView
  constructor: (serializedState) ->
    @element = document.createElement('div')
    @element.classList.add('beastmode')

    message = document.createElement('div')
    message.textContent = "The Beastmode package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  destroy: ->
    @element.remove()

  getElement: ->
    @element
