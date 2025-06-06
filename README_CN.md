# X Version Manager

我们经常因为各种各样的原因，在同一台电脑上安装、使用同一个工具的不同版本，比如 **node**，**golang**，**python** 等。版本管理就变的十分重要。

我们会使用 **nvm** 来管理 node

我们会使用 **gvm** 来管理 golang

我们会使用 **pyenv** 或者 **Conda** 来管理 python

这些工具都十分强大，但使用方式却各不相同，一段时间不使用，就不得不重新熟悉每个工具的使用方式

**xvm** 是一款小巧的，融合了 **node**， **golang**， **python** 等的版本管理工具，虽然没有专门的工具那么强大，但小巧且命令统一

## 安装方式

```
curl -o- https://raw.githubusercontent.com/duan0120/xvm/main/install.sh | bash
```

或者

```
git clone https://github.com/duan0120/xvm.git ~/.xvm
```

将下面代码放到 **~/.bashrc**， **~/.zshrc** 中，并重新 source

```
export XVM_ROOT=~/.xvm
[ -s "$XVM_ROOT/xvm" ] && source "$XVM_ROOT/xvm"
```

## 使用方式

查看版本

```
xvm -v
```

获取帮助

```
xvm -h
xvm help node
```

### node

查看版本

```
xvm node ls-remote
xvm node ls-remote --lts
xvm node list
```

安装指定版本

```
xvm node install v18.19.1
xvm node install v18.19.1 --default
```

卸载指定版本

```
xvm node uninstall v18.19.1
```

切换版本

```
xvm node use v18.19.1
xvm node use v18.19.1 --default
```

查看默认版本

```
xvm node default
```

### golang

查看版本

```
xvm go ls-remote
xvm go list
```

安装指定版本

```
xvm go install go1.19.2
xvm go install go1.19.2 --default
# 指定架构，amd64/386/arm64, 默认为amd64
xvm go install go1.13.10 --default --arch=amd64
```

如果需要指定下载地址，可以在 **~/.xvm/scripts/go-scripts/proxy** 文件中指定，如 https://golang.google.cn

卸载指定版本

```
xvm go uninstall go1.19.2
```

切换版本

```
xvm go use go1.19.2
xvm go use go1.19.2 --default
```

查看默认版本

```
xvm go default
```

### python

安装依赖
源码编译安装，需要安装依赖，请参考 [https://devguide.python.org/getting-started/setup-building/]()

查看版本

```
xvm python ls-remote
xvm python list
```

安装指定版本

```
xvm python install 3.12.0
xvm python install 3.12.0 --default
```

卸载指定版本

```
xvm python uninstall 3.12.0
xvm python uninstall venv
```

切换版本

```
xvm python use 3.12.0
xvm python use 3.12.0 --default
```

查看默认版本

```
xvm python default
```

创建虚拟环境

```
xvm python alias 3.12.0 venv
```

激活虚拟环境

```
xvm python activate venv
```

撤销虚拟环境

```
xvm python deactivate
```
