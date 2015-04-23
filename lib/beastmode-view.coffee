module.exports =
class BeastmodeView
  constructor: ->
    @element = document.createElement('div')
    @element.classList.add('beastmode')

    message = document.createElement('div')
    message.textContent = "The Beastmode package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  destroy: ->
    @element.remove()

  getElement: ->
    @element
