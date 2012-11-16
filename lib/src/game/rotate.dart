import 'dart:html';
import 'dart:math';

num vector;

void main() {
  query("#text")
    ..text = "Insert text here.";
  window.on.keyDown.add(handleKeyboard);
}

void handleKeyboard(KeyboardEvent args){
  print(args.keyCode);
  if (args.keyCode == 37 || args.keyCode == 38 || args.keyCode == 39 || args.keyCode == 40)
    handleArrow(args.keyCode);
}

const NORTH = 38;
const EAST = 39;
const SOUTH = 40;
const WEST = 37;

void handleArrow(int a) {
  switch (a){
    case (NORTH):
      rotate(0);
    break;

    case (EAST):
      rotate(90);
    break;

    case (SOUTH):
      rotate(180);
    break;

    case (WEST):
      rotate(270);
    break;
    }
}

void updateVec(int n){
  vector = n;
}

void rotate(num a) {
  updateVec(a);
  print(vector);
  query("#text").style
    ..transition = "1s"
    ..transform = "rotate(${vector}deg)";
}