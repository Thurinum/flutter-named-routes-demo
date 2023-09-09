import 'package:flutter/material.dart';
import 'package:rip_bozo_get_better/components/app_scaffold.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  static const String routeName = "/input";

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "An error has occurred!",
      children: [
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pop();
            },
            icon: const Icon(Icons.arrow_back),
            label: const Text("Go back"))
      ],
    );
  }
}
