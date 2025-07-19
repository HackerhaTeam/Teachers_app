import 'package:flutter_bloc/flutter_bloc.dart';
import 'reorder_sessions_list_state.dart';

class ReorderSessionsListCubit extends Cubit<ReorderSessionsListState> {
  ReorderSessionsListCubit({required List<Map<String, dynamic>> items})
    : super(
        ReorderSessionsListInitialState(items: List<Map<String, dynamic>>.from(items)),
      );

void onReorder(int oldIndex, int newIndex) {
  final List<Map<String, dynamic>> items = List<Map<String, dynamic>>.from(state.items);

  if (oldIndex < newIndex) newIndex -= 1;

  final item = items.removeAt(oldIndex);
  items.insert(newIndex, item);

  emit(ReorderedSessionsListState(items: items));
}

}
