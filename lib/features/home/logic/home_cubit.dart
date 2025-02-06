import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/helpers/app_strings.dart';
import 'package:oly_elazm/core/helpers/shared_prefrences.dart';
import 'package:oly_elazm/features/home/data/repo/home_repo.dart';
import '../../../../core/helpers/operation_state.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState()){
    if(SharedPrefHelper.getString(AppStrings.userRoleKey) == "student"){
      fetchAssignedTask();
    }else{

      fetchAllStudents();
    }
  }
  final HomeRepo _homeRepo;

  /// fetchAllStudents
  Future<void> fetchAllStudents() async {
    emit(state.copyWith(allStudentsState: OperationState.loading()));
    final result = await _homeRepo.fetchAllStudents();
    result.when(
      failure: (l) {
        emit(state.copyWith(allStudentsState: OperationState.error()));
      },
      success: (r) {

        emit(state.copyWith(allStudentsState: OperationState.success(),allStudents: r));
      },
    );
  }

  /// fetchAssignedTask
  Future<void> fetchAssignedTask() async {
    emit(state.copyWith(assignedTask: OperationState.loading()));
    final result =
        await _homeRepo.fetchAssignedTask();
    result.when(
      failure: (l) =>
          emit(state.copyWith(assignedTask: OperationState.error())),
      success: (r) => emit(state.copyWith(
          assignedTask: OperationState.success(),assignedTaskModel: r)),
    );
  }
}
