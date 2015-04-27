Marker = require '../lib/marker'

describe "Marker", ->
  viewClass = Marker

  it "is a thing", ->
    view = new viewClass("X")
    expect(view.find(".beastmode-motion-key").text()).toBe "X"
