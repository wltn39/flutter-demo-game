import 'package:flutter/material.dart';
import '../../utils/ryulib/game_engine.dart';

const SHIP_SIZE = 30.0;

class Ship extends GameControl {
  @override
  void onStart(Canvas canvas, Size size, int current) {
    width = SHIP_SIZE;
    height = SHIP_SIZE;
    x = (size.width - width) ;
    y = size.height - SHIP_SIZE ;
    paint.color = Colors.blue;
  }

  @override
  void tick(Canvas canvas, Size size, int current, int term) {
    x = x + _direction;

    const radius = SHIP_SIZE / 2;
    canvas.drawCircle(Offset(x + radius, y + radius), radius, paint);
  }

  void move(int direction) {
    _direction = direction;
  }

  int _direction = 0;
}