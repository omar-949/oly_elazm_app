class StudentProgressApiConstants {
  ///Teacher
  static  String  studentDetails(int id) => 'get-student-details/$id';
  static  String  giveTask(int id) => 'teacher/give-task/$id';
  static  String  addReview(int id) => 'teacher/rate-note-teacher/$id';
  ///Student
}