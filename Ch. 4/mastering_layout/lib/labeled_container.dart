import 'package:flutter/material.dart' show BuildContext, Center, Color, Container, StatelessWidget, Text, TextStyle, Widget;

class LabeledContainer extends StatelessWidget {
  final double? width;
  final double height;
  final Color? color;
  final String text;
  final Color? textColor;

  const LabeledContainer({
    super.key,
    this.width,
    this.height = double.infinity,
    this.color,
    required this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20
          )
        )
      )
    );
  }
}