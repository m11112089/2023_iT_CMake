cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_totorial VERSION 1.0.0 LANGUAGES CXX)
# 設定專案名稱為cmake_totorial，版本為1.0.0，且此項目使用C++

include_directories(${PROJECT_SOURCE_DIR}/include)
# 設定include路徑
add_executable(main src/main.cpp)
# 將main.cpp編譯成可執行文件main
target_link_directories(main PUBLIC ${PROJECT_SOURCE_DIR}/lib)
# 設定執行檔main搜尋lib的路徑
target_link_libraries(main mysqrt)
# 將mysqrt連結到執行檔main
