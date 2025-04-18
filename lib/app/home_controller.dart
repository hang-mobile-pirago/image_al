import 'package:bai1/share/widgets.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends BBSBaseController {
  final prompt = TextEditingController();

  void setPrompt(String value) {
    prompt.text = value;
    notifyListeners();
  }
}
