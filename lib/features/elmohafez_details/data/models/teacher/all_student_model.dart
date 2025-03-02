class AllStudentModel {
  String? message;
  int? status;
  List<DataAllStudents>? data;

  AllStudentModel({
    this.message,
    this.status,
    this.data,
  });

  factory AllStudentModel.fromJson(Map<String, dynamic> json) => AllStudentModel(
    message: json["message"],
    status: json["status"],
    data: json["data"] == null ? [] : List<DataAllStudents>.from(json["data"]!.map((x) => DataAllStudents.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DataAllStudents {
  int? id;
  String? profilePicture;
  String? name;
  int? totalPoints;
  String? quranPartsMemorized;

  DataAllStudents({
    this.id,
    this.profilePicture,
    this.name,
    this.totalPoints,
    this.quranPartsMemorized,
  });

  factory DataAllStudents.fromJson(Map<String, dynamic> json) => DataAllStudents(
    id: json["id"],
    profilePicture: json["profile_picture"],
    name: json["name"],
    totalPoints: json["total_points"],
    quranPartsMemorized: json["quran_parts_memorized"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile_picture": profilePicture,
    "name": name,
    "total_points": totalPoints,
    "quran_parts_memorized": quranPartsMemorized,
  };
}
