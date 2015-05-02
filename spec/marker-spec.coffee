Marker = require '../lib/marker'
{TextEditor} = require 'atom'

describe "Marker", ->
  viewClass = Marker
  editor = null
  editorElement = null

  beforeEach ->
    editor = new TextEditor({softTabs: true})
    editorElement = atom.views.getView(editor)
    jasmine.attachToDOM(editorElement)

  it "is a thing", ->
    view = new viewClass(editor, {row: 0, column: 0}, "X")
    expect(view.find(".beastmode-motion-key").text()).toBe "X"

  it "creates a marker and decorates it in the editor", ->
    view = new viewClass(editor, {row: 0, column: 0}, "X")
    expect(editorElement.querySelector("atom-overlay .beastmode-motion-marker")).toExist()

  it "keeps track of its buffer position", ->
    view = new viewClass(editor, {row: 2, column: 3}, "X")
    expect(view.bufferPosition).toEqual {row: 2, column: 3}
