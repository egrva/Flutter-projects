import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_works/homework3/modules/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
            title: 'Homeworks',
            debugShowCheckedModeBanner: false,
            theme: theme.copyWith(
                primaryColor: Colors.red,
                colorScheme: theme.colorScheme.copyWith(
                    primary: Colors.red, secondary: Color(0xFFFEF9EB)),
                appBarTheme: AppBarTheme(elevation: 0)))
        .modular();
  }
}
