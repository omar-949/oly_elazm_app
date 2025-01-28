import 'package:oly_elazm/core/networking/network/result.dart';
import 'package:oly_elazm/features/home/data/models/teacher/all_student_model.dart';



abstract class StudentProgressRepo {
  /// TEACHER
  // FETCH ALL STUDENTS
  Future<Result<AllStudentModel>> fetchAllStudents();
  //
}
