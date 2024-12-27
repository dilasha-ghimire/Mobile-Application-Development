import 'package:assignment_1/view/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Stateless widget for the Simple Interest Calculator
class SimpleInterestCubitView extends StatelessWidget {
  const SimpleInterestCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers for TextFormFields to handle user input
    final principalController = TextEditingController();
    final rateController = TextEditingController();
    final timeController = TextEditingController();

    // Key for form validation
    final myKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dilasha - Simple Interest',
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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(
                context); // Navigate back when the back button is pressed
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 224, 230, 230),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: myKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              // User Input Card for entering principal, rate, and time
              Card(
                elevation: 4,
                shadowColor: Colors.black45,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),

                      // TextFormField for Principal Amount
                      TextFormField(
                        controller: principalController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Enter Principal Amount',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter principal amount';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      // TextFormField for Rate of Interest
                      TextFormField(
                        controller: rateController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Enter Rate of Interest',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter rate of interest';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),

                      // TextFormField for Time
                      TextFormField(
                        controller: timeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Enter Time (in years)',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter time';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Card to display the calculated Simple Interest
              BlocBuilder<SimpleInterestCubit, double>(
                builder: (context, simpleInterest) {
                  return Card(
                    elevation: 3,
                    color: const Color.fromARGB(158, 162, 171, 196),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Simple Interest: Rs. ${simpleInterest.toStringAsFixed(2)}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Button to calculate Simple Interest
              ElevatedButton(
                onPressed: () {
                  // Validates the form
                  if (myKey.currentState!.validate()) {
                    final principal = double.parse(principalController.text);
                    final rate = double.parse(rateController.text);
                    final time = double.parse(timeController.text);

                    // Calls the Cubit method to calculate simple interest
                    context.read<SimpleInterestCubit>().calculateSimpleInterest(
                          principal: principal,
                          rate: rate,
                          time: time,
                        );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: const Color.fromARGB(179, 163, 212, 180),
                ),
                child: const Text(
                  'Calculate Simple Interest',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
