import 'package:dreamscript/pages/story_page.dart';
import 'package:dreamscript/utils/colors.dart';
import 'package:dreamscript/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WorldSelection extends StatefulWidget {
  const WorldSelection({super.key});

  @override
  State<WorldSelection> createState() => _WorldSelectionState();
}

class _WorldSelectionState extends State<WorldSelection> {
  void navigateToStoryPage(BuildContext context, String world) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryPage(world: world),
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
          titleText("SELECT YOUR WORLD", 24.0),
          SizedBox(height: 25),
          button(
              text: "Fantasy",
              onTap: () => navigateToStoryPage(context, "Fantasy")),
          button(
              text: "Medieval",
              onTap: () => navigateToStoryPage(context, "Medieval")),
          button(
              text: "Superhero",
              onTap: () => navigateToStoryPage(context, "Superhero")),
          Spacer(),
        ],
      ),
    );
  }
}
