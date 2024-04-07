import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rent_it/constant/app_text_styles.dart';
import 'package:rent_it/controllers/auth_controllers/auth_fields_validator_controllers.dart';

class AppDatePickerField extends ConsumerStatefulWidget {
  final TextEditingController controller;
  final TextEditingController finalController;
  final String label;

  const AppDatePickerField({required this.controller, required this.finalController, required this.label, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppDatePickerFieldState();
}

class _AppDatePickerFieldState extends ConsumerState<AppDatePickerField> {
  final List<DateTime?> dates = [];

  Future<void> selectDate() async {
    final selectedDate = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(selectedDayTextStyle: AppTextStyles.bodyMedium.copyWith(color: Theme.of(context).colorScheme.primaryContainer)),
      dialogSize: const Size(325, 400),
      value: dates,
      borderRadius: BorderRadius.circular(15),
    );

    if (selectedDate != null && selectedDate.first != null) {
      setState(() {
        widget.controller.text = DateFormat('dd - MM - yyyy').format(selectedDate.first!);
        widget.finalController.text = selectedDate.first.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(formNotifierProvider);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 6),
        InkWell(
          onTap: selectDate,
          child: TextField(
            controller: widget.controller,
            enabled: false,
            onTap: selectDate,
            decoration: InputDecoration(
              hintText: 'Select Date',
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.outline)),
              filled: true,
              fillColor: Theme.of(context).colorScheme.onInverseSurface,
              suffixIcon: const Icon(Icons.calendar_month_outlined),
            ),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ]),
    );
  }
}
