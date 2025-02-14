import 'package:dreamscript/utils/colors.dart';
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

  /// **Chat Options (Initially Visible)**
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

  /// **Reusable Button for Chat Options**
  Widget chatOptionButton(String text, dynamic icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon is String
          ? Image.asset(icon, width: 20, height: 20)
          : Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

/// **Chat Field (Visible When "Write" is Clicked)**
Widget chatField(
    {required VoidCallback onSend, required VoidCallback onWandTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onWandTap, // **Switch back to chat options when tapped**
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black, width: 2),
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/icons/magic-wand.png",
              scale: 20,
            ),
          ),
        ),
      ),
      Expanded(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Type Your Story..",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      MaterialButton(
        onPressed: onSend,
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        shape: const CircleBorder(),
        child: const Icon(Icons.send),
      ),
    ],
  );
}
