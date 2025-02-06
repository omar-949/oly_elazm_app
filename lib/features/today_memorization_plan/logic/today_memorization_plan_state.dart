import '../../home/data/models/student/assigned_task_model.dart';

/// Represents the entire authentication state.
class MemorizationPlanState {
  AssignedTaskModel? assignedTaskModel;

  MemorizationPlanState({
    this.assignedTaskModel,
  });

  /// Returns a new instance of [MemorizationPlanState] with updated values.
  MemorizationPlanState copyWith({AssignedTaskModel? assignedTaskModel}) {
    return MemorizationPlanState(
        assignedTaskModel: assignedTaskModel ?? this.assignedTaskModel);
  }
}
