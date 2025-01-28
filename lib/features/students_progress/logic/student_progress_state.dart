

import 'package:oly_elazm/features/students_progress/data/models/teacher/student_details.dart';

import '../../../../core/helpers/operation_state.dart';

/// Represents the entire authentication state.
class StudentProgressState {
  final OperationState studentsDetailsState;
  final StudentDetailsModel? studentsDetailsData;
  final OperationState giveTaskState;
  final OperationState addReviewState ;
  final int? verifyCode ;

  const StudentProgressState({
    this.studentsDetailsState = const OperationState(),
    this.studentsDetailsData,
    this.giveTaskState = const OperationState(),
    this.addReviewState = const OperationState(),
    this.verifyCode,
  });

  /// Returns a new instance of [StudentProgressState] with updated values.
  StudentProgressState copyWith({
    OperationState? studentsDetailsState,
    StudentDetailsModel? studentsDetailsData,
    OperationState? giveTaskState,
    OperationState? addReviewState,
    int? verifyCode
  }) {
    return StudentProgressState(
      studentsDetailsState: studentsDetailsState ?? this.studentsDetailsState,
      studentsDetailsData: studentsDetailsData ?? this.studentsDetailsData,
      giveTaskState: giveTaskState ?? this.giveTaskState,
      addReviewState: addReviewState ?? this.addReviewState,
      verifyCode: verifyCode ?? this.verifyCode
    );
  }
}
