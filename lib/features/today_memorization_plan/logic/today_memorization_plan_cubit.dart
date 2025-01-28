import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/helpers/app_strings.dart';
import 'package:oly_elazm/core/helpers/shared_prefrences.dart';
import 'package:oly_elazm/features/today_memorization_plan/data/repo/today_memorization_plan_repo.dart';

import '../../../../core/helpers/operation_state.dart';
import '../../../../core/routing/routing_arguments.dart';
import '../../auth/presentation/data/models/send_models/register_send_model.dart';
import 'today_memorization_plan_state.dart';

class MemorizationPlanCubit extends Cubit<MemorizationPlanState> {
  MemorizationPlanCubit(this._memorizationPlanRepo) : super(const MemorizationPlanState()){
    if(SharedPrefHelper.getString(AppStrings.userRoleKey) == "student"){

    }else{
      fetchAllStudents();
    }
  }
  final MemorizationPlanRepo _memorizationPlanRepo;

  /// fetchAllStudents
  Future<void> fetchAllStudents() async {
    emit(state.copyWith(allStudentsState: OperationState.loading()));
    final result = await _memorizationPlanRepo.fetchAllStudents();
    result.when(
      failure: (l) {
        emit(state.copyWith(allStudentsState: OperationState.error()));
      },
      success: (r) {

        emit(state.copyWith(allStudentsState: OperationState.success(),allStudents: r));
      },
    );
  }

  /// register
  Future<void> register({required RegisterSendModel registerSendModel}) async {
    emit(state.copyWith(registerState: OperationState.loading()));
    // final result =
    //     await _authRepo.register(registerSendModel: registerSendModel);
    // result.when(
    //   failure: (l) =>
    //       emit(state.copyWith(registerState: OperationState.error())),
    //   success: (r) => emit(state.copyWith(
    //       registerState: OperationState.success(), verifyCode: r)),
    // );
  }

  /// verify
  Future<void> verify(
      {required VerifyCodeArguments verifyCodeArguments}) async {
    emit(state.copyWith(verifyCodeState: OperationState.loading()));
    // final result =
    //     await _authRepo.verify(verifyCodeArguments: verifyCodeArguments);
    // result.when(
    //   failure: (l) =>
    //       emit(state.copyWith(verifyCodeState: OperationState.error())),
    //   success: (r) =>
    //       emit(state.copyWith(verifyCodeState: OperationState.success())),
    // );
  }
}
