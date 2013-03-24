cmake_minimum_required(VERSION 2.8)
project(test)
SET_PROPERTY(GLOBAL PROPERTY USE_FOLDERS ON)
add_library(Libraries_libstm32f107
)
message(STATUS "added Libraries_libstm32f107 library")
SET_PROPERTY(TARGET Libraries_libstm32f107                PROPERTY FOLDER "lib")



message(STATUS "adding include directories")
include_directories(
	${CMAKE_SOURCE_DIR}/Libraries/libstm32f107
)
message(STATUS "added include directories")



add_executable(main Project/src/main.c)
target_link_libraries(main Libraries_libstm32f107 ${EXTERNAL_LIBS})
message(STATUS "added main exec and target link libraries Libraries_libstm32f107")

set(CMAKE_BUILD_TYPE Release)
