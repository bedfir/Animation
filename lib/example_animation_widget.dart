import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ExampleAnimationWidget extends StatefulWidget {
  const ExampleAnimationWidget({Key? key}) : super(key: key);

  @override
  State<ExampleAnimationWidget> createState() => _ExampleAnimationWidgetState();
}

class _ExampleAnimationWidgetState extends State<ExampleAnimationWidget>
    with TickerProviderStateMixin {
  Size containerSize = Size(200, 200);
  Color containerColor = Colors.blue;
  Random random = Random();
  late AnimationController controller;
  late Animation<Offset> slideTween;
  late Animation<double> rotateTween;
  late Animation<double> slide;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    slideTween = Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
        .animate(controller);
    rotateTween = Tween<double>(begin: 0.0, end: 2 * pi).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        }
      });

    slide = Tween<double>(begin: -60.0, end: 60.0).animate(controller);

    Timer.periodic(Duration(seconds: 1), (_) {
      containerSize =
          Size(random.nextInt(200).toDouble(), random.nextInt(200).toDouble());
      containerColor = Color.fromARGB(
        255,
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
      );
      setState(() {});
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Center(
  //         // child: AnimatedContainer(
  //         //   width: containerSize.width,
  //         //   height: containerSize.height,
  //         //   duration: Duration(
  //         //     seconds: 1,
  //         //   ),
  //         //   color: containerColor,
  //         // ),
  //         ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Center(
  //       child: FadeTransition(
  //         opacity: controller,
  //         child: Container(
  //           height: 200,
  //           width: 200,
  //           color: Colors.indigo,
  //         ),
  //       ),
  //     ),
  //   );
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Center(
  //       child: SlideTransition(
  //         position: slideTween,
  //         child: Container(
  //           height: 200,
  //           width: 200,
  //           color: Colors.indigo,
  //         ),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          // child: Transform.translate(
          //   offset: Offset(slide.value, slide.value),
          //   child: Transform.rotate(
          //     angle: rotateTween.value,
          //     child: AnimatedContainer(
          //       width: containerSize.width,
          //       height: containerSize.height,
          //       duration: Duration(
          //         seconds: 1,
          //       ),
          //       color: containerColor,
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
