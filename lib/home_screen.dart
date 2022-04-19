import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/user_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

import 'user_list/models/users_list_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [_ui(usersViewModel)],
        ),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return Container(
        child: Text('loading'),
      );
    } else if (usersViewModel.userError.code != 0) {
      return Container(
        child: Text('error'),
      );
    } else {
      print('ui length = ' + usersViewModel.userListModel.length.toString());
      return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              UserModel userModel = usersViewModel.userListModel[index];
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userModel.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(userModel.email),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: usersViewModel.userListModel.length),
      );
    }
  }
}
