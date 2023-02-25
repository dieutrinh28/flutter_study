import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySettings extends ChangeNotifier {
  String text = 'this is text';
  Color color = Colors.blue;
  var random = Random();

  void changeText() {
    text = String.fromCharCodes(
      List.generate(10, (index) => random.nextInt(26) + 97),
    );
    notifyListeners();
  }

  void changeColor() {
    var randomHex =
        '0xff${random.nextInt(0xffffff).toRadixString(16).padLeft(6, '0')}';
    color = Color(int.parse(randomHex));
    notifyListeners();
  }

  set newColor(Color newColor) {
    color = newColor;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MySettings>(
      builder: (context, mySettings, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Provider with consumer'),
            backgroundColor: mySettings.color,
          ),
          drawer: Drawer(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      mySettings.changeColor();
                      //mySettings.color = Colors.green;
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        mySettings.color,
                      ),
                    ),
                    child: const Text('Change color'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      mySettings.changeText();
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        mySettings.color,
                      ),
                    ),
                    child: const Text('Random text'),
                  ),
                ],
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    mySettings.newColor = Colors.red;
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      mySettings.color,
                    ),
                  ),
                  child: const Text('Color red'),
                ),
                ElevatedButton(
                  onPressed: mySettings.changeText,
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      mySettings.color,
                    ),
                  ),
                  child: const Text('Random text'),
                ),
                Text(mySettings.text),
              ],
            ),
          ),
        );
      },
    );
  }
}
