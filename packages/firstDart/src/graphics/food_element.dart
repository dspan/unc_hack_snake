class FoodElement extends ImgElement
{
  AffineTransform trans = new AffineTransform();
  int lastTime = 0;

  factory FoodElement.fromUrl(int width, int height, [String src = "res/food.png"])
  {
    final image = new ImageElement(src, null, null);

    return new FoodElement(width, height, image);
  }
  FoodElement(int width, int height, ImageElement img)
      : super(width, height, img, false)
  {
    trans.rotate(toRadians(30), width / 2, height / 2);
  }

  void doAnim(int highResTime)
  {
    if (lastTime == 0)
    {
      lastTime = highResTime;
      return;
    }
    int delta = highResTime - lastTime;
    lastTime = highResTime;

    trans.rotate(toRadians(-90 * (delta / 1000)), this.width / 2, this.height / 2);
  }
  void drawOverride(CanvasRenderingContext2D ctx)
  {
    CanvasUtil.transform(ctx, this.trans);
    super.drawOverride(ctx);
  }

  num toRadians(num degrees)
  {
    return (degrees / 180) * math.PI;
  }
}