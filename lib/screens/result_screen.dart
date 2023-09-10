import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rip_bozo_get_better/components/app_scaffold.dart';
import 'package:rip_bozo_get_better/main.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.input});

  final String input;

  @override
  Widget build(BuildContext context) {
    final int number = int.parse(input); // assuming this always works
    final int randomNumber = Random().nextInt(App.maxNumber - 1);
    final result = number == randomNumber
        ? "✅ You guessed the right number! ✅"
        : "💀 Wrong guess '$number' rip bozo get better 💀";

    return AppScaffold(
      title: "My result",
      children: [
        Text(result, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 24),
        ElevatedButton.icon(
            onPressed: () {
              context.go("/");
            },
            icon: const Icon(Icons.arrow_back),
            label: const Text("Try again"))
      ],
    );
  }
}
