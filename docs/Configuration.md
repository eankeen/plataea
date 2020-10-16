# Configuration

Plataea reads from a `plataea.toml` by defualt, or one specified as the first argument to the executable

The format looks like this. Currently, nothing happens with the 'tags' property.

```toml
[[sources]]
tags = ["terminator"]

prefix = "https://raw.githubusercontent.com/arcticicestudio/nord-terminator/develop/src/"
files = ["config"]
postfix = ""

destPrefix = "config/terminator/themes"
destPostfix = ".theme.conf"

[[sources]]
tags = ["terminator"]
file = "https://raw.githubusercontent.com/arcticicestudio/nord-terminator/develop/src/config"
destFile = "config/terminator/themes/config"
```
