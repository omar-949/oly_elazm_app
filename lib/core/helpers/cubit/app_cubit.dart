import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(AppState(
        ));

  void changeSelectedUserRole() =>
      emit(state.copyWith(userRoleSelected: !state.userRoleSelected!));
}
