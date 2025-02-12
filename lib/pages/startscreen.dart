import 'package:dreamscript/services/auth_services.dart';
import 'package:dreamscript/utils/colors.dart';
import 'package:dreamscript/widgets/common.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String uid;
  final String displayName;

  const HomePage({super.key, required this.uid, required this.displayName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            titleText("DREAMSCRIPT", 34.0),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/home',
                  arguments: {"uid": uid, "userName": displayName},
                );
              },
              child: button(text: "Start"),
            ),
            button(text: "Instructions"),
            const SizedBox(height: 30),
            Text(
              "Welcome, $displayName!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "User ID: $uid",
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
            TextButton(
              onPressed: () async {
                await AuthService().signOut();
                Navigator.pushReplacementNamed(context, "/auth");
              },
              child: const Text("Sign Out"),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
