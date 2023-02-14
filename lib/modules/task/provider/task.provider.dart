import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  DateTime pickedDate = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) {
      pickedDate = picked;
      notifyListeners();
    }
  }
}
