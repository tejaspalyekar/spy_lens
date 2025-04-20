import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spy_lens/utils/widgets/custom_text.dart';
import 'package:toastification/toastification.dart';

extension ContextExtension on BuildContext {
  //mediaQuery
  get screenWidth => MediaQuery.of(this).size.width;
  get screenHeight => MediaQuery.of(this).size.height;

  //navigation

  pop() => Navigator.of(this).pop();
  push(Widget routeName) => Navigator.of(this).push(CupertinoPageRoute(
        builder: (context) => routeName,
      ));

  showToast(
      {required String title,
      ToastificationStyle toastStyle = ToastificationStyle.simple,
      ToastificationType toastType = ToastificationType.info}) {
    return toastification.show(
      padding: EdgeInsets.all(10),
      alignment: Alignment.bottomCenter,
      foregroundColor: Colors.black,
      applyBlurEffect: true,
      type: toastType,
      style: toastStyle,
      context: this,
      title: CustomText(text: title),
      autoCloseDuration: const Duration(seconds: 5),
    );
  }
}
