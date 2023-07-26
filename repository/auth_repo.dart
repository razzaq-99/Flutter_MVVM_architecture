import 'package:flutter_mvvm/data/network/baseapi_services.dart';
import 'package:flutter_mvvm/resources/app_url.dart';

import '../data/network/networkapi_services.dart';

class AuthRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _baseApiServices.getPostApiResponse(AppUrl.loginUrl, data);

      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
      await _baseApiServices.getPostApiResponse(AppUrl.RegistrationUrl, data);

      return response;
    } catch (e) {
      throw e;
    }
  }
}
