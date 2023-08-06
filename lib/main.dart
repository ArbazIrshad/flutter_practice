import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationBasicsApp());
}

class AnimationBasicsApp extends StatelessWidget {
  const AnimationBasicsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation Basics',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        size: Size.infinite,
        painter: SquareCustomPainter(),
        // child: Column(
        //   children: [
        //     // Text('Hello from the other side')
        //     // Expanded(
        //     //     child: Container(
        //     //         // color: Colors.teal,
        //     //         ))
        //   ],
        // ),
      ),
    );
  }
}

class SquareCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF006600);
    final path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(0, size.height / 2);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawLine(
        Offset(20, size.height / 2),
        Offset(size.width - 20, size.height / 2),
        paint
          ..color = Colors.black
          ..strokeWidth = 5);
    // canvas.close();
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 4,
        Paint()..color = Colors.yellow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
