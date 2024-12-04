import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart'; // For deep equality checks

class MyBlocObserver extends BlocObserver {
  final DeepCollectionEquality _equality = const DeepCollectionEquality();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- ${bloc.runtimeType}', name: 'App bloc state');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    // Check if currentState and nextState are different
    if (!_equality.equals(change.currentState, change.nextState)) {
      log(
        'onChange -- ${bloc.runtimeType}, '
        'state changed from ${change.currentState} to ${change.nextState}',
        name: 'App bloc state',
      );
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- ${bloc.runtimeType}, $error', name: 'App bloc state');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose -- ${bloc.runtimeType}', name: 'App bloc state');
  }
}
