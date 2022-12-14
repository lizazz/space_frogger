import 'package:flutter/material.dart';

import 'GameObject.dart';

class Player extends GameObject
{
  int speed = 0;
  int moveHorizontal = 0;
  int moveVertical = 0;
  double energy = 0.0;
  Map angleToRadiansConversionTable = {
    "angle45" : 0.7853981633974483,
    "angle90" : 1.5707963267948966,
    "angle135" : 2.3387411976724017,
    "angle180" : 3.141592653589793,
    "angle225" : 3.9269908169872414,
    "angle270" : 4.71238898038469,
    "angle315" : 5.497787143782138
  };
  double radians = 0.0;

  Player(
    double inScreenWidth,
    double inScreenHeight,
    String inBaseFilename,
    int inWidth,
    int inHeight,
    int inNumFrames,
    int inFrameSkip,
    int inSpeed
  ) : super(
    inScreenWidth,
    inScreenHeight,
    inBaseFilename,
    inWidth,
    inHeight,
    inNumFrames,
    inFrameSkip,
    null
  ) {
    speed = inSpeed;
  }

  @override

  Widget draw()
  {
    return visible ?
        Positioned(
            left: x,
            top: y,
            child: Transform.rotate(angle: radians, child: frames[currentFrame])
        ) :
        Positioned(child: Container());
  }

  void orientationChanged()
  {
    radians = 0.0;

    if (moveHorizontal == 1 && moveVertical == -1) {
      radians = angleToRadiansConversionTable["angle45"];
    } else if (moveHorizontal == 1 && moveVertical == 0) {
      radians = angleToRadiansConversionTable['angle90'];
    } else if (moveHorizontal == 1 && moveVertical == 1) {
      radians = angleToRadiansConversionTable['angle135'];
    } else if (moveHorizontal == 0 && moveVertical == 1) {
      radians = angleToRadiansConversionTable['angle180'];
    } else if (moveHorizontal == -1 && moveVertical == 1) {
      radians = angleToRadiansConversionTable['angle225'];
    } else if (moveHorizontal == -1 && moveVertical == 0) {
      radians = angleToRadiansConversionTable['angle270'];
    } else if (moveHorizontal == -1 && moveVertical == -1) {
      radians = angleToRadiansConversionTable['angle315'];
    }
  }

  void move()
  {
    if (x > 0 && moveHorizontal == -1) { x -= speed; }
    if (x < (screenWidth - width) && moveHorizontal == 1) { x += speed; }
    if (y > 40 && moveVertical == -1) { y -= speed; }
    if (y < (screenHeight - height - 10) && moveVertical == 1) { y += speed; }
  }
}