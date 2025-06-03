// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spell _$SpellFromJson(Map<String, dynamic> json) => Spell(
  nome: json['nome'] as String,
  descricao: json['descricao'] as String,
  elemento: json['elemento'] as String,
);

Map<String, dynamic> _$SpellToJson(Spell instance) => <String, dynamic>{
  'nome': instance.nome,
  'descricao': instance.descricao,
  'elemento': instance.elemento,
};
