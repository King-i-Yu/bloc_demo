import 'dart:ui';

import 'package:blocdemo/particle.dart';
import 'package:flutter/material.dart';

///
///Author: WangYu
///Date: 2020/6/11
///Description:
///
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    print("_SecondPageState-->build-->${show}");
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              CustomPaint(
                painter: MyCustomPainter(),
              ),
              if (show)
                Particle(100, 100, 200, 200).startParticleAnimation((finish) {
                  print("_SecondPageState-->build-->222${finish}");
                  show = false;
                  setState(() {});
                }),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  Paint _paint = Paint()
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 6.0
    ..style = PaintingStyle.fill
    ..maskFilter = MaskFilter.blur(BlurStyle.solid, 6.0)
    ..color = Colors.red;
  Paint _paint2 = Paint()
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4.0
    ..style = PaintingStyle.fill
    ..color = Colors.white;
  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    path.moveTo(30, 30);
    path.lineTo(100, 100);
    canvas.drawLine(Offset(200, 200), Offset(400, 400), _paint);
    path.moveTo(30, 30);
    path.lineTo(100, 100);
    canvas.drawLine(Offset(200, 200), Offset(400, 400), _paint2);
//    List<Offset> points = [
//      Offset(0, 0),
//      Offset(30, 50),
//      Offset(20, 80),
//      Offset(100, 40),
//      Offset(150, 90),
//      Offset(60, 110),
//      Offset(260, 160),
//    ];
//    canvas.drawPoints(PointMode.points, points, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
