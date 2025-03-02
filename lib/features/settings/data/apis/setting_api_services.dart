import 'package:oly_elazm/core/networking/network/network_call.dart';
import 'package:oly_elazm/core/networking/network/result.dart';
import 'package:oly_elazm/features/settings/data/apis/setting_apis_constants.dart';
import 'package:oly_elazm/features/settings/data/models/students/profile_model.dart';

import '../repo/setting_repo.dart';

class SettingApiServices implements SettingRepo {
  @override
  Future<Result<ProfileModel>> getProfile() {
    return networkCall(
      method: ServerMethods.GET,
      path: SettingApisConstants.getProfile,
      fromJson: (p0) => ProfileModel.fromJson(p0),
    );
  }

  @override
  Future<Result<T>> logout<T>() {
    return networkCall(
      method: ServerMethods.POST,
      path: SettingApisConstants.logout,
      fromJson: (p0) =>p0 as T,
    );
  }

  @override
  Future<Result<T>> updateProfile<T>({required ProfileModel profileModel}) {
    return networkCall(
      method: ServerMethods.POST,
      path: SettingApisConstants.updateProfile,
      fromJson: (p0) =>p0 as T,
      data:{
        'name': profileModel.data!.name!,
        'phone_number': profileModel.data!.phoneNumber!,
        'country': profileModel.data!.country!,
        "email": profileModel.data!.email!,

      },
  );
  }
}
