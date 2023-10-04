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
    int randWrapped();
    void checkEventsWrapped(WindowWrapped);
    void clearWrapped(WindowWrapped, ColorWrapped);
    void displayWrapped(WindowWrapped);
    void setCellWrapped(/*TO BE DONE*/);

} // extern "C"

#endif // GAME_OF_LIFE_WRAPPED_WRAPPED_HPP