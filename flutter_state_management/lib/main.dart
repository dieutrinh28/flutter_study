import 'package:flutter/material.dart';

void main() {
  runApp(const OngBa());
}
int counterOngBa = 0;
int counterBoMe = 0;
int counterConCai = 0;
int counterCoChu = 0;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class OngBa extends StatefulWidget {
  const OngBa({Key? key}) : super(key: key);

  @override
  State<OngBa> createState() => OngBaState();
}

class OngBaState extends State<OngBa> {
  void foo() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    counterOngBa++;
    print('OngBa build lan thu $counterOngBa');

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {

                });
              },
              child: Text('OngBa build lan thu $counterOngBa'),
            ),
          ),
          BoMe(foo: foo),
          CoChu(),
        ],
      ),
    );
  }
}

class BoMe extends StatefulWidget {
  const BoMe({Key? key, this.foo}) : super(key: key);
  final VoidCallback? foo;

  @override
  State<BoMe> createState() => BoMeState();
}

class BoMeState extends State<BoMe> {

  void fooTwo() {
    setState(() {
      widget.foo!();
    });
  }

  @override
  Widget build(BuildContext context) {
    counterBoMe++;
    print('BoMe build lan thu $counterBoMe');
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  fooTwo();
                });

              },
              child: Text('BoMe build lan thu $counterBoMe'),
            ),
          ),
          ConCai(foo: fooTwo),
        ],
      ),
    );
  }
}

class ConCai extends StatefulWidget {
  const ConCai({Key? key, this.foo}) : super(key: key);
  final VoidCallback? foo;

  @override
  State<ConCai> createState() => ConCaiState();
}

class ConCaiState extends State<ConCai> {
  @override
  Widget build(BuildContext context) {
    counterConCai++;
    print('ConCai build lan thu $counterConCai');

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.foo!();

                });

              },
              child: Text('ConCai build lan thu $counterConCai'),
            ),
          )
        ],
      ),
    );
  }
}

class CoChu extends StatefulWidget {
  const CoChu({Key? key}) : super(key: key);

  @override
  State<CoChu> createState() => CoChuState();
}

class CoChuState extends State<CoChu> {
  @override
  Widget build(BuildContext context) {
    counterCoChu++;
    print('CoChu build lan thu $counterCoChu');

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {

                });
              },
              child: Text('CoChu build lan thu $counterCoChu'),
            ),
          ),
        ],
      ),
    );
  }
}



