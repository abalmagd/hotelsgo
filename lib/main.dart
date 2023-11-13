import 'package:flutter/material.dart';
import 'package:hotelsgo/config/theme/custom_theme.dart';
import 'package:hotelsgo/screens/form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotels Go',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme(context),
      home: const FormScreen(),
    );
  }
}
