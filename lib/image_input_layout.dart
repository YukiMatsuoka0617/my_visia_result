import 'package:flutter/material.dart';

class ImageInputLayout extends StatelessWidget {
  final Widget image;
  final Widget textFormField;
  final double spacing;

  const ImageInputLayout({
    super.key,
    required this.image,
    required this.textFormField,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: image,
        ),
        SizedBox(width: spacing),
        Expanded(
          child: textFormField,
        ),
      ],
    );
  }
}
