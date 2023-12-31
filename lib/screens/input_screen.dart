import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:rip_bozo_get_better/components/app_scaffold.dart';

import '../main.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Guess the number!",
      children: [
        Text("Please choose a number:",
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 24),
        NumberPicker(
          value: _number,
          minValue: 0,
          maxValue: App.maxNumber,
          onChanged: (value) {
            setState(() {
              _number = value;
            });
          },
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
            onPressed: () {
              context.go("/result/$_number");
            },
            icon: const Icon(Icons.check),
            label: const Text("Commit my choice")),
      ],
    );
  }
}
