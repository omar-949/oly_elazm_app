import 'package:oly_elazm/core/networking/network/result.dart';
import 'package:oly_elazm/features/home/data/models/teacher/all_student_model.dart';

import '../models/student/assigned_task_model.dart';



abstract class HomeRepo {
  /// TEACHER
  // FETCH ALL STUDENTS
  Future<Result<AllStudentModel>> fetchAllStudents();
  /// STUDENT
  // FETCH ASSIGNED TASK
  Future<Result<AssignedTaskModel>> fetchAssignedTask();
}
