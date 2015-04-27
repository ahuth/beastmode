BeastmodePackage = require '../lib/main'

describe "BeastmodePackage", ->
  describe "activation", ->
    it "creates a Beastmode on activation", ->
      expect(BeastmodePackage.beastmode).toBeFalsy()
      BeastmodePackage.activate()
      expect(BeastmodePackage.beastmode).toBeTruthy()

    it "destroys the Beastmode on deactivation", ->
      BeastmodePackage.activate()
      expect(BeastmodePackage.beastmode).toBeTruthy()
      BeastmodePackage.deactivate()
      expect(BeastmodePackage.beastmode).toBeFalsy()

  describe "commands", ->
    workspaceElement = null
    activationPromise = null

    beforeEach ->
      workspaceElement = atom.views.getView(atom.workspace)
      activationPromise = atom.packages.activatePackage('beastmode')

      waitsForPromise ->
        atom.workspace.open("sample.coffee")

    describe "beastmode:toggle", ->
      it "applies and removes the 'beastmode' class on the editor", ->
        expect(workspaceElement.querySelector('.beastmode')).not.toExist()
        atom.commands.dispatch workspaceElement, 'beastmode:toggle'

        waitsForPromise ->
          activationPromise

        runs ->
          expect(workspaceElement.querySelector('.beastmode')).toExist()
          atom.commands.dispatch workspaceElement, 'beastmode:toggle'
          expect(workspaceElement.querySelector('.beastmode')).not.toExist()

    describe "beastmode:clear", ->
      it "removes the 'beastmode' class from the editor", ->
        atom.commands.dispatch workspaceElement, 'beastmode:toggle'

        waitsForPromise ->
          activationPromise

        runs ->
          expect(workspaceElement.querySelector('.beastmode')).toExist()
          atom.commands.dispatch workspaceElement, 'beastmode:clear'
          expect(workspaceElement.querySelector('.beastmode')).not.toExist()
