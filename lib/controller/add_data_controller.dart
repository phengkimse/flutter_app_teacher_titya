import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataController extends GetxController {
  var items = <Map<String, String>>[].obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // Load stored data
    List<dynamic> storedItems = box.read<List>('items') ?? [];
    items.value =
        storedItems.map((item) => Map<String, String>.from(item)).toList();
  }

  void addItem(String title, String dateTime, String priority) {
    final newItem = {
      'title': title,
      'dateTime': dateTime,
      'priority': priority
    };
    items.add(newItem);
    box.write('items', items.toList());
  }
}
