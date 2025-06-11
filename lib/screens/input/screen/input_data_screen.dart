import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/data/hive/hive_servise.dart';
import 'package:flutter_application_result_visia/screens/input/widgets/brown_spots_input_field.dart';
import 'package:flutter_application_result_visia/screens/input/widgets/date_input_field.dart';
import 'package:flutter_application_result_visia/screens/input/widgets/pores_input_field.dart';
import 'package:flutter_application_result_visia/screens/input/widgets/porphyrins_input_field.dart';
import 'package:flutter_application_result_visia/screens/input/widgets/spots_input_field.dart';
import 'package:flutter_application_result_visia/screens/input/widgets/texture_input_field.dart';
import 'package:flutter_application_result_visia/screens/input/widgets/uv_spots_input_field.dart';
import 'package:flutter_application_result_visia/screens/input/widgets/wrinkles_input_field.dart';

class InputDataScreen extends StatefulWidget {
  const InputDataScreen({super.key});

  @override
  State<StatefulWidget> createState() => _InputDataScreen();
}

class _InputDataScreen extends State<StatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  final List<String> labelData = [
    'Spots',
    'UV Spots',
    'Brown Spots',
    'Wrinkles',
    'Texture',
    'Pores',
    'Porphyrins',
  ];
  final Map<String, TextEditingController> controllers = {};

  final hive = HiveService();
  final _dateController = TextEditingController();
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    for (var label in labelData) {
      controllers[label] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    _dateController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final result = labelData
          .map((label) => double.tryParse(controllers[label]!.text))
          .toList();
      print("入力されたデータ: $result");

      print("selectedDate: $selectedDate");
      if (selectedDate == null) {
        print("日付を入力してください:");
        return;
      }
      hive.saveData(
        '${selectedDate?.year}/${selectedDate?.month.toString().padLeft(2, '0')}/${selectedDate?.day.toString().padLeft(2, '0')}',
        result,
      );
      Navigator.pop(context, true);
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text =
            '${picked.year}/${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            'Input Data Screen',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DateInputField(
                controller: _dateController,
                onTap: _pickDate,
              ),
              SpotsInputField(
                controller: controllers[labelData[0]]!,
                label: labelData[0],
              ),
              UVSpotsInputField(
                controller: controllers[labelData[1]]!,
                label: labelData[1],
              ),
              BrownSpotsInputField(
                controller: controllers[labelData[2]]!,
                label: labelData[2],
              ),
              WrinklesInputField(
                controller: controllers[labelData[3]]!,
                label: labelData[3],
              ),
              TextureInputField(
                controller: controllers[labelData[4]]!,
                label: labelData[4],
              ),
              PoresInputField(
                controller: controllers[labelData[5]]!,
                label: labelData[5],
              ),
              PorphyrinsInputField(
                controller: controllers[labelData[6]]!,
                label: labelData[6],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  hive.clearAllData();
                },
                child: const Text('Clear All Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
