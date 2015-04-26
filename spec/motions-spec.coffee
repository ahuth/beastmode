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

  describe "nextWord", ->
    it "gets the start position of the next word", ->
      position = Motions.nextWord(editor)
      expect(position.row).toBe 4
      expect(position.column).toBe 16

  describe "endOfWord", ->
    it "gets the current word's end position", ->
      position = Motions.endOfWord(editor)
      expect(position.row).toBe 4
      expect(position.column).toBe 14

  describe "endOfLine", ->
    it "gets the end position of the current line", ->
      position = Motions.endOfLine(editor)
      expect(position.row).toBe 4
      expect(position.column).toBe 38

  describe "startOfLine", ->
    it "gets the start position of the current line", ->
      position = Motions.startOfLine(editor)
      expect(position.row).toBe 4
      expect(position.column).toBe 0

  describe "firstCharacterOfLine", ->
    it "gets the position of the first character of the current line", ->
      position = Motions.firstCharacterOfLine(editor)
      expect(position.row).toBe 4
      expect(position.column).toBe 4

  describe "previousWordBoundary", ->
    it "gets the position of previous word boundary, starting with the current word", ->
      position = Motions.previousWordBoundary(editor)
      expect(position.row).toBe 4
      expect(position.column).toBe 11
