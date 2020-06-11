import 'package:flutter/material.dart';
import 'dart:math' as math;

///
///Author: WangYu
///Date: 2020/6/11
///Description:
///
typedef onFinish = void Function(bool finish);

class Particle extends State with TickerProviderStateMixin {
  Offset position;
  double offsetX = 0.0;
  double offsetY = 0.0;
  double newOffsetX = 0.0;
  double newOffsetY = 0.0;
  AnimationController animationController;
  Animation translateXAnimation, negatetransXAnimation;
  Animation translateYAnimation, negatetransYAnimation;
  double lastXOffset, lastYOffset;
  Particle(this.offsetX, this.offsetY, this.newOffsetX, this.newOffsetY) {
    position = Offset(this.offsetX, this.offsetY);
    math.Random random = new math.Random();
    this.lastXOffset = random.nextDouble() * 100;
    this.lastYOffset = random.nextDouble() * 100;
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    translateXAnimation = Tween(begin: position.dx, end: lastXOffset)
        .animate(animationController);
    translateYAnimation = Tween(begin: position.dy, end: lastYOffset)
        .animate(animationController);
    negatetransXAnimation =
        Tween(begin: -1 * position.dx, end: -1 * lastXOffset)
            .animate(animationController);
    negatetransYAnimation =
        Tween(begin: -1 * position.dy, end: -1 * lastYOffset)
            .animate(animationController);
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });
  }

  @override
  Widget build(BuildContext context) {}

  startParticleAnimation(onFinish) {
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        onFinish(true);
      }
    });
    return Container(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, widget) {
          return Transform.translate(
            offset:
                Offset(translateXAnimation.value, translateYAnimation.value),
            child: Container(
              width: 30,
              height: 30,
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }
}
