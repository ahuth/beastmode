{Point} = require 'atom'

module.exports =
  nextWord: (cursor) ->
    cursor.getBeginningOfNextWordBufferPosition()

  endOfWord: (cursor) ->
    cursor.getCurrentWordBufferRange().end.translate([0, -1])

  endOfLine: (cursor) ->
    cursor.getCurrentLineBufferRange().end

  startOfLine: (cursor) ->
    cursor.getCurrentLineBufferRange().start

  firstCharacterOfLine: (editor, cursor) ->
    firstCharacterColumn = undefined
    lineRange = cursor.getCurrentLineBufferRange()
    editor.scanInBufferRange /\S/, lineRange, ({range, stop}) ->
      firstCharacterColumn = range.start.column
      stop()
    new Point(lineRange.start.row, firstCharacterColumn)
