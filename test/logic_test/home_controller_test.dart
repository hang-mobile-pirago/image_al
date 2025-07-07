import 'package:bai1/app/home/home_controller.dart';
import 'package:bai1/response/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([ApiClient])
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
      expect(controller.prompt, isNotEmpty);
    });
  });

  test('sentMultipartRequest handles success', () async {
    final mockApi = MockApiClient();
    final controller = HomeController();
    controller.setPrompt("test");
    when(mockApi.sentMultipartRequest(controller.prompt, any, any)).thenAnswer((realInvocation) async{
      final success = realInvocation.positionalArguments[1] as Function;
      success(['14565']);
    },);
  });

}
