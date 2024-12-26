import 'package:bloc_task/core/common/user_list_view.dart';
import 'package:flutter/material.dart';

class UserOutputView extends StatelessWidget {
  const UserOutputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Output Cubit'),
        centerTitle: true,
        elevation: 10,
      ),
      body: const UserListView(),
    );
  }
}
