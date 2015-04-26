MotionMarker = require '../lib/motion-marker'

describe "MotionMarker", ->
  viewClass = MotionMarker

  it "is a thing", ->
    view = new viewClass("X")
    expect(view.find(".beastmode-motion-key").text()).toBe "X"
