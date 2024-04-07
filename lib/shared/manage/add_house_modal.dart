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
    initHeight: 0.85,
    maxHeight: 0.85,
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
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      },
      text: 'Submit',
    );
  }
}
