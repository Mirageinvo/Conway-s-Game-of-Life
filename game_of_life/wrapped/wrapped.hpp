#ifndef GAME_OF_LIFE_WRAPPED_WRAPPED_HPP
#define GAME_OF_LIFE_WRAPPED_WRAPPED_HPP

#include <SFML/Graphics.hpp>

extern "C" {
    struct ColorWrapped {
        uint8_t r = 0, g = 0, b = 0;
    };

    struct WindowWrapped {
        WindowWrapped(int w, int h, const char* name): window(new sf::RenderWindow(sf::VideoMode(w, h), name)) {}
        sf::RenderWindow* window;
    };

    int isOpenWrapped(WindowWrapped);
    int RandWrapped();
    void checkEventsWrapped(WindowWrapped);
    void clearWrapped(WindowWrapped, ColorWrapped);
    void displayWrapped(WindowWrapped);

    // void FlushWrapped();
    // void BkptWrapped();
    // void SetPixelWrapped(int x, int y, int argb);
} // extern "C"

#endif // GAME_OF_LIFE_WRAPPED_WRAPPED_HPP