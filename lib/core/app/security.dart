import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../routing/named_router.dart';
import '../routing/named_router_impl.dart';
import '../theme/app_theme.dart';

class SecurityApp extends StatelessWidget {
  final AppRouter appRouter;

  const SecurityApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          themeAnimationDuration: const Duration(milliseconds: 700),
          themeAnimationCurve: Curves.easeInOutCubic,
          initialRoute: Routes.dashboard,
          onGenerateRoute: appRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'Security',
          theme: AppTheme.lightThemeData,
        ),
      ),
    );
  }
}
