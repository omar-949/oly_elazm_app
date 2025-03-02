import 'package:oly_elazm/features/settings/data/models/students/profile_model.dart';

import '../../../../core/helpers/operation_state.dart';

/// Represents the entire authentication state.
class RateElMohafezState {
  final OperationState addRate;
  final OperationState? updateRate;
  final OperationState deleteRate;
  final ProfileModel? profileModel;

  const RateElMohafezState({
    this.addRate = const OperationState(),
    this.updateRate= const OperationState(),
    this.deleteRate = const OperationState(),
    this.profileModel,
  });

  /// Returns a new instance of [RateElMohafezState] with updated values.
  RateElMohafezState copyWith({
    OperationState? addRate,
    OperationState? updateRate,
    OperationState? deleteRate,
    ProfileModel? profileModel
  }) {
    return RateElMohafezState(
      addRate: addRate ?? this.addRate,
      updateRate: updateRate ?? this.updateRate,
      deleteRate: deleteRate ?? this.deleteRate,
      profileModel: profileModel ?? this.profileModel
    );
  }
}
