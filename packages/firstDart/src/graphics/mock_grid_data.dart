class MockGridData implements GridData
{
  bool isSnake(int x, int y)
  {
    return (y == 3) && (x == 5 || x == 6);
  }
  bool isFood(int x, int y)
  {
    return (x == y);
  }
}
