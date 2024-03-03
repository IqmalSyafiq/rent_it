import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_it/controllers/auth_controllers/auth_fields_validator_controllers.dart';
import 'package:rent_it/resources/getters/auth_form_getters.dart';

class AppTextField extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final FieldTypes type;

  final TextEditingController? passwordController;

  const AppTextField({required this.controller, required this.type, this.passwordController, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends ConsumerState<AppTextField> {
  @override
  Widget build(BuildContext context) {
    ref.watch(formNotifierProvider);
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(fieldLabelsMap[widget.type] ?? '', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 6),
        TextField(
          controller: widget.controller,
          obscureText: widget.type == FieldTypes.password || widget.type == FieldTypes.confirmPassword,
          decoration: InputDecoration(
            errorText: ref.watch(formNotifierProvider).errors[widget.type],
            hintText: fieldHintsMap[widget.type] ?? '',
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
            filled: true,
            fillColor: Theme.of(context).colorScheme.onInverseSurface,
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          onChanged: (value) {
            ref.read(formNotifierProvider.notifier).validate(widget.type, value, widget.passwordController?.text);
          },
        )
      ]),
    );
  }
}
