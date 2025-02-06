
class AzkarModel {
  int? id;
  String? category;
  String? audio;
  String? filename;
  List<Array>? array;

  AzkarModel({
    this.id,
    this.category,
    this.audio,
    this.filename,
    this.array,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
    id: json["id"],
    category: json["category"],
    audio: json["audio"],
    filename: json["filename"],
    array: json["array"] == null ? [] : List<Array>.from(json["array"]!.map((x) => Array.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "audio": audio,
    "filename": filename,
    "array": array == null ? [] : List<dynamic>.from(array!.map((x) => x.toJson())),
  };
}

class Array {
  int? id;
  String? text;
  int? count;
  String? audio;
  String? filename;

  Array({
    this.id,
    this.text,
    this.count,
    this.audio,
    this.filename,
  });

  factory Array.fromJson(Map<String, dynamic> json) => Array(
    id: json["id"],
    text: json["text"],
    count: json["count"],
    audio: json["audio"],
    filename: json["filename"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
    "count": count,
    "audio": audio,
    "filename": filename,
  };
}
