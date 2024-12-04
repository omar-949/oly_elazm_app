class AppState {
  final bool? userRoleSelected;

  AppState({
     this.userRoleSelected=false,
  });

  AppState copyWith({
    bool? userRoleSelected,
  }) {
    return AppState(
      userRoleSelected: userRoleSelected ?? this.userRoleSelected,
    );
  }
}
// data layers