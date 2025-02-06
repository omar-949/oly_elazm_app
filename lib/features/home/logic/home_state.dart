

import 'package:oly_elazm/features/home/data/models/student/assigned_task_model.dart';
import 'package:oly_elazm/features/home/data/models/teacher/all_student_model.dart';

import '../../../../core/helpers/operation_state.dart';

/// Represents the entire authentication state.
class HomeState {
  final OperationState allStudentsState;
  final AllStudentModel? allStudents;
  final OperationState assignedTask;
  final AssignedTaskModel? assignedTaskModel;


  const HomeState({
    this.allStudentsState = const OperationState(),
    this.allStudents,
    this.assignedTask = const OperationState(),
    this.assignedTaskModel


  });

  /// Returns a new instance of [HomeState] with updated values.
  HomeState copyWith({
    OperationState? allStudentsState,
    AllStudentModel? allStudents,
    OperationState? assignedTask,
    AssignedTaskModel? assignedTaskModel

  }) {
    return HomeState(
      allStudentsState: allStudentsState ?? this.allStudentsState,
      allStudents: allStudents ?? this.allStudents,
      assignedTask: assignedTask ?? this.assignedTask,
      assignedTaskModel: assignedTaskModel ?? this.assignedTaskModel

    );
  }
}
