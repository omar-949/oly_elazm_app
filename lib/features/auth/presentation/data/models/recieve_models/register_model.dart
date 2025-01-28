class RegisterModel {
  String? message;
  int? status;
  Data? data;
  int? otpNumber;

  RegisterModel({
    this.message,
    this.status,
    this.data,
    this.otpNumber,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    message: json["message"],
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    otpNumber: json["otp_number"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data?.toJson(),
    "otp_number": otpNumber,
  };
}

class Data {
  String? name;
  String? email;
  String? phoneNumber;
  String? role;
  String? status;
  String? country;
  String? language;
  String? job;
  String? age;
  dynamic gender;
  int? id;
  String? photoUrl;
  String? quranPartsMemorized;

  Data({
    this.name,
    this.email,
    this.phoneNumber,
    this.role,
    this.status,
    this.country,
    this.language,
    this.job,
    this.age,
    this.gender,
    this.id,
    this.photoUrl,
    this.quranPartsMemorized,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    role: json["role"],
    status: json["status"],
    country: json["country"],
    language: json["language"],
    job: json["job"],
    age: json["age"],
    gender: json["gender"],
    id: json["id"],
    photoUrl: json["photo_url"],
    quranPartsMemorized: json["quran_parts_memorized"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "role": role,
    "status": status,
    "country": country,
    "language": language,
    "job": job,
    "age": age,
    "gender": gender,
    "id": id,
    "photo_url": photoUrl,
    "quran_parts_memorized": quranPartsMemorized,
  };
}
