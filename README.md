# My personal nvim configuration

大部分配置都来源于 nvimdots，裁剪了自己不需要的插件、快捷键，增加了自己习惯的键位。

## 各种插件的使用方法

### conform

在 conform.lua 的配置中，因为默认开启了prefer lsp，所以可能有些lsp没有format能力却进入了only lsp 逻辑，所以可能需要明确给filetype配置formatters。

