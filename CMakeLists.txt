cmake_minimum_required(VERSION 3.8)
project(mach_decoder_intel)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()
include_directories(${CMAKE_SOURCE_DIR}/header)
include_directories(${CMAKE_SOURCE_DIR}/header/decoder)
include_directories(${CMAKE_SOURCE_DIR}/header/reader)
include_directories(${CMAKE_SOURCE_DIR}/TPL/yaml-cpp/include)
include_directories(${CMAKE_SOURCE_DIR}/TPL/ffmpeg_intel/include)
include_directories(${CMAKE_SOURCE_DIR}/TPL/opencv/include)
link_directories(${CMAKE_SOURCE_DIR}/TPL/yaml-cpp/lib)
link_directories(${CMAKE_SOURCE_DIR}/TPL/ffmpeg_intel/lib)
link_directories(${CMAKE_SOURCE_DIR}/TPL/opencv/lib)
aux_source_directory(${CMAKE_SOURCE_DIR}/src/decoder ALL_MY_SRC)
aux_source_directory(${CMAKE_SOURCE_DIR}/src/reader ALL_MY_SRC)
add_executable(mach_decoder_intel
    ${ALL_MY_SRC}
    ${CMAKE_SOURCE_DIR}/src/manager.cpp
    main.cpp
)
target_link_libraries(mach_decoder_intel 
avformat avdevice  avcodec swscale avutil swresample   avfilter yaml-cpp
opencv_core opencv_imgproc opencv_highgui opencv_imgcodecs
pthread)