import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oly_elazm/core/di/dependency_injection.dart';
import 'package:oly_elazm/core/routing/routing_arguments.dart';
import 'package:oly_elazm/core/widgets/main_navigator.dart';
import 'package:oly_elazm/features/auth/presentation/logic/auth_cubit.dart';
import 'package:oly_elazm/features/auth/presentation/views/forget_password_view.dart';
import 'package:oly_elazm/features/auth/presentation/views/login_sign_up_view.dart';
import 'package:oly_elazm/features/auth/presentation/views/reset_password_view.dart';
import 'package:oly_elazm/features/auth/presentation/views/verification_code_view.dart';
import 'package:oly_elazm/features/azkhar/data/models/azkhar_model.dart';
import 'package:oly_elazm/features/azkhar/logic/azkar_cubit.dart';
import 'package:oly_elazm/features/azkhar/ui/azker_counter_view.dart';
import 'package:oly_elazm/features/elmohafez_details/logic/rate_elmohafez_cubit.dart';
import 'package:oly_elazm/features/elmohafez_details/ui/elmohafez_details_view.dart';
import 'package:oly_elazm/features/home/data/models/student/assigned_task_model.dart';
import 'package:oly_elazm/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:oly_elazm/features/onboarding/presentation/views/splash_view.dart';
import 'package:oly_elazm/features/settings/data/models/students/profile_model.dart';
import 'package:oly_elazm/features/settings/views/edit_profile_view.dart';
import 'package:oly_elazm/features/settings/views/setting_view.dart';
import 'package:oly_elazm/features/students_progress/logic/student_progress_cubit.dart';
import 'package:oly_elazm/features/today_memorization_plan/logic/today_memorization_plan_cubit.dart';
import 'package:oly_elazm/features/user_info/presentation/views/user_info.dart';

import '../../features/settings/logic/setting_cubit.dart';
import '../../features/students_progress/ui/student_progress.dart';
import '../../features/today_memorization_plan/ui/today_memorization.dart';
import 'named_router.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      case Routes.userInfo:
        return MaterialPageRoute(
          builder: (_) => const UserPreferences(),
        );
      case Routes.loginSignUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: LoginSignUpView(),
          ),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordView(),
        );
      case Routes.verificationCodeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: VerificationCodeView(
              verifyCode: settings.arguments as VerifyCodeArguments,
            ),
          ),
        );
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordView(),
        );
      case Routes.mainNav:
        return MaterialPageRoute(
          builder: (_) => const MainNavigator(),
        );
      case Routes.studentProgress:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<StudentProgressCubit>()..init(settings.arguments as int),
            child: const StudentProgress(),
          ),
        );
      case Routes.todayMemorization:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
  create: (context) => getIt<MemorizationPlanCubit>()..fetchAssignedTask(settings.arguments as AssignedTaskModel),
  child: TodayMemorization(),
),
        );
      case Routes.settingView:
        return MaterialPageRoute(
          builder: (_) => const SettingView(),
        );
      case Routes.editProfileView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SettingCubit>()
              ..initProfileModel(settings.arguments as ProfileModel),
            child: EditProfileView(),
          ),
        );
      case Routes.elmohafezDetailsView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RateElMohafezCubit>()
              ..initElMohafez(profileModel: settings.arguments as ProfileModel),
            child: ElmohafezDetailsView(),
          ),
        );
      case Routes.azkarCountView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AzkarCubit>()
              ..changeAzkar(settings.arguments as AzkarModel),
            child: AzkarCounterView(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
