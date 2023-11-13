import 'package:flutter/material.dart';
import 'package:hotelsgo/config/theme/palette.dart';
import 'package:hotelsgo/resources/spacing.dart';

class FormDropdown extends StatefulWidget {
  const FormDropdown({super.key, required this.items, required this.hint});

  final List<String> items;
  final String hint;

  @override
  State<FormDropdown> createState() => _FormDropdownState();
}

class _FormDropdownState extends State<FormDropdown> {
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(Spacing.s12),
      ),
      width: double.infinity,
      child: DropdownButton(
        isExpanded: true,
        underline: const SizedBox.shrink(),
        hint: Text(widget.hint),
        borderRadius: BorderRadius.circular(Spacing.s12),
        value: selectedCity,
        items: widget.items.map((item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(),
        style: theme.textTheme.titleMedium?.copyWith(color: theme.primaryColor),
        onChanged: (String? value) {
          setState(() => selectedCity = value);
        },
      ),
    );
  }
}
