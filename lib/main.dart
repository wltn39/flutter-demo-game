import 'package:flutter/material.dart';
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
      // home: SpaceShip(),
    );
  }
}