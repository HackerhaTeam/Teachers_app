import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_hackerha/features/student/presentation/manager/student_list_state.dart';

class StudentListCubit extends Cubit<StudentListState> {
  StudentListCubit() : super(StudentListInitialState());

  void updateExpandedIndex(int index) {
    if (state.expandedIndex == index) {
      state.expandedIndex = null;
    } else {
      state.expandedIndex = index;
    }

    emit(StudentListUpdateState(expandedIndex: state.expandedIndex));
  }


  bool isExpanded(int index)
  {
    return state.expandedIndex==index;
  }
}
