import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/resources/getters/auth_form_getters.dart';

class FormState {
  final Map<FieldTypes, String?> errors;

  FormState({required this.errors});
}

class FormNotifier extends StateNotifier<FormState> {
  FormNotifier()
      : super(FormState(errors: {
          FieldTypes.email: null,
          FieldTypes.password: null,
          FieldTypes.username: null,
          FieldTypes.confirmPassword: null,
        }));

  void validate(FieldTypes type, String value, [String? password]) {
    String? errorMessage;
    switch (type) {
      case FieldTypes.email:
        errorMessage = value.isEmpty
            ? 'Email cannot be empty'
            : !value.contains('@')
                ? 'Invalid email'
                : null;
        break;
      case FieldTypes.password:
        errorMessage = value.isEmpty
            ? 'Password cannot be empty'
            : value.length < 8
                ? 'Password must be at least 8 characters'
                : null;
        break;
      case FieldTypes.username:
        errorMessage = value.isEmpty ? 'Username cannot be empty' : null;
        break;
      case FieldTypes.confirmPassword:
        errorMessage = value.isEmpty
            ? 'Confirm password cannot be empty'
            : password != value
                ? 'Passwords do not match'
                : null;
        break;
    }
    state = FormState(errors: {
      ...state.errors,
      type: errorMessage
    });
  }

  void reset() {
    state = FormState(errors: {
      FieldTypes.email: null,
      FieldTypes.password: null,
      FieldTypes.username: null,
      FieldTypes.confirmPassword: null,
    });
  }
}

final formNotifierProvider = StateNotifierProvider<FormNotifier, FormState>((ref) => FormNotifier());
