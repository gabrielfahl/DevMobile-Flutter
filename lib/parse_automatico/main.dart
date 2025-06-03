import 'package:flutter/material.dart';
import 'screens/wizard_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Magos',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Cor primária padrão
      ),
      home: const WizardListScreen(),
    );
  }
}