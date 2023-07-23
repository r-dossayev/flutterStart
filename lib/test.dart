import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  String? _title;

  void _goHome() {
    Navigator.of(context).pushNamed("/home");
  }

  Future<void> _getTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final title = prefs.getString("key");
    setState(() {
      _title = title;
    });
  }

  @override
  void initState() {
    _getTitle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(100, 2, 4, 31),
        title: Text(_title ?? ""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '122222',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goHome,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
