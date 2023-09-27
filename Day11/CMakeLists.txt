cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_totorial LANGUAGES CXX)
# 設定專案名稱，且此項目使用C++

include_directories(include)
# 設定頭文件的搜尋路徑
link_directories(${PROJECT_SOURCE_DIR}/lib)
# 將庫所在路徑加入鍊結器的搜尋路徑中

## 靜態庫 ##
add_executable(main_a src/main.cpp)
# 將main.cpp編譯成一個可執行文件main_a
target_link_libraries(main_a mysqrt_a)
# 將mysqrt_a鍊結到main_a

## 動態庫 ##
add_executable(main_so src/main.cpp)
# 將main.cpp編譯成一個可執行文件main_so
target_link_libraries(main_so mysqrt_so)
# 將mysqrt_so鍊結到main_so