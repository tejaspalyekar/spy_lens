part of 'wifi_scanner_bloc.dart';

class WifiScannerState {
  WifiScannerState(
      {this.isWifiConnected = false,
      this.connectedWifiIP = "",
      this.connectedWifiName = "",
      this.isLoading = true});
  bool? isWifiConnected;
  String? connectedWifiName;
  String? connectedWifiIP;
  bool? isLoading;
}
