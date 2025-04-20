import 'package:flutter/material.dart';
import 'package:spy_lens/utils/widgets/custom_app_bar.dart';

class WifiScannerView extends StatelessWidget {
  const WifiScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Wifi Scanner", context: context),
    );
  }
}
