import 'package:dreamscript/utils/colors.dart';
import 'package:flutter/material.dart';

class button extends StatefulWidget {
  final String text;

  const button({Key? key, required this.text}) : super(key: key);

  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
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
