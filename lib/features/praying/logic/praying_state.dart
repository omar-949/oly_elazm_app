


import '../data/praying_model/timings.dart';

abstract class PrayingState {}

class PrayingInitial extends PrayingState {}

class PrayingLoading extends PrayingState {}

class PrayingLoaded extends PrayingState {
  final PrayerTimingsResponse prayerTimes;

  final Timings timings;

  // final String? nextPraying;
  final String nextPrayerName;
  PrayingLoaded(
      this.prayerTimes, this.nextPrayerName, this.timings);
}

class PrayingError extends PrayingState {
  final String error;

  PrayingError(this.error);
}