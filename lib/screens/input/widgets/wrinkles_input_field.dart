import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/image_input_layout.dart';

class WrinklesInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const WrinklesInputField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ImageInputLayout(
        image: Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
        ),
        textFormField: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$label を入力してください';
            }
            if (double.tryParse(value) == null) {
              return '$label は数値で入力してください';
            }
            return null;
          },
        ),
      ),
    );
  }
}
