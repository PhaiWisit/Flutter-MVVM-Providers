import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/components/app_title.dart';
import 'package:flutter_mvvm_provider/components/user_list_row.dart';
import 'package:flutter_mvvm_provider/user_list/view_models/users_view_model.dart';
import 'package:flutter_mvvm_provider/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

import '../../components/app_loading.dart';
import '../models/users_list_model.dart';

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
      return Apploading();
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
              return UserListRow(
                  userModel: userModel,
                  onTap: () async {
                    openUserDetials(context);
                  });
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: usersViewModel.userListModel.length),
      );
    }
  }
}
