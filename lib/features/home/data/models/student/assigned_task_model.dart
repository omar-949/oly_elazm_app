class AssignedTaskModel {
  String? message;
  int? status;
  List<Datum>? data;

  AssignedTaskModel({
    this.message,
    this.status,
    this.data,
  });

  factory AssignedTaskModel.fromJson(Map<String, dynamic> json) => AssignedTaskModel(
    message: json["message"],
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? surahName;
  String? versesFrom;
  String? versesTo;
  DateTime? scheduledTime;
  String? meetingLink;
  dynamic teacherNotes;
  String? teacherName;

  Datum({
    this.id,
    this.surahName,
    this.versesFrom,
    this.versesTo,
    this.scheduledTime,
    this.meetingLink,
    this.teacherNotes,
    this.teacherName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    surahName: json["surah_name"],
    versesFrom: json["verses_from"],
    versesTo: json["verses_to"],
    scheduledTime: json["scheduled_time"] == null ? null : DateTime.parse(json["scheduled_time"]),
    meetingLink: json["meeting_link"],
    teacherNotes: json["teacher_notes"],
    teacherName: json["teacher_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "surah_name": surahName,
    "verses_from": versesFrom,
    "verses_to": versesTo,
    "scheduled_time": scheduledTime?.toIso8601String(),
    "meeting_link": meetingLink,
    "teacher_notes": teacherNotes,
    "teacher_name": teacherName,
  };
}
