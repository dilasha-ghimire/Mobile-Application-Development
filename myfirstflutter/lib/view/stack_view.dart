import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  const StackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Stack(
          // can overflow
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              color: Colors.amber,
              child: const Text("I am First Container"),
            ),
            Positioned(
                top: 50,
                right: 50,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: const Text("I am Second container"),
                )),
            const Positioned(
                bottom: -95,
                left: 30,
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 100,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/image2.jpg"),
                    radius: 90,
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
