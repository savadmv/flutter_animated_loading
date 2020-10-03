import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedLoading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateAnimatedLoading();
}

class StateAnimatedLoading extends State<AnimatedLoading>
    with SingleTickerProviderStateMixin {
 
  double initialRadius = 30;
  double radiusOdd=0;
  double radiusEven=0;
  AnimationController _controller;
  Animation<double> animationDotIn;
  Animation<double> animationDotOut;
  Animation<double> animationDotRotate;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationDotIn = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));
    animationDotOut = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    animationDotRotate = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));

    _controller.addListener(() {
      if (_controller.value >=0.75 && _controller.value <= 1.0) {
        setState(() {
          radiusOdd = animationDotIn.value * initialRadius;
          radiusEven = animationDotIn.value * initialRadius+5;
        });
      }
      else if (_controller.value >=0.0 && _controller.value <= 0.25) {

        setState(() {
          radiusOdd = animationDotOut.value * initialRadius;
          radiusEven = animationDotIn.value * initialRadius+5;

        });
      }
    });
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.accentColor,
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Center(
            child: RotationTransition(
              turns: animationDotRotate,
              child: Stack(
                children: [
                  Dot(
                    color: Colors.white,
                    radius: 30,
                  ),
                  Transform.translate(
                    offset:
                        Offset(radiusOdd * sin(pi), radiusOdd * cos(pi)),
                    child: Dot(
                      color: Colors.black,
                      radius: 5,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                        radiusEven * sin(pi / 4), radiusEven * cos(pi / 4)),
                    child: Dot(
                      color: Colors.black,
                      radius: 5,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(radiusOdd * sin(2 * pi / 4),
                        radiusOdd * cos(2 * pi / 4)),
                    child: Dot(
                      color: Colors.black,
                      radius: 5,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(radiusEven * sin(3 * pi / 4),
                        radiusEven * cos(3 * pi / 4)),
                    child: Dot(
                      color: Colors.black,
                      radius: 5,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(radiusOdd * sin(4 * pi / 4),
                        radiusOdd * cos(4 * pi / 4)),
                    child: Dot(
                      color: Colors.black,
                      radius: 5,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(radiusEven * sin(5 * pi / 4),
                        radiusEven * cos(5 * pi / 4)),
                    child: Dot(
                      color: Colors.black,
                      radius: 5,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(radiusOdd * sin(6 * pi / 4),
                        radiusOdd * cos(6 * pi / 4)),
                    child: Dot(
                      color: Colors.black,
                      radius: 5,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(radiusEven * sin(7 * pi / 4),
                        radiusEven * cos(7 * pi / 4)),
                    child: Dot(
                      color: Colors.black,
                      radius: 5,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(radiusOdd * sin(8 * pi / 4),
                        radiusOdd * cos(8 * pi / 4)),
                    child: Dot(
                      color: Colors.black,
                      radius: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  const Dot({Key key, this.radius, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        width: radius,
        height: radius,
      ),
    );
  }
}
