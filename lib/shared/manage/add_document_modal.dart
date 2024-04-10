import 'dart:io';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/resources/getters/form_field_getters.dart';
import 'package:rent_it/services/low_level_services/manage_services/manage_services.dart';
import 'package:rent_it/services/top_level_services/firebase/firebase_storage_services.dart';
import 'package:rent_it/shared/app_text_input_field.dart';
import 'package:rent_it/shared/buttons/primary_button.dart';

Future<void> showAddDocumentModal(BuildContext context, String tenancyId) async {
  return await showFlexibleBottomSheet(
    context: context,
    minHeight: 0,
    initHeight: 0.5,
    maxHeight: 0.5,
    bottomSheetBorderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    builder: (context, controller, _) => AddDocumentModal(tenancyId: tenancyId),
  );
}

class AddDocumentModal extends ConsumerStatefulWidget {
  final String tenancyId;
  const AddDocumentModal({required this.tenancyId, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddDocumentModalState();
}

class _AddDocumentModalState extends ConsumerState<AddDocumentModal> {
  final documentTypeController = TextEditingController();
  final documentNameController = TextEditingController();

  String selectedFileName = 'Choose File (PDF)';

  PlatformFile? selectedFile;

  Future<void> _pickFiles() async {
    FilePickerResult? result;

    result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: [
      'pdf',
      'doc',
      'docx',
      'txt',
      'csv',
      'rtf',
      'html',
      'epub',
      'xml',
      'pptx',
      'odt',
      'ods',
      'odp',
    ]);

    if (result != null && result.files.isNotEmpty) {
      selectedFile = result.files.first;
      final platformFileName = selectedFile!.name;
      // ignore: unused_local_variable
      final platformFileData = selectedFile!.bytes;

      setState(() {
        selectedFileName = platformFileName;
      }); // Call setState to update the UI.
    }
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(slivers: [
        SliverAppBar(
          title: Text('Add Document', style: AppTextStyles.bodyLarge),
          pinned: true,
          automaticallyImplyLeading: false,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          actions: [
            IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))
          ],
        ),
        SliverFillRemaining(hasScrollBody: false, child: buildContent())
      ]);

  Widget buildContent() => Container(
      padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppFormTextField(controller: documentTypeController, type: FormFieldType.documentType),
          AppFormTextField(controller: documentNameController, type: FormFieldType.documentName),
          buildFilePickerButton(),
          buildAddDocumentButton(),
        ],
      ));

  Widget buildFilePickerButton() => Row(
        children: [
          IconButton(
              onPressed: () async {
                await _pickFiles();
              },
              icon: Icon(Icons.add_circle_rounded, color: Theme.of(context).colorScheme.primary)),
          Text(selectedFileName, style: Theme.of(context).textTheme.bodyMedium?.copyWith()),
        ],
      );

  Widget buildAddDocumentButton() => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: PrimaryButton(
          needLoading: true,
          onPressed: () async {
            final result = await uploadFile(File(selectedFile!.path!), selectedFileName);

            await addTenancyDocument(widget.tenancyId, documentTypeController.text, documentNameController.text, result ?? '');
          },
          text: 'Add Document',
        ),
      );
}
