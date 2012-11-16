part of snake_graphics;

class SnakeSegmentElement extends ImgElement
{
  factory SnakeSegmentElement.fromUrl(int width, int height, [String src = "res/snake.png"])
  {
    final image = new ImageElement(src: src);

    return new SnakeSegmentElement(width, height, image);
  }
  SnakeSegmentElement(num width, num height, ImageElement image)
      : super(width, height, image, false)
  {

  }
}