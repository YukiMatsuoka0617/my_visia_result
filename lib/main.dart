import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/screens/home_screen.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text('My VISIA History'),
          ),
          body: HomeScreen(),
        ));
  }
}
