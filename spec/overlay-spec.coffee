Overlay = require '../lib/overlay'

describe "Overlay", ->
  viewClass = Overlay

  it "is a thing", ->
    view = new viewClass()
    expect(view.find(".message").text()).toBe "The Beastmode package is Alive! It's ALIVE!"
