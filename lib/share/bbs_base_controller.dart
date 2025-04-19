part of 'widgets.dart';

class BBSBaseController extends ChangeNotifier {
  late BuildContext context;

  bool _loading = true;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void update(Function update) {
    update();
    notifyListeners();
  }



}
