discard """
action: "run"
"""

import "../src/plataea"


let table = parsetoml.parseString("""
input = "foo"
"""

doAssert ensureGet(table, "input") == "foo"
