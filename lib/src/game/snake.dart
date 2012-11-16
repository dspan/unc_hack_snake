part of snake_game;

class Snake extends Updateable {
  final segments = new List<SnakeSegment>();
  Vector direction;
  GridManager grid;
  final _deathEvent = new EventHandle<Snake>();
  final _grewEvent = new EventHandle<Snake>();

  int movementTimer = 0;
  final movementStepTime = 500;

  Snake(this.grid) {

  }

  EventRoot<Snake> get deathEvent => _deathEvent;
  EventRoot<Snake> get grewEvent => _grewEvent;
  SnakeSegment get head => (this.segments.length > 0 ? this.segments[0] : null);
               set head(SnakeSegment value) => this.segments[0] = value;
  SnakeSegment get tail => (this.segments.length > 0 ? this.segments[this.segments.length - 1] : null);
               set tail(SnakeSegment value) => this.segments[this.segments.length - 1] = value;

  void initialize() {

    super.initialize();
  }

  void update(GameTime gameTime) {
    super.update(gameTime);

    this.movementTimer += gameTime.elapsed;
    while (this.movementTimer > movementStepTime) {
      this.movementTimer -= movementStepTime;

      if (this.canMove()) {
        this.move();
      }
      else {
        // player just died
        this.die();
      }
    }
  }

  void die() {
    this.enabled = false;

    _deathEvent.fireEvent(this);
  }

  void spawn(Vector cellStart) {
    this.segments.clear();
    this.direction = Directions.right;

    // create 3 starting segments
    for (int i = 0; i < 3; i++)
    {
      var segment = new SnakeSegment(cellStart - (this.direction * i));
      this.segments.add(segment);
    }
    this.enabled = true;
    this.movementTimer = 0;
  }

  bool isSnakeCell(int cellX, int cellY) => this.segments.filter((s) => s.cellPos.x == cellX && s.cellPos.y == cellY).length > 0;
  bool isSnakePos(Vector pos) => isSnakeCell(pos.x, pos.y);

  bool canMove() {
    var nextPos = this.head.cellPos + this.direction;

    return this.grid.isValidPos(nextPos) && !this.isSnakePos(nextPos);
  }

  void move() {
    assert(this.canMove());

    // store data of whether or not we should grow
    var shouldGrow = grid.isFoodAtPos(this.head.cellPos + this.direction);
    var tailPos = this.segments[this.segments.length - 1].cellPos;

    // move the segments
    for (int i = this.segments.length; i > 0; i--)
    {
       // move all of the segments back one
       this.segments[i].cellPos = this.segments[i - 1].cellPos;
    }
    // create a new head
    this.head.cellPos = this.head.cellPos + this.direction;

    if (shouldGrow) {
      // create a tail segment
      this.segments.add(new SnakeSegment(tailPos));
    }
  }
}