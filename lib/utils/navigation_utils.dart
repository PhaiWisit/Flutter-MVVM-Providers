import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/user_list/view_models/users_view_model.dart';
import 'package:flutter_mvvm_provider/user_list/views/add_user_screen.dart';
import 'package:flutter_mvvm_provider/user_list/views/user_details_screen.dart';
import 'package:provider/provider.dart';

void openUserDetials(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: ((context) => UserDetialsScreen())));
}

void openAddUser(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: ((context) => AddUserScreen())));
}

void onRefresh(BuildContext context) async {
  await Future.delayed(Duration(milliseconds: 500));
  Provider.of<UsersViewModel>(context, listen: false).getUsers();

  // _refreshController.refreshCompleted();
}
