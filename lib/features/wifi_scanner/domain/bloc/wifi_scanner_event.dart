part of 'wifi_scanner_bloc.dart';

abstract class WifiScannerEvent {}

class CheckNetworkConnectivityEvent extends WifiScannerEvent {
  BuildContext context;
  CheckNetworkConnectivityEvent(this.context);
}

// Private internal event to handle stream changes
class _WifiConnectivityChangedEvent extends WifiScannerEvent {
  final List<ConnectivityResult> results;
  final BuildContext? context;

  _WifiConnectivityChangedEvent(this.results, {this.context});
}
