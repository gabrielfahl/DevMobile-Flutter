import 'package:flutter/material.dart';
import '../models/wizard.dart';
import '../models/spell.dart';

class WizardDetailScreen extends StatelessWidget {
  final Wizard wizard;

  const WizardDetailScreen({super.key, required this.wizard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wizard.nome),
      ),
      body: ListView.builder(
        itemCount: wizard.feiticos.length,
        itemBuilder: (context, index) {
          final spell = wizard.feiticos[index];
          return ListTile(
            title: Text(spell.nome),
            subtitle: Text('Elemento: ${spell.elemento}\nDescrição: ${spell.descricao}'),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}