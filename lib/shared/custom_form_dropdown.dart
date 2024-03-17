import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomFormDropdown extends ConsumerStatefulWidget {
  final String label;
  final String hint;
  final List<String> items;
  final void Function(String) onItemSelected;
  const CustomFormDropdown({
    required this.label,
    required this.hint,
    required this.items,
    required this.onItemSelected,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomFormDropdownState();
}

class _CustomFormDropdownState extends ConsumerState<CustomFormDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.label, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 6),
        DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(contentPadding: const EdgeInsets.symmetric(vertical: 8), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
            hint: Text(widget.hint, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5))),
            items: widget.items.map((item) => DropdownMenuItem<String>(value: item, child: Text(item, style: Theme.of(context).textTheme.bodyMedium))).toList(),
            validator: (value) {
              if (value == null) {
                return widget.hint;
              }
              return null;
            },
            onChanged: (value) {
              //Do something when selected item is changed.
            },
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: const ButtonStyleData(padding: EdgeInsets.only(right: 8)),
            iconStyleData: const IconStyleData(icon: Icon(Icons.arrow_drop_down, color: Colors.black45), iconSize: 24),
            dropdownStyleData: DropdownStyleData(decoration: BoxDecoration(borderRadius: BorderRadius.circular(8))),
            menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 16)))
      ]),
    );
  }
}
