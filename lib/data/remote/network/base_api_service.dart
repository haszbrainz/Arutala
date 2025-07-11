abstract class BaseApiService {
  final String baseUrl = 'https://be-arutala.vercel.app';

  Future<String> getPing();
  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url, dynamic body);
  Future<dynamic> postFormResponse(String url, String imagePath);
}
