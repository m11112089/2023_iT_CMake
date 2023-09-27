cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_totorial LANGUAGES CXX)
# 設定專案名稱，且此項目使用C++

## 普通版本 ##
include_directories(${PROJECT_SOURCE_DIR}/include)
# 設定頭文件的搜尋路徑
add_executable(main src/main.cpp src/mysqrt.cpp)
# 將main.cpp和mysqrt.cpp編譯成一個可執行文件main
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)
# 設定庫的輸出路徑

## 靜態庫 ##
add_library(mysqrt_a STATIC src/mysqrt.cpp)
# 將mysqrt.cpp編譯成一個靜態庫mysqrt_a
target_include_directories(mysqrt_a PUBLIC ${PROJECT_SOURCE_DIR}/include)
# 將頭文件路徑加入mysqrt_a
add_executable(main_a src/main.cpp)
# 將main.cpp編譯成一個可執行文件main_a
target_link_libraries(main_a mysqrt_a)
# 將mysqrt_a鍊結到main_a

## 動態庫 ##
add_library(mysqrt_so SHARED src/mysqrt.cpp)
# 將mysqrt.cpp編譯成一個動態庫mysqrt_so
target_include_directories(mysqrt_so PUBLIC ${PROJECT_SOURCE_DIR}/include)
# 將頭文件路徑加入mysqrt_so
add_executable(main_so src/main.cpp)
# 將main.cpp編譯成一個可執行文件main_so
target_link_libraries(main_so mysqrt_so)
# 將mysqrt_so鍊結到main_so
