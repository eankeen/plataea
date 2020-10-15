# Package
version       = "0.1.0"
author        = "Edwin Kofler"
description   = "Plataea"
license       = "GPL-2.0"
srcDir        = "src"
bin           = @["plataea"]

# Dependencies
requires "nim >= 1.2.6"
requires "parsetoml >= 0.5.0"

task tests, "Run all tests":
  exec "testament all"

task test, "Run the Nimble tester!":
  withDir "tests":
    exec "nim c -r tester"
