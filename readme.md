# Python-VSCode Template Project "2020"

## What's This?

I recently went to start a new python project and discovered that my template from 1-2 years ago was already outdated; seems like you need to create a fresh template project every ~12 months. So this is my 2020 version.

## Goals

- Autoformatting in VSCode
- Autoformatting in on git commit with same formatting rules
- Types enforced
- Intellisense
- Keep extensions, packages, config files, etc. to a minimum!

## Steps Taken

- `source _init_setup.sh`. This created and activated the venv
- Install the main MS-supported python extension `ms-python.python`
- Add `"python.pythonPath": ".venv/bin/python"` to `.vscode/settings.json`
- `pip install mypy`. This does not enable type warnings/errors in vscode, but does let you run `mypy src/main.py` and get warnings/errors printed to terminal.
- Add ` "python.linting.mypyEnabled": true` to `.vscode/settings.json`; now we get type warnings/erros in vscode!
- Intellisense is now working; at first I was inundated with snippet suggestions, but then I disabled the extension `frhtylcn.pythonsnippets`, and now I can see the intellisense suggestions no problem. Note: I could also add `"editor.snippetSuggestions": "none"` to `settings.json`, but then that undermines the whole point of that extension; hurray for one less extension!
- To get the pesky pylint name-spelling rules, etc., you need to install `pip install pylint` and add `"python.linting.pylintEnabled": true` to your `settings.json` file.

## Conclusion

Things have improved a lot in VSCode! It feels a lot more 'out of the box' to get all the code-tools up and running.
