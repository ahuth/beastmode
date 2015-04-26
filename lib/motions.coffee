{Point} = require 'atom'

module.exports =
  nextWord: (editor, iterations) ->
    startPosition = position = editor.getCursorBufferPosition()
    for iteration in [1..iterations]
      editor.setCursorBufferPosition(position) unless startPosition == position
      position = editor.cursors[0].getBeginningOfNextWordBufferPosition()
    editor.setCursorBufferPosition(startPosition)
    position
