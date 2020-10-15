import os
import system
import httpclient
import parsetoml
import strformat

var toml: TomlValueRef = nil
try:
    toml = parsetoml.parseFile("plataea.toml")
except IOError as err:
    echo "Could not open file plataea.toml. Exiting"
    quit(1)

let client = newHttpClient()

let root = toml["root"].getStr()
for _, endpoint in toml["urls"].getElems():
    for _, file in endpoint["files"].getElems():
        var pre = endpoint["pre"]
        var post = endpoint["post"]
        var url = &"{pre}{file}{post}"
        let content = client.getContent(url)

        var dest = endpoint["dest"].getStr()
        var destPost = endpoint["destPost"].getStr()

        let destFile = joinPath(getCurrentDir(), root, dest, &"{file}{destPost}")
        # try:
        writeFile(destFile, content)
        # except IOError as err:
        #     echo "Could not wrie the file. Aborting"
        #     echo err
        #     quit(1)
        echo destFile
