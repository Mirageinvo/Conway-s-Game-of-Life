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

    void drawingWrapped(WindowWrapped w, int **cells)
    {
        for (int i = 0; i < NUM_CELLS_X; ++i) {
            for (int j = 0; j < NUM_CELLS_Y; ++j) {
                if (cells[i][j] == 1) {
                    sf::RectangleShape cell;
                    cell.setPosition(i * CELL_SIDE, j * CELL_SIDE);
                    cell.setSize(sf::Vector2f(CELL_SIDE, CELL_SIDE));
                    cell.setFillColor(ToSfColor(ColorWrapped{80, 250, 120}));
                    w.window->draw(cell);
                }
            }
        }
    }

    void displayWrapped(WindowWrapped w)
    {
        w.window->display();
        sf::sleep(sf::milliseconds(100));
    }

} // extern "C"