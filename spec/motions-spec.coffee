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
