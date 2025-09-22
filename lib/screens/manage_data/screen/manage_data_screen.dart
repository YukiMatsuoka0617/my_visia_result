import 'package:flutter/material.dart';
import 'package:flutter_application_result_visia/data/hive/hive_keys.dart';
import 'package:hive/hive.dart';

class ManageDataScreen extends StatefulWidget {
  const ManageDataScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ManageDataScreenState();
}

class _ManageDataScreenState extends State<ManageDataScreen> {
  late Box<Map> _box;

  final Map<String, bool> _checkedItems = {};

  @override
  void initState() {
    super.initState();
    _box = Hive.box<Map>(HiveKeys.chartBox);

    for (var key in _box.keys) {
      _checkedItems[key.toString()] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final keys = _box.keys.toList();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Data List',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true),
      body: keys.isEmpty
          ? const Center(child: Text('データがありません'))
          : ListView.builder(
              itemCount: keys.length,
              itemBuilder: (context, index) {
                final key = keys[index].toString();
                return ListTile(
                  title: Text(key),
                  // TODO:表示するかどうか検討
                  subtitle: Text(_box.get(key)?['data'].toString() ?? ''),
                  trailing: Checkbox(
                    value: _checkedItems[key] ?? false,
                    onChanged: (bool? value) {
                      setState(() {
                        _checkedItems[key] = value ?? false;
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      _checkedItems[key] = !(_checkedItems[key] ?? false);
                    });
                  },
                );
              },
            ),
    );
  }
}
