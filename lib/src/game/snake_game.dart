part of snake_game;

class SnakeGame extends UpdateableContainer {
  final _gameTime = new GameTime();
  final foodPieces = new List<Food>();
  Snake snake;
  final grid = new GridManager(10, 10);

  SnakeGame() {
    this.snake = new Snake(this.grid);
  }

  void run() {
    window.requestAnimationFrame((double firstTime) {
      _gameTime.update(firstTime.toInt());
      _requestFrame();
    });
  }

  void _requestFrame() {
    window.requestAnimationFrame(_tick);
  }

  void _tick(double highResTime) {
    _gameTime.update(highResTime.toInt());
    update(_gameTime);
    _requestFrame();
  }

  void initialize() {
    this.addComponent(this.snake);

    super.initialize();
  }

  void update(GameTime gameTime) {

    super.update(gameTime);
  }
}