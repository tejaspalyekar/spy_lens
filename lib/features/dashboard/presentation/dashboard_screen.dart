import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spy_lens/features/dashboard/domain/dashboard_bloc.dart';
import 'package:spy_lens/features/dashboard/domain/dashboard_event.dart';
import 'package:spy_lens/features/dashboard/domain/dashboard_state.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, dashboardState) {
        return Scaffold(
          body: dashboardState.screens[dashboardState.index],
          bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 13,
              unselectedFontSize: 11,
              showUnselectedLabels: true,
              onTap: (index) {
                final dashboardBloc = context.read<DashboardBloc>();
                dashboardBloc.add(UpdateDashboardIndexEvent(newIndex: index));
              },
              currentIndex: dashboardState.index,
              items: const [
                BottomNavigationBarItem(
                    label: "Tools", icon: Icon(Icons.dashboard_rounded)),
                BottomNavigationBarItem(
                    label: "Tips", icon: Icon(Icons.tips_and_updates_outlined)),
                BottomNavigationBarItem(
                    label: "News", icon: Icon(Icons.south_america)),
                // BottomNavigationBarItem(
                //     label: "4", icon: Icon(Icons.dashboard_rounded))
              ]),
        );
      },
    );
  }
}