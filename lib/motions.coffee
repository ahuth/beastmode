{Point} = require 'atom'

module.exports =
  nextWord: (editor) ->
    editor.cursors[0].getBeginningOfNextWordBufferPosition()
