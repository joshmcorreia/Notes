# Ultimate-VSCode-Settings

`settings.json`:
```
{
    "editor.renderWhitespace": "all",
    "editor.dragAndDrop": false, # disable the dumb mouse drag and drop feature
    "editor.fontFamily": "Consolas",
    "editor.fontSize": 14,
    "diffEditor.ignoreTrimWhitespace": false,
    "search.useIgnoreFiles": false,
    "terminal.integrated.scrollback": 10000,
    "terminal.integrated.fontFamily": "Consolas",
    "terminal.integrated.fontSize": 14,
    "workbench.colorCustomizations" : {
        "terminal.foreground" : "#000000",
        "terminal.background" : "#ffffff",
        "terminal.selectionBackground": "#000000",
        "editorBracketMatch.background": "#ff000088",
        "editorBracketMatch.border": "#ff000088"
    },
    "[python]": {
        "editor.tabSize": 4,
        "editor.insertSpaces": false,
        "editor.detectIndentation":false
    }
}
```

`keybindings.json`:
```
// Place your key bindings in this file to override the defaultsauto[]
[
    {
        "key": "shift+enter",
        "command": "-python.execSelectionInTerminal",
        "when": "editorTextFocus && !findInputFocussed && !jupyter.ownsSelection && !notebookEditorFocused && !replaceInputFocussed && editorLangId == 'python'"
    }
]
```

---

# Extensions:
- Highlight Bad Chars
- Remote - SSH
- Remote - SSH: Editing Configuration Files
- Python
- Pylance
- Jupyter
- GitLens
- Better Comments
