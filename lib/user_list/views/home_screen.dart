import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/components/app_error.dart';
import 'package:flutter_mvvm_provider/components/app_title.dart';
import 'package:flutter_mvvm_provider/components/user_list_row.dart';
import 'package:flutter_mvvm_provider/user_list/view_models/users_view_model.dart';
import 'package:flutter_mvvm_provider/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

import '../../components/app_loading.dart';
import '../models/users_list_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//test data
var imageNetwork = [
  'https://i.pinimg.com/564x/d8/ad/0f/d8ad0f0c34db3c886eddfdf794f889bd.jpg',
  'https://i.pinimg.com/564x/22/ae/2c/22ae2c6fbee73ed7d3bb607b5f91675b.jpg',
  'https://i.pinimg.com/564x/33/2f/51/332f51d65b03fa74d9c6c785244d5dd8.jpg',
  'https://i.pinimg.com/736x/63/3e/3c/633e3ce3827625a3122f5f04f89daf34.jpg',
  'https://i.pinimg.com/736x/f7/71/30/f771308f7f819520fbdf451cf47b466d.jpg',
  'https://i.pinimg.com/736x/60/91/92/609192ef06a798f804f820f3eb1afb38.jpg',
  'https://i.pinimg.com/736x/a5/8b/a9/a58ba9ae54bb8ab47c0b37ccca00bb5f.jpg',
  'https://i.pinimg.com/736x/c9/51/b5/c951b594606d918ed5cd5f484f99eaf1.jpg',
  'https://i.pinimg.com/736x/31/fa/23/31fa235fbe701d29c008a998e10b8c00.jpg',
  'https://i.pinimg.com/564x/ce/2a/95/ce2a95e99faceaf7af19c273b10ebcc1.jpg',
  'https://i.pinimg.com/736x/ba/8d/d3/ba8dd3454bbff608e83146e3724968b9.jpg'
];
int test = 1;

class _HomeScreenState extends State<HomeScreen> {
  // int test = 1;
  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
        actions: [
          IconButton(
              onPressed: () async {
                openAddUser(context);
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () async {
                usersViewModel.addingUser?.name = 'testName' + test.toString();
                usersViewModel.addingUser?.email =
                    "testEmail" + test.toString();
                test++;
                await usersViewModel.addUser();
                imageNetwork.add("https://picsum.photos/10" + test.toString());
              },
              icon: Icon(Icons.add_a_photo))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [_ui(context, usersViewModel)],
        ),
      ),
    );
  }

  _ui(BuildContext context, UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return Apploading();
    } else if (usersViewModel.userError.code != 0) {
      return AppError(
        errortext: usersViewModel.userError.massage,
      );
    } else {
      return Expanded(
        child: RefreshIndicator(
          onRefresh: () async {
            onRefresh(context);
          },
          child: ListView.separated(
              itemBuilder: (context, index) {
                UserModel userModel = usersViewModel.userListModel[index];
                return UserListRow(
                    userModel: userModel,
                    userImageNetwork: imageNetwork[index],
                    onTap: () async {
                      usersViewModel.setSelectedUser(
                          userModel, imageNetwork[index]);
                      openUserDetials(context);
                    });
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: usersViewModel.userListModel.length),
        ),
      );
    }
  }
}
