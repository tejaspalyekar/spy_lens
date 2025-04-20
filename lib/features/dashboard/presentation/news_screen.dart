import 'package:flutter/material.dart';
import 'package:spy_lens/utils/widgets/custom_app_bar.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "World Wide News"),
    );
  }
}
