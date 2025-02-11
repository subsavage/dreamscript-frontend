import 'package:dreamscript/pages/auth.dart';
import 'package:dreamscript/pages/startscreen.dart';
import 'package:dreamscript/pages/worldselection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DreamScript',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final String userName = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => HomePage(userName: userName),
          );
        }
        return null; // Default fallback
      },
      routes: {
        '/': (context) => const AuthPage(),
        '/auth': (context) => const AuthPage(),
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
