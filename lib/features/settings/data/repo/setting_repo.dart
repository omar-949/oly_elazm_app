import 'package:oly_elazm/core/networking/network/result.dart';

import '../models/students/profile_model.dart';

abstract class SettingRepo {
  Future<Result<ProfileModel>> getProfile();
  Future<Result<T>> logout<T>();
  Future<Result<T>> updateProfile<T>({required ProfileModel profileModel});
}