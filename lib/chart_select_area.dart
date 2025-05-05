import 'package:flutter/material.dart';

class ChartSelectArea extends StatelessWidget {
  const ChartSelectArea({
    super.key,
    required this.onSelectionChanged,
    required this.selected,
  });

  final Function(Set<String>) onSelectionChanged;
  final String selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                    value: 'All',
                    label: Text('All'),
                  ),
                  ButtonSegment(
                    value: 'Category',
                    label: Text('Category'),
                  ),
                ],
                selected: <String>{selected},
                onSelectionChanged: onSelectionChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
