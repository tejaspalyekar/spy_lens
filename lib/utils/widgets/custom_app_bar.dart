import 'package:flutter/material.dart';
import 'package:spy_lens/config/constants/app_constants.dart';
import 'package:spy_lens/utils/extension/context_extension.dart';
import 'package:spy_lens/utils/widgets/custom_text.dart';

PreferredSizeWidget? customAppBar(
    {required String title,
    required BuildContext context,
    List<Widget>? actions,
    Widget? leading,
    bool isCenter = true}) {
  return AppBar(
    centerTitle: isCenter,
    leading: leading,
    title: TweenAnimationBuilder(
      tween: Tween<double>(begin: context.screenHeight * 0.015, end: 0),
      duration: Duration(milliseconds: 300),
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.only(bottom: value),
        child: CustomText(
          text: title,
          fontSize: headerFontSize,
          maxLines: 1,
          minFontSize: subheaderFontSize,
        ),
      ),
    ),
    actions: actions,
  );
}
