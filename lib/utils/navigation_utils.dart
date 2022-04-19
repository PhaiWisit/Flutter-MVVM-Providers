import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/user_list/views/user_details_screen.dart';

void openUserDetials(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: ((context) => UserDetialsScreen())));
}
