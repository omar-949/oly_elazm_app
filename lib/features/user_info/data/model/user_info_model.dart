class UserInfoModel {
  final String? country;
  final String? job;
  final String? gender;
  final String? userType;
  final int? partNumber;
  final int? yearsOfExperience;

  UserInfoModel(
      {this.country = "مصر",
      this.job,
      this.gender,
      this.userType,
      this.partNumber,
      this.yearsOfExperience
      });

  UserInfoModel copyWith(
      {String? country,
      String? job,
      String? gender,
      String? userType,
      int? partNumber,
      int? yearsOfExperience
      }) {
    return UserInfoModel(
        country: country ?? this.country,
        job: job ?? this.job,
        gender: gender ?? this.gender,
        userType: userType ?? this.userType,
        partNumber: partNumber ?? this.partNumber,
        yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience
    );
  }
}
