Beastmode = require '../lib/beastmode'

describe "Beastmode", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('beastmode')

  describe "when the beastmode:toggle event is triggered", ->
    it "hides and shows the modal panel", ->
      expect(workspaceElement.querySelector('.beastmode')).not.toExist()
      atom.commands.dispatch workspaceElement, 'beastmode:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(workspaceElement.querySelector('.beastmode')).toExist()

        beastmodeElement = workspaceElement.querySelector('.beastmode')
        expect(beastmodeElement).toExist()

        beastmodePanel = atom.workspace.panelForItem(beastmodeElement)
        expect(beastmodePanel.isVisible()).toBe true
        atom.commands.dispatch workspaceElement, 'beastmode:toggle'
        expect(beastmodePanel.isVisible()).toBe false

    it "hides and shows the view", ->
      jasmine.attachToDOM(workspaceElement)

      expect(workspaceElement.querySelector('.beastmode')).not.toExist()
      atom.commands.dispatch workspaceElement, 'beastmode:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        beastmodeElement = workspaceElement.querySelector('.beastmode')
        expect(beastmodeElement).toBeVisible()
        atom.commands.dispatch workspaceElement, 'beastmode:toggle'
        expect(beastmodeElement).not.toBeVisible()
