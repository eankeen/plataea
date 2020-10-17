# Plataea

Plataea is a simple program that automatically updates files based on user-defined URLs

## Installation

```sh
git clone git@github.com:eankeen/plataea
cd plataea
nimble install
```

## Usage

Plataea reads from a `plataea.toml` by defualt, or one specified as the first argument to the executable

The format looks like this. Currently, nothing happens with the 'tags' property. The first soruce is a single url. You can also download multiple files with the method below

```toml
# plataea.toml

root = "."

[[sources]]
file = "https://raw.githubusercontent.com/eankeen/eankeen/main/readme.md"
destFile = "one"

[[sources]]
tags = ["deno-babel"]
prefix = "https://raw.githubusercontent.com/eankeen/deno-babel/dev/"
files = [".gitattributes", ".gitignore", ".gitmodules"]
postfix = ""
destPrefix = "more"
destPostfix = ""
```

Then, execute
```sh
plataea plataea.toml
```

## Contributing

```sh
git clone git@github.com:eankeen/plataea
cd plataea
nimble install
```
