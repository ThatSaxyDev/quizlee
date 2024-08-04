import 'package:flutter_riverpod/flutter_riverpod.dart';

//! TODO: Must remove this and refactor

final loadingStateControllerProvider =
    StateNotifierProvider<LoadingStateController, bool>((ref) {
  return LoadingStateController();
});

class LoadingStateController extends StateNotifier<bool> {
  LoadingStateController() : super(false);

  void loading() {
    state = true;
  }

  void stop() {
    state = false;
  }
}
