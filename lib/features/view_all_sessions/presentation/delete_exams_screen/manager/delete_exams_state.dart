abstract class DeleteExamsState {
  final List<int?> selectedIndexes;
  final List<Map<String, dynamic>> examsItems;

  DeleteExamsState({
    required this.selectedIndexes,
    required this.examsItems,
  });
}

class DeleteExamsInitial extends DeleteExamsState {
  DeleteExamsInitial({
    required super.selectedIndexes,
    required super.examsItems,
  });
}

class DeleteExamsUpdated extends DeleteExamsState {
  DeleteExamsUpdated({
    required super.selectedIndexes,
    required super.examsItems,
  });
}

class DeleteExamsAllSelected extends DeleteExamsState {
  DeleteExamsAllSelected({
    required super.selectedIndexes,
    required super.examsItems,
  });
}

class DeleteExamsNoneSelected extends DeleteExamsState {
  DeleteExamsNoneSelected({
    required super.selectedIndexes,
    required super.examsItems,
  });
}
