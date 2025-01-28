import 'package:oly_elazm/core/networking/network/network_call.dart';
import 'package:oly_elazm/core/networking/network/result.dart';
import 'package:oly_elazm/core/routing/routing_arguments.dart';
import 'package:oly_elazm/features/auth/presentation/data/apis/auth_api_constants.dart';
import 'package:oly_elazm/features/auth/presentation/data/repo/auth_repo.dart';

import '../models/send_models/register_send_model.dart';

class AuthApiServices implements AuthRepo {
  /// Login in the app
  @override
  Future<Result<T>> login<T>({
    required String email,
    required String password,
  }) async {
    return await networkCall(
      method: ServerMethods.POST,
      path: AuthApiConstants.login,
      data: {
        "email": email,
        "password": password,
      },
      fromJson: (p0) => p0 as T,
    );
  }

  /// Register in the app
  @override
  Future<Result<T>> register<T>(
      {required RegisterSendModel registerSendModel}) async {
    return await networkCall(
      method: ServerMethods.POST,
      path: AuthApiConstants.register,
      data: {
        "name": registerSendModel.name,
        "email": registerSendModel.email,
        "password": registerSendModel.password,
        "phone_number": registerSendModel.phoneNumber,
        "role": registerSendModel.role,
        "country": registerSendModel.country,
        "job": registerSendModel.job,
        "gender": registerSendModel.gender,
        "language": "ar",
        "age": "${registerSendModel.age}",
        "quran_parts_memorized": "${registerSendModel.quranPartsMemorized}"
      },
      fromJson: (p0) => p0["otp_number"] as T,
    );
  }

  /// verify
  @override
  Future<Result<T>> verify<T>(
      {required VerifyCodeArguments verifyCodeArguments}) async {
    return networkCall(
      method: ServerMethods.POST,
      path: AuthApiConstants.verify,
      data: {
        "email": verifyCodeArguments.email,
        "otp_code": verifyCodeArguments.code,
      },
      fromJson: (p0) => p0 as T,
    );
  }
}
