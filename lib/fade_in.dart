import 'package:flutter/material.dart';

class FadeIn extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  const FadeIn({Key? key, required this.child, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}
