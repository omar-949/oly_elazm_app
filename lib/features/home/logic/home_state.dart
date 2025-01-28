

import 'package:oly_elazm/features/home/data/models/teacher/all_student_model.dart';

import '../../../../core/helpers/operation_state.dart';

/// Represents the entire authentication state.
class HomeState {
  final OperationState allStudentsState;
  final AllStudentModel? allStudents;
  final OperationState registerState;
  final OperationState verifyCodeState ;
  final int? verifyCode ;

  const HomeState({
    this.allStudentsState = const OperationState(),
    this.allStudents,
    this.registerState = const OperationState(),
    this.verifyCodeState = const OperationState(),
    this.verifyCode,
  });

  /// Returns a new instance of [HomeState] with updated values.
  HomeState copyWith({
    OperationState? allStudentsState,
    AllStudentModel? allStudents,
    OperationState? registerState,
    OperationState? verifyCodeState,
    int? verifyCode
  }) {
    return HomeState(
      allStudentsState: allStudentsState ?? this.allStudentsState,
      allStudents: allStudents ?? this.allStudents,
      registerState: registerState ?? this.registerState,
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
      verifyCode: verifyCode ?? this.verifyCode
    );
  }
}
