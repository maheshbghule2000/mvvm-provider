import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_provider/data/network/base_api_services.dart';

import '../app_exception.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    // TODO: implement getApiResponse
    dynamic responsJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responsJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responsJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responsJson;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responsJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responsJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responsJson = jsonDecode(response.body);

        return responsJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw Invalidinputexception(response.body.toString());
      default:
        throw FetchDataException(
            'Error Accoured while communicating web server' +
                'With status code' +
                response.statusCode.toString());
    }
  }
}
