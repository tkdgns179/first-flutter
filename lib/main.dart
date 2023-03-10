import 'package:flutter/material.dart';
import 'layout_page.dart' as layout;
import 'kakao_map.dart' as kakaoMap;
import 'package:flutter_config/flutter_config.dart';

// main function
void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            displaySmall: TextStyle(fontSize: 30.0),
            displayMedium: TextStyle(fontSize: 50.0),
            displayLarge: TextStyle(fontSize: 75.0),
          )),
      // home: MyHomePage(title: 'Flutter Demo Home page')
      home: layout.LayoutPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   final String title;
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0; // 언더바 -> private 접근제어자
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('You have pushed the button this many times:'),
//             Text('$_counter', style: Theme.of(context).textTheme.displaySmall)
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//           onPressed: _incrementCounter,
//           tooltip: 'Increment',
//           child: Icon(Icons.add)),
//     );
//   }
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
// }
