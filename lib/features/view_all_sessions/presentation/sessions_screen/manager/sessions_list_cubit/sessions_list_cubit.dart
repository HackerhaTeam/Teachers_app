import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/sessions_screen/manager/sessions_list_cubit/sessions_list_state.dart';

class SessionsListCubit extends Cubit<SessionsListState> {
  SessionsListCubit({required List<Map<String, dynamic>> items})
    : super(SessionsListInitialState(items: items));

  updateListOrder(List<Map<String, dynamic>> items) {
    final List<Map<String, dynamic>> updtedItems = List<Map<String, dynamic>>.from(
      state.items,
    );

    updtedItems
      ..clear()
      ..addAll(items);
    emit(SessionsListUpdateState(items: updtedItems));
  }
}
