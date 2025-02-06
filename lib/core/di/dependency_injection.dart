import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:oly_elazm/features/auth/presentation/data/apis/auth_api_services.dart';
import 'package:oly_elazm/features/auth/presentation/data/repo/auth_repo.dart';
import 'package:oly_elazm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:oly_elazm/features/azkhar/logic/azkar_cubit.dart';
import 'package:oly_elazm/features/elmohafez_details/logic/rate_elmohafez_cubit.dart';
import 'package:oly_elazm/features/home/data/repo/home_repo.dart';
import 'package:oly_elazm/features/students_progress/data/apis/student_progress_api_services.dart';
import 'package:oly_elazm/features/students_progress/data/repo/student_progress_repo.dart';
import 'package:oly_elazm/features/students_progress/logic/student_progress_cubit.dart';
import 'package:oly_elazm/features/today_memorization_plan/data/apis/today_memorization_plan_api_services.dart';
import 'package:oly_elazm/features/today_memorization_plan/data/repo/today_memorization_plan_repo.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../features/elmohafez_details/data/apis/rate_elmohafez_api_services.dart';
import '../../features/elmohafez_details/data/repo/rate_elmohafez_repo.dart';
import '../../features/home/data/apis/home_api_services.dart';
import '../../features/home/logic/home_cubit.dart';
import '../../features/settings/data/apis/setting_api_services.dart';
import '../../features/settings/data/repo/setting_repo.dart';
import '../../features/settings/logic/setting_cubit.dart';
import '../../features/today_memorization_plan/logic/today_memorization_plan_cubit.dart';
import '../helpers/cubit/app_cubit.dart';
import '../networking/network/app_constants.dart';
import '../networking/network/base_consumer.dart';
import '../networking/network/dio_consumer.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  /// Register DioConsumer to handle API calls using Dio ///
  final logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 100,
    logPrint: (object) => log(
      object.toString(),
      name: "Api",
    ),
  );
  final dio = Dio(BaseOptions(
    baseUrl: AppApiConstants.baseUrl,
    receiveDataWhenStatusError: true,
  ));
  dio.interceptors.addAll([logger]);

  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<BaseConsumer>(() => DioConsumer(getIt<Dio>()));

  ///! FOR APP CUBIT ///
  getIt.registerFactory<AppCubit>(() => AppCubit());

  ///! FOR AUTH ///
  getIt.registerLazySingleton<AuthRepo>(() => AuthApiServices());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));

  ///! FOR HOME ///
  getIt.registerLazySingleton<HomeRepo>(() => HomeApiServices());
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  ///!FOR STUDENT PROGRESS ///
  getIt.registerLazySingleton<StudentProgressRepo>(
      () => StudentProgressApiServices());
  getIt.registerFactory<StudentProgressCubit>(
      () => StudentProgressCubit(getIt<StudentProgressRepo>()));

  ///! FOR AZKHAR ///
  getIt.registerFactory<AzkarCubit>(() => AzkarCubit());

  ///! FOR SETTINGS ///
  getIt.registerLazySingleton<SettingRepo>(() => SettingApiServices());
  getIt.registerFactory<SettingCubit>(() => SettingCubit(getIt<SettingRepo>()));

  ///! FOR TEACHER RATE ///
  getIt.registerLazySingleton<RateElMohafezRepo>(
      () => RateElMohafezApiServices());
  getIt.registerFactory<RateElMohafezCubit>(
      () => RateElMohafezCubit(getIt<RateElMohafezRepo>()));
  ///! FOR ASSIGNEd TASK ///
  getIt.registerLazySingleton<MemorizationPlanRepo>(() => MemorizationPlanApiServices());
  getIt.registerFactory<MemorizationPlanCubit>(() => MemorizationPlanCubit(getIt<MemorizationPlanRepo>()));
}
