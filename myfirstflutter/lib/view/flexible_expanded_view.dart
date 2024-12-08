import 'package:flutter/material.dart';

class FlexibleExpandedView extends StatelessWidget {
  const FlexibleExpandedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,

            child: Container(
              color: Colors.yellow,
              width: double.infinity,
            ),
          ),

          //Flexible widget: allows a container (any other widget) to adjust its height acc. to the situation
          //FlexFit.loose - doesnt go beyond the specified height
          //FlexFit.tight - can go beyond the specified height, to cover all available blank spaces (EXPANDED)

          //When using expanded for both containers with no height, it is equally divided (also responsive)

          //When using flex (for both Expanded and Flexible) the containers can be divided in different ratios
          Expanded(
            flex: 2,

            child: Container(
              color: Colors.blue,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}