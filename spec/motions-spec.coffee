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
    it "works", ->
      position = Motions.nextWord(cursor)
      expect(position.row).toBe 4
      expect(position.column).toBe 16
