import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/custom_bar_chart.dart';
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
            if (isDailyResultShown) ...[
              Text(
                dateData[_currentPage],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: allChartData.length,
                  onPageChanged: (value) {
                    setState(() {
                      _currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Expanded(
                      child: CustomBarChart(
                        data: allChartData[index],
                        labelData: labelData,
                      ),
                    );
                  },
                ),
              ),
            ],
            if (!isDailyResultShown) ...[
              Text(
                labelData[selectLabelIndex],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                  child: CustomBarChart(
                data:
                    allChartData.map((list) => list[selectLabelIndex]).toList(),
                labelData: dateData,
              )),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentPage = 0;
                        isDailyResultShown = true;
                      });
                    },
                    child: AutoSizeText(
                      'All',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 10,
                      stepGranularity: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectLabelIndex = 0;
                        isDailyResultShown = false;
                      });
                    },
                    child: AutoSizeText(
                      labelData[0],
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 10,
                      stepGranularity: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectLabelIndex = 1;
                        isDailyResultShown = false;
                      });
                    },
                    child: AutoSizeText(
                      labelData[1],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      minFontSize: 10,
                      stepGranularity: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectLabelIndex = 2;
                        isDailyResultShown = false;
                      });
                    },
                    child: AutoSizeText(
                      labelData[2],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      minFontSize: 10,
                      stepGranularity: 1,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectLabelIndex = 3;
                        isDailyResultShown = false;
                      });
                    },
                    child: AutoSizeText(
                      labelData[3],
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 10,
                      stepGranularity: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectLabelIndex = 4;
                        isDailyResultShown = false;
                      });
                    },
                    child: AutoSizeText(
                      labelData[4],
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 10,
                      stepGranularity: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectLabelIndex = 5;
                        isDailyResultShown = false;
                      });
                    },
                    child: AutoSizeText(
                      labelData[5],
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 10,
                      stepGranularity: 1,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectLabelIndex = 6;
                        isDailyResultShown = false;
                      });
                    },
                    child: AutoSizeText(
                      labelData[6],
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      minFontSize: 10,
                      stepGranularity: 1,
                    ),
                  ),
                ),
              ],
            ),
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
