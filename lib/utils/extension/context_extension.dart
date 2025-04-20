import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  //mediaQuery
  get screenWidth => MediaQuery.of(this).size.width;
  get screenHeight => MediaQuery.of(this).size.height;

  //navigation

  pop() => Navigator.of(this).pop();
  push(Widget routeName) => Navigator.of(this).push(CupertinoPageRoute(
        builder: (context) => routeName,
      ));
}
