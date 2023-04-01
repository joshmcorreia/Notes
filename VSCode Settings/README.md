# Ultimate-VSCode-Settings
<kbd>CTRL</kbd>+<kbd>SHIFT</kbd>+<kbd>P</kbd> and click `Open Settings (JSON)`

`settings.json`:
```
{
    "editor.renderWhitespace": "all",
    "editor.dragAndDrop": false, // disable the dumb mouse drag and drop feature
    "editor.fontSize": 12,
    "python.analysis.autoImportCompletions": false,
    "diffEditor.ignoreTrimWhitespace": false,
    "search.useIgnoreFiles": false,
    "terminal.integrated.scrollback": 10000,
    "git.openDiffOnClick": false,
    "git.showInlineOpenFileAction": true,
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
    },
    "gitlens.codeLens.enabled": false,
    "gitlens.statusBar.enabled": false,
    "gitlens.hovers.enabled": false,
    "editor.minimap.enabled": false
}
```

---
<kbd>CTRL</kbd>+<kbd>SHIFT</kbd>+<kbd>P</kbd> and click `Preferences: Open Keyboard Shortcuts (JSON)`

`keybindings.json`:
```
// Place your key bindings in this file to override the defaults
[
    {
        "key": "shift+enter",
        "command": "-python.execSelectionInTerminal",
        "when": "editorTextFocus && !findInputFocussed && !jupyter.ownsSelection && !notebookEditorFocused && !replaceInputFocussed && editorLangId == 'python'"
    }
]
```

---

## Extensions:
- Highlight Bad Chars
- Remote - SSH
- Remote - SSH: Editing Configuration Files
- Python
- Pylance
- Jupyter
- GitLens
- Better Comments

---

## Use Remote SSH with a private key instead of a password:

### Windows 10:
To use Remote SSH with a private key all you have to do is make sure that there is a private key in the same directory as the SSH config that VSCode checks

You can check which SSH config VSCode is using by doing the following:
1. Open a new VSCode window
2. Press <kbd>F1</kbd> and type in "open ssh conf" then select "Remote-SSH: Open SSH Configuration File..."
3. Look at the SSH configs listed in the dropdown
    Example: `C:\Users\joshm\.ssh\config`
    For this example I would need to put a private key inside of `C:\Users\joshm\.ssh`
