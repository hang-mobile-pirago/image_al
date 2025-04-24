import 'dart:io';

import 'package:bai1/share/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saver_gallery/saver_gallery.dart';

import '../response/api_client.dart';

class HomeController extends BBSBaseController {
  final prompt = TextEditingController();
  File? _genImageFile;

  File? get genImageFile => _genImageFile;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setPrompt(String? value) {
    if (value == null) return;
    prompt.text = value;
    notifyListeners();
  }

  Future<void> getImage() async {
    _isLoading = true;
    notifyListeners();
    await ApiClient().sentMultipartRequest(
      prompt.text,
      (object) {
        _setOnSuccess(object as List<int>);
      },
      (errorCode) {
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> _setOnSuccess(List<int> bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    File genImageFile = File('${directory.path}/${timestamp}_imagine.png');
    await genImageFile.writeAsBytes(bytes, flush: true);
    _genImageFile = genImageFile;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveImageToGallery() async {
    if (_genImageFile == null) return;
    if (await Permission.photos.request().isGranted ||
        await Permission.storage.request().isGranted) {
      final Uint8List imageBytes = await genImageFile!.readAsBytes();
      final result = await SaverGallery.saveImage(
        imageBytes,
        fileName: genImageFile!.path.split('/').last.split('.').first,
        quality: 100,
        skipIfExists: false,
      );
    } else {
      print("Không có quyền truy cập ảnh/thư viện");
    }
  }
}
