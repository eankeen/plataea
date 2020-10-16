import system
import parsetoml
# import posix

import util

# umask(0o022)

let toml = getToml()
var root: string = ""
if "root" in toml:
    root = toml["root"].getStr()
else:
    root = "."
if not ("sources" in toml):
    echo "Must have at least one [[sources]] entry in toml file. Exiting"
    quit(1)

for _, source in toml["sources"].getElems():
    if "file" in source:
        fetchSingleFile(source, root)
    elif "files" in source:
        fetchMultipleFiles(source, root)
    else:
        echo "A [[sources]] entry in your config doesn't have either a 'file' or 'files' property. It's being skipped"
