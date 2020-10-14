# Package
version       = "0.1.0"
author        = "Edwin Kofler"
description   = "Plataea"
license       = "GPL-2.0"
srcDir        = "src"
bin           = @["plataea"]

# Dependencies
requires "nim >= 1.2.6"

task tests, "Run all tests":
  exec "testament all"