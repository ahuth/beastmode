BeastmodePackage = require '../lib/main'

describe "BeastmodePackage", ->
  it "creates a Beastmode on activation", ->
    expect(BeastmodePackage.beastmode).toBeNull()
    BeastmodePackage.activate()
    expect(BeastmodePackage.beastmode).not.toBeNull()

  it "destroys the Beastmode on deactivation", ->
    BeastmodePackage.activate()
    expect(BeastmodePackage.beastmode).not.toBeNull()
    BeastmodePackage.deactivate()
    expect(BeastmodePackage.beastmode).toBeNull()
