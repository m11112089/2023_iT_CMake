cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_totorial VERSION 1.0.0 LANGUAGES CXX)
# 設定專案名稱為cmake_totorial，版本為1.0.0，且此項目使用C++

find_package(MathFunctions REQUIRED)
# 尋找MathFunctionsConfig.cmake

add_executable(main src/main.cpp)
# 將main.cpp編譯成可執行文件main
target_link_libraries(main PUBLIC mysqrt)
# 將mysqrt連結到執行檔main

configure_file(version.h.in version.h)
# 將version.h.in輸出成version.h
target_include_directories(main PUBLIC "${PROJECT_BINARY_DIR}")
# 將PROJECT_BINARY_DIR加入main的include路徑，使main可以include到 build/version.h