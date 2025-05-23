import 'package:flutter/material.dart';
import 'package:spy_lens/utils/widgets/custom_app_bar.dart';

class DetectInfraredCameras extends StatelessWidget {
  const DetectInfraredCameras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Detect Infrared Cameras", context: context),
    );
  }
}
