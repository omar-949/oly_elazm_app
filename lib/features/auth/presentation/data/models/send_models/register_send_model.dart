class RegisterSendModel {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String role;
  final String gender;
  final String country;
  final String language;
  final String job;
  final int age;
  final int? quranPartsMemorized;

  RegisterSendModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
    required this.gender,
    required this.country,
    required this.language,
    required this.job,
    required this.age,
     this.quranPartsMemorized,
  });
}
