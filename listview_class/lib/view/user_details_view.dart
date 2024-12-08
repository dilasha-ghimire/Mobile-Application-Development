
import 'package:flutter/material.dart';
import 'package:listview_class/core/common/user_list_view.dart';
import 'package:listview_class/model/user.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({super.key});

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {
  final _gap = const SizedBox(
    height: 8,
  );

  final items = [
    const DropdownMenuItem(value: "Kathmandu", child: Text("Kathmandu")),
    const DropdownMenuItem(value: "Pokhara", child: Text("Pokhara")),
    const DropdownMenuItem(value: "Chitwan", child: Text("Chitwan")),
  ];

  List<User> userList = [];

  String? city;

  //Controller
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details View'),
        backgroundColor: Colors.grey,
        centerTitle: true,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),

        child: Column(
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: "Enter first name",
                border: OutlineInputBorder()
              ),
            ),

            _gap,
        
            TextFormField(
              controller: _lastNameController,
                decoration: const InputDecoration(
                labelText: "Enter last name",
                border: OutlineInputBorder()
              ),
            ),

            _gap,

            DropdownButtonFormField(
              items: items, 

              onChanged: (value){
                setState(() {
                  city = value;
                });
              },

              decoration: const InputDecoration(
                labelText: "Select a city",
                border: OutlineInputBorder()
              ),
            ),
        
            SizedBox(
              width: double.infinity,
        
              child: ElevatedButton(
                onPressed: (){
                  User user = User(
                    firstName: _firstNameController.text.trim(),
                    lastName: _lastNameController.text.trim(),
                    city: city!
                  );
                  setState(() {
                    userList.add(user);
                  });

                  debugPrint(userList.length.toString());
                }, 
                child: const Text("Add user data")),
            ),

            _gap,
        
            SizedBox(
              width: double.infinity,
        
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/output", arguments: userList);
                }, 
                child: const Text("View users")),
            ),

            //Display user details in ListView
            userList.isEmpty 
            ? const Text("No data") 

            : UserListView(userList: userList)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}
