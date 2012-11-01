class GridElement extends PCanvas
{
  num _width, _height;
  num _cellFactor;

  GridElement(num cWidth, num cHeight, num cellFactor)
      : super(cWidth * cellFactor, cHeight * cellFactor)
  {
    _width = cWidth;
    _height = cHeight;
    _cellFactor = cellFactor;
  }

  num get cWidth => _width;
  num get cHeight => _height;
  num get cellFactor => _cellFactor;

  FoodElement createFood(num cX, num cY)
  {
    FoodElement food = new FoodElement.fromUrl(cellFactor, cellFactor);
    this.addElement(food);
    this.setTopLeft(food, new Coordinate(cX * cellFactor, cY * cellFactor));
    return food;
  }
}