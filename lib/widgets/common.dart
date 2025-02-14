import 'package:dreamscript/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class button extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const button({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  State<button> createState() => _ButtonState();
}

class _ButtonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: GestureDetector(
        // Added GestureDetector
        onTap: widget.onTap,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: AppColors.buttonTextColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget titleText(String text, double fontsize) {
  return Center(
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.titleText,
        fontSize: fontsize,
        fontFamily: 'HandwritingDraftShaded',
      ),
    ),
  );
}

Widget loadingAnimation() {
  return SizedBox(
    height: 150,
    child: Lottie.asset("assets/loading.json"),
  );
}

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

Widget chatOptionButton(String text, dynamic icon, VoidCallback onPressed) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon is String
          ? Image.asset(
              icon,
              width: 20,
              height: 25,
            )
          : Icon(
              icon,
              size: 25,
            ),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
