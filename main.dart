#import("dart:html");
#import('dart:math', prefix:'math');
#import('package:bot/bot.dart');
#import('package:bot/html.dart');
#import('package:bot/retained.dart');
#import("lib/graphics.dart");

CanvasRenderingContext2D ctx;
Stage stage;
FoodElement food;

void main() {
  final CanvasElement canvas = query("#displayCanvas");
  ctx = canvas.context2d;

  //drawer = new GridDrawer(canvas);
  stage = createStage(canvas);

  window.requestAnimationFrame(loop);
}

Stage createStage(CanvasElement canvas)
{
  PCanvas root = new PCanvas(canvas.width, canvas.height);

  food = new FoodElement.fromUrl(24, 24);
  root.addElement(food);
  root.setCenter(food, new Coordinate(50, 50));

  return new Stage(canvas, root);
}

void loop(int highResTime)
{
  food.doAnim(highResTime);
  stage.draw();

  window.requestAnimationFrame(loop);
}