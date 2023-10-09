cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_totorial VERSION 1.2.0 LANGUAGES CXX)
# 設定專案名稱為cmake_totorial，版本為1.0.0，且此項目使用C++

find_package(MathFunctions 1.0.0 REQUIRED)
# 尋找版本為 1.0.0 的 MathFunctionsConfig.cmake，REQUIRED 將其設定為必要項目，若找不到則會報錯

message(STATUS "MathFunctions_FOUND: ${MathFunctions_FOUND}")
message(STATUS "MathFunctions_INCLUDE_DIRS: ${MathFunctions_INCLUDE_DIRS}")
message(STATUS "MathFunctions_LIBRARY_DIRS: ${MathFunctions_LIBRARY_DIRS}")
message(STATUS "MathFunctions_LIBS: ${MathFunctions_LIBS}")
message(STATUS "MathFunctions_VERSION: ${MathFunctions_VERSION}")
# 顯示MathFunctions提供的資訊

include_directories(${MathFunctions_INCLUDE_DIRS})
add_executable(main src/main.cpp)
# 將main.cpp編譯成可執行文件main
target_link_directories(main PUBLIC ${MathFunctions_LIBRARY_DIRS})
# 將MathFunctions_LIBRARY_DIRS加入main的連結路徑
target_link_libraries(main PUBLIC ${MathFunctions_LIBS})
# 將MathFunctions的庫鍊結到執行檔main

configure_file(version.h.in version.h)
# 將version.h.in輸出成version.h
target_include_directories(main PUBLIC "${PROJECT_BINARY_DIR}")
# 將PROJECT_BINARY_DIR加入main的include路徑，使main可以include到 build/version.h                                           