set(SOURCES
    entry.cpp
)

add_executable(graphics ${SOURCES})
target_link_libraries(graphics PRIVATE sfml-graphics)

add_custom_target(
    run_graphics
    COMMENT "Running graphics"
    COMMAND ./graphics
)
add_dependencies(run_graphics graphics)