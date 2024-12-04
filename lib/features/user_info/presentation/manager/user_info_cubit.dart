import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoUpdated(isStudent: null, isMale: null, percent: 0.0, currentIndex: 0,));
  // Update role (Student or not)
  void updateRole(bool value) {
    final currentState = state;
    if (currentState is UserInfoUpdated) {
      final updatedPercent = percentCalculator(
        value,
        currentState.isMale,
        currentState.selectedChapter,
      );
      emit(
        currentState.copyWith(
          isStudent: value,
          percent: updatedPercent,
        ),
      );
    }
  }

  // Update gender (Male or Female)
  void updateGender(bool value) {
    final currentState = state;
    if (currentState is UserInfoUpdated) {
      final updatedPercent = percentCalculator(
        currentState.isStudent,
        value,
        currentState.selectedChapter,
      );
      emit(
        currentState.copyWith(
          isMale: value,
          percent: updatedPercent,
        ),
      );
    }
  }

  // Calculate percent based on role (student) and gender (male)
  double percentCalculator(
      bool? isStudent, bool? isMale, String? selectedChapter) {
    if (isStudent == null) return 0.0; // Initial state when isStudent is null
    if (isMale == null) {
      return isStudent
          ? 1 / 3
          : 1 / 2; // Only role selected, gender is still null
    }
    if (selectedChapter != null) return 1.0;
    return isStudent ? 2 / 3 : 1.0; // Both role and gender are selected
  }

  // Update the current index of the PageView
  void updateCurrentIndex(int index) {
    final currentState = state;
    if (currentState is UserInfoUpdated) {
      emit(
        currentState.copyWith(
          currentIndex: index,
        ),
      );
    }
  }

  // Update the selected chapter
  void selectChapter(String chapter) {
    final currentState = state;
    if (currentState is UserInfoUpdated) {
      final updatedPercent = percentCalculator(
        currentState.isStudent,
        currentState.isMale,
        chapter,
      );
      emit(
        currentState.copyWith(
          selectedChapter: chapter,
          percent: updatedPercent,
          notStarted: false,
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
          'No Chapter Selected',
        );
      } else {
        updatedPercent = 2 / 3;
      }
      emit(
        currentState.copyWith(
          selectedChapter: 'No Chapter Selected',
          notStarted: isChecked,
          percent: updatedPercent,
        ),
      );
    }
  }
}
