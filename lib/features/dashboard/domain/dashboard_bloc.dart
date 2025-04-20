import 'package:bloc/bloc.dart';
import 'package:spy_lens/features/dashboard/domain/dashboard_event.dart';
import 'package:spy_lens/features/dashboard/domain/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState(0)) {
    on<UpdateDashboardIndexEvent>((event, emit) {
      emit(DashboardState(event.newIndex));
    });
  }
}
