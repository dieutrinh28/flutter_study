import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'useSetState.dart';
import 'useProvider.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (_) => CounterProvider(),
  child: const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ),));
}
