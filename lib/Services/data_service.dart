import 'dart:io';

import 'package:gg_interview_task/Models/data.dart';
import 'package:gg_interview_task/Utils/constants.dart';
import 'package:http/http.dart' as http;

class DataService {
  static Future<Object> getData() async {
    try {
      var response = await http.get(Uri.parse(URLLINK));
      if (200 == response.statusCode) {
        return Success(response: ggdataFromJson(response.body));
      }
      return Failure(code: 100, response: 'INVALID RESPONSE');
    } on HttpException {
      return Failure(code: 100, response: 'NO INTERNET');
    } on SocketException {
      return Failure(code: 100, response: 'NO INTERNET');
    } on FormatException {
      return Failure(code: 100, response: 'INVALID FORMAT');
    } catch (e) {
      return Failure(code: 100, response: 'UNKNOWN ERROR');
    }
  }
}

class Success {
  int? code;
  Object? response;
  Success({this.code, this.response});
}

class Failure {
  int? code;
  Object? response;
  Failure({this.code, this.response});
}
