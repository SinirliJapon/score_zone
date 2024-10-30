import 'package:score_zone/model/contract.dart';

class Coach {
  final int? id;
  final String? name;
  final String? dateOfBirth;
  final String? nationality;
  final Contract contract;

  Coach({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.nationality,
    required this.contract,
  });

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      dateOfBirth: json['dateOfBirth'] as String? ?? 'Unknown',
      nationality: json['nationality'] as String? ?? 'Unknown',
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
      'contract': contract.toJson(),
    };
  }
}
