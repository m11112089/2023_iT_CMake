cmake_minimum_required(VERSION 3.22.1 )
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_totorial LANGUAGES CXX)
# 設定專案名稱，且此項目使用C++
MESSAGE(STATUS "PROJECT_NAME " ${CMAKE_PROJECT_NAME})
MESSAGE(STATUS "SOURCE_DIR " ${PROJECT_SOURCE_DIR})
MESSAGE(STATUS "SOURCE_DIR " ${cmake_totorial_SOURCE_DIR})
message(STATUS "BINARY_DIR " ${PROJECT_BINARY_DIR})
message(STATUS "BINARY_DIR " ${cmake_totorial_BINARY_DIR})
#輸出project自動生成的變量，注意命令與變量名稱大小寫等價
add_executable(main main.cpp)
# 將main.cpp編譯成執行檔main
