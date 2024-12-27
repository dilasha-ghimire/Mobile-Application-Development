import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/area_of_circle_cubit.dart';

class AreaOfCircleCubitView extends StatelessWidget {
  AreaOfCircleCubitView({super.key});

  // Controller for the radius input text field
  final radiusController = TextEditingController();
  // Key for form validation
  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with a title and back button
      appBar: AppBar(
        title: const Text(
          'Dilasha - Area of Circle', // Title of the app
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 10, // Shadow effect
        backgroundColor:
            const Color.fromARGB(255, 106, 117, 148), // Background color
        shadowColor: const Color.fromARGB(255, 3, 1, 22), // Shadow color
        iconTheme: const IconThemeData(color: Colors.white), // Icon color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(
          255, 224, 230, 230), // Background color for the body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15), // Padding around the content
        child: Form(
          key: myKey, // Form key for validation
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .stretch, // Stretch children to fill the width
            children: [
              const SizedBox(height: 20), // Spacer

              // Card for user input (radius)
              Card(
                elevation: 4, // Elevation for shadow effect
                shadowColor: Colors.black45, // Shadow color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16), // Padding inside the card
                  child: Column(
                    children: [
                      const SizedBox(height: 5), // Spacer
                      // Text field for user input
                      TextFormField(
                        controller: radiusController, // Controller for input
                        keyboardType: TextInputType.number, // Numeric keyboard
                        decoration: const InputDecoration(
                          labelText: 'Enter radius', // Label for the input
                          border: OutlineInputBorder(), // Border style
                        ),
                        // Validation logic
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter radius'; // Error if empty
                          }
                          final double? radius =
                              double.tryParse(value); // Try to parse the input
                          if (radius == null || radius <= 0) {
                            return 'Please enter a valid positive number'; // Error if not valid
                          }
                          return null; // Valid input
                        },
                      ),
                      const SizedBox(height: 5), // Spacer
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20), // Spacer

              // Result card displaying the calculated area
              BlocBuilder<AreaOfCircleCubit, double>(
                builder: (context, area) {
                  return Card(
                    elevation: 3, // Elevation for shadow effect
                    color: const Color.fromARGB(
                        158, 162, 171, 196), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20), // Vertical padding
                      child: Text(
                        'Area: ${area.toStringAsFixed(2)}', // Display calculated area
                        textAlign: TextAlign.center, // Center align text
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold), // Text style
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20), // Spacer

              // Button to calculate the area
              ElevatedButton(
                onPressed: () {
                  if (myKey.currentState!.validate()) {
                    // Validate form
                    final double radius =
                        double.parse(radiusController.text); // Parse radius
                    context
                        .read<AreaOfCircleCubit>()
                        .calculateArea(radius); // Call the cubit method
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  backgroundColor: const Color.fromARGB(
                      179, 163, 212, 180), // Background color
                ),
                child: const Text(
                  'Calculate Area', // Button text
                  style: TextStyle(fontSize: 18), // Text style
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
