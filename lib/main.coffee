Beastmode = require './beastmode'

module.exports =
  beastmode: null

  activate: ->
    @beastmode = new Beastmode(atom.workspace)

  deactivate: ->
    @beastmode.destroy()
    @beastmode = null
