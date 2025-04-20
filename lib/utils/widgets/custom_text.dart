import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.text,
      this.maxLines,
      this.fontSize,
      this.fontWeight,
      this.minFontSize});
  final String text;
  int? maxLines = 2;
  double? fontSize = 12;
  double? minFontSize = 10;
  FontWeight? fontWeight = FontWeight.normal;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      maxLines: maxLines,
      minFontSize: minFontSize!,
      overflow: TextOverflow.ellipsis,
    );
  }
}
