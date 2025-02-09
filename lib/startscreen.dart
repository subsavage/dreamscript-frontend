import 'package:dreamscript/utils/colors.dart';
import 'package:dreamscript/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            onTap: () => Navigator.pushNamed(context, '/worldselection'),
            child: button(text: "Start"),
          ),
          button(text: "Instructions"),
          Spacer(),
        ],
      ),
    );
  }
}
