import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/features/students_progress/data/repo/student_progress_repo.dart';

import '../../../../core/helpers/operation_state.dart';
import 'student_progress_state.dart';
import 'package:quran/quran.dart' as quran;

class StudentProgressCubit extends Cubit<StudentProgressState> {
  StudentProgressCubit(this._studentProgressRepo)
      : super(const StudentProgressState());
  final StudentProgressRepo _studentProgressRepo;
  late int id;

  void init(int id) {
    this.id = id;
    fetchAllStudents(id);
  }

  /// fetchAllStudents
  Future<void> fetchAllStudents(int id) async {
    emit(state.copyWith(studentsDetailsState: OperationState.loading()));
    final result = await _studentProgressRepo.fetchStudentsDetails(id);
    result.when(
      failure: (l) {
        emit(state.copyWith(studentsDetailsState: OperationState.error()));
      },
      success: (r) {
        emit(state.copyWith(
            studentsDetailsState: OperationState.success(),
            studentsDetailsData: r));
      },
    );
  }

  /// giveTask
  String? surahName;
  int ? from, to;
  void changeGiveTaskData({String? surahName, int? from, int? to}) {
    emit(state.copyWith(studentsDetailsState: OperationState.loading()));
    this.surahName = surahName??this.surahName;
    this.from = from??this.from;
    this.to = to??this.to;
    emit(state.copyWith(studentsDetailsState: OperationState.success()));
  }
  Future<void> giveTask(
      {

      required String time,
      required String desc,
      required double rate,
      required String meetingLink}) async {
    emit(state.copyWith(giveTaskState: OperationState.loading()));
    final result = await _studentProgressRepo.giveTask(
        id: id,
        surah: surahName!,
        from: from!,
        to: to!,
        time: time,
        meetingLink: meetingLink);
    result.when(
      failure: (l) =>
          emit(state.copyWith(giveTaskState: OperationState.error())),
      success: (r) {
        emit(state.copyWith(giveTaskState: OperationState.success()));
        addReview(comment: desc, rating: rate,
            idAddReview: r.data!.id!
        );
      },
    );
  }
final suras=List.generate(
  114, (index) => quran.getSurahNameArabic(index + 1),);
  /// addReview
  Future<void> addReview(
      {required String comment,
        required int idAddReview,
      required double rating}) async {
    emit(state.copyWith(addReviewState: OperationState.loading()));
    final result = await _studentProgressRepo.addReview(
      id:idAddReview,
      comment: comment,
      partsNum:(surahName=="الفاتحة")?"1":quran.getJuzNumber(suras.indexOf(surahName!), to!).toString(),
      rating: rating,
    );
    result.when(
      failure: (l) =>
          emit(state.copyWith(addReviewState: OperationState.error())),
      success: (r) =>
          emit(state.copyWith(addReviewState: OperationState.success())),
    );
  }
}
