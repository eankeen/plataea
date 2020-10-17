# Package
version       = "0.2.0"
author        = "Edwin Kofler"
description   = "Plataea"
license       = "GPL-2.0"
srcDir        = "src"
bin           = @["plataea"]

# Dependencies
requires "nim >= 1.2.6"
requires "parsetoml >= 0.5.0"

task tests, "Run Tests":
  exec "testament r util.nim"
