MyMinimapPlugin = require '../lib/my-minimap-plugin'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "MyMinimapPlugin", ->
  [workspaceElement, editor] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    jasmine.attachToDOM(workspaceElement)

    waitsForPromise ->
      atom.workspace.open('sample.js')

    runs ->
      editor = atom.workspace.getActiveTextEditor()
      editor.setText("This is the file content")

    waitsForPromise ->
      atom.packages.activatePackage('minimap')

    waitsForPromise ->
      atom.packages.activatePackage('my-minimap-plugin')

  describe "with an open editor that have a minimap", ->
    it "lives", ->
      expect('life').toBe('easy')
