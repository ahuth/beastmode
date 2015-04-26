Beastmode = require '../lib/beastmode'

describe "Beastmode", ->
  beastmode = null
  workspaceElement = null

  beforeEach ->
    beastmode = new Beastmode(atom.workspace)
    workspaceElement = atom.views.getView(atom.workspace)
    jasmine.attachToDOM(workspaceElement)

    waitsForPromise ->
      atom.workspace.open("sample.coffee")

    runs ->
      editor = atom.workspace.getActiveTextEditor()
      editor.setCursorScreenPosition({row: 4, column: 13})

  it "toggles the motion markers", ->
    expect(workspaceElement.querySelector('.beastmode-motion-marker')).not.toExist()
    beastmode.toggle()
    expect(workspaceElement.querySelector('.beastmode-motion-marker')).toExist()
    beastmode.toggle()
    expect(workspaceElement.querySelector('.beastmode-motion-marker')).not.toExist()

  it "clears the motion markers", ->
    beastmode.toggle()
    expect(workspaceElement.querySelector('.beastmode-motion-marker')).toExist()
    beastmode.clear()
    expect(workspaceElement.querySelector('.beastmode-motion-marker')).not.toExist()
