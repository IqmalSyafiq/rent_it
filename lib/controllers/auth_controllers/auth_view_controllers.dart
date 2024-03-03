import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/models/app_user/app_user.dart';

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

class RoleSelector extends StateNotifier<UserRole?> {
  RoleSelector() : super(null);

  void setAsOwner() {
    state = UserRole.owner;
  }

  void setAsTenant() {
    state = UserRole.tenant;
  }

  void resetState() {
    state = null;
  }

  bool get isOwner => state == UserRole.owner;

  UserRole? get role => state;
}

final selectedRoleNotifierProvider = StateNotifierProvider<RoleSelector, UserRole?>((ref) {
  return RoleSelector();
});
