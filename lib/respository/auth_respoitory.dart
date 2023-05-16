

import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../res/componants/app_url.dart';

class AuthRespotory {
  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.loginUrlEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
  Future<dynamic>signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
   Future<dynamic>RegisterUserApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.registerUserApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
