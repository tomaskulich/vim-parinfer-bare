## vim-parinfer-bare

This is a lightweight version of [vim-parinfer](https://github.com/oakmac/parinfer-viml). For me this is
just a temporary solution until the before the various aspects of the before mentioned plugin is
fixed.

## Installation

### using Vundle:

add

```
Plugin 'tomaskulich/vim-parinfer-bare'
```

to your `.vimrc`

run

```
:PluginInstall
```


## Mappings

- F7 - run parinfer in 'indent' mode, i.e. infer parenthesis from indentation
- F8 - run parinfer in 'paren' mode, i.e. infer indentations from parenthesis
