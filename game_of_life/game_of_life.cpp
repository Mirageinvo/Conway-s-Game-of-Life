#include "game_of_life.hpp"

int RunLife()
{
    // create the window
    sf::RenderWindow window(sf::VideoMode(800, 600), "Game of life");

    while (window.isOpen())
    {
        // check all the window's events that were triggered since the last iteration of the loop
        sf::Event event;
        while (window.pollEvent(event))
        {
            switch(event.type) {
                case sf::Event::KeyPressed:
                case sf::Event::Closed:
                    window.close();
                    break;
            }
        }

        // clear the window with black color
        window.clear(sf::Color::Black);

        // draw everything here...
        // window.draw(...);

        // end the current frame
        window.display();
    }
    return 0;
}