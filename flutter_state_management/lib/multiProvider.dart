import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMultiProvider extends ChangeNotifier {
  bool _isDark = false;

  get isDark => _isDark;

  void setBrightness(bool value) {
    _isDark = value;
    notifyListeners();
  }
}

class Counter extends ChangeNotifier {
  int _myCounter = 0;
  get myValue => _myCounter;

  void add() {
    _myCounter++;
    notifyListeners();
  }
}

class MyMulti extends StatelessWidget {
  const MyMulti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: context.watch<MyMultiProvider>().isDark
            ? Brightness.dark
            : Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: const MyMultiPage(),
    );
  }
}

class MyMultiPage extends StatelessWidget {
  const MyMultiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Multi Provider'),
        actions: [
          Switch(
            value: context.watch<MyMultiProvider>().isDark,
            onChanged: (newValue) {
              context.read<MyMultiProvider>().setBrightness(newValue);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times'),
            Text(
              context.watch<Counter>().myValue.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<Counter>().add();
        },
      ),
    );
  }
}
