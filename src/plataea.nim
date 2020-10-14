import os
import httpclient
import parsetoml
import strformat


let toml = parsetoml.parseFile("plataea.toml")
let client = newHttpClient()

let root = toml["root"].getStr()
for _, endpoint in toml["urls"].getElems():
    for _, file in endpoint["files"].getElems():
        var pre = endpoint["pre"]
        var post = endpoint["post"]
        var url = &"{pre}{file}{post}"
        # echo client.getContent(url)

        var dest = endpoint["dest"].getStr()
        const dirname = parentDir(currentSourcePath())
        var destFile = joinPath(dirname, root, dest, &"{file}{post}")
        echo destFile
