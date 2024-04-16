import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDSC 모바일 스터디 4주차',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GDSC 모바일 스터디'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            CustomPaintWidget(painter: FirstCustomPainter()),
            const SizedBox(height: 16),
            CustomPaintWidget(painter: SecondCustomPainter()),
            const SizedBox(height: 16),
            CustomPaintWidget(painter: ThirdCustomPainter()),
          ],
        ),
      ),
    );
  }
}

class CustomPaintWidget extends StatelessWidget {
  final CustomPainter painter;

  const CustomPaintWidget({super.key, required this.painter});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 100),
      painter: painter,
    );
  }
}

class FirstCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final double radius = size.height / 2;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(
        Offset(size.width - radius, size.height),
        radius: Radius.circular(radius),
        clockwise: true,
      )
      ..lineTo(0, size.height)
      ..arcToPoint(
        const Offset(0, 0),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SecondCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final double radius = size.height / 2;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..arcToPoint(
        Offset(size.width, size.height),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(0, size.height)
      ..arcToPoint(
        const Offset(0, 0),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ThirdCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final double radius = size.height / 2;

    final path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(
        Offset(size.width - radius, size.height),
        radius: Radius.circular(radius),
        clockwise: true,
      )
      ..lineTo(radius, size.height)
      ..arcToPoint(
        Offset(radius, 0),
        radius: Radius.circular(radius),
        clockwise: true,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
