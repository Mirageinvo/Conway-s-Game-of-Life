set(LOGGER_FILE "${PROJECT_ROOT}/llvm-instrumental-pass/log.c")

add_library(logger SHARED pass_trace.cpp ${LOGGER_FILE})
target_include_directories(logger PUBLIC ${LLVM_INCLUDE_DIRS})