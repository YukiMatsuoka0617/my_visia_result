import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/data/hive/hive_sservise.dart';

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
      }
      hive.saveData(
        '${selectedDate?.year}/${selectedDate?.month.toString().padLeft(2, '0')}/${selectedDate?.day.toString().padLeft(2, '0')}',
        result,
      );
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
        title: Text('Input Data Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '日付を選択',
                    border: OutlineInputBorder(),
                  ),
                  onTap: () => _pickDate(context),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '日付を選択してください';
                    }
                    return null;
                  },
                ),
              ),
              ...labelData.map(
                (label) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      controller: controllers[label],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: label,
                        border: const OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '$label を入力してください';
                        }
                        if (double.tryParse(value) == null) {
                          return '$label は数値で入力してください';
                        }
                        return null;
                      },
                    ),
                  );
                },
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
