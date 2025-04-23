import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomBarChart extends StatelessWidget {
  final List<double> data;
  final List<String> labelData;

  const CustomBarChart({
    super.key,
    required this.data,
    required this.labelData,
  });

  List<BarChartGroupData> _generateBarGroups() {
    return List.generate(data.length, (i) {
      final value = data[i] + 50;
      final color = value > 50 ? Colors.green : Colors.red;
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            fromY: 50,
            toY: value,
            color: color,
            width: 20,
            borderRadius: BorderRadius.circular(4),
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 100,
        barGroups: _generateBarGroups(),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 10,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  meta: meta,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Text(
                      '${value.toInt()}',
                      textAlign: TextAlign.right,
                    ),
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= labelData.length) {
                  return const SizedBox();
                }
                return Text(
                  labelData[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 20,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= data.length) {
                  return const SizedBox();
                }
                final displayValue = data[index].toInt();
                return Text(
                  displayValue.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          drawHorizontalLine: true,
        ),
        backgroundColor: Colors.white,
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: 85,
              color: Colors.blue,
              strokeWidth: 2,
            ),
            HorizontalLine(
              y: 50,
              color: Colors.black,
              strokeWidth: 2,
            ),
            HorizontalLine(
              y: 15,
              color: Colors.blue,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
