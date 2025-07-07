
import 'package:flutter/material.dart';

class BBSTextView extends StatelessWidget {
  final String content;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  BBSTextView(
      {required this.content, this.textStyle, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Text(
        content,
        style: textStyle,
      ),
    );
  }
}
