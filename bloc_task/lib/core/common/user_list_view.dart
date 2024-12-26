import 'package:bloc_task/model/user.dart';
import 'package:bloc_task/view/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, List<User>>(
      builder: (context, userList) {
        if (userList.isEmpty) {
          return const Center(child: Text("No data"));
        }

        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final user = userList[index];
              return ListTile(
                leading: const Icon(Icons.wysiwyg),
                title: Text("${user.firstName} ${user.lastName}"),
                subtitle: Text(user.city),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
