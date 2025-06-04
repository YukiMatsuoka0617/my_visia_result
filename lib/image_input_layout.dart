import 'package:flutter/material.dart';

class ImageInputLayout extends StatelessWidget {
  final Widget image;
  final Widget textFormField;
  final double spacing;
  final double imageFlex;
  final double textFlex;

  const ImageInputLayout({
    super.key,
    required this.image,
    required this.textFormField,
    this.spacing = 8.0,
    this.imageFlex = 2,
    this.textFlex = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: imageFlex.toInt(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: image,
            ),
          ),
        ),
        SizedBox(width: spacing),
        Flexible(
          flex: textFlex.toInt(),
          child: textFormField,
        ),
      ],
    );
  }
}
