import 'package:dreamscript/utils/colors.dart';
import 'package:dreamscript/widgets/common.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  bool showChatField = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          title: titleText(
            "DREAMSCRIPT",
            24,
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Story Page"),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.2),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: showChatField
                      ? chatField(
                          onSend: () {
                            setState(() {
                              showChatField = false;
                            });
                          },
                          onWandTap: () {
                            setState(() {
                              showChatField = false;
                            });
                          },
                        )
                      : chatOptions(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chatOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        chatOptionButton("Write", "assets/icons/magic-wand.png", () {
          setState(() {
            showChatField = true;
          });
        }),
        chatOptionButton("Continue", Icons.arrow_forward, () {
          // Add your functionality here
        }),
        chatOptionButton("Redo", Icons.refresh, () {
          // Add your functionality here
        }),
      ],
    );
  }
}
