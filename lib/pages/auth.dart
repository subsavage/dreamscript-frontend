import 'package:dreamscript/pages/startscreen.dart';
import 'package:dreamscript/services/auth_services.dart';
import 'package:dreamscript/utils/colors.dart';
import 'package:dreamscript/widgets/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthService _authService = AuthService();

  Widget googleSignInButton() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/google_logo.png",
            scale: 24,
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            "Sign in with Google",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Spacer(),
          titleText("DREAMSCRIPT", 34.0),
          const SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () async {
              User? user = await _authService.signInWithGoogle();
              if (user != null) {
                print("User signed in: ${user.displayName}");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HomePage(userName: user.displayName ?? "User"),
                  ),
                );
              }
            },
            child: googleSignInButton(),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
