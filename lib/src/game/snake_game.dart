class SnakeGame extends UpdateableContainer {
  final _gameTime = new GameTime();
  final foodPieces = new List<Food>();

  void run() {
    window.requestAnimationFrame((int firstTime) {
      _gameTime.update(firstTime);
      _requestFrame();
    });
  }

  void _requestFrame()
  {
    window.requestAnimationFrame(_tick);
  }

  void _tick(int highResTime)
  {
    _gameTime.update(highResTime);
    update(_gameTime);
    _requestFrame();
  }

  void update(GameTime gameTime) {

    super.update(gameTime);
  }
}