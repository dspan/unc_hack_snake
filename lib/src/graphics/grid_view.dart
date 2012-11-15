part of snake_graphics;

class GridView extends PElement
{
  int _cellSize;
  int _width;
  int _height;
  dynamic _strokeStyle = "black";
  GridData _data;
  dynamic emptyFillStyle = "white";
  dynamic snakeFillStyle = "green";
  dynamic foodFillStyle = "red";

  GridView(int width, int height, GridData data, [int cellSize = 32])
  : super(width * cellSize, height * cellSize, false)
  {
      _width = width;
      _height = height;
      _cellSize = cellSize;
      _data = data;
  }

  dynamic get strokeStyle => _strokeStyle;
  void set strokeStyle(dynamic value)
  {
    _strokeStyle = value;
    this.invalidateDraw();
  }

  void drawOverride(CanvasRenderingContext2D ctx)
  {
    for (int y = 0; y < _height; y++)
    {
      for (int x = 0; x < _width; x++)
      {
        _drawSpace(ctx, x, y, _strokeStyle, _getFillStyle(x, y));
      }
    }
  }
  void _drawSpace(CanvasRenderingContext2D ctx, int x, int y, dynamic strokeStyle, dynamic fillStyle)
  {
    ctx.strokeStyle = strokeStyle;

    ctx.strokeRect(x * _cellSize, y * _cellSize, _cellSize, _cellSize, 1);

    ctx.fillStyle = fillStyle;

    ctx.fillRect(x * _cellSize + 1, y * _cellSize + 1, _cellSize - 2, _cellSize - 2);
  }
  dynamic _getFillStyle(int x, int y)
  {
    if (_data.isFood(x, y))
    {
      return this.foodFillStyle;
    }
    if (_data.isSnake(x, y))
    {
      return this.snakeFillStyle;
    }
    return this.emptyFillStyle;
  }
}
