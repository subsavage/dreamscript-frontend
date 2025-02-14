import 'package:dreamscript/pages/auth.dart';
import 'package:dreamscript/pages/startscreen.dart';
import 'package:dreamscript/pages/story_page.dart';
import 'package:dreamscript/pages/worldselection.dart';
import 'package:dreamscript/services/wrapper.dart';
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
      routes: {
        // '/': (context) => const Wrapper(),
        '/': (context) => const StoryPage(),
        '/auth': (context) => const AuthPage(),
        '/worldselection': (context) => const WorldSelection(),
        '/storypage': (context) => const StoryPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
