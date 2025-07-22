import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/view_all_sessions/presentation/delete_exams_screen/manager/delete_exams_state.dart';

class DeleteExamsCubit extends Cubit<DeleteExamsState> {
  DeleteExamsCubit({required this.items})
    : super(
        DeleteExamsInitial(
          examsItems: List<Map<String, dynamic>>.from(
            items.where((item) => item['type'] == 'exam'),
          ),
          selectedIndexes: List<int?>.filled(
            items.where((item) => item['type'] == 'exam').length,
            null,
          ),
        ),
      );

  final List<Map<String, dynamic>> items;

  void selectIndex(int index) {
    final updatedSelection = List<int?>.from(state.selectedIndexes);
    updatedSelection[index] = updatedSelection[index] == null ? index : null;

    emit(
      _isAllSelected(updatedSelection)
          ? DeleteExamsAllSelected(
            selectedIndexes: updatedSelection,
            examsItems: state.examsItems,
          )
          : DeleteExamsUpdated(
            selectedIndexes: updatedSelection,
            examsItems: state.examsItems,
          ),
    );
  }

  void toggleSelectAll() {
    final int length = state.selectedIndexes.length;

    final updatedSelection =
        _isAllSelected(state.selectedIndexes)
            ? List<int?>.filled(length, null)
            : List.generate(length, (i) => i);

    emit(
      _isAllSelected(updatedSelection)
          ? DeleteExamsAllSelected(
            selectedIndexes: updatedSelection,
            examsItems: state.examsItems,
          )
          : DeleteExamsNoneSelected(
            selectedIndexes: updatedSelection,
            examsItems: state.examsItems,
          ),
    );
  }

  bool _isAllSelected(List<int?> selection) {
    final expected = List.generate(selection.length, (i) => i);
    return listEquals(selection, expected);
  }
}
