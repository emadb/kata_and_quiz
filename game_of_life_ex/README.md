# Game of life

## rules
You start with a two dimensional grid of cells, where each cell is either alive or dead.

The grid is finite, and no life can exist off the edges.

When calculating the next generation of the grid, follow these four rules:

- Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
- Any live cell with more than three live neighbours dies, as if by overcrowding.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any dead cell with exactly three live neighbours becomes a live cell.