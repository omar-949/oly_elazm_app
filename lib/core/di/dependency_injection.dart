import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:oly_elazm/features/auth/presentation/data/apis/auth_api_services.dart';
import 'package:oly_elazm/features/auth/presentation/data/repo/auth_repo.dart';
import 'package:oly_elazm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:oly_elazm/features/home/data/repo/home_repo.dart';
import 'package:oly_elazm/features/students_progress/data/apis/student_progress_api_services.dart';
import 'package:oly_elazm/features/students_progress/data/repo/student_progress_repo.dart';
import 'package:oly_elazm/features/students_progress/logic/student_progress_cubit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../features/home/data/apis/home_api_services.dart';
import '../../features/home/logic/home_cubit.dart';
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
  getIt.registerLazySingleton<StudentProgressRepo>(() => StudentProgressApiServices());
  getIt.registerFactory<StudentProgressCubit>(() => StudentProgressCubit(getIt<StudentProgressRepo>()));
}
