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
        '/': (context) => const Wrapper(),
        '/auth': (context) => const AuthPage(),
        '/worldselection': (context) => const WorldSelection(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/storypage') {
          final args = settings.arguments as String?;
          if (args != null) {
            return MaterialPageRoute(
              builder: (context) => StoryPage(world: args),
            );
          }
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
