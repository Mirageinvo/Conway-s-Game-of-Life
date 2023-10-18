cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(LangCompiler)
enable_language(C)

set(PROJECT_ROOT ${PROJECT_SOURCE_DIR})
set(PROJECT_BINARY_ROOT ${PROJECT_BINARY_DIR})
set(PROJECT_SCRIPTS ${PROJECT_ROOT}/scripts)

add_subdirectory(entry)