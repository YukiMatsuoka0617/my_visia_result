import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/chart_display_area.dart';
import 'package:flutter_application_result_visia/chart_select_area.dart';
import 'package:flutter_application_result_visia/data/hive/hive_sservise.dart';
import 'package:flutter_application_result_visia/screens/home/widgets/home_screen_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<List<double>> allChartData = [
    [-41, 45, 9, 46, 10, -41, 48],
    [-37, -39, -41, 47, 46, -24, 4],
    [-39, 43, -41, 44, 45, -31, 49],
    [-41, -4, 8, 23, 17, -41, -25],
    [-30, 5, 15, 1, 26, -41, -10],
    [-36, -39, -41, 29, 38, -41, -41],
  ];
  final List<String> labelData = [
    'Spots',
    'UV Spots',
    'Brown Spots',
    'Wrinkles',
    'Texture',
    'Pores',
    'Porphyrins',
  ];
  final List<String> dateData = [
    '2025/05/19',
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

  String selectedCategory = 'All';
  String selectedSubCategory = 'Spots';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final hive = HiveService();
    final results = hive.getAllData();
    final keys = results.keys.toList();

    setState(() {
      dateData.clear();
      allChartData.clear();
      for (final key in keys) {
        final map = results[key];

        final rawList = map['data'] as List<dynamic>;
        List<double> dataList =
            rawList.map((v) => (v as num).toDouble()).toList();
        dateData.add(key);
        allChartData.add(dataList);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(),
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
            const SizedBox(height: 16),
            ChartSelectArea(
              selected: selectedCategory,
              onSelectionChanged: (newSelection) {
                setState(() {
                  selectedCategory = newSelection.first;
                  isDailyResultShown = (selectedCategory == 'All');
                });
              },
              showSubCategory: selectedCategory == 'Category',
              selectedSubCategory: selectedSubCategory,
              onSubCategoryChanged: (subSelection) {
                setState(() {
                  selectedSubCategory = subSelection.first;
                });
              },
              subCategories: labelData,
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
            ),
          ],
        ),
      ),
    );
  }
}
