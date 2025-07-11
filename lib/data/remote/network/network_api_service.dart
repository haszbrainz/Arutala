import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:program_arutala/data/remote/app_exception.dart';
import 'package:program_arutala/data/remote/network/base_api_service.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future<String> getPing() async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse('$baseUrl/ping'));
      responseJson = returnResponse(response).toString();
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postResponse(String url, dynamic body) async {
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(baseUrl + url),
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});
      responseJson = await _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postFormResponse(String url, String imagePath) async {
    dynamic responseJson;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));
      request.files.add(await http.MultipartFile.fromPath('file', imagePath));
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      responseJson = await _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load data');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
