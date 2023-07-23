import 'dart:convert';
import 'dart:io';

import 'package:flutter_mvvm/data/network/baseapi_services.dart';
import 'package:flutter_mvvm/data/response/app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection:");
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection:");

      return responseJson;
    }
    }

    dynamic returnResponse(http.Response response) {
      switch (response.statusCode) {
        case 200:
          dynamic responseJson = jsonDecode(response.body);
          return responseJson;
        case 400:
          throw BadRequestException(response.body.toString());
        case 404:
          throw UnAuthorizedException(response.body.toString());
        default:
          throw FetchDataException(
              'Error occur while communication with server' +
                  'with status code' +
                  response.statusCode.toString());
      }
    }
  }

