import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/features/user_info/data/model/user_info_model.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit()
      : super(UserInfoUpdated(
            isStudent: null,
            isMale: null,
            percent: 0.0,
            currentIndex: 0,
            userInfoModel: UserInfoModel()));

  // Update role (Student or not)
  void updateRole(bool value) {
    final currentState = state;
    if (currentState is UserInfoUpdated) {
      final updatedPercent = percentCalculator(value, currentState.isMale,
          currentState.selectedChapter, currentState.currentIndex);
      emit(
        currentState.copyWith(
          isStudent: value,
          percent: updatedPercent,
        ),
      );
    }
  }

  ///update date
  void updateData({
    String? country,
    String? job,
    String? gender,
    String? userType,
    int? partNumber,
    int? yearsOfExperience
  }) {
    final currentState = state;

    if (currentState is UserInfoUpdated) {
      emit(
        currentState.copyWith(
            userInfoModel: currentState.userInfoModel!.copyWith(
          job: job,
          country: country,
          gender: gender,
          userType: userType,
          partNumber: partNumber,
              yearsOfExperience: yearsOfExperience
        )),
      );
    }
  }
  // Update gender (Male or Female)
  void updateGender(bool value) {
    final currentState = state;
    if (currentState is UserInfoUpdated) {
      final updatedPercent = percentCalculator(currentState.isStudent, value,
          currentState.selectedChapter, currentState.currentIndex);
      emit(
        currentState.copyWith(
          isMale: value,
          percent: updatedPercent,
        ),
      );
    }
  }

  // Calculate percent dynamically based on role and current step
  double percentCalculator(bool? isStudent, bool? isMale,
      int? selectedChapter, int currentIndex) {
    if (isStudent == null) return 0.0;

    // Unified total steps for both roles
    final totalSteps = 3;

    // Calculate percentage including the current index
    return (currentIndex / totalSteps).clamp(0.0, 1.0);
  }


  // Update the current index of the PageView and adjust the percentage
  void updateCurrentIndex(int index) {
    final currentState = state;
    if (currentState is UserInfoUpdated) {

      final updatedPercent = percentCalculator(
        currentState.isStudent,
        currentState.isMale,
        currentState.selectedChapter,
        index,
      );
      emit(
        currentState.copyWith(
          currentIndex: index,

          percent: updatedPercent,
        ),
      );
    }
  }

  // Update the selected chapter
  void selectChapter(int chapter) {
    final currentState = state;
    if (currentState is UserInfoUpdated) {
      final updatedPercent = percentCalculator(currentState.isStudent,
          currentState.isMale, chapter, currentState.currentIndex);
      emit(
        currentState.copyWith(
          selectedChapter: chapter,
          percent: updatedPercent,
          notStarted: false,
          userInfoModel: currentState.userInfoModel!.copyWith(
              partNumber: chapter),
        ),
      );
    }
  }

  void toggleChapterSelection(bool isChecked) {
    final currentState = state;
    double updatedPercent;
    if (currentState is UserInfoUpdated) {
      if (isChecked) {
        updatedPercent = percentCalculator(
            currentState.isStudent,
            currentState.isMale,
            0,
            currentState.currentIndex);
      } else {
        updatedPercent = 3 / 3; // Full completion percent when deselected
      }
      emit(
        currentState.copyWith(
          selectedChapter: 0,
          notStarted: isChecked,
          percent: updatedPercent,
          userInfoModel: currentState.userInfoModel!.copyWith(
            partNumber: isChecked ? 0 : null,
          ),
        ),
      );
    }
  }
}
