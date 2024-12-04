import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import for Bloc
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oly_elazm/core/routing/named_router_impl.dart';
import 'package:oly_elazm/oly_elazm.dart';

import 'features/user_info/presentation/manager/user_info_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  SystemUIConfig.configure();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/translations',
      startLocale: Locale('ar'),
      child: BlocProvider(
        create: (context) => UserInfoCubit(),
        child: OlyElazm(
          appRouter: AppRouter(),
        ),
      ),
    ),
  );
}

class SystemUIConfig {
  static void configure() {
    setSystemUIStyles();
    lockPortraitMode();
  }

  // the status bar at the top and bottom nav bar colors
  static void setSystemUIStyles() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  // disable device orientation
  static void lockPortraitMode() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }
}
