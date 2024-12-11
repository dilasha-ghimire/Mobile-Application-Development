import 'package:myfirstflutter/view/card_view.dart';
// import 'package:myfirstflutter/view/flexible_expanded_view.dart';
// import 'package:myfirstflutter/view/load_image_view.dart';
// import 'package:myfirstflutter/view/show_snackbar_view.dart';
// import 'package:myfirstflutter/view/load_image_view.dart';
// import 'package:myfirstflutter/view/container_view.dart';
// import 'package:myfirstflutter/view/column_view.dart';
// import 'package:myfirstflutter/view/arithmetic_view.dart';
// import 'package:myfirstflutter/view/first_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: FirstView(),
      // home: ArithmeticView(),
      // home: ColumnView(),
      // home: ContainerView(),
      // home: LoadImageView(),
      // home: ShowSnackbarView(),
      // home: LoadImageView(),
      // home: FlexibleExpandedView().
      home: CardView(),
    );
  }
}
