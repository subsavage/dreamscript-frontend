import 'package:dreamscript/pages/auth.dart';
import 'package:dreamscript/pages/startscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const AuthPage();
          } else {
            final user = snapshot.data!;
            return HomePage(
                uid: user.uid, displayName: user.displayName ?? "Guest");
          }
        },
      ),
    );
  }
}
