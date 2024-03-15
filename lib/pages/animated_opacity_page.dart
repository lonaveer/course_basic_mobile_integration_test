import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedOpacityPageApp());
}

class AnimatedOpacityPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedOpacityPage App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedOpacityPage(),
    );
  }
}

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // เริ่มต้น animation หลังจาก build ครั้งแรก
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0; // เปลี่ยนค่า opacity ไปยัง 1.0
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Opacity Demo')),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 2), // ระยะเวลาของ animation
          child: Text(
            'Hello, World!',
            key: Key('animatedText'),
            style: TextStyle(
              fontSize: 36.0,
            ),
          ),
        ),
      ),
    );
  }
}