### 主文件
```shell
cmake_minimum_required(VERSION 3.29)
project(account VERSION 1.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "/utf-8 ${CMAKE_CXX_FLAGS}")

if (POLICY CMP0091)
    cmake_policy(SET CMP0091 NEW)
endif (POLICY CMP0091)

find_package(jsoncpp CONFIG REQUIRED)
find_package(fmt CONFIG REQUIRED)
find_package(spdlog REQUIRED)

set(ACCOUNT_INCLUDE_DIR include)
include_directories(${ACCOUNT_INCLUDE_DIR})

#string(TIMESTAMP COMPILE_TIME %Y%m%d%H%M%S)
#set(BUILD_TIME ${COMPILE_TIME})

configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/src/lim-version/version.h.in
        ${CMAKE_CURRENT_SOURCE_DIR}/src/lim-version/version.h
)

add_subdirectory(src)
add_subdirectory(include)
```

### 二级目录cpp CMakefile文件
就是主文件包含的src
```shell
file(GLOB V_GLOB LIST_DIRECTORIES true "*")
foreach (item ${V_GLOB})
    if (IS_DIRECTORY ${item})
        add_subdirectory(${item})
    endif ()
endforeach ()
```

### 目标文件 CMakefile
```shell
# 包含需要的目录下的所有cpp
file(GLOB SOURCE_SRC *.cpp ../lim/*.cpp)

set(PROJECT_NAME targetName) # 目录文件名
set(PROJECT_DEPENDENCIES lim-resource-cli) # 依赖工程
set(SHARED_LIB ${PROJECT_NAME}_lib) # 静态库名
set(OUTPUT_DIR_NAME "${CMAKE_BINARY_DIR}/../bin") # 生成文件存放的目录

# log config
add_compile_definitions(DSPDLOG_DEFAULT_NAME="lim") # 编译宏, 有这个设置,在代码里可以直接使用这个宏
add_compile_definitions(DSPDLOG_DEFAULT_PATH="log/lim-resource.log") # 编译宏

add_library(${SHARED_LIB} SHARED ${SOURCE_SRC}) # 生成共享动态库
set_target_properties(${SHARED_LIB} PROPERTIES # 将动态库改名,避免名称冲突
        OUTPUT_NAME ${PROJECT_NAME}
)

add_executable(${PROJECT_NAME} ${SOURCE_SRC} ../lim-version/version.rc) # 生成目标文件
add_dependencies(${PROJECT_NAME} ${PROJECT_DEPENDENCIES}) # 为目标文件添加依赖,生成目标文件前会先编译依赖工程
add_dependencies(${PROJECT_NAME} lim-change-display) # 为目标文件添加依赖,生成目标文件前会先编译依赖工程

if (MSVC)
    # 如果是MSVC编译,设置为MT/MTD编译
    set_property(TARGET ${PROJECT_NAME} PROPERTY
            MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
    set_property(TARGET ${SHARED_LIB} PROPERTY
            MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
endif ()

# 设置输出目录开始
set(OUTPUT_RELEASE_DIR "${OUTPUT_DIR_NAME}/release/x86")
set(OUTPUT_DEBUG_DIR "${OUTPUT_DIR_NAME}/debug/x86")
if (CMAKE_CL_64)
    set(OUTPUT_RELEASE_DIR "${OUTPUT_DIR_NAME}/release/x64")
    set(OUTPUT_DEBUG_DIR "${OUTPUT_DIR_NAME}/debug/x64")
endif ()

set_target_properties(${PROJECT_NAME}
        PROPERTIES
        # 可执行文件
        RUNTIME_OUTPUT_DIRECTORY_RELEASE ${OUTPUT_RELEASE_DIR}
        RUNTIME_OUTPUT_DIRECTORY_DEBUG ${OUTPUT_DEBUG_DIR}
)

set_target_properties(${SHARED_LIB}
        PROPERTIES
        # 静态文件
        ARCHIVE_OUTPUT_DIRECTORY_RELEASE "${OUTPUT_RELEASE_DIR}"
        ARCHIVE_OUTPUT_DIRECTORY_DEBUG "${OUTPUT_DEBUG_DIR}"
        # 动态文件
        RUNTIME_OUTPUT_DIRECTORY_RELEASE ${OUTPUT_RELEASE_DIR}
        RUNTIME_OUTPUT_DIRECTORY_DEBUG ${OUTPUT_DEBUG_DIR}
)
# 设置输出目录结束

# 设置静态库链接开始
target_link_libraries(${PROJECT_NAME} PRIVATE
        JsonCpp::JsonCpp
        fmt::fmt
        spdlog::spdlog
)
target_link_libraries(${SHARED_LIB} PRIVATE
        JsonCpp::JsonCpp
        fmt::fmt
        spdlog::spdlog
)
# 设置静态库链接结束

#vcpkg install fmt:x64-windows-static
#vcpkg install spdlog:x64-windows-static
#vcpkg install jsoncpp:x64-windows-static
#find_package(fmt CONFIG REQUIRED)
#target_link_libraries(${PROJECT_NAME} PRIVATE JsonCpp::JsonCpp fmt::fmt)

```
