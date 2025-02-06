import 'package:oly_elazm/core/networking/network/network_call.dart';
import 'package:oly_elazm/core/networking/network/result.dart';
import 'package:oly_elazm/features/home/data/apis/home_api_constants.dart';
import 'package:oly_elazm/features/home/data/models/student/assigned_task_model.dart';
import 'package:oly_elazm/features/home/data/models/teacher/all_student_model.dart';
import 'package:oly_elazm/features/home/data/repo/home_repo.dart';



class HomeApiServices implements HomeRepo {
  /// fetch all students
  @override
  Future<Result<AllStudentModel>> fetchAllStudents() async {
    return await networkCall(
      method: ServerMethods.GET,
      path: HomeApiConstants.allStudents,
      fromJson: (p0) => AllStudentModel.fromJson(p0),
    );
  }

  @override
  Future<Result<AssignedTaskModel>> fetchAssignedTask() {
    return networkCall(
      method: ServerMethods.GET,
      path: HomeApiConstants.assignedTasks,
      fromJson: (p0) => AssignedTaskModel.fromJson(p0),
    );
  }

}
