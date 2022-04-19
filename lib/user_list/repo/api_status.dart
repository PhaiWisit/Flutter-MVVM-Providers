import 'package:flutter_mvvm_provider/user_list/models/users_list_model.dart';

class Success {
  int code;
  Object response;
  Success({required this.code, required this.response});
}

class Failure {
  int code;
  Object errorResponse;
  Failure({required this.code, required this.errorResponse});
}
