import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.title, 
    required this.color
  });

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Card(
        color: color ?? Colors.amber,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      
        child: Center(
          child: Text(title,
          style: const TextStyle(fontSize: 22)),),
      ),
    );
  }
}