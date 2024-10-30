import 'package:score_zone/model/team.dart';

class Player {
  final int? id;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? nationality;
  final String? section;
  final String? position;
  final int? shirtNumber;
  final String? lastUpdated;
  final Team currentTeam;

  Player({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.nationality,
    required this.section,
    required this.position,
    required this.shirtNumber,
    required this.lastUpdated,
    required this.currentTeam,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      firstName: json['firstName'] as String? ?? 'Unknown',
      lastName: json['lastName'] as String? ?? 'Unknown',
      dateOfBirth: json['dateOfBirth'] as String? ?? 'Unknown',
      nationality: json['nationality'] as String? ?? 'Unknown',
      section: json['section'] as String? ?? 'Unknown',
      position: json['position'] as String? ?? 'Unknown',
      shirtNumber: json['shirtNumber'] as int? ?? 0,
      lastUpdated: json['lastUpdated'] as String? ?? 'Unknown',
      currentTeam: Team.fromJson(json['currentTeam'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
      'section': section,
      'position': position,
      'shirtNumber': shirtNumber,
      'lastUpdated': lastUpdated,
    };
  }
}
