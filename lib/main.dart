import 'package:flutter/material.dart';

import 'example_animation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animation !'),
        ),
        // body: MainWidget(),
        body: ExampleAnimationWidget(),
      ),
    );
  }
}