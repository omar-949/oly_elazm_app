class StudentDetailsModel {
  String? message;
  int? status;
  DataStudentDetails? data;

  StudentDetailsModel({
    this.message,
    this.status,
    this.data,
  });

  factory StudentDetailsModel.fromJson(Map<String, dynamic> json) => StudentDetailsModel(
    message: json["message"],
    status: json["status"],
    data: json["data"] == null ? null : DataStudentDetails.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data?.toJson(),
  };
}

class DataStudentDetails {
  int? id;
  String? profilePicture;
  String? role;
  String? name;
  int? totalPoints;
  String? quranPartsMemorized;

  DataStudentDetails({
    this.id,
    this.profilePicture,
    this.role,
    this.name,
    this.totalPoints,
    this.quranPartsMemorized,
  });

  factory DataStudentDetails.fromJson(Map<String, dynamic> json) => DataStudentDetails(
    id: json["id"],
    profilePicture: json["profile_picture"],
    role: json["role"],
    name: json["name"],
    totalPoints: json["total_points"],
    quranPartsMemorized: json["quran_parts_memorized"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile_picture": profilePicture,
    "role": role,
    "name": name,
    "total_points": totalPoints,
    "quran_parts_memorized": quranPartsMemorized,
  };
}
