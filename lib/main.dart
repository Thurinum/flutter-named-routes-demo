import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rip_bozo_get_better/screens/input_screen.dart';
import 'package:rip_bozo_get_better/screens/result_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  static const int maxNumber = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Routing demo",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routerConfig: GoRouter(initialLocation: "/", routes: [
        GoRoute(
            path: "/",
            builder: (context, state) => const InputScreen(),
            routes: [
              GoRoute(
                  path: "result/:number",
                  builder: (context, state) => ResultScreen(
                      input: state.pathParameters["number"] ?? "-1")),
            ]),
      ]),
    );
  }
}
