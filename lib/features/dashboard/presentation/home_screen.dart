import 'package:flutter/material.dart';
import 'package:spy_lens/utils/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          isCenter: false,
          leading: Icon(Icons.security),
          title: "Spy Lens"),
    );
  }
}
