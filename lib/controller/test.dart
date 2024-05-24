import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();
  var difference = ''.obs;

  void setStartDate(DateTime date) {
    startDate.value = date;
    calculateDifference();
  }

  void setEndDate(DateTime date) {
    endDate.value = date;
    calculateDifference();
  }

  void calculateDifference() {
    if (startDate.value != null && endDate.value != null) {
      final diff = endDate.value!.difference(startDate.value!).inDays;
      difference.value = convertToKhmerNumerals(diff.toString()) + ' ថ្ងៃ';
    } else {
      difference.value = '';
    }
  }

  String format(DateTime date) {
    final formattedDate = DateFormat('yyyy-MM-dd', 'km').format(date);
    return convertToKhmerNumerals(formattedDate);
  }

  String convertToKhmerNumerals(String input) {
    const khmerNumbers = ['០', '១', '២', '៣', '៤', '៥', '៦', '៧', '៨', '៩'];
    return input.replaceAllMapped(RegExp(r'[0-9]'), (match) {
      final digit = match.group(0);
      return khmerNumbers[int.parse(digit!)];
    });
  }
}
