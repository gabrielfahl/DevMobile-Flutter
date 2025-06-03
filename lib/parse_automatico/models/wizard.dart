import 'package:json_annotation/json_annotation.dart';
import 'spell.dart';

part 'wizard.g.dart';

@JsonSerializable(explicitToJson: true)
class Wizard {
  final String nome;
  final int idade;
  final List<Spell> feiticos;

  Wizard({required this.nome, required this.idade, required this.feiticos});

  factory Wizard.fromJson(Map<String, dynamic> json) => _$WizardFromJson(json);
  Map<String, dynamic> toJson() => _$WizardToJson(this);
}