cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(MathFunctions VERSION 1.5.0 LANGUAGES CXX)
# 設定專案名稱為MathFunctions，版本為1.5.0，且此項目使用C++

add_library(mysqrt SHARED src/mysqrt.cpp)
# 將mysqrt.cpp編譯成庫
target_include_directories(
	mysqrt PUBLIC 
	"$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
	"$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>"
)
# 在編譯時期使用的是${CMAKE_CURRENT_SOURCE_DIR}/include目錄
# 在安裝時期使用的是${CMAKE_INSTALL_INCLUDEDIR}目錄

set_target_properties(mysqrt PROPERTIES VERSION ${PROJECT_VERSION} SOVERSION ${PROJECT_VERSION_MAJOR})
# 設定庫的版本號，實做版本和專案版本相同，界面版本和主要版本相同

include(GNUInstallDirs)
# 引入 GNUInstallDirs 變數，預設
# ${CMAKE_PREFIX_PATH}=/usr/local
# ${CMAKE_INSTALL_LIBDIR}=lib
# ${CMAKE_INSTALL_BINDIR}=bin
# ${CMAKE_INSTALL_INCLUDEDIR}=include

install(FILES include/mysqrt.h DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_INCLUDEDIR}) 
# 安裝庫到 /usr/local/include
install(
	TARGETS mysqrt 
	EXPORT ${PROJECT_NAME}Targets
	LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
	ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
	RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
	INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
) 
# 將mysqrt匯出成${PROJECT_NAME}Targets,並安裝
# 動態庫文件(LIBRARY)到 /usr/local/bin
# 靜態庫文件(ARCHIVE)到 /usr/local/lib
# 可執行文件(RUNTIME)到 /usr/local/lib
# 頭文件(INCLUDES)到 /usr/local/include

install(
	EXPORT ${PROJECT_NAME}Targets
	FILE ${PROJECT_NAME}Targets.cmake
	NAMESPACE ${PROJECT_NAME}::
	DESTINATION lib/cmake/${PROJECT_NAME}
)
# 匯出成的${PROJECT_NAME}Targets
# 生成 ${PROJECT_NAME}Targets.cmake 文件
# 設定 ${PROJECT_NAME}Targets.cmake 文件中的命名空間為 ${PROJECT_NAME}::
# 將 ${PROJECT_NAME}Targets.cmake 安裝到 /usr/local/lib/cmake/${PROJECT_NAME}

set(PACKAGE_INCLUDE_DIRS ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_INCLUDEDIR})
# 設定要替換Config.cmake.in文件中的@PACKAGE_INCLUDE_DIRS@變數
set(PACKAGE_LIBRARY_DIRS ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR})
# 設定要替換Config.cmake.in文件中的@PACKAGE_LIBRARY_DIRS@變數
set(PACKAGE_LIBS mysqrt)
# 設定要替換Config.cmake.in文件中的@PACKAGE_LIBS@變數

include(CMakePackageConfigHelpers)
# 引入 CMakePackageConfigHelpers 模組，才能用configure_package_config_file、configure_package_config_file 函數
write_basic_package_version_file(
	${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	VERSION ${PROJECT_VERSION}
	COMPATIBILITY SameMajorVersion
)
# 生成 ${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake 文件，讓 find_package 知道這個第三方庫是什麼版本
# 相容性設定為和主要版本號相同

configure_package_config_file(
	${PROJECT_SOURCE_DIR}/Config.cmake.in
	${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
	INSTALL_DESTINATION lib/cmake/${PROJECT_NAME}
	PATH_VARS PACKAGE_INCLUDE_DIRS PACKAGE_LIBRARY_DIRS PACKAGE_LIBS 
)
install(
	FILES ${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake 
	FILES ${PROJECT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	DESTINATION lib/cmake/${PROJECT_NAME}
)
# 讀入 ${PROJECT_SOURCE_DIR}/Config.cmake.in 文件
# 生成 ${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake 文件
# 將生成出的 Config.cmake 安裝到 /usr/local/lib/cmake/${PROJECT_NAME}，讓find_package能夠在預設的搜索路徑找到
# 替換 ${PROJECT_SOURCE_DIR}/Config.cmake.in 文件中的 @PACKAGE_INCLUDE_DIRS@ @PACKAGE_LIBRARY_DIRS@ @PACKAGE_LIBS@ 變數

