import 'package:json_annotation/json_annotation.dart';

part 'spell.g.dart';

@JsonSerializable()
class Spell {
  final String nome;
  final String descricao;
  final String elemento;

  Spell({required this.nome, required this.descricao, required this.elemento});

  factory Spell.fromJson(Map<String, dynamic> json) => _$SpellFromJson(json);
  Map<String, dynamic> toJson() => _$SpellToJson(this);
}