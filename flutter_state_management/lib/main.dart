import 'package:flutter/material.dart';
import 'package:flutter_state_management/multiConsumer.dart';
import 'package:provider/provider.dart';

import 'useSetState.dart';
import 'useProvider.dart';
import 'consumer.dart';
import 'multiProvider.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => CounterProvider(),
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: HomeScreen(),
//       ),
//     ),
//   );
// }

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => MySettings(),
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: MyApp(),
//       ),
//     ),
//   );
// }

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => MyMultiProvider()),
//         ChangeNotifierProvider(create: (_) => Counter())
//       ],
//       child: const MyMulti(),
//     ),
//   );
// }

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GioiTinh()),
        ChangeNotifierProvider(create: (_) => BangCap())
      ],
      child: const MaterialApp(home: MyMultiConsumer()),
    ),
  );
}
