+++
date = '2025-07-12T12:47:16+08:00'
title = 'cmake设置'
+++

### 链接静态文件
```shell
target_link_libraries(${SHARED_LIB} PRIVATE
        spdlog::spdlog
)
```

### 设置输出目录
```shell
set(OUTPUT_RELEASE_DIR "${OUTPUT_DIR_NAME}/release/x86")
set(OUTPUT_DEBUG_DIR "${OUTPUT_DIR_NAME}/debug/x86")
if (CMAKE_CL_64)
    set(OUTPUT_RELEASE_DIR "${OUTPUT_DIR_NAME}/release/x64")
    set(OUTPUT_DEBUG_DIR "${OUTPUT_DIR_NAME}/debug/x64")
endif ()

set_target_properties(${SHARED_LIB}
        PROPERTIES
        # 静态文件
        ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${OUTPUT_RELEASE_DIR}"
        ARCHIVE_OUTPUT_DIRECTORY_DEBUG "${OUTPUT_DEBUG_DIR}"
        # 动态文件
        RUNTIME_OUTPUT_DIRECTORY_RELEASE ${OUTPUT_RELEASE_DIR}
        RUNTIME_OUTPUT_DIRECTORY_DEBUG ${OUTPUT_DEBUG_DIR}
)
```

### CMake设置MSVC工程MT/MTd/MD/MDd
```shell
cmake_minimum_required(VERSION 3.27)
 
# 设置策略CMP0091为NEW，新策略
if (POLICY CMP0091)
    cmake_policy(SET CMP0091 NEW)
endif (POLICY CMP0091)
 
project(Test)
 
# cxx标准
set(CMAKE_CXX_STANDARD 17)
 
add_executable(
        ${PROJECT_NAME}
        main.cpp
)

# 设置MT/MTd
set_property(TARGET ${PROJECT_NAME} PROPERTY
        MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
        
# 链接到user32库
#target_link_libraries(${PROJECT_NAME} user32)

```

### cmake add_subdirectory匹配多个目录
```shell
# 将当前所有目录放入V_GLOB
file(GLOB V_GLOB LIST_DIRECTORIES true "*") 

# 遍历目录
foreach (item ${V_GLOB})
    if (IS_DIRECTORY ${item})
        # 如果是目录
        add_subdirectory(${item})
    endif ()
endforeach ()
```

## GLOB/GLOB-RECURSE使用
```shell
# 1.GLOB 帮助开发收集要编译的源文件，就是模糊匹配到文件后，把所有文件放到一个变量里面

cmake_minimum_required(VERSION 3.10)
project(MyProject)

# 设置变量包含所有源文件
file(GLOB MY_PROJECT_SOURCES "src/*.cpp")

# 将源文件编译成可执行文件
add_executable(${PROJECT_NAME} ${SOURCE_SRC})
这样所有的src下面的cpp文件都放进了 MY_PROJECT_SOURCES 这个变量中，后面可以直接使用这个编译进行可执行文件的编译

# 2.GLOB_RECURSE

# GLOB会递归的寻找文件夹下面的文件，GLOB_RECURSE就不会就这点区别
```
