import 'package:flutter/widgets.dart';
import 'package:spy_lens/features/dashboard/presentation/home_screen.dart';
import 'package:spy_lens/features/dashboard/presentation/news_screen.dart';
import 'package:spy_lens/features/dashboard/presentation/tips_screen.dart';

class DashboardState {
  DashboardState(this.index);

  List<Widget> screens = [HomeScreen(), TipsScreen(), NewsScreen()];
  int index;
}
