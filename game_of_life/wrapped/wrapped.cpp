#include <ctime>
#include "wrapped.hpp"

extern "C" {
    sf::Color ToSfColor(ColorWrapped c) {
        return sf::Color{c.r, c.g, c.b};
    }

    int isOpenWrapped(WindowWrapped w)
    {
        return w.window->isOpen();
    }

    int randWrapped()
    {
        std::srand(std::time(NULL));
        return rand();
    }

    void checkEventsWrapped(WindowWrapped w)
    {
        sf::Event event;
        while (w.window->pollEvent(event))
        {
            switch(event.type) {
                case sf::Event::KeyPressed:
                case sf::Event::Closed:
                    w.window->close();
                    break;
            }
        }
    }

    void clearWrapped(WindowWrapped w, ColorWrapped c)
    {
        w.window->clear(ToSfColor(c));
    }

    void displayWrapped(WindowWrapped w)
    {
        w.window->display();
    }

} // extern "C"