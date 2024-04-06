import 'package:rent_it/resources/strings/auth_strings.dart';

enum FieldTypes {
  username,
  email,
  password,
  confirmPassword,
  tenantEmail,
}

final Map<FieldTypes, String> fieldLabelsMap = {
  FieldTypes.username: FormStrings.username,
  FieldTypes.email: FormStrings.email,
  FieldTypes.password: FormStrings.password,
  FieldTypes.confirmPassword: FormStrings.confirmPassword,
  FieldTypes.tenantEmail: FormStrings.tenantEmail,
};

final Map<FieldTypes, String> fieldHintsMap = {
  FieldTypes.username: FormStrings.usernameHint,
  FieldTypes.email: FormStrings.emailHint,
  FieldTypes.password: FormStrings.passwordHint,
  FieldTypes.confirmPassword: FormStrings.confirmPasswordHint,
  FieldTypes.tenantEmail: FormStrings.tenantEmailHint,
};
