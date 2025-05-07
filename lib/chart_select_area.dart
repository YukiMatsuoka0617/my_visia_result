import 'package:flutter/material.dart';

class ChartSelectArea extends StatelessWidget {
  const ChartSelectArea({
    super.key,
    required this.onSelectionChanged,
    required this.selected,
    this.showSubCategory = false,
    this.selectedSubCategory = '',
    this.onSubCategoryChanged,
    this.subCategories = const [],
    required this.onLabelSelected,
    required this.onAllSelected,
  });

  final Function(Set<String>) onSelectionChanged;
  final String selected;

  final bool showSubCategory;
  final String selectedSubCategory;
  final Function(Set<String>)? onSubCategoryChanged;
  final List<String> subCategories;

  final Function(int) onLabelSelected;
  final Function() onAllSelected;

  final double chipHeight = 48;

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
                    label: Center(child: Text('All')),
                  ),
                  ButtonSegment(
                    value: 'Category',
                    label: Center(child: Text('Category')),
                  ),
                ],
                selected: <String>{selected},
                onSelectionChanged: onSelectionChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (showSubCategory && onSubCategoryChanged != null)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: subCategories.take(3).map((label) {
                  final isSelected = selectedSubCategory == label;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Center(
                          child: Text(
                            label,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (_) {
                          onSubCategoryChanged!({label});
                          onLabelSelected(subCategories.indexOf(label));
                        },
                        selectedColor: Theme.of(context).colorScheme.primary,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: subCategories.skip(3).take(4).map((label) {
                  final isSelected = selectedSubCategory == label;
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Center(
                          child: Text(
                            label,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (_) {
                          onSubCategoryChanged!({label});
                          onLabelSelected(subCategories.indexOf(label));
                        },
                        selectedColor: Theme.of(context).colorScheme.primary,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          )
      ],
    );
  }
}
