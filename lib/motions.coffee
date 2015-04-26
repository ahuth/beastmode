{Point} = require 'atom'

module.exports =
  nextWord: (editor) ->
    editor.cursors[0].getBeginningOfNextWordBufferPosition()

  endOfWord: (editor) ->
    editor.cursors[0].getCurrentWordBufferRange().end.translate([0, -1])

  endOfLine: (editor) ->
    editor.cursors[0].getCurrentLineBufferRange().end

  startOfLine: (editor) ->
    editor.cursors[0].getCurrentLineBufferRange().start

  firstCharacterOfLine: (editor) ->
    firstCharacterColumn = undefined
    lineRange = editor.cursors[0].getCurrentLineBufferRange()
    editor.scanInBufferRange /\S/, lineRange, ({range, stop}) ->
      firstCharacterColumn = range.start.column
      stop()
    new Point(lineRange.start.row, firstCharacterColumn)

  previousWordBoundary: (editor) ->
    editor.cursors[0].getPreviousWordBoundaryBufferPosition() 
