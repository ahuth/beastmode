BeastmodePackage = require '../lib/main'

describe "BeastmodePackage", ->
  it "creates a Beastmode on activation", ->
    expect(BeastmodePackage.beastmode).toBeFalsy()
    BeastmodePackage.activate()
    expect(BeastmodePackage.beastmode).toBeTruthy()

  it "destroys the Beastmode on deactivation", ->
    BeastmodePackage.activate()
    expect(BeastmodePackage.beastmode).toBeTruthy()
    BeastmodePackage.deactivate()
    expect(BeastmodePackage.beastmode).toBeFalsy()
