import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_painter/sky.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Painter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Painting like a pro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  @override
  void initState() {
    super.initState();
    Duration tenth = Duration(milliseconds: 100);
    Timer.periodic(tenth, (_) => setState(() => count++));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => setState(() => count = 0),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: CustomPaint(
        painter: Sky(count),
        child: Center(
          child: Text(
            widget.title.toUpperCase(),
            style: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
