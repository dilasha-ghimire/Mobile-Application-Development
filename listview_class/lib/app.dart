import 'package:flutter/material.dart';
import 'package:listview_class/view/user_details_view.dart';
import 'package:listview_class/view/user_output_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const UserDetailsView(),
        "/output": (context) => const UserOutputView()
      },
    );
  }
}