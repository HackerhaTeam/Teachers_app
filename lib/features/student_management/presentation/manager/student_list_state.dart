abstract class StudentListState {
   int? expandedIndex;

  StudentListState({this.expandedIndex});
}

class StudentListInitialState extends StudentListState {
  StudentListInitialState({super.expandedIndex});
}

class StudentListUpdateState extends StudentListState {
  StudentListUpdateState({super.expandedIndex});
}
