import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ChartSelectButtonArea extends StatelessWidget {
  const ChartSelectButtonArea({
    super.key,
    required this.isDailyResultShown,
    required this.selectLabelIndex,
    required this.onLabelSelected,
    required this.onAllSelected,
    required this.labelData,
  });

  final bool isDailyResultShown;
  final int selectLabelIndex;
  final Function(int) onLabelSelected;
  final Function() onAllSelected;
  final List<String> labelData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (int i = 0; i < 3; i++)
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onLabelSelected(i),
                  child: AutoSizeText(
                    labelData[i],
                    textAlign: TextAlign.center,
                    maxLines: labelData[i].contains('\n') ? 2 : 1,
                    minFontSize: 10,
                    stepGranularity: 1,
                  ),
                ),
              ),
          ],
        ),
        Row(
          children: [
            for (int i = 3; i < 7; i++)
              Expanded(
                child: ElevatedButton(
                  onPressed: () => onLabelSelected(i),
                  child: AutoSizeText(
                    labelData[i],
                    textAlign: TextAlign.center,
                    maxLines: labelData[i].contains('\n') ? 2 : 1,
                    minFontSize: 10,
                    stepGranularity: 1,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
