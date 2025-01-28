class UserInfoModel {
  final String? country;
  final String? job;
  final String? gender;
  final String? userType;
  final int? partNumber;

  UserInfoModel(
      {this.country = "مصر",
      this.job,
      this.gender,
      this.userType,
      this.partNumber});

  UserInfoModel copyWith(
      {String? country,
      String? job,
      String? gender,
      String? userType,
      int? partNumber}) {
    return UserInfoModel(
        country: country ?? this.country,
        job: job ?? this.job,
        gender: gender ?? this.gender,
        userType: userType ?? this.userType,
        partNumber: partNumber ?? this.partNumber);
  }
}
