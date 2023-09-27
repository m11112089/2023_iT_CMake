cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_totorial LANGUAGES CXX)
# 設定專案名稱，且此項目使用C++
add_subdirectory(MathFunctions)
# 將MathFunctions目錄加入編譯
add_executable(main src/main.cpp)
# 將main.cpp與hello.cpp及greeting.cpp編譯並鍊結成執行檔main
target_link_libraries(main mysqrt)
# 將main與mysqrt鍊結