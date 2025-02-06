import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../core/helpers/operation_state.dart';
import '../data/models/azkhar_model.dart';
import 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkharState> {
  AzkarCubit() : super(AzkharState());
  late AzkarModel azkar;
  AudioPlayer player = AudioPlayer();
  int currentPageIndex = 0;
  int currentCount = 0;
  PageController pageController = PageController(initialPage: 0);
  bool isPlaying = false;

  Future<void> loadAzkar() async {
    emit(state.copyWith(azkharState: OperationState.loading()));
    final String response =
        await rootBundle.loadString('assets/jsons/adhkar.json');
    final List<dynamic> data = json.decode(response);
    emit(state.copyWith(
        azkharState: OperationState.success(),
        azkhar: data.map((item) => AzkarModel.fromJson(item)).toList()));
  }

  void changeAzkar(AzkarModel azkar) {
    this.azkar = azkar;
    emit(state.copyWith(azkharState: OperationState.success()));
  }

  void onPageChanged(int index) {
    emit(state.copyWith(azkharState: OperationState.loading()));
    currentPageIndex = index;
    currentCount = 0;
    isPlaying = false;
    player.stop();
    emit(state.copyWith(azkharState: OperationState.success()));
  }

  void nextPage() {
    emit(state.copyWith(azkharState: OperationState.loading()));
    if (azkar.array!.length - 1 > currentPageIndex) {
      currentPageIndex++;
      pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.linear);
      currentCount = 0;
      isPlaying = false;
      player.stop();
    }
    emit(state.copyWith(azkharState: OperationState.success()));
  }

  void prevPage() {
    emit(state.copyWith(azkharState: OperationState.loading()));
    if (currentPageIndex > 0) {
      currentPageIndex--;
      pageController.previousPage(
          duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
      currentCount = 0;
      isPlaying = false;
      player.stop();
    }
    emit(state.copyWith(azkharState: OperationState.success()));
  }

  void changeCount() {
    emit(state.copyWith(azkharState: OperationState.loading()));
    if (azkar.array![currentPageIndex].count! - 1 > currentCount) {
      currentCount++;
    } else {
      nextPage();
    }
    emit(state.copyWith(azkharState: OperationState.success()));
  }

  void play() {
    emit(state.copyWith(azkharState: OperationState.loading()));
    if (isPlaying) {
      player.pause();
      isPlaying = false;
      return;
    } else {
      player.setUrl(
          "https://raw.githubusercontent.com/rn0x/Adhkar-json/refs/heads/main${azkar.array![currentPageIndex].audio!}");
      player.play();
    }
    isPlaying = true;
    emit(state.copyWith(azkharState: OperationState.success()));
  }
}
