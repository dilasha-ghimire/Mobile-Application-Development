import 'package:flutter/material.dart';
import 'package:listview_class/core/common/user_list_view.dart';
import 'package:listview_class/model/user.dart';

class UserOutputView extends StatefulWidget {
  const UserOutputView({super.key});

  @override
  State<UserOutputView> createState() => _UserOutputViewState();
}

class _UserOutputViewState extends State<UserOutputView> {
  List<User> userList = [];

  @override
  void didChangeDependencies() {
    userList = ModalRoute.of(context)!.settings.arguments as List<User>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Output View'),
          backgroundColor: Colors.grey,
          centerTitle: true,
          elevation: 0,
        ),
        body: userList.isEmpty
            ? const Center(child: Text("No data"))
            : UserListView(userList: userList));
  }
}
