import 'package:flutter/material.dart';

import 'animated_square.dart';
import 'fade_in.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _curve;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(
        seconds: 2,
      ),
      vsync: this,
    );

    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60),
      alignment: Alignment.center,
      child: Center(
        // child: AnimatedSquare(
        // animation: controller,
        // ),
        child: FadeIn(
          child: Test(),
          animation: controller,
        ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('123');
  }
}
