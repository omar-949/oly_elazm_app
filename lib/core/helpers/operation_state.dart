class OperationState {
  final bool isLoading;
  final bool isSuccess;
  final bool isError;
  final bool isForbidden;

  const OperationState(
      {this.isLoading = false,
      this.isSuccess = false,
      this.isError = false,
      this.isForbidden = false});

  static OperationState loading() => const OperationState(isLoading: true);

  static OperationState success() => const OperationState(isSuccess: true);

  static OperationState error() => const OperationState(isError: true);

  static OperationState forbidden() => const OperationState(isForbidden: true);

  /// Returns a new instance of [OperationState] with updated values.
  OperationState copyWith(
      {bool? isLoading, bool? isSuccess, bool? isError, bool? isForbidden}) {
    return OperationState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,
        isForbidden: isForbidden ?? this.isForbidden);
  }
}
