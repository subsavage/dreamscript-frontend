import 'package:dreamscript/pages/auth.dart';
import 'package:dreamscript/pages/startscreen.dart';
import 'package:dreamscript/widgets/common.dart';
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
            return Center(child: loadingAnimation());
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
