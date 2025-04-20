import 'package:meta/meta.dart';

@immutable
abstract class DashboardEvent {}

class UpdateDashboardIndexEvent extends DashboardEvent {
  final int newIndex;
  UpdateDashboardIndexEvent({required this.newIndex});
}
