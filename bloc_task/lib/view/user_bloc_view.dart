import 'package:bloc_task/core/common/user_list_view.dart';
import 'package:bloc_task/model/user.dart';
import 'package:bloc_task/view/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBlocView extends StatelessWidget {
  const UserBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    String? city;

    final gap = const SizedBox(height: 8);

    final items = const [
      DropdownMenuItem(value: "Kathmandu", child: Text("Kathmandu")),
      DropdownMenuItem(value: "Pokhara", child: Text("Pokhara")),
      DropdownMenuItem(value: "Chitwan", child: Text("Chitwan")),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Bloc'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: firstNameController,
              decoration: const InputDecoration(
                labelText: "Enter first name",
                border: OutlineInputBorder(),
              ),
            ),
            gap,
            TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(
                labelText: "Enter last name",
                border: OutlineInputBorder(),
              ),
            ),
            gap,
            DropdownButtonFormField(
              items: items,
              onChanged: (value) {
                city = value;
              },
              decoration: const InputDecoration(
                labelText: "Select a city",
                border: OutlineInputBorder(),
              ),
            ),
            gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (firstNameController.text.isNotEmpty &&
                      lastNameController.text.isNotEmpty &&
                      city != null) {
                    final user = User(
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      city: city!,
                    );

                    context.read<UserCubit>().addUser(user);

                    firstNameController.clear();
                    lastNameController.clear();
                    city = null;
                  }
                },
                child: const Text("Add user data"),
              ),
            ),
            gap,
            const UserListView(),
          ],
        ),
      ),
    );
  }
}
