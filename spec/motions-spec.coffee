Motions = require '../lib/motions'

describe "Motions", ->
  editor = null
  cursor = null

  beforeEach ->
    waitsForPromise ->
      atom.workspace.open("sample.coffee")

    runs ->
      editor = atom.workspace.getActiveTextEditor()
      editor.setCursorScreenPosition({row: 4, column: 13})
      cursor = editor.cursors[0]

  describe "nextWord", ->
    it "gets the start position of the next word", ->
      position = Motions.nextWord(cursor)
      expect(position.row).toBe 4
      expect(position.column).toBe 16

  describe "endOfWord", ->
    it "gets the current word's end position", ->
      position = Motions.endOfWord(cursor)
      expect(position.row).toBe 4
      expect(position.column).toBe 14

  describe "endOfLine", ->
    it "gets the end position of the current line", ->
      position = Motions.endOfLine(cursor)
      expect(position.row).toBe 4
      expect(position.column).toBe 38

  describe "startOfLine", ->
    it "gets the start position of the current line", ->
      position = Motions.startOfLine(cursor)
      expect(position.row).toBe 4
      expect(position.column).toBe 0
