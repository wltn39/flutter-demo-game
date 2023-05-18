import 'package:flutter/material.dart';
<<<<<<< HEAD
=======

import './sample_000.dart';
import './sample_001.dart';
import './sample_002.dart';
import './sample_003.dart';
import './sample_004.dart';

>>>>>>> 1bba07991cd4e1a0bb731d2e8daef56428a8f95e
import 'game/space_ship_003/space_ship.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameEngine Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpaceShip(),
<<<<<<< HEAD
      // home: SpaceShip(),
=======
>>>>>>> 1bba07991cd4e1a0bb731d2e8daef56428a8f95e
    );
  }
}