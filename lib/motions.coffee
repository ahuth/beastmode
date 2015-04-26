module.exports =
  nextWord: (cursor) ->
    cursor.getBeginningOfNextWordBufferPosition()

  endOfWord: (cursor) ->
    cursor.getCurrentWordBufferRange().end

  endOfLine: (cursor) ->
    cursor.getCurrentLineBufferRange().end
