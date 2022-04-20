import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/user_list/view_models/users_view_model.dart';
import 'package:provider/provider.dart';

import '../../components/app_title.dart';

class UserDetialsScreen extends StatelessWidget {
  const UserDetialsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  image: DecorationImage(
                      image: NetworkImage(usersViewModel.imageNetwork!))),
              width: 50,
              height: 50,
              // color: Colors.amber,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTitle(
                  text: usersViewModel.selectedUser.name,
                ),
                Text(usersViewModel.selectedUser.email!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
