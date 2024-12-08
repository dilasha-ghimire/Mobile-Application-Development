import 'package:flutter/material.dart';

class ShowSnackbarView extends StatefulWidget {
  const ShowSnackbarView({super.key});
  @override
  State<ShowSnackbarView> createState() => _ShowSnackbarViewState();
}

class _ShowSnackbarViewState extends State<ShowSnackbarView> {
//Function for snackbar
//ScaffoldMessenger - the container required to display the snack bar
  _showSnackBar1() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Show Message 1"),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
    ));
  }

  _showSnackBar2() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Show Message 2"),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar View'),
        backgroundColor: Colors.grey,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          ElevatedButton(
              //function called here, using arrow function
              onPressed: () => _showSnackBar1(),
              child: const Text("Snackbar 1")),
          ElevatedButton(
              onPressed: () => _showSnackBar2(),
              child: const Text("Snackbar 2")),
        ],
      ),
    );
  }
}
