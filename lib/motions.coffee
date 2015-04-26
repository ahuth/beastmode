module.exports =
  nextWord: (cursor) ->
    cursor.getBeginningOfNextWordBufferPosition()

  endOfWord: (cursor) ->
    cursor.getCurrentWordBufferRange().end.translate([0, -1])

  endOfLine: (cursor) ->
    cursor.getCurrentLineBufferRange().end

  startOfLine: (cursor) ->
    cursor.getCurrentLineBufferRange().start
