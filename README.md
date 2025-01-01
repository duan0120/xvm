# X Version Manager

We often need to install and use different versions of the same tool on the same computer for various reasons, such as **node**, **golang**, **python**, etc. Version management becomes very important.

We use **nvm** to manage node

We use **gvm** to manage golang

We use **pyenv** or **Conda** to manage python

These tools are all very powerful, but their usage methods differ from each other. After not using them for a while, we have to refamiliarize ourselves with how to use each tool.

**xvm** is a lightweight version managers tool that integrates version management for **node**, **golang**, **python**, etc. Although it may not be as powerful as specialized tools, it is compact and has unified commands.

## Installation

```
git clone https://github.com/duan0120/xvm.git ~/.xvm
```

Add the following code to **~/.bashrc** or **~/.zshrc**, and source it again:

```
export XVM_ROOT=~/.xvm
[ -s "$XVM_ROOT/xvm" ] && source "$XVM_ROOT/xvm"
```

## Usage

Check version

```
xvm -v
```

Get help

```
xvm -h
xvm help node
```

### node

List available versions

```
xvm node ls-remote
xvm node ls-remote --lts
xvm node list
```

Install specific version

```
xvm node install v18.19.1
xvm node install v18.19.1 --default
```

Uninstall specific version

```
xvm node uninstall v18.19.1
```

Switch version

```
xvm node use v18.19.1
xvm node use v18.19.1 --default
```

Check default version

```
xvm node default
```

### golang

List available versions

```
xvm go ls-remote
xvm go list
```

Install specific version

```
xvm go install go1.19.2
xvm go install go1.19.2 --default
xvm go install go1.13.10 --default --arch=amd64
```

Uninstall specific version

```
xvm go uninstall go1.19.2
```

Switch version

```
xvm go use go1.19.2
xvm go use go1.19.2 --default
```

Check default version

```
xvm go default
```
