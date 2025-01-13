import 'package:bloc_task/view/cubit/arithmetic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArithmeticBlocView extends StatelessWidget {
  const ArithmeticBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNumberController = TextEditingController();
    final TextEditingController secondNumberController =
        TextEditingController();

    int? parseInput(String input) {
      return int.tryParse(input);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Arithmetic Bloc"),
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: firstNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "First Number",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: secondNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Second Number",
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<ArithmeticCubit, int>(
              builder: (context, state) {
                return Text(
                  "Result: $state",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final int? num1 = parseInput(firstNumberController.text);
                final int? num2 = parseInput(secondNumberController.text);
                if (num1 != null && num2 != null) {
                  context.read<ArithmeticCubit>().add(num1, num2);
                }
              },
              child: const Text("Add"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              // CALL BLOC FROM UI NOT DONE
              onPressed: () {
                final int? num1 = parseInput(firstNumberController.text);
                final int? num2 = parseInput(secondNumberController.text);
                if (num1 != null && num2 != null) {
                  context.read<ArithmeticCubit>().subtract(num1, num2);
                }
              },
              child: const Text("Subtract"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final int? num1 = parseInput(firstNumberController.text);
                final int? num2 = parseInput(secondNumberController.text);
                if (num1 != null && num2 != null) {
                  context.read<ArithmeticCubit>().multiply(num1, num2);
                }
              },
              child: const Text("Multiply"),
            ),
          ],
        ),
      ),
    );
  }
}
