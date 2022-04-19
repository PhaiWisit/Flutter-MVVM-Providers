import 'dart:io';

import 'package:flutter_mvvm_provider/user_list/models/users_list_model.dart';
import 'package:flutter_mvvm_provider/user_list/repo/api_status.dart';
import 'package:flutter_mvvm_provider/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USERS_LIST);
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(
            code: SUCCESS, response: usersListModelFromJson(response.body));
      } else {
        return Failure(
            code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response.');
      }
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet.');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
