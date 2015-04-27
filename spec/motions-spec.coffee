Motions = require '../lib/motions'

describe "Motions", ->
  editor = null

  beforeEach ->
    waitsForPromise ->
      atom.workspace.open("sample.coffee")

    runs ->
      editor = atom.workspace.getActiveTextEditor()

  describe "nextWord", ->
    it "gets the start position of the next word", ->
      editor.setCursorScreenPosition({row: 4, column: 13})
      position = Motions.nextWord(editor, 1)
      expect(position.row).toBe 4
      expect(position.column).toBe 16

    it "gets the start position of the second next word", ->
      editor.setCursorScreenPosition({row: 4, column: 13})
      position = Motions.nextWord(editor, 2)
      expect(position.row).toBe 4
      expect(position.column).toBe 18

    it "gets the start position of the third next word", ->
      editor.setCursorScreenPosition({row: 4, column: 13})
      position = Motions.nextWord(editor, 3)
      expect(position.row).toBe 4
      expect(position.column).toBe 20

    it "wraps to the next line if necessary", ->
      editor.setCursorScreenPosition({row: 3, column: 4})
      position = Motions.nextWord(editor, 8)
      expect(position.row).toBe 4
      expect(position.column).toBe 11

  describe "endOfWord", ->
    it "gets the end position of the current word", ->
      editor.setCursorScreenPosition({row: 4, column: 13})
      position = Motions.endOfWord(editor, 1)
      expect(position.row).toBe 4
      expect(position.column).toBe 15

    it "gets the end position of the next word", ->
      editor.setCursorScreenPosition({row: 4, column: 13})
      position = Motions.endOfWord(editor, 2)
      expect(position.row).toBe 4
      expect(position.column).toBe 17

    it "gets the end position of the third word", ->
      editor.setCursorScreenPosition({row: 4, column: 13})
      position = Motions.endOfWord(editor, 3)
      expect(position.row).toBe 4
      expect(position.column).toBe 19

    it "wraps to the next line if necessary", ->
      editor.setCursorScreenPosition({row: 3, column: 4})
      position = Motions.endOfWord(editor, 7)
      expect(position.row).toBe 4
      expect(position.column).toBe 9
