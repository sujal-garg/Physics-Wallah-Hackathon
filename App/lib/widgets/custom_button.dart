import 'package:flutter/material.dart';
import 'package:infosys_aarohan_app/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.constants,
      required this.height,
      required this.width,
      required this.onTap,
      required this.title,
      required this.color,
      required this.textColor});

  final Constants constants;
  String title;
  void Function()? onTap;
  double height;
  double width;
  Color color;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
        ),
      ),
    );
  }
}