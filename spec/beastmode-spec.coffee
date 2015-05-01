Beastmode = require '../lib/beastmode'

describe "Beastmode", ->
  beastmode = null
  workspaceElement = null
  editor = null

  beforeEach ->
    beastmode = new Beastmode(atom.workspace)
    workspaceElement = atom.views.getView(atom.workspace)
    jasmine.attachToDOM(workspaceElement)

    waitsForPromise ->
      atom.workspace.open("sample.coffee")

    runs ->
      editor = atom.workspace.getActiveTextEditor()
      editor.setCursorBufferPosition({row: 4, column: 13})

  it "toggles the motion markers", ->
    expect(workspaceElement.querySelector('.beastmode-motion-marker')).not.toExist()
    beastmode.toggle()
    expect(workspaceElement.querySelector('.beastmode-motion-marker')).toExist()
    beastmode.toggle()
    expect(workspaceElement.querySelector('.beastmode-motion-marker')).not.toExist()

  it "clears the motion markers", ->
    beastmode.toggle()
    expect(workspaceElement.querySelector('.beastmode-motion-marker')).toExist()
    beastmode.leave()
    expect(workspaceElement.querySelector('.beastmode-motion-marker')).not.toExist()

  describe "movement", ->
    cursor = null

    beforeEach ->
      cursor = editor.cursors[0]
      cursor.setBufferPosition({row: 3, column: 4})
      beastmode.toggle()

    afterEach ->
      beastmode.leave()

    it "can move to the next word", ->
      beastmode.onMove({originalEvent: {keyCode: 87}}) # Press the "w" key
      expect(cursor.getBufferPosition()).toEqual {row: 3, column: 6}

    it "can move to the next word after giving a number modifier", ->
      beastmode.onNumberEntered({originalEvent: {keyCode: 53}}) # Press the "5" key
      beastmode.onMove({originalEvent: {keyCode: 87}}) # Press the "w" key
      expect(cursor.getBufferPosition()).toEqual {row: 3, column: 17}
