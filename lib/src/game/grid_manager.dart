part of snake_game;

class GridManager {
  List<Food> _foodGrid;
  int _width;
  int _height;

  GridManager(this._width, this._height) {
    _foodGrid = new List<Food>(_width * _height);
  }

  bool isValidCell(int cellX, int cellY) {
    return (0 <= cellX && cellX < _width) &&
        (0 <= cellY && cellY < _height);
  }
  bool isValidPos(Vector pos) => this.isValidCell(pos.x, pos.y);

  int transformToIndex(int cellX, int cellY) {
    return (cellX) + (cellY * _width);
  }

  bool isFood(int cellX, int cellY) {
    return isValidCell(cellX, cellY) &&
        _foodGrid[transformToIndex(cellX, cellY)] != null;
  }
  bool isFoodAtPos(Vector pos) => this.isFood(pos.x, pos.y);
}