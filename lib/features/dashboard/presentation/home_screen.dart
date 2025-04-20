import 'package:flutter/material.dart';
import 'package:spy_lens/config/constants/app_constants.dart';
import 'package:spy_lens/features/detect_wired_cameras/presentation/detect_wired_cameras.dart';
import 'package:spy_lens/features/detect_wireless_cameras/presentation/detect_wireless_cameras.dart';
import 'package:spy_lens/features/infrared_camera/presentation/infrared_camera_view.dart';
import 'package:spy_lens/features/wifi_scanner/presentation/wifi_scanner_view.dart';
import 'package:spy_lens/utils/extension/context_extension.dart';
import 'package:spy_lens/utils/widgets/custom_app_bar.dart';
import 'package:spy_lens/utils/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          isCenter: false,
          leading: Icon(Icons.security),
          title: "Spy Lens"),
      body: Container(
        margin: EdgeInsets.symmetric(
            vertical: context.screenHeight * 0.03,
            horizontal: context.screenWidth * 0.01),
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            GridView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: contentList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.1,
                  crossAxisCount: 2,
                  crossAxisSpacing: context.screenWidth * 0.01,
                  mainAxisSpacing: context.screenHeight * 0.01),
              itemBuilder: (context, index) => ContentContainer(
                title: contentList[index][0],
                icon: contentList[index][1],
                navigationScreen: contentList[index][2],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: context.screenWidth,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 201, 201, 201),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text: "Network Status: ",
                fontColor: Colors.black,
                fontSize: headerFontSize,
                fontWeight: FontWeight.bold,
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green[100]!.withAlpha(180),
                    border: Border.all(color: Colors.green[800]!)),
                child: CustomText(
                  text: "Connected",
                  fontWeight: FontWeight.w600,
                  fontSize: subheaderFontSize,
                  fontColor: Colors.green[800],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CustomText(
                  fontColor: Colors.black,
                  fontSize: subheaderFontSize,
                  fontWeight: FontWeight.w600,
                  text: "You are connected to wifi: "),
              Spacer(),
              CustomText(
                  fontColor: Colors.black,
                  fontSize: subheaderFontSize,
                  fontWeight: FontWeight.w600,
                  text: "Harsh 5G"),
            ],
          ),
        ],
      ),
    );
  }
}

class ContentContainer extends StatelessWidget {
  const ContentContainer(
      {super.key,
      required this.title,
      required this.icon,
      required this.navigationScreen});
  final IconData icon;
  final String title;
  final Widget navigationScreen;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          context.push(navigationScreen);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: context.screenHeight * 0.02,
            children: [
              Icon(
                icon,
                size: context.screenHeight * 0.08,
              ),
              CustomText(
                textAlignment: TextAlign.center,
                text: title,
                fontSize: headerFontSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
