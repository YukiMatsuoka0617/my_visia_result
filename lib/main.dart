import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/data/hive/hive_sservise.dart';
import 'package:flutter_application_result_visia/screens/home/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
          color: Colors.white,
        )),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
