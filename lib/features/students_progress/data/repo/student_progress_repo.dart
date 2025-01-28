import 'package:oly_elazm/core/networking/network/result.dart';
import 'package:oly_elazm/features/students_progress/data/models/teacher/student_details.dart';

abstract class StudentProgressRepo {
  /// TEACHER
  // FETCH  STUDENTS Details
  Future<Result<StudentDetailsModel>> fetchStudentsDetails(int id);

  //give task
  Future<Result<T>> giveTask<T>(
      {required int id,
      required String surah,
      required int from,
      required int to,
      required String time,
      required String meetingLink,
      });

  //add review
  Future<Result<T>> addReview<T>(
      {required int id,
      required String comment,
      required String partsNum,
      required double rating,}
      );
}
