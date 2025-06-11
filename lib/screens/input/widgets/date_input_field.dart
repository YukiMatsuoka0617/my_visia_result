import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/image_input_layout.dart';

class DateInputField extends StatelessWidget {
  final TextEditingController controller;
  final Future<void> Function(BuildContext context) onTap;

  const DateInputField({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ImageInputLayout(
        image: const Icon(Icons.calendar_month),
        textFormField: TextFormField(
          controller: controller,
          readOnly: true,
          decoration: const InputDecoration(
            labelText: 'Select a date',
            border: OutlineInputBorder(),
          ),
          onTap: () => onTap(context),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '日付を選択してください';
            }
            return null;
          },
        ),
      ),
    );
  }
}
