part of snake_graphics;

class SnakeElement extends ImgElement
{
  factory SnakeElement.fromUrl(int width, int height, [String src = "res/snake.png"])
  {
    final image = new ImageElement(src, null, null);

    return new SnakeElement(width, height, image);
  }
  SnakeElement(num width, num height, ImageElement image)
      : super(width, height, image, false)
  {

  }
}