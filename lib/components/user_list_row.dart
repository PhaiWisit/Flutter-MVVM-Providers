import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/user_list/models/users_list_model.dart';

import 'app_title.dart';

class UserListRow extends StatelessWidget {
  const UserListRow({Key? key, required this.userModel, required this.onTap})
      : super(key: key);
  final Function onTap;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: userModel.name,
            ),
            Text(userModel.email!),
          ],
        ),
      ),
    );
  }
}
