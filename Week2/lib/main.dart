import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Week2"),
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
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          // 중앙 정렬된 단일 Column
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              // 첫 번째 행의 상자들
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBox(Colors.red),
                _buildBox(Colors.blue),
              ],
            ),
            Row(
              // 두 번째 행의 상자들
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBox(Colors.yellow),
                _buildBox(Colors.green),
              ],
            ),
            Padding(
              // 바로 아래의 텍스트
              padding: EdgeInsets.all(16.0),
              child: Text('유우비트', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  // 상자 중복 코드를 줄이기 위한 함수
  Widget _buildBox(Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.all(8.0),
      height: 130,
      width: 130,
    );
  }
}
