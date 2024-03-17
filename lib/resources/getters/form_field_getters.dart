import 'package:rent_it/resources/strings/form_field_strings.dart';

enum FormFieldType {
  reportTitle,
  reportDescription
}

final Map<FormFieldType, String> formFieldLabelsMap = {
  FormFieldType.reportTitle: FormFieldStrings.reportTitle,
  FormFieldType.reportDescription: FormFieldStrings.reportDescription,
};

final Map<FormFieldType, String> formFieldHintsMap = {
  FormFieldType.reportTitle: FormFieldStrings.reportTitleHint,
  FormFieldType.reportDescription: FormFieldStrings.reportDescriptionHint,
};
