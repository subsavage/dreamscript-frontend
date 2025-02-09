import 'package:dreamscript/startscreen.dart';
import 'package:dreamscript/worldselection.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DreamScript',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/worldselection': (context) => const WorldSelection(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
