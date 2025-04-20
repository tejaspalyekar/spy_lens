import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_lens/config/theme/my_app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:spy_lens/features/dashboard/domain/dashboard_bloc.dart';
import 'package:spy_lens/features/dashboard/presentation/dashboard_screen.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode && kIsWeb,
      builder: (context) => const StartApp()));
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DashboardBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myAppTheme,
        home: const DashboardScreen(),
      ),
    );
  }
}
