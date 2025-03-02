class AddTaskForStudent {
  String? message;
  int? status;
  Data? data;

  AddTaskForStudent({
    this.message,
    this.status,
    this.data,
  });

  factory AddTaskForStudent.fromJson(Map<String, dynamic> json) => AddTaskForStudent(
    message: json["message"],
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  int? teacherId;
  int? studentId;
  String? surahName;
  String? versesFrom;
  String? versesTo;
  DateTime? scheduledTime;
  String? meetingLink;
  int? id;

  Data({
    this.teacherId,
    this.studentId,
    this.surahName,
    this.versesFrom,
    this.versesTo,
    this.scheduledTime,
    this.meetingLink,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    teacherId: json["teacher_id"],
    studentId: json["student_id"],
    surahName: json["surah_name"],
    versesFrom: json["verses_from"],
    versesTo: json["verses_to"],
    scheduledTime: json["scheduled_time"] == null ? null : DateTime.parse(json["scheduled_time"]),
    meetingLink: json["meeting_link"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "teacher_id": teacherId,
    "student_id": studentId,
    "surah_name": surahName,
    "verses_from": versesFrom,
    "verses_to": versesTo,
    "scheduled_time": scheduledTime?.toIso8601String(),
    "meeting_link": meetingLink,
    "id": id,
  };
}
