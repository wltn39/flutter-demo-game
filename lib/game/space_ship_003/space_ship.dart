import 'package:flutter/material.dart';
import '../../utils/ryulib/game_engine.dart';
import 'asteroids.dart';
import 'joystick.dart';
import 'ship.dart';

class SpaceShip extends StatelessWidget {
  SpaceShip({Key? key}) : super(key: key) {
    _joystick = Joystick(
        onMove: (int direction) => {
          _ship.move(direction)
        }
    );

    _ship = Ship();
    _asteroids = Asteroids(
      onCheckCollision: (GameControl target) {
        return _ship.checkCollisionAndExplode(target);
      }
    );

    _gameEngine.getControls().addControl(_joystick);
    _gameEngine.getControls().addControl(_ship);
    _gameEngine.getControls().addControl(_asteroids);
    _gameEngine.start();
  }

<<<<<<< HEAD
  final _gameEngine = GameEngine();
  late final _joystick;
  late final _ship;
  late final _asteroids;

=======
>>>>>>> 1bba07991cd4e1a0bb731d2e8daef56428a8f95e
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GameEngine Demo"),
        ),
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: _gameEngine.getCustomPaint()
        )
    );
  }

<<<<<<< HEAD
=======
  final _gameEngine = GameEngine();
  late final _joystick;
  late final _ship;
  late final _asteroids;
>>>>>>> 1bba07991cd4e1a0bb731d2e8daef56428a8f95e
}

