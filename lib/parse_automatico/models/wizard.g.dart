// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wizard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wizard _$WizardFromJson(Map<String, dynamic> json) => Wizard(
  nome: json['nome'] as String,
  idade: (json['idade'] as num).toInt(),
  feiticos: (json['feiticos'] as List<dynamic>)
      .map((e) => Spell.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WizardToJson(Wizard instance) => <String, dynamic>{
  'nome': instance.nome,
  'idade': instance.idade,
  'feiticos': instance.feiticos.map((e) => e.toJson()).toList(),
};
