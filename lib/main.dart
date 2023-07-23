import 'package:first_app_flutter/test.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "/test": (BuildContext context) => const TestWidget(),
        "/home": (BuildContext context) => const MyHomePage(),
      },
      initialRoute: "/home",
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  Future<void> _goTestPage()async {
    Navigator.of(context).pushNamed("/test");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("key", _controller.text);

  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title??""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('insert command name:'),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 3.3, vertical: 4), child: TextField(controller: _controller) ,)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goTestPage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
