import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GDSC 모바일 스터디 3주차',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        useMaterial3: true,
      ),
      // bold
      home: const MyHomeworkPage(title: 'GDSC 모바일 스터디'),
    );
  }
}

class MyHomeworkPage extends StatelessWidget {
  const MyHomeworkPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Theme.of(context).colorScheme.background,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: Colors.grey,
              height: 0.5,
            ),
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text('과제',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)))
              ]),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MyCard(title: '오늘의 과제', icon: Icons.book),
                    MyCard(title: '수행한 과제', icon: Icons.collections_bookmark)
                  ]),
              Row(children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text('나의 수행도',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)))
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context)
                          .cardColor, // Card's background color
                      boxShadow: const [
                        BoxShadow(
                          color: Color(
                              0x40000000), // Hexadecimal code for #00000040
                          blurRadius:
                              10.0, // The blur radius used to create the shadow
                          spreadRadius:
                              0.0, // The extent of the shadow's spread area
                          offset:
                              Offset(0, 0), // The x,y coordinates of the shadow
                        ),
                      ],
                    ),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2024, 4, 1),
                      lastDay: DateTime.utc(2024, 4, 30),
                      focusedDay: DateTime.now(),
                    ),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text('나의 다짐',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)))
              ]),
              Row(children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text('과제를 모두 죽이겠다. 그르르르',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)))
              ])
            ])));
  }
}

class MyCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const MyCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor, // Card's background color
              boxShadow: const [
                BoxShadow(
                  color: Color(0x40000000), // Hexadecimal code for #00000040
                  blurRadius: 10.0, // The blur radius used to create the shadow
                  spreadRadius: 0.0, // The extent of the shadow's spread area
                  offset: Offset(0, 0), // The x,y coordinates of the shadow
                ),
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 10),
                  // 투명하게 채우기
                  Icon(icon, size: 60)
                ])));
  }
}
