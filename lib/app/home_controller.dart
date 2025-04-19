import 'dart:io';

import 'package:bai1/share/widgets.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../response/api_client.dart';

class HomeController extends BBSBaseController {
  final prompt = TextEditingController();
  File? _genImageFile;

  File? get genImageFile => _genImageFile;

  void setPrompt(String? value) {
    if (value == null) return;
    prompt.text = value;
    notifyListeners();
  }

  Future<void> getImage() async {
    await ApiClient().sentMultipartRequest(
      prompt.text,
      (object) => _setOnSuccess(object),
      (errorCode) {},
    );
  }

  Future<void> _setOnSuccess(dynamic object) async {
    final directory = await getApplicationDocumentsDirectory();
    _genImageFile = File('${directory.path}/imagine.png');
    await _genImageFile?.writeAsBytes(object);
    notifyListeners();
  }
}
