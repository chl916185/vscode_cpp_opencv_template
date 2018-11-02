# makefile
# 描述： C++ 项目 makefile文件
# 版本： v3.1
# 修改记录:  1.先测试普通的cpp文件的编译运行
#		    2.使用变量来改进我们的makefile文件
#			3.新加了一个源文件
#			4.使用伪目标，加上clean规则
#			5.使用wildcard函数，自动扫描当前目录下的源文件
#			6.加入了自动规则依赖
#			7.改变依赖关系的生成模式
#			8.提供多目录文件编译
#			9.添加了-g 参数
#			10.将clean规则下的清除所有编译生成文件的规则取消
#			11.将clean规则注释掉
#			12.更改以支持第三方库
#			13.更改了clean规则，采用了嵌套执行nakefile文件的方式
#			14.采用了条件判断，用于区分windows平台与Linux平台下的第三方链接库的差异

# 定义的项目平台变量，用于选择项目使用的平台
WIN := win 
LINUX	:= Linux
# 选择项目的平台
PLATFORM	:=	${LINUX}

# 头文件存放目录
INC_DIR=./Headers

# 可执行文件存放目录
BIN_DIR=./Output/bin

# 源文件存放目录
SRC_DIR=./Sources

# 其它中间文件存放目录
OBJ_DIR=./Output

# 源文件列表
SRC	:= ${wildcard ${SRC_DIR}/*.cpp}

# obj文件列表
OBJ	:= ${patsubst %.cpp, $(OBJ_DIR)/%.o, ${notdir ${SRC}}}

# 定义编译命令变量
CC	:= g++

# 定义清除命令变量
# windows平台
RM_WIN	:= del
# Linux平台
RM_LINUX	:=	rm -rf
# 根据平台选择
ifeq ($(PLATFORM), $(WIN))
RM	:= ${RM_WIN}
else
RM	:= ${RM_LINUX}
endif
export RM

# windows下，需要调用的链接库
WIN_LIBS    :=  #-l

# windows下，头文件路径
WIN_INCLUDE :=  #-I

# windows下，链接库路径
WIN_LDFLAGS :=  #-L

# linux下，需要调用的链接库
LINUX_LIBS    :=  #-l

# linux下，头文件路径
LINUX_INCLUDE :=  #-I

# linux下，链接库路径
LINUX_LDFLAGS :=  #-L

# 根据平台选择
ifeq ($(PLATFORM), $(WIN))
LIBS	:= ${WIN_LIBS}
INCLUDE	:= ${WIN_INCLUDE}
LDFLAGS	:= ${WIN_LDFLAGS}
else
LIBS	:= ${LINUX_LIBS}
INCLUDE	:= ${LINUX_INCLUDE}
LDFLAGS	:= ${LINUX_LDFLAGS}
endif

# 定义可执行文件变量
executable	:= main
BIN_TARGET=${BIN_DIR}/${executable}

# 终极目标规则：生成可执行文件
${BIN_TARGET}:${OBJ}
	${CC} ${OBJ} -o $@ -g $(LDFLAGS) $(LIBS)

# 子目标规则：生成链接文件
${OBJ_DIR}/%.o:${SRC_DIR}/%.cpp
	${CC} -o $@ -c $< -I${INC_DIR} -g ${INCLUDE}

#clean规则
.PHONY: clean
clean:
#清除编译生成的所有文件,不包括可执行文件
	cd Output && ${MAKE}