import 'package:flutter/material.dart';
import 'package:spy_lens/utils/widgets/custom_app_bar.dart';

class DetectWirelessCameras extends StatelessWidget {
  const DetectWirelessCameras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Detect Wireless Cameras", context: context),
    );
  }
}
