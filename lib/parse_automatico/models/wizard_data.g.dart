// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wizard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WizardData _$WizardDataFromJson(Map<String, dynamic> json) => WizardData(
  wizards: (json['magos'] as List<dynamic>)
      .map((e) => Wizard.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WizardDataToJson(WizardData instance) =>
    <String, dynamic>{
      'magos': instance.wizards.map((e) => e.toJson()).toList(),
    };
