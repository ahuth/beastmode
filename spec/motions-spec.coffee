Motions = require '../lib/motions'

describe "Motions", ->
  editor = null
  cursor = null

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
