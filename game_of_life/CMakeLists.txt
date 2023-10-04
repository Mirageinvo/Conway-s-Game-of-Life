add_library(wrapped STATIC wrapped/wrapped.cpp)
target_link_libraries(wrapped PUBLIC sfml-graphics)