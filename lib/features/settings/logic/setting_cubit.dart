import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/helpers/app_strings.dart';
import 'package:oly_elazm/core/helpers/shared_prefrences.dart';
import 'package:oly_elazm/features/settings/data/models/students/profile_model.dart';
import 'package:oly_elazm/features/settings/data/repo/setting_repo.dart';
import 'package:oly_elazm/features/settings/logic/setting_state.dart';

import '../../../core/helpers/operation_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this._settingRepo) : super(SettingState());
  final SettingRepo _settingRepo;

  void initProfileModel(ProfileModel profileModel) {
    emit(state.copyWith(profileModel: profileModel));

  }
  Future<void> getProfile() async {
    emit(state.copyWith(profileState: OperationState.loading()));
    final result = await _settingRepo.getProfile();
    result.when(success: (data) {
      emit(state.copyWith(
          profileState: OperationState.success(), profileModel: data));
    }, failure: (failure) {
      emit(state.copyWith(profileState: OperationState.error()));
    });
  }

  //logout
  Future<void> logout() async {
    emit(state.copyWith(logOutState: OperationState.loading()));
    final result = await _settingRepo.logout();
    result.when(success: (data) {
      SharedPrefHelper.removeData(AppStrings.userId);
      SharedPrefHelper.removeData(AppStrings.userRoleKey);
      SharedPrefHelper.removeData(AppStrings.isLoginKey);
      SharedPrefHelper.removeData(AppStrings.userTokenKey);
      emit(state.copyWith(
        logOutState: OperationState.success(),
      ));
    }, failure: (failure) {
      emit(state.copyWith(logOutState: OperationState.error()));
    });
  }
  //updateProfile
  Future<void> updateProfile({required ProfileModel profileModel}) async {
    emit(state.copyWith(updateProfileState: OperationState.loading()));
    final result = await _settingRepo.updateProfile(profileModel: profileModel);
    result.when(success: (data) {
      emit(state.copyWith(
          updateProfileState: OperationState.success()));
    }, failure: (failure) {
      emit(state.copyWith(updateProfileState: OperationState.error()));
    });
  }
}
