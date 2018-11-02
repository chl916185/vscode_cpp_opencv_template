# 项目模板

> 这是一个基于VSCode编辑器的跨平台（Windows, Linux）的C++项目模板。

## 项目结构

```shell
.
├── Headers
├── makefile
├── Output
│   ├── bin
│   │   ├── main
│   │   └── makefile
│   ├── main.o
│   └── makefile
├── README.md
└── Sources
    └── main.cpp
```

`.vscode`: 存放项目的配置文件;

`Headers`: 存放头文件

`Sources`: 存放源文件

`Output`: 存放中间文件以及可执行文件

`bin`: 存放可执行文件

## VSCode中使用的插件

+ C/C++
+ C++ Intenllisense
+ Code Runner
+ GitLens
+ Markdown All in One

## 环境配置

### Windows环境配置

+ MingW:
  默认安装在C盘;
  如果安装在其他盘，请注意修改配置文件的相关内容（`c_cpp_properties.json`文件中的`compilerPath`,`launch,json`文件中的`miDebuggerPath`）;
  安装并下载好组件（`mingw32-base`,`mingw32-gcc-g++`）后，请注意添加系统环境变量;
  注意将`C:/MinGW/bin`目录下的`mingw32-make.exe`复制并重命名为`make.exe`，这是因为linux平台使用的是`make`命令去执行makefile文件的，为了通用性，所以就在windows平台上做一些改变;

### Linux 环境配置

```shell
sudo apt-get install build-essential
sudo apt-get install gcc g++ git cmake
```

## 使用时注意

+ 注意在顶层makefile文件中选择当前项目所在平台;

```shell
# linux平台
PLATFORM:=${LINUX}
# Windows平台
PLATFORM:=${WIN}
```
