import 'package:score_zone/model/area.dart';
import 'package:score_zone/model/coach.dart';
import 'package:score_zone/model/competition.dart';
import 'package:score_zone/model/contract.dart';
import 'package:score_zone/model/player.dart';

class Team {
  final Area area;
  final int? id;
  final String? name;
  final String? shortName;
  final String? tla;
  final String? crest;
  final String? website;
  final int? founded;
  final String? clubColors;
  final String? venue;
  final Competition? runningCompetitions;
  final Coach? coach;
  final List<Player>? squad;
  final Contract? contract;

  Team({
    required this.area,
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
    required this.website,
    required this.clubColors,
    required this.founded,
    required this.venue,
    required this.runningCompetitions,
    required this.coach,
    this.squad,
    required this.contract,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      area: Area.fromJson(json['area'] as Map<String, dynamic>? ?? {}),
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      shortName: json['shortName'] as String? ?? 'Unknown',
      tla: json['tla'] as String? ?? 'Unknown',
      crest: json['crest'] as String? ?? 'Unknown',
      website: json['website'] as String?,
      founded: json['founded'] as int? ?? 0,
      clubColors: json['clubColors'] as String? ?? 'Unknown',
      venue: json['venue'] as String? ?? 'Unknown',
      runningCompetitions: Competition.fromJson(json['competitions'] as Map<String, dynamic>? ?? {}),
      coach: Coach.fromJson(json['coach'] as Map<String, dynamic>? ?? {}),
      squad: (json['squad'] as List<dynamic>?)?.map((item) => Player.fromJson(item)).toList(),
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'shortName': shortName,
      'tla': tla,
      'crest': crest,
    };
  }
}
