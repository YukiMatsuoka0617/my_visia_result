import 'package:flutter/material.dart';

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
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final result = labelData
          .map((label) => double.tryParse(controllers[label]!.text))
          .toList();
      print("入力されたデータ: $result");
      // ここで保存処理などに進めます
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
            ],
          ),
        ),
      ),
    );
  }
}
