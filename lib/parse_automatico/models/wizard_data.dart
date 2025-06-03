import 'package:json_annotation/json_annotation.dart';
import 'wizard.dart';

part 'wizard_data.g.dart';

@JsonSerializable(explicitToJson: true)
class WizardData {
  @JsonKey(name: 'magos')
  final List<Wizard> wizards;

  WizardData({required this.wizards});

  factory WizardData.fromJson(Map<String, dynamic> json) => _$WizardDataFromJson(json);
  Map<String, dynamic> toJson() => _$WizardDataToJson(this);
}