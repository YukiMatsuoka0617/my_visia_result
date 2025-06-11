import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/screens/input/widgets/circle_icon_input_field.dart';

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
    return CircleIconInputField(
      controller: controller,
      label: label,
      color: Colors.green,
    );
  }
}
