import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/helpers/app_strings.dart';
import 'package:oly_elazm/core/helpers/shared_prefrences.dart';
import 'package:oly_elazm/features/auth/presentation/data/repo/auth_repo.dart';
import 'package:oly_elazm/features/home/data/repo/home_repo.dart';

import '../../../../core/helpers/operation_state.dart';
import '../../../../core/routing/routing_arguments.dart';
import '../../auth/presentation/data/models/send_models/register_send_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState()){
    if(SharedPrefHelper.getString(AppStrings.userRoleKey) == "student"){

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
