import 'package:flutter/material.dart';

class LoadImageView extends StatelessWidget {
  const LoadImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image View'),
          backgroundColor: Colors.grey,
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: SizedBox(
              //context: the screen we're in
              //The sized box's height and width and 50% of the SafeArea()
              //MediaQuery makes it responsive
              //so when rotating the phone, the SizedBox() is still 50% in width and height
              height: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.height * .5,
              child: Image.asset("assets/images/image1.jpg")),
        ));
  }
}

// child: SingleChildScrollView(
//           //Image.asset because it is being pulled locally, and not from the internet
//           child: Column(
//             children: [
//               Image.asset("assets/images/image1.jpg"),
//               Image.asset("assets/images/image2.jpg"),
//               Image.asset("assets/images/image1.jpg"),
//               Image.asset("assets/images/image2.jpg"),
//             ],
//           )
//         )
