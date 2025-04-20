import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_lens/features/wifi_scanner/domain/bloc/wifi_scanner_bloc.dart';
import 'package:spy_lens/utils/extension/context_extension.dart';
import 'package:spy_lens/utils/widgets/custom_text.dart';

class WifiInfoHeader extends StatelessWidget {
  const WifiInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WifiScannerBloc, WifiScannerState>(
      builder: (context, state) => Container(
        width: context.screenWidth,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1A1A1A),
              const Color(0xFF1A1A1A).withOpacity(0.9),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.wifi, color: Color(0xFF1E88E5), size: 20),
                SizedBox(width: 8),
                CustomText(
                  text: "Network Status",
                  fontColor: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: state.isWifiConnected!
                        ? Colors.green.withOpacity(0.2)
                        : Colors.red.withOpacity(0.2),
                    border: Border.all(
                      color: state.isWifiConnected! ? Colors.green : Colors.red,
                      width: 1,
                    ),
                  ),
                  child: CustomText(
                    text: state.isWifiConnected! ? "Connected" : "Disconnected",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontColor:
                        state.isWifiConnected! ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CustomText(
                  fontColor: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  text: "Connected to: ",
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                      fontColor: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      text: state.connectedWifiName != null
                          ? state.connectedWifiName!.isEmpty
                              ? "Not Connected"
                              : state.connectedWifiName!
                          : "Not Connected",
                    ),
                    if (state.connectedWifiIP != null &&
                        state.connectedWifiIP!.isNotEmpty)
                      CustomText(
                        fontColor: Colors.white54,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        text: state.connectedWifiIP!,
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
