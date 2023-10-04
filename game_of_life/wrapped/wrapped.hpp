#ifndef GAME_OF_LIFE_WRAPPED_WRAPPED_HPP
#define GAME_OF_LIFE_WRAPPED_WRAPPED_HPP

#include <SFML/Graphics.hpp>

extern "C" {
    constexpr const int CELL_SIDE = 20;
    constexpr const int WINDOW_WIDTH = 1200;
    constexpr const int WINDOW_HEIGHT = 800;
    constexpr const int NUM_CELLS_X = WINDOW_WIDTH / CELL_SIDE;
    constexpr const int NUM_CELLS_Y = WINDOW_HEIGHT / CELL_SIDE;
    const sf::Vector2f CELL_VECTOR(CELL_SIDE, CELL_SIDE);

    struct ColorWrapped {
        uint8_t r = 0, g = 0, b = 0;
    };

    struct WindowWrapped {
        WindowWrapped(int w, int h, const char* name): window(new sf::RenderWindow(sf::VideoMode(w, h), name)) {}
        sf::RenderWindow* window;
    };

    sf::Color ToSfColor(ColorWrapped c);
    int isOpenWrapped(WindowWrapped);
    int randWrapped();
    void checkEventsWrapped(WindowWrapped);
    void clearWrapped(WindowWrapped, ColorWrapped);
    void drawingWrapped(WindowWrapped w, int **cells);
    void displayWrapped(WindowWrapped);

} // extern "C"

#endif // GAME_OF_LIFE_WRAPPED_WRAPPED_HPP