import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_lens/features/dashboard/widgets/content_container.dart';
import 'package:spy_lens/features/dashboard/widgets/wifi_info_header.dart';
import 'package:spy_lens/features/detect_wired_cameras/presentation/detect_wired_cameras.dart';
import 'package:spy_lens/features/detect_wireless_cameras/presentation/detect_wireless_cameras.dart';
import 'package:spy_lens/features/infrared_camera/presentation/infrared_camera_view.dart';
import 'package:spy_lens/features/wifi_scanner/domain/bloc/wifi_scanner_bloc.dart';
import 'package:spy_lens/features/wifi_scanner/presentation/wifi_scanner_view.dart';
import 'package:spy_lens/utils/extension/context_extension.dart';
import 'package:spy_lens/utils/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final List<List> contentList = [
    ["Detect Wired Camera", Icons.camera_indoor, DetectWiredCameras()],
    [
      "Detect Wireless Camera",
      Icons.wifi_2_bar_rounded,
      DetectWirelessCameras()
    ],
    [
      "Detect Infrared Camera",
      Icons.perm_device_information_rounded,
      DetectInfraredCameras()
    ],
    ["Wifi Scanning", Icons.wifi_find_sharp, WifiScannerView()]
  ];

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

    final wifiScannerBloc = context.read<WifiScannerBloc>();
    if (!wifiScannerBloc.state.isWifiConnected!) {
      wifiScannerBloc.add(CheckNetworkConnectivityEvent(context));
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        isCenter: false,
        leading: const Icon(Icons.security, color: Color(0xFF1E88E5)),
        title: "Spy Lens",
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: context.screenHeight * 0.02,
          horizontal: context.screenWidth * 0.03,
        ),
        child: Column(
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: const WifiInfoHeader(),
            ),
            SizedBox(height: context.screenHeight * 0.03),
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: contentList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    crossAxisSpacing: context.screenWidth * 0.03,
                    mainAxisSpacing: context.screenHeight * 0.02,
                  ),
                  itemBuilder: (context, index) => ContentContainer(
                    title: contentList[index][0],
                    icon: contentList[index][1],
                    navigationScreen: contentList[index][2],
                    animationDelay: index * 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
