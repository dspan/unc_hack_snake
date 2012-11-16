part of snake_graphics;

class GridElement extends PCanvas {
  num _cWidth, _cHeight;
  num _cellFactor;
  ImageElement image;

  GridElement(num cWidth, num cHeight, num cellFactor)
      : super(cWidth * cellFactor, cHeight * cellFactor) {
    _cWidth = cWidth;
    _cHeight = cHeight;
    _cellFactor = cellFactor;
    image = new ImageElement(src: "res/grid.png");
  }

  num get cWidth => _cWidth;
  num get cHeight => _cHeight;
  num get cellFactor => _cellFactor;

  void drawOverride(CanvasRenderingContext2D ctx) {
    for (int row = 0; row < _cHeight; row++)
    {
      for (int col = 0; col < _cWidth; col++)
      {
        ctx.drawImage(image, col * cellFactor, row * cellFactor, cellFactor, cellFactor);
      }
    }
    super.drawOverride(ctx);
  }

  bool isValidCoordinate(num cX, num cY) {
    return (0 < cX && cX < _cWidth && 0 < cY && cY < _cHeight);
  }

  FoodElement createFood(num cX, num cY) {
    assert(isValidCoordinate(cX, cY));

    final food = new FoodElement.fromUrl(cellFactor, cellFactor);
    this.addElement(food);
    this.setTopLeft(food, new Coordinate(cX * cellFactor, cY * cellFactor));
    return food;
  }

  SnakeSegmentElement createSnakePart(num cX, num cY) {
    assert(isValidCoordinate(cX, cY));

    SnakeSegmentElement snake = new SnakeSegmentElement.fromUrl(cellFactor, cellFactor);
    this.addElement(snake);
    this.setTopLeft(snake, new Coordinate(cX * cellFactor, cY * cellFactor));
    return snake;
  }
}