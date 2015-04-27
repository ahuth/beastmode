{Point} = require 'atom'

module.exports =
  nextWord: (editor, iterations) ->
    startPosition = position = editor.getCursorBufferPosition()
    for iteration in [1..iterations]
      editor.setCursorBufferPosition(position) unless startPosition == position
      position = editor.cursors[0].getBeginningOfNextWordBufferPosition()
    editor.setCursorBufferPosition(startPosition)
    position

  endOfWord: (editor, iterations) ->
    startPosition = position = editor.getCursorBufferPosition()
    for iteration in [1..iterations]
      editor.setCursorBufferPosition(position) unless startPosition == position
      position = editor.cursors[0].getEndOfCurrentWordBufferPosition()
    editor.setCursorBufferPosition(startPosition)
    position

  previousWordBoundary: (editor, iterations) ->
    startPosition = position = editor.getCursorBufferPosition()
    for iteration in [1..iterations]
      editor.setCursorBufferPosition(position) unless startPosition == position
      position = editor.cursors[0].getPreviousWordBoundaryBufferPosition()
    editor.setCursorBufferPosition(startPosition)
    position
