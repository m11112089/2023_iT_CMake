cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_totorial CXX)
# 設定專案名稱，且此項目使用C++
include_directories(${PROJECT_SOURCE_DIR}/include)
# 將include資料夾加入include路徑
set(SRC_DIR ${PROJECT_SOURCE_DIR}/src)
# 將原始碼所在路徑設定成變數 SRC_DIR
add_executable(main ${SRC_DIR}/main.cpp ${SRC_DIR}/mysqrt.cpp)
# 將main.cpp與mysqrt.cpp編譯並鍊結成執行檔main
