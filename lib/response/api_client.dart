import 'package:http/http.dart' as http;

class ApiClient {
  final String BASE_URL;
  final String token;

  ApiClient({
    this.BASE_URL = 'https://api.vyro.ai/v2/image/generations',
    this.token = 'vk-9jOf1EqW83pGz7AqfVBS6z5kCF76mIhtk6DWaSy90j2EP',
  });

  Future<void> sentMultipartRequest(
    String prompt,
    Function(dynamic object)? onSuccess,
    Function(String errorCode)? onError,
  ) async {
    var request = http.MultipartRequest('POST', Uri.parse(BASE_URL));
    request.headers['Authorization'] = "Bearer $token";
    request.fields['prompt'] = prompt;
    request.fields['style'] = "realistic";
    request.fields['high_res_result'] = "0";
    try {
      var streamedResponse = await request.send();

      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = response.bodyBytes;
        print('success');
        if (onSuccess != null) onSuccess(data);
      } else {
        if (onError != null)
          onError('Lỗi ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      if (onError != null) onError('Lỗi gửi request: $e');
    }
  }
}
