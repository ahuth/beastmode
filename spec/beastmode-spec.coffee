Beastmode = require '../lib/beastmode'

describe "Beastmode", ->
  beastmode = null
  workspaceElement = null
  activationPromise = null

  beforeEach ->
    beastmode = new Beastmode(atom.workspace)
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('beastmode')

  it "toggles the modal panel", ->
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

  it "clears the modal panel", ->
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
      atom.commands.dispatch workspaceElement, 'beastmode:clear'
      expect(beastmodePanel.isVisible()).toBe false
