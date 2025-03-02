import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/operation_state.dart';
import '../../../../core/routing/routing_arguments.dart';
import '../../auth/presentation/data/models/send_models/register_send_model.dart';
import '../../settings/data/models/students/profile_model.dart';
import '../data/repo/rate_elmohafez_repo.dart';
import 'rate_elmohafez_state.dart';

class RateElMohafezCubit extends Cubit<RateElMohafezState> {
  RateElMohafezCubit(this._rateElMohafezRepo)
      : super(const RateElMohafezState());
  final RateElMohafezRepo _rateElMohafezRepo;

  void initElMohafez({required ProfileModel profileModel}) {
    emit(state.copyWith(profileModel: profileModel));
  }

  /// add rate
  Future<void> addRate({required int teacherId,required double rating,required String comment}) async {
    emit(state.copyWith(addRate: OperationState.loading()));
    final result = await _rateElMohafezRepo.addRate(
      rating: rating,
      teacherId: teacherId,
      comment: comment
    );
    result.when(
      failure: (l) {
        emit(state.copyWith(addRate: OperationState.error()));
      },
      success: (r) {
        emit(state.copyWith(addRate: OperationState.success()));
      },
    );
  }

  /// register
  Future<void> register({required RegisterSendModel registerSendModel}) async {
    emit(state.copyWith(deleteRate: OperationState.loading()));
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
    // emit(state.copyWith(verifyCodeState: OperationState.loading()));
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
