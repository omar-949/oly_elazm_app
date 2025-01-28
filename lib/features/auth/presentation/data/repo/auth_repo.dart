import 'package:oly_elazm/core/networking/network/result.dart';

import '../../../../../core/routing/routing_arguments.dart';
import '../models/send_models/register_send_model.dart';

abstract class AuthRepo {
  /// LOGIN
  Future<Result<T>> login<T>({
    required String email,
    required String password,
  });
  /// REGISTER
  Future<Result<T>> register<T>({
    required RegisterSendModel registerSendModel,
  });
  /// VERIFY
  Future<Result<T>> verify<T>({
    required VerifyCodeArguments verifyCodeArguments
  });
}
