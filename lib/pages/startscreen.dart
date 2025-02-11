import 'package:dreamscript/utils/colors.dart';
import 'package:dreamscript/widgets/common.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Spacer(),
          titleText("DREAMSCRIPT", 34.0),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/worldselection'),
            child: button(text: "Start"),
          ),
          button(text: "Instructions"),
          Text(
            "SIgned in as, $userName!",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
