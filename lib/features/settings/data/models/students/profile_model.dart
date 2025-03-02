class ProfileModel {
  Data? data;

  ProfileModel({
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  String? name;
  String? email;
  String? phoneNumber;
  String? country;
  String? photoUrl;
  int? totalPoints;
  TeacherOfStudent? teacherOfStudent;
  List<Comment>? comments;

  Data({
    this.name,
    this.email,
    this.phoneNumber,
    this.country,
    this.photoUrl,
    this.totalPoints,
    this.teacherOfStudent,
    this.comments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    country: json["country"],
    photoUrl: json["photo_url"],
    totalPoints: json["total_points"],
    teacherOfStudent: json["teacherOfStudent"] == null
        ? null
        : TeacherOfStudent.fromJson(json["teacherOfStudent"]),
    comments: json["comments"] == null
        ? []
        : List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "country": country,
    "photo_url": photoUrl,
    "total_points": totalPoints,
    "teacherOfStudent": teacherOfStudent?.toJson(),
    "comments": comments == null
        ? []
        : List<dynamic>.from(comments!.map((x) => x.toJson())),
  };
}

class TeacherOfStudent {
  int? id;
  String? name;
  String? email;
  dynamic rating;
  dynamic yearsOfExperience;

  TeacherOfStudent({
    this.id,
    this.name,
    this.email,
    this.rating,
    this.yearsOfExperience,
  });

  factory TeacherOfStudent.fromJson(Map<String, dynamic> json) =>
      TeacherOfStudent(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        rating: json["rating"],
        yearsOfExperience: json["years_of_experience"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "rating": rating,
    "years_of_experience": yearsOfExperience,
  };
}

class Comment {
  int? commentId;
  String? teacherName;
  double? rating;
  String? comment;
  String? dateCommented;

  Comment({
    this.commentId,
    this.teacherName,
    this.rating,
    this.comment,
    this.dateCommented,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    commentId: json["comment_id"],
    teacherName: json["teacher_name"],
    rating: json["rating"].toDouble(),
    comment: json["comment"],
    dateCommented: json["date_commented"],
  );

  Map<String, dynamic> toJson() => {
    "comment_id": commentId,
    "teacher_name": teacherName,
    "rating": rating,
    "comment": comment,
    "date_commented": dateCommented,
  };
}
