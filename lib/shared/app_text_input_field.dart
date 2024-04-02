import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/auth_controllers/auth_fields_validator_controllers.dart';
import 'package:rent_it/resources/getters/form_field_getters.dart';

class AppFormTextField extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final FormFieldType type;

  final TextEditingController? passwordController;

  const AppFormTextField({required this.controller, required this.type, this.passwordController, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppFormTextFieldState();
}

class _AppFormTextFieldState extends ConsumerState<AppFormTextField> {
  @override
  Widget build(BuildContext context) {
    ref.watch(formNotifierProvider);

    bool isNumber = widget.type == FormFieldType.postCode || widget.type == FormFieldType.numRooms || widget.type == FormFieldType.bathrooms || widget.type == FormFieldType.monthlyRent;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(formFieldLabelsMap[widget.type] ?? '', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 6),
        TextField(
          controller: widget.controller,
          maxLines: widget.type == FormFieldType.reportDescription ? 5 : 1,
          keyboardType: isNumber ? TextInputType.number : null,
          inputFormatters: isNumber
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly // Add this line
                ]
              : null,
          decoration: InputDecoration(
            errorText: ref.watch(formNotifierProvider).errors[widget.type],
            hintText: formFieldHintsMap[widget.type] ?? '',
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
            filled: true,
            fillColor: Theme.of(context).colorScheme.onInverseSurface,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ]),
    );
  }
}
