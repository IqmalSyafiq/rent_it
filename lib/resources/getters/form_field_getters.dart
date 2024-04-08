import 'package:rent_it/resources/strings/form_field_strings.dart';

enum FormFieldType {
  reportTitle,
  reportDescription,
  addressLineOne,
  addressLineTwo,
  postCode,
  city,
  state,
  numRooms,
  bathrooms,
  monthlyRent,
  description,
  tenantEmail,
  documentType,
  documentName,
}

final Map<FormFieldType, String> formFieldLabelsMap = {
  FormFieldType.reportTitle: FormFieldStrings.reportTitle,
  FormFieldType.reportDescription: FormFieldStrings.reportDescription,
  FormFieldType.addressLineOne: FormFieldStrings.addressLineOne,
  FormFieldType.addressLineTwo: FormFieldStrings.addressLineTwo,
  FormFieldType.postCode: FormFieldStrings.postCode,
  FormFieldType.city: FormFieldStrings.city,
  FormFieldType.state: FormFieldStrings.state,
  FormFieldType.numRooms: FormFieldStrings.numRooms,
  FormFieldType.bathrooms: FormFieldStrings.bathrooms,
  FormFieldType.monthlyRent: FormFieldStrings.monthlyRent,
  FormFieldType.description: FormFieldStrings.description,
  FormFieldType.tenantEmail: FormFieldStrings.tenantEmail,
  FormFieldType.documentType: FormFieldStrings.documentType,
  FormFieldType.documentName: FormFieldStrings.documentName,
};

final Map<FormFieldType, String> formFieldHintsMap = {
  FormFieldType.reportTitle: FormFieldStrings.reportTitleHint,
  FormFieldType.reportDescription: FormFieldStrings.reportDescriptionHint,
  FormFieldType.addressLineOne: FormFieldStrings.addressLineOneHint,
  FormFieldType.addressLineTwo: FormFieldStrings.addressLineTwoHint,
  FormFieldType.postCode: FormFieldStrings.postCodeHint,
  FormFieldType.city: FormFieldStrings.cityHint,
  FormFieldType.state: FormFieldStrings.stateHint,
  FormFieldType.numRooms: FormFieldStrings.numRoomsHint,
  FormFieldType.bathrooms: FormFieldStrings.bathroomsHint,
  FormFieldType.monthlyRent: FormFieldStrings.monthlyRentHint,
  FormFieldType.description: FormFieldStrings.descriptionHint,
  FormFieldType.tenantEmail: FormFieldStrings.tenantEmailHint,
  FormFieldType.documentType: FormFieldStrings.documentTypeHint,
  FormFieldType.documentName: FormFieldStrings.documentNameHint,
};
