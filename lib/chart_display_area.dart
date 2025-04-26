import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/custom_bar_chart.dart';

class ChartDisplayArea extends StatelessWidget {
  final bool isDailyResultShown;
  final int currentPage;
  final int selectLabelIndex;
  final List<String> dateData;
  final List<String> labelData;
  final List<List<double>> allChartData;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const ChartDisplayArea({
    super.key,
    required this.isDailyResultShown,
    required this.currentPage,
    required this.selectLabelIndex,
    required this.dateData,
    required this.labelData,
    required this.allChartData,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          isDailyResultShown
              ? dateData[currentPage]
              : labelData[selectLabelIndex],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: isDailyResultShown
              ? PageView.builder(
                  controller: pageController,
                  itemCount: allChartData.length,
                  onPageChanged: onPageChanged,
                  itemBuilder: (context, index) {
                    return CustomBarChart(
                      data: allChartData[index],
                      labelData: labelData,
                    );
                  },
                )
              : CustomBarChart(
                  data: allChartData
                      .map((list) => list[selectLabelIndex])
                      .toList(),
                  labelData: dateData,
                ),
        ),
      ],
    );
  }
}
