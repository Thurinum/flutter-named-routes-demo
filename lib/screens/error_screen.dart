import 'package:flutter/material.dart';
import 'package:rip_bozo_get_better/components/app_scaffold.dart';
import 'package:rip_bozo_get_better/screens/result_screen.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  static const String routeName = "/input";

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "An error has occurred!",
      children: [
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, ResultScreen.routeName(_number));
            },
            icon: const Icon(Icons.arrow_back),
            label: const Text("Go back"))
      ],
    );
  }
}
