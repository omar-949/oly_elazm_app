import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/features/home/data/models/student/assigned_task_model.dart';
import 'package:oly_elazm/features/today_memorization_plan/data/repo/today_memorization_plan_repo.dart';


import 'today_memorization_plan_state.dart';

class MemorizationPlanCubit extends Cubit<MemorizationPlanState> {
  MemorizationPlanCubit(this._memorizationPlanRepo) : super( MemorizationPlanState());
  final MemorizationPlanRepo _memorizationPlanRepo;

  /// init data fetchAssignedTask
  Future<void> fetchAssignedTask(AssignedTaskModel r)  async {
    emit(state.copyWith(assignedTaskModel:  r));
  }


}
