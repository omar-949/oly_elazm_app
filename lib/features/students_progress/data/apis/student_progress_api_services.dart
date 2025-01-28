import 'package:oly_elazm/core/networking/network/network_call.dart';
import 'package:oly_elazm/core/networking/network/result.dart';
import 'package:oly_elazm/features/students_progress/data/apis/student_progress_api_constants.dart';
import 'package:oly_elazm/features/students_progress/data/models/teacher/student_details.dart';
import 'package:oly_elazm/features/students_progress/data/repo/student_progress_repo.dart';

class StudentProgressApiServices implements StudentProgressRepo {
  /// fetch all students
  @override
  Future<Result<StudentDetailsModel>> fetchStudentsDetails(int id) async {
    return await networkCall(
      method: ServerMethods.GET,
      path: StudentProgressApiConstants.studentDetails(id),
      fromJson: (p0) => StudentDetailsModel.fromJson(p0),
    );
  }

  @override
  Future<Result<T>> addReview<T>(
      {required int id,
      required String comment,
      required String partsNum,
      required double rating}) async{
    return await networkCall(
      method: ServerMethods.POST,
      path: StudentProgressApiConstants.addReview(id),
      data: {
        "rating": rating,
        "parts_memorized_increment": partsNum,
        "teacher_notes": comment
      },
      fromJson: (p0) => p0 as T,
    );
  }

  @override
  Future<Result<T>> giveTask<T>(
      {required int id,
      required String surah,
      required int from,
      required int to,
      required String time,
      required String meetingLink}) async{
    return await networkCall(
      method: ServerMethods.POST,
      path: StudentProgressApiConstants.giveTask(id),
      data: {
        "surah_name": surah,
        "verses_from": from,
        "verses_to": to,
        "scheduled_time": time,
        "meeting_link": meetingLink
      },
      fromJson: (p0) => p0 as T,
    );

  }
}
