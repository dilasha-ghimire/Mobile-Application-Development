import 'package:bloc_task/view/cubit/arithmetic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArithmeticView extends StatelessWidget {
  ArithmeticView({super.key});

  final _firstController = TextEditingController();
  final _secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Arithmetic Cubit',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 106, 117, 148),
        shadowColor: const Color.fromARGB(255, 3, 1, 22),
      ),
      backgroundColor: const Color.fromARGB(255, 224, 230, 230),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // User Input Card
            Card(
              elevation: 10,
              shadowColor: Colors.black45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  const SizedBox(height: 15),

                  // First Number
                  TextFormField(
                    controller: _firstController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter first number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Second Number
                  TextFormField(
                    controller: _secondController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter second number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                ]),
              ),
            ),
            const SizedBox(height: 20),

            // Result Card
            Card(
              elevation: 3,
              color: const Color.fromARGB(158, 162, 171, 196),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),

                // Step 2: Create BlocBuilder in View
                child: BlocBuilder<ArithmeticCubit, int>(
                  builder: (context, state) {
                    return Text(
                      'Result: $state',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Addition Button
            ElevatedButton(
              onPressed: () {
                final firstNum = int.tryParse(_firstController.text) ?? 0;
                final secondNum = int.tryParse(_secondController.text) ?? 0;
                // Step 4: Add Functions to View
                context.read<ArithmeticCubit>().add(firstNum, secondNum);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color.fromARGB(179, 163, 212, 180),
              ),
              child: const Text(
                'Addition',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),

            // Subtraction Button
            ElevatedButton(
              onPressed: () {
                final firstNum = int.tryParse(_firstController.text) ?? 0;
                final secondNum = int.tryParse(_secondController.text) ?? 0;
                context.read<ArithmeticCubit>().subtract(firstNum, secondNum);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color.fromARGB(179, 163, 212, 180),
              ),
              child: const Text(
                'Subtraction',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 10),

            // Multiplication Button
            ElevatedButton(
              onPressed: () {
                final firstNum = int.tryParse(_firstController.text) ?? 0;
                final secondNum = int.tryParse(_secondController.text) ?? 0;
                context.read<ArithmeticCubit>().multiply(firstNum, secondNum);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: const Color.fromARGB(179, 163, 212, 180),
              ),
              child: const Text(
                'Multiplication',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
