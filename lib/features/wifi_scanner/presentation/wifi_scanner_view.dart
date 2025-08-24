import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_tools/network_tools.dart';
import 'package:spy_lens/config/constants/app_constants.dart';
import 'package:spy_lens/features/dashboard/widgets/wifi_info_header.dart';
import 'package:spy_lens/features/wifi_scanner/domain/bloc/wifi_scanner_bloc.dart';
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
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) => scanNetwork());
  }

  scanNetwork() async {
    String address =
        context.read<WifiScannerBloc>().state.connectedWifiIP ?? "";
    // or You can also get address using network_info_plus package
    // final String? address = await (NetworkInfo().getWifiIP());
    final String subnet = address.substring(0, address.lastIndexOf('.'));
    final stream = HostScannerService.instance.getAllPingableDevices(subnet,
        firstHostId: 1, lastHostId: 50, progressCallback: (progress) {
      log('Progress for host discovery : $progress');
    });

    stream.listen((host) async {
      // Vendor? hostName = await host.vendor;
      // //Same host can be emitted multiple times
      // //Use Set<ActiveHost> instead of List<ActiveHost>
      // log('Found device: ${hostName!.vendorName}');
    }, onDone: () {
      log('Scan completed');
    }); // Don't forget to cancel the stream when not in use.
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
