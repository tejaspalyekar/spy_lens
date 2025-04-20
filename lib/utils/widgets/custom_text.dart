import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.text,
      this.maxLines = 2,
      this.fontSize = 12,
      this.fontWeight = FontWeight.normal,
      this.textAlignment = TextAlign.left,
      this.fontColor = Colors.white,
      this.minFontSize = 10});
  final String text;
  final int? maxLines;
  final double? fontSize;
  final double? minFontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlignment;
  final Color? fontColor;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      softWrap: true,
      textAlign: textAlignment,
      text,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: fontColor),
      maxLines: maxLines,
      minFontSize: minFontSize!,
      overflow: TextOverflow.ellipsis,
    );
  }
}
