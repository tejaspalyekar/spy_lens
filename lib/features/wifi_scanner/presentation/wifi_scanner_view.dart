import 'package:flutter/material.dart';
import 'package:spy_lens/config/constants/app_constants.dart';
import 'package:spy_lens/features/dashboard/widgets/wifi_info_header.dart';
import 'package:spy_lens/utils/extension/context_extension.dart';
import 'package:spy_lens/utils/widgets/custom_app_bar.dart';
import 'package:spy_lens/utils/widgets/custom_text.dart';

class WifiScannerView extends StatefulWidget {
  const WifiScannerView({super.key});

  @override
  State<WifiScannerView> createState() => _WifiScannerViewState();
}

class _WifiScannerViewState extends State<WifiScannerView>
    with SingleTickerProviderStateMixin {
  late Animation<double> _fadeAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Wifi Scanner", context: context),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: context.screenHeight * 0.02,
        horizontal: context.screenWidth * 0.03,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: const WifiInfoHeader(),
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          CustomText(
            text: "Connected Devices:",
            fontSize: subheaderFontSize,
          )
        ],
      ),
    );
  }
}
