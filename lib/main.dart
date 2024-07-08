import 'package:flutter/material.dart';
import 'package:fromnotes_mobile/pages/home/home_page.dart';
import 'package:fromnotes_mobile/pages/login/login_page.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(useMaterial3: true, colorScheme: const ColorScheme.dark()),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage()
      },
    );
  }
}
