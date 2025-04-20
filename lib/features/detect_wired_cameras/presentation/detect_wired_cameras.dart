import 'package:flutter/material.dart';
import 'package:spy_lens/utils/widgets/custom_app_bar.dart';

class DetectWiredCameras extends StatelessWidget {
  const DetectWiredCameras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Detect Wired Cameras", context: context),
    );
  }
}
