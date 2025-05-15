import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'hive_keys.dart';

class HiveService {
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.openBox(HiveKeys.chartBox);
  }

  Future<void> saveData(String date, List<double> data) async {
    final box = Hive.box<Map>(HiveKeys.chartBox);
    box.put(date, {'data': data});
  }

  Map<String, dynamic> getAllData() {
    final box = Hive.box(HiveKeys.chartBox);
    return Map<String, dynamic>.from(box.toMap());
  }

  Future<void> deleteData(String date) async {
    final box = Hive.box(HiveKeys.chartBox);
    await box.delete(date);
  }

  Future<void> clearAllData() async {
    final box = Hive.box(HiveKeys.chartBox);
    await box.clear();
  }
}
