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
import 'package:oly_elazm/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:oly_elazm/features/onboarding/presentation/views/splash_view.dart';
import 'package:oly_elazm/features/settings/presentation/views/edit_profile_view.dart';
import 'package:oly_elazm/features/settings/presentation/views/elmohafez_details_view.dart';
import 'package:oly_elazm/features/settings/presentation/views/setting_view.dart';
import 'package:oly_elazm/features/user_info/presentation/views/user_info.dart';
import '../../features/students_progress/ui/student_progress.dart';
import '../../features/today_memorization_plan/today_memorization.dart';
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
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<AuthCubit>(),
                child: LoginSignUpView(

                ),
              ),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordView(),
        );
      case Routes.verificationCodeScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
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
          builder: (_) => const StudentProgress(),
        );
      case Routes.todayMemorization:
        return MaterialPageRoute(
          builder: (_) => const TodayMemorization(),
        );
      case Routes.settingView:
        return MaterialPageRoute(
          builder: (_) => const SettingView(),
        );
      case Routes.editProfileView:
        return MaterialPageRoute(
          builder: (_) => const EditProfileView(),
        );
      case Routes.elmohafezDetailsView:
        return MaterialPageRoute(
          builder: (_) => const ElmohafezDetailsView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
