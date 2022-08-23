import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'GameScreen.dart';

void main() => runApp(SpaceFrogger());

class SpaceFrogger extends StatelessWidget {
  @override

  Widget build(BuildContext context)
  {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]
    );

    return MaterialApp(
      title: "Space Frogger",
      home: GameScreen(),
    );
  }
}