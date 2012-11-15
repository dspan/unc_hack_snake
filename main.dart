import "dart:html";
import 'dart:math' as math;
import 'package:bot/bot.dart';
import 'package:bot/html.dart';
import 'package:bot/retained.dart';
import "lib/graphics.dart";

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

  GridElement grid = new GridElement(20, 15, 24);
  root.addElement(grid);

  food = grid.createFood(5, 5);
  grid.createSnakePart(5, 6);
  grid.createSnakePart(5, 7);
  grid.createSnakePart(5, 8);

  return new Stage(canvas, root);
}

void loop(int highResTime)
{
  food.doAnim(highResTime);
  stage.draw();

  window.requestAnimationFrame(loop);
}