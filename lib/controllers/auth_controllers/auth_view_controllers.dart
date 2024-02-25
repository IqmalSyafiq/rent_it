import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthToggle extends StateNotifier<bool> {
  AuthToggle() : super(false);

  void toggleValue() {
    state = !state;
  }

  bool get isSignUp => state;
}

final authToggleProvider = StateNotifierProvider<AuthToggle, bool>((ref) {
  return AuthToggle();
});
