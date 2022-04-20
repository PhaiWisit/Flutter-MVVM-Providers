import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/user_list/models/users_list_model.dart';

import 'app_title.dart';

class UserListRow extends StatelessWidget {
  const UserListRow({
    Key? key,
    required this.userModel,
    required this.userImageNetwork,
    required this.onTap,
  }) : super(key: key);
  final Function onTap;
  final UserModel userModel;
  final String userImageNetwork;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  image:
                      DecorationImage(image: NetworkImage(userImageNetwork))),
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
                  text: userModel.name,
                ),
                Text(userModel.email!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
