import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/chart_display_area.dart';
import 'package:flutter_application_result_visia/chart_select_area.dart';
import 'package:flutter_application_result_visia/chart_select_button_area.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<List<double>> allChartData = [
    [-37, -39, -41, 47, 46, -24, 4],
    [-39, 43, -41, 44, 45, -31, 49],
    [-41, -4, 8, 23, 17, -41, -25],
    [-30, 5, 15, 1, 26, -41, -10],
    [-36, -39, -41, 29, 38, -41, -41],
  ];
  final List<String> labelData = [
    'Spots',
    'UV \nSpots',
    'Brown \nSpots',
    'Wrinkles',
    'Texture',
    'Pores',
    'Porphyrins',
  ];
  final List<String> dateData = [
    '2025/04/20',
    '2025/03/14',
    '2025/02/16',
    '2025/01/10',
    '2024/12/02',
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool isDailyResultShown = true;
  var selectLabelIndex = 0;

  String selected = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ChartDisplayArea(
                isDailyResultShown: isDailyResultShown,
                currentPage: _currentPage,
                selectLabelIndex: selectLabelIndex,
                dateData: dateData,
                labelData: labelData,
                allChartData: allChartData,
                pageController: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            ChartSelectArea(
              selected: selected,
              onSelectionChanged: (newSelection) {
                setState(() {
                  selected = newSelection.first;
                  isDailyResultShown = (selected == 'All');
                });
              },
            ),
            if (!isDailyResultShown)
              ChartSelectButtonArea(
                  isDailyResultShown: isDailyResultShown,
                  selectLabelIndex: selectLabelIndex,
                  onLabelSelected: (index) {
                    setState(() {
                      selectLabelIndex = index;
                      isDailyResultShown = false;
                    });
                  },
                  onAllSelected: () {
                    setState(() {
                      _currentPage = 0;
                      isDailyResultShown = true;
                    });
                  },
                  labelData: labelData),
            const SizedBox(height: 16),
            if (isDailyResultShown)
              SmoothPageIndicator(
                controller: _pageController,
                count: allChartData.length,
                effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.deepPurple,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
