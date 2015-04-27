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
      expect(position.column).toBe 14

    it "gets the end position of the next word", ->
      editor.setCursorScreenPosition({row: 4, column: 13})
      position = Motions.endOfWord(editor, 2)
      expect(position.row).toBe 4
      expect(position.column).toBe 16

    it "gets the end position of the third word", ->
      editor.setCursorScreenPosition({row: 4, column: 13})
      position = Motions.endOfWord(editor, 3)
      expect(position.row).toBe 4
      expect(position.column).toBe 18

    it "wraps to the next line if necessary", ->
      editor.setCursorScreenPosition({row: 3, column: 4})
      position = Motions.endOfWord(editor, 7)
      expect(position.row).toBe 4
      expect(position.column).toBe 8

  describe "previousWordBoundary", ->
    it "gets the previous word boundary of the current word", ->
      editor.setCursorScreenPosition({row: 4, column: 23})
      position = Motions.previousWordBoundary(editor, 1)
      expect(position.row).toBe 4
      expect(position.column).toBe 20

    it "gets the previous word boundary of the next word", ->
      editor.setCursorScreenPosition({row: 4, column: 23})
      position = Motions.previousWordBoundary(editor, 2)
      expect(position.row).toBe 4
      expect(position.column).toBe 19

    it "gets the previous word boundary of the third word", ->
      editor.setCursorScreenPosition({row: 4, column: 23})
      position = Motions.previousWordBoundary(editor, 3)
      expect(position.row).toBe 4
      expect(position.column).toBe 18

    it "wraps to the previous line if necessary", ->
      editor.setCursorScreenPosition({row: 3, column: 4})
      position = Motions.previousWordBoundary(editor, 5)
      expect(position.row).toBe 1
      expect(position.column).toBe 23

  describe "endOfLine", ->
    it "gets the end of the current line", ->
      editor.setCursorScreenPosition({row: 0, column: 0})
      position = Motions.endOfLine(editor, 1)
      expect(position.row).toBe 0
      expect(position.column).toBe 12

    it "gets the end of the next line", ->
      editor.setCursorScreenPosition({row: 0, column: 0})
      position = Motions.endOfLine(editor, 2)
      expect(position.row).toBe 1
      expect(position.column).toBe 25

    it "gets the end of the third line", ->
      editor.setCursorScreenPosition({row: 0, column: 0})
      position = Motions.endOfLine(editor, 3)
      expect(position.row).toBe 2
      expect(position.column).toBe 0

    it "gets the end of the fourth line", ->
      editor.setCursorScreenPosition({row: 0, column: 0})
      position = Motions.endOfLine(editor, 4)
      expect(position.row).toBe 3
      expect(position.column).toBe 19
