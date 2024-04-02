import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/resources/getters/form_field_getters.dart';
import 'package:rent_it/services/low_level_services/manage_services/manage_services.dart';
import 'package:rent_it/services/top_level_services/main_services.dart/main_services.dart';
import 'package:rent_it/shared/app_text_input_field.dart';
import 'package:rent_it/shared/buttons/primary_button.dart';

Future<void> showAddHouseModal(BuildContext context, {bool google = false}) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.7,
    maxHeight: 0.7,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => const AddHouseModal(),
  );
}

class AddHouseModal extends ConsumerStatefulWidget {
  const AddHouseModal({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddHouseModalState();
}

class _AddHouseModalState extends ConsumerState<AddHouseModal> {
  final addressLineOneController = TextEditingController();
  final addressLineTwoController = TextEditingController();
  final postCodeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final numRoomsController = TextEditingController();
  final bathroomsController = TextEditingController();
  final monthlyRentController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map<FormFieldType, TextEditingController> houseTypes = {
      FormFieldType.addressLineOne: addressLineOneController,
      FormFieldType.addressLineTwo: addressLineTwoController,
      FormFieldType.postCode: postCodeController,
      FormFieldType.city: cityController,
      FormFieldType.state: stateController,
      FormFieldType.numRooms: numRoomsController,
      FormFieldType.bathrooms: bathroomsController,
      FormFieldType.monthlyRent: monthlyRentController,
      FormFieldType.description: descriptionController,
    };

    return CustomScrollView(slivers: [
      SliverAppBar(title: Text('Add House', style: AppTextStyles.bodyLarge), pinned: true, automaticallyImplyLeading: false, actions: [
        IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
      ]),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(children: houseTypes.entries.map((entry) => AppFormTextField(controller: entry.value, type: entry.key)).toList()),
              _buildSubmitButton(houseTypes)
            ])),
      )
    ]);
  }

  Widget _buildSubmitButton(Map<FormFieldType, TextEditingController> houseTypes) {
    return PrimaryButton(
      needLoading: true,
      disabled: false,
      onDisabledPressed: () => showErrorSnackbar(context, 'Please fill in all fields'),
      onPressed: () async {
        final List<TextEditingController> controllers = houseTypes.values.toList();

        await addHouse(controllers);
        // await addReport(reportTitleController.text, reportDescriptionController.text, house!, userName);
        Navigator.pop(context);
      },
      text: 'Submit',
    );
  }
}


  //   @JsonKey(name: 'id') required String id,
  //   @JsonKey(name: 'owner_id') required String ownerId,
  //   @JsonKey(name: 'address_line_one') required String addressLineOne,
  //   @JsonKey(name: 'address_line_two') String? addressLineTwo,
  //   @JsonKey(name: 'postcode') required String postCode,
  //   @JsonKey(name: 'city') required String city,
  //   @JsonKey(name: 'state') required String state,
  //   @JsonKey(name: 'num_rooms') required int numRooms,
  //   @JsonKey(name: 'num_bathrooms') required int bathrooms,
  //   @JsonKey(name: 'monthly_rent') required double monthlyRent,
  //   @JsonKey(name: 'description') String? description,
  //   @JsonKey(name: 'image_url') List<String>? imageUrl,
  //   @JsonKey(name: 'tenants_id') List<String>? tenantsId,
  // }) = _House;