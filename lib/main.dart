import 'package:flutter/material.dart';
import 'package:rip_bozo_get_better/screens/error_screen.dart';
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
    return MaterialApp(
      title: "Rip Bozo Get Better",
      // generate theme
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: InputScreen.routeName,
      onGenerateRoute: (settings) {
        bool matches(String expression) {
          if (settings.name == null) {
            return false;
          }

          if (settings.name == expression) {
            return true;
          }
          return RegExp(expression).hasMatch(settings.name!);
        }

        return MaterialPageRoute(
            builder: (context) {
              if (matches("/result/[0-9]+")) {
                List<String> pathComponents = settings.name!.split('/');
                int number;

                if (settings.name == null) {
                  return const InputScreen(); // ErrorScreen
                }

                try {
                  number = int.parse(pathComponents.last);
                } catch (e) {
                  return const InputScreen(); // ErrorScreen
                }

                return ResultScreen(
                  number: number,
                );
              } else if (matches(InputScreen.routeName)) {
                return const InputScreen();
              } else {
                return const ErrorScreen();
              }
            },
            settings: settings);
      },
    );
  }
}
