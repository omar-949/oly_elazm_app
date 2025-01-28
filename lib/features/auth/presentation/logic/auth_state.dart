

import '../../../../core/helpers/operation_state.dart';

/// Represents the entire authentication state.
class AuthState {
  final OperationState loginState;
  final OperationState registerState;
  final OperationState verifyCodeState ;
  final int? verifyCode ;

  const AuthState({
    this.loginState = const OperationState(),
    this.registerState = const OperationState(),
    this.verifyCodeState = const OperationState(),
    this.verifyCode,
  });

  /// Returns a new instance of [AuthState] with updated values.
  AuthState copyWith({
    OperationState? loginState,
    OperationState? registerState,
    OperationState? verifyCodeState,
    int? verifyCode
  }) {
    return AuthState(
      loginState: loginState ?? this.loginState,
      registerState: registerState ?? this.registerState,
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
      verifyCode: verifyCode ?? this.verifyCode
    );
  }
}
