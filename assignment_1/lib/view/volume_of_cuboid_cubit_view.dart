import 'package:assignment_1/view/cubit/volume_of_cuboid_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VolumeOfCuboidCubitView extends StatelessWidget {
  VolumeOfCuboidCubitView({super.key});

  final lengthController =
      TextEditingController(); // Controller for length input
  final widthController = TextEditingController(); // Controller for width input
  final heightController =
      TextEditingController(); // Controller for height input
  final myKey = GlobalKey<FormState>(); // Form validation key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dilasha - Volume of Cuboid',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 106, 117, 148),
        shadowColor: const Color.fromARGB(255, 3, 1, 22),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 224, 230, 230),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: myKey, // Form key for validation
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20), // Spacer

              // Card for user input (length, width, height)
              Card(
                elevation: 4,
                shadowColor: Colors.black45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16), // Padding inside the card
                  child: Column(
                    children: [
                      const SizedBox(height: 5), // Spacer

                      // Text field for length
                      TextFormField(
                        controller: lengthController,
                        keyboardType: TextInputType.number, // Numeric keyboard
                        decoration: const InputDecoration(
                          labelText: 'Enter length',
                          border: OutlineInputBorder(), // Border style
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter length'; // Error if empty
                          }
                          final double? length =
                              double.tryParse(value); // Try to parse the input
                          if (length == null || length <= 0) {
                            return 'Please enter a valid positive number'; // Error if not valid
                          }
                          return null; // Valid input
                        },
                      ),

                      const SizedBox(height: 10), // Spacer

                      // Text field for width
                      TextFormField(
                        controller: widthController,
                        keyboardType: TextInputType.number, // Numeric keyboard
                        decoration: const InputDecoration(
                          labelText: 'Enter width',
                          border: OutlineInputBorder(), // Border style
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter width'; // Error if empty
                          }
                          final double? width =
                              double.tryParse(value); // Try to parse the input
                          if (width == null || width <= 0) {
                            return 'Please enter a valid positive number'; // Error if not valid
                          }
                          return null; // Valid input
                        },
                      ),

                      const SizedBox(height: 10), // Spacer

                      // Text field for height
                      TextFormField(
                        controller: heightController,
                        keyboardType: TextInputType.number, // Numeric keyboard
                        decoration: const InputDecoration(
                          labelText: 'Enter height',
                          border: OutlineInputBorder(), // Border style
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter height'; // Error if empty
                          }
                          final double? height =
                              double.tryParse(value); // Try to parse the input
                          if (height == null || height <= 0) {
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

              // Result Card
              BlocBuilder<VolumeOfCuboidCubit, double>(
                builder: (context, volume) {
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
                        'Volume: ${volume.toStringAsFixed(2)}', // Display calculated volume
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

              // Calculate Volume Button
              ElevatedButton(
                onPressed: () {
                  if (myKey.currentState!.validate()) {
                    // Validate form
                    final double length =
                        double.parse(lengthController.text); // Parse length
                    final double width =
                        double.parse(widthController.text); // Parse width
                    final double height =
                        double.parse(heightController.text); // Parse height
                    context.read<VolumeOfCuboidCubit>().calculateVolume(
                        length, width, height); // Call cubit method
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
                  'Calculate Volume', // Button text
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
