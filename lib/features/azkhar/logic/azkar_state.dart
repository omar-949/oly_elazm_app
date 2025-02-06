import 'package:oly_elazm/features/azkhar/data/models/azkhar_model.dart';

import '../../../core/helpers/operation_state.dart';

class AzkharState {
  final OperationState azkharState;
  final List<AzkarModel>? azkhar;

  AzkharState({
    this.azkharState = const OperationState(),
    this.azkhar,
  });

  AzkharState copyWith({
    OperationState? azkharState,
    List<AzkarModel>? azkhar,
  }) {
    return AzkharState(
      azkharState: azkharState ?? this.azkharState,
      azkhar: azkhar ?? this.azkhar,
    );
  }
}
