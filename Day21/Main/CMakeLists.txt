cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_tutorial VERSION 1.0.0 LANGUAGES CXX)
# 設定專案名稱為cmake_totorial，版本為1.0.0，且此項目使用C++

find_package(nlohmann_json REQUIRED)
# 尋找 nlohmann_json 這個第三方庫，REQUIRED 代表如果沒找到就會報錯

message(STATUS "OpenCV library status:")
message(STATUS "version: ${nlohmann_json_VERSION}")
message(STATUS "libraries: ${nlohmann_json_LIBS}")
message(STATUS "include path: ${nlohmann_json_INCLUDE_DIRS}")

add_executable(main src/main.cpp)
# 將 main.cpp 編譯成可執行文件 main

configure_file(version.h.in version.h)
# 將version.h.in輸出成version.h
target_include_directories(main PUBLIC "${PROJECT_BINARY_DIR}")
# 將PROJECT_BINARY_DIR加入main的include路徑，使main可以include到 build/version.h
