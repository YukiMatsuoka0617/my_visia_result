import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/custom_bar_chart.dart';

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
    [20, -10, 30, -5, 15, 40, -20],
    [10, 10, 10, 10, 10, 10, 10],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: PageView.builder(
        itemCount: allChartData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                '2025/04/20',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              CustomBarChart(
                data: allChartData[index],
                labelData: labelData,
              ),
            ],
          );
        },
      ),
    );
  }
}
