import 'package:flutter/material.dart';
import 'dart:convert';
import '../models/wizard.dart';
import '../models/wizard_data.dart';
import '../data/wizards_json.dart';
import 'wizard_detail_screen.dart';

class WizardListScreen extends StatefulWidget {
  const WizardListScreen({super.key});

  @override
  State<WizardListScreen> createState() => _WizardListScreenState();
}

class _WizardListScreenState extends State<WizardListScreen> {
  late List<Wizard> wizards;

  @override
  void initState() {
    super.initState();
    _loadWizards();
  }

  void _loadWizards() {
    final Map<String, dynamic> jsonData = jsonDecode(wizardsJsonData);
    final wizardData = WizardData.fromJson(jsonData);
    setState(() {
      wizards = wizardData.wizards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Magos'),
      ),
      body: ListView.builder(
        itemCount: wizards.length,
        itemBuilder: (context, index) {
          final wizard = wizards[index];
          return ListTile(
            title: Text(wizard.nome),
            subtitle: Text('Idade: ${wizard.idade}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WizardDetailScreen(wizard: wizard),
                ),
              );
            },
          );
        },
      ),
    );
  }
}