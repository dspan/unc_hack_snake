class GridElement extends PCanvas
{
  num _cWidth, _cHeight;
  num _cellFactor;
  ImageElement image;

  GridElement(num cWidth, num cHeight, num cellFactor)
      : super(cWidth * cellFactor, cHeight * cellFactor)
  {
    _cWidth = cWidth;
    _cHeight = cHeight;
    _cellFactor = cellFactor;
    image = new ImageElement("res/grid.png", null, null);
  }

  num get cWidth => _cWidth;
  num get cHeight => _cHeight;
  num get cellFactor => _cellFactor;

  void drawOverride(CanvasRenderingContext2D ctx)
  {
    for (int row = 0; row < _cHeight; row++)
    {
      for (int col = 0; col < _cWidth; col++)
      {
        ctx.drawImage(image, col * cellFactor, row * cellFactor, cellFactor, cellFactor);
      }
    }
    super.drawOverride(ctx);
  }

  bool isValidCoordinate(num cX, num cY)
  {
    return (0 < cX && cX < _cWidth && 0 < cY && cY < _cHeight);
  }
  FoodElement createFood(num cX, num cY) {
    assert(isValidCoordinate(cX, cY));

    final food = new FoodElement.fromUrl(cX * cellFactor, cY * cellFactor, cellFactor, cellFactor);
    this.addElement(food);
    this.setTopLeft(food, new Coordinate(cX * cellFactor, cY * cellFactor));
    return food;
  }
  SnakeElement createSnakePart(num cX, num cY)
  {
    assert(isValidCoordinate(cX, cY));

    SnakeElement snake = new SnakeElement.fromUrl(cellFactor, cellFactor);
    this.addElement(snake);
    this.setTopLeft(snake, new Coordinate(cX * cellFactor, cY * cellFactor));
    return snake;
  }
}