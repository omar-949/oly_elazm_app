part of 'user_info_cubit.dart';

@immutable
abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserInfoUpdated extends UserInfoState {
  final bool? isStudent;
  final bool? isMale;
  final double percent;
  final int currentIndex;
  final int? selectedChapter;
  final bool notStarted;
  final UserInfoModel? userInfoModel;

  UserInfoUpdated({
    this.isStudent,
    this.isMale,
    required this.percent,
    this.currentIndex = 0,
    this.selectedChapter,
    this.notStarted = false,
    this.userInfoModel
  });

  UserInfoUpdated copyWith({
    bool? isStudent,
    bool? isMale,
    double? percent,
    int? currentIndex,
    int? selectedChapter,
    bool? notStarted,
    UserInfoModel? userInfoModel,
  }) {
    return UserInfoUpdated(
      isStudent: isStudent ?? this.isStudent,
      isMale: isMale ?? this.isMale,
      percent: percent ?? this.percent,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedChapter: selectedChapter ?? this.selectedChapter,
      notStarted: notStarted ?? this.notStarted,
      userInfoModel: userInfoModel??this.userInfoModel
    );
  }
}
