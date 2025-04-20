import 'dart:async' show StreamSubscription;
import 'dart:developer' show log;
import 'package:permission_handler/permission_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:spy_lens/config/constants/app_constants.dart';
import 'package:spy_lens/utils/widgets/custom_text.dart';
import 'package:toastification/toastification.dart';

part 'wifi_scanner_event.dart';
part 'wifi_scanner_state.dart';

class WifiScannerBloc extends Bloc<WifiScannerEvent, WifiScannerState> {
  late final StreamSubscription _connectivitySubscription;

  WifiScannerBloc() : super(WifiScannerState(isWifiConnected: false)) {
    final info = NetworkInfo();
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      // Dispatch a new event instead of emitting directly
      add(_WifiConnectivityChangedEvent(result));
    });

    on<CheckNetworkConnectivityEvent>((event, emit) async {
      emit(WifiScannerState(isLoading: true));
    });

    on<_WifiConnectivityChangedEvent>((event, emit) async {
      try {
        final isConnected = event.results.contains(ConnectivityResult.wifi);

        if (isConnected) {
          await requestLocationPermission();
          final wifiName = await info.getWifiName();
          final wifiIP = await info.getWifiIP();
          emit(WifiScannerState(
              isLoading: false,
              isWifiConnected: isConnected,
              connectedWifiName: wifiName,
              connectedWifiIP: wifiIP));
          toastification.show(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            foregroundColor: Colors.black,
            style: ToastificationStyle.flat,
            applyBlurEffect: true,
            backgroundColor: Color.fromARGB(255, 156, 255, 147),
            type: ToastificationType.info,
            context: event.context,
            title: CustomText(
              fontWeight: FontWeight.bold,
              fontSize: subheaderFontSize,
              text: "Connected To WIFI",
              fontColor: Colors.white,
            ),
            autoCloseDuration: const Duration(seconds: 3),
          );
        } else {
          emit(
              WifiScannerState(isWifiConnected: isConnected, isLoading: false));
          toastification.show(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            style: ToastificationStyle.flat,
            applyBlurEffect: true,
            backgroundColor: Color.fromARGB(255, 255, 242, 67),
            type: ToastificationType.info,
            context: event.context,
            title: CustomText(
              fontWeight: FontWeight.bold,
              fontSize: subheaderFontSize,
              text: "WIFI Disconnected",
              fontColor: Colors.white,
            ),
            autoCloseDuration: const Duration(seconds: 3),
          );
        }
      } catch (e) {
        log(e.toString());
      }
    });
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
