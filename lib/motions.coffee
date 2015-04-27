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
    position.translate([0, -1])

  previousWordBoundary: (editor, iterations) ->
    startPosition = position = editor.getCursorBufferPosition()
    for iteration in [1..iterations]
      editor.setCursorBufferPosition(position) unless startPosition == position
      position = editor.cursors[0].getPreviousWordBoundaryBufferPosition()
    editor.setCursorBufferPosition(startPosition)
    position

  endOfLine: (editor, iterations) ->
    startPosition = editor.getCursorBufferPosition()
    editor.setCursorBufferPosition({row: startPosition.row + iterations - 1, column: 0})
    position = editor.cursors[0].getCurrentLineBufferRange().end
    editor.setCursorBufferPosition(startPosition)
    position

  startOfLine: (editor, iterations) ->
    startPosition = editor.getCursorBufferPosition()
    editor.setCursorBufferPosition({row: startPosition.row - iterations + 1, column: 0})
    position = editor.cursors[0].getCurrentLineBufferRange().start
    editor.setCursorBufferPosition(startPosition)
    position
