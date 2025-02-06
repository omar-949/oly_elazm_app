import 'package:oly_elazm/features/settings/data/models/students/profile_model.dart';

import '../../../core/helpers/operation_state.dart';

class SettingState {
  final OperationState profileState;
  final ProfileModel? profileModel;
  final OperationState logOutState;
  final OperationState updateProfileState;

  const SettingState({
    this.profileState = const OperationState(),
    this.profileModel,
    this.logOutState = const OperationState(),
    this.updateProfileState = const OperationState()

  });

  SettingState copyWith({
    OperationState? profileState,
    ProfileModel? profileModel,
    OperationState? logOutState,
    OperationState? updateProfileState
  }) {
    return SettingState(
      profileState: profileState ?? this.profileState,
      profileModel: profileModel?? this.profileModel,
      logOutState: logOutState ?? this.logOutState,
      updateProfileState: updateProfileState ?? this.updateProfileState
    );
  }
}
