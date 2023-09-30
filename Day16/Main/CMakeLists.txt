# 設定cmake最低版本
cmake_minimum_required(VERSION 3.10)

# 設定項目名稱和版本號
project(Tutorial VERSION 1.0.0)

# 將main.cpp編譯成可執行文件main
add_executable(main src/main.cpp)

# 將mysqrt連結到執行檔main
include(GNUInstallDirs)

# 設定庫的 link 路徑
link_directories(main PUBLIC ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_BINDIR})
target_link_libraries(main mysqrt)

