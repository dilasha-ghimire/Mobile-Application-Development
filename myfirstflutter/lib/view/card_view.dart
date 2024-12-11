import 'package:flutter/material.dart';
import 'package:myfirstflutter/common/my_card.dart';
import 'package:myfirstflutter/common/my_snackbar.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //spread operator used
            for (int i = 1; i <= 10; i++) ...{
              GestureDetector(
                onTap: () => showMySnackBar(
                    context: context, message: "This is Card $i"),
                child: MyCard(
                    title: "Card $i",

                    //isEven used instead of if..else
                    color: i.isEven ? Colors.blue : Colors.amber),
              )
            }
          ],
        ),
      )),
    );
  }
}
