import 'package:bai1/app/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeController - setPrompt', () {
    late HomeController controller;

    setUp(() {
      controller = HomeController();
    });

    test('setPrompt true', () async {
      String testString = '  helooooo w   ';
      controller.setPrompt(testString);
      expect(controller.prompt, testString.trim());
    });

    ///push error if null
    test('setPromptNull', () {
      controller.setPrompt(null);
      expect(controller.prompt, isNotEmpty);
    });
    /// push error if empty
    test('setPromptSpace', () {
      String testString = '     ';
      controller.setPrompt(testString);
      controller.setPrompt(testString);
      expect(controller.prompt,isNotEmpty );
    });
  });
}
