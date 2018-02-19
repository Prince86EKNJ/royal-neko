atom.commands.add 'atom-text-editor', 'markdown:paste-as-link', ->
  return unless editor = atom.workspace.getActiveTextEditor()

  selection = editor.getLastSelection()
  clipboardText = atom.clipboard.read()

  selection.insertText("[#{selection.getText()}](#{clipboardText})")

atom.commands.add 'atom-text-editor', 'neko:auto-indent-all', (e) ->
  saveSelection()
  atom.commands.dispatch(e.target, 'core:select-all')
  atom.commands.dispatch(e.target, 'editor:auto-indent')
  loadSelection()

cursor = null
selection = null

saveSelection = ->
    cursor = atom.workspace.getActiveTextEditor().getCursorBufferPosition()
    selection = atom.workspace.getActiveTextEditor().getSelectedBufferRanges()

loadSelection = ->
    atom.workspace.getActiveTextEditor().setCursorBufferPosition(cursor)
    atom.workspace.getActiveTextEditor().setSelectedBufferRanges(selection)

atom.commands.add 'atom-text-editor', 'neko:test', (e) ->
  saveSelection()

atom.commands.add 'atom-text-editor', 'neko:test2', (e) ->
  loadSelection()
