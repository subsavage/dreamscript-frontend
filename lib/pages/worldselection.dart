import 'package:dreamscript/utils/colors.dart';
import 'package:dreamscript/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WorldSelection extends StatelessWidget {
  const WorldSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Spacer(),
          titleText("SELECT YOUR WORLD", 24.0),
          SizedBox(
            height: 25,
          ),
          button(text: "Fantasy"),
          button(text: "Medeival"),
          button(text: "Superhero"),
          Spacer(),
        ],
      ),
    );
  }
}
