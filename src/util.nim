import os
import system
import httpclient
import parsetoml
import strformat

# ensure ensures a specific property is in a table
# note that this only works for string type properties
proc ensureGet(table: TomlValueRef, property: string): string =
    if not (property in table):
        echo &"Must specify '{property}'. Exiting"
        quit(1)
    return table[property].getStr()

# assumes source["file"] exists
proc fetchSingleFile*(source: TomlValueRef, root: string) =
    let
        client = newHttpClient()
        destFile = joinPath(getCurrentDir(), root, ensureGet(source, "destFile"))
        content = client.getContent(source["file"].getStr())

    echo "writing to: '", destFile, "'"
    createDir(parentDir(destFile))
    writeFile(destFile, content)

# assumes source["files"] exists
proc fetchMultipleFiles*(source: TomlValueRef, root: string) =
    let
        client = newHttpClient()
        prefix = ensureGet(source, "prefix")
        postfix = ensureGet(source, "postfix")
        destPrefix = ensureGet(source, "destPrefix")
        destPostFix = ensureGet(source, "destPostfix")

    for _, file in source["files"].getElems():
        let
            url = &"{prefix}{file}{postfix}"
            destFile = joinPath(getCurrentDir(), root, destPrefix, file.getStr() , destPostfix)
            content = client.getContent(url)

        echo "writing to: '", destFile, "'"
        createDir(parentDir(destFile))
        writeFile(destFile, content)

proc getFilename(): string =
    if paramCount() == 0:
        return "plataea.toml"

    let fileName = paramStr(1)
    if fileName == "":
        return "plataea.toml"

    return fileName

proc getToml*(): TomlValueRef =
    let tomlFile = getFilename()
    var toml: TomlValueRef = nil

    try:
        toml = parsetoml.parseFile(tomlFile)
    except IOError as err:
        echo &"Could not open file {tomlFile}. Exiting"
        quit(1)

    return toml
