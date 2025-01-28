class ApiErrorModel {
  final String message;
  final Map<String, List<String>> errors;

  ApiErrorModel({required this.message, required this.errors});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'],
      errors: (json['errors'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, List<String>.from(value)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errors': errors.map(
            (key, value) => MapEntry(key, value),
      ),
    };
  }
}
