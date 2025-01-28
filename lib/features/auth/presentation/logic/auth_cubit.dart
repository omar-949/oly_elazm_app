import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/helpers/app_strings.dart';
import 'package:oly_elazm/core/helpers/shared_prefrences.dart';
import 'package:oly_elazm/features/auth/presentation/data/repo/auth_repo.dart';

import '../../../../core/helpers/operation_state.dart';
import '../../../../core/routing/routing_arguments.dart';
import '../data/models/send_models/register_send_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(const AuthState());
  final AuthRepo _authRepo;

  /// login
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(loginState: OperationState.loading()));
    final result = await _authRepo.login(email: email, password: password);
    result.when(
      failure: (l) {

        if(l.contains("403")) {
          emit(state.copyWith(loginState: OperationState.forbidden()));
        }else {
          emit(state.copyWith(loginState: OperationState.error()));
        }
      },
      success: (r) {
        SharedPrefHelper.setData(AppStrings.userRoleKey, r["role"]);
        SharedPrefHelper.setData(AppStrings.userId, r["data"]["id"]);
        SharedPrefHelper.setData(AppStrings.isLoginKey, true);
        SharedPrefHelper.setSecuredString(AppStrings.userTokenKey, r["token"]);
        emit(state.copyWith(loginState: OperationState.success()));
      },
    );
  }

  /// register
  Future<void> register({required RegisterSendModel registerSendModel}) async {
    emit(state.copyWith(registerState: OperationState.loading()));
    final result =
        await _authRepo.register(registerSendModel: registerSendModel);
    result.when(
      failure: (l) =>
          emit(state.copyWith(registerState: OperationState.error())),
      success: (r) => emit(state.copyWith(
          registerState: OperationState.success(), verifyCode: r)),
    );
  }

  /// verify
  Future<void> verify(
      {required VerifyCodeArguments verifyCodeArguments}) async {
    emit(state.copyWith(verifyCodeState: OperationState.loading()));
    final result =
        await _authRepo.verify(verifyCodeArguments: verifyCodeArguments);
    result.when(
      failure: (l) =>
          emit(state.copyWith(verifyCodeState: OperationState.error())),
      success: (r) =>
          emit(state.copyWith(verifyCodeState: OperationState.success())),
    );
  }
}
