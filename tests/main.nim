discard """
action: "run"
"""

import "../src/plataea.nim"

assert 42 == 42

doAssert hello(1) == 5

block:
  doAssert hello(3) == 7
