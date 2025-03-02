import 'package:easy_localization/easy_localization.dart';
import 'package:oly_elazm/core/networking/network/network_call.dart';
import 'package:oly_elazm/core/networking/network/result.dart';
import 'package:oly_elazm/features/students_progress/data/apis/student_progress_api_constants.dart';
import 'package:oly_elazm/features/students_progress/data/models/teacher/student_details.dart';
import 'package:oly_elazm/features/students_progress/data/repo/student_progress_repo.dart';

import '../models/teacher/add_task_model.dart';

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
  Future<Result<AddTaskForStudent>> giveTask(
      {required int id,
      required String surah,
      required int from,
      required int to,
      required String time,
      required String meetingLink}) async{
    DateTime dateTime = DateTime.parse(time);

    // Format the DateTime object to remove milliseconds
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss', 'en').format(dateTime);
    // Format the DateTime object
    return await networkCall(
      method: ServerMethods.POST,
      path: StudentProgressApiConstants.giveTask(id),
      data: {
        "surah_name": surah,
        "verses_from": "$from",
        "verses_to": "$to",
        "scheduled_time": formattedDate,
        "meeting_link": meetingLink
      },
      fromJson: (p0) => AddTaskForStudent.fromJson(p0),
    );

  }
}
