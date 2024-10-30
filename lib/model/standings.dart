import 'package:score_zone/model/area.dart';
import 'package:score_zone/model/competition.dart';
import 'package:score_zone/model/filters.dart';
import 'package:score_zone/model/season.dart';
import 'package:score_zone/model/table_data.dart';

class Standings {
  final Filters filters;
  final Area area;
  final Competition competition;
  final Season season;
  final List<StandingsData> standings;

  Standings({
    required this.filters,
    required this.area,
    required this.competition,
    required this.season,
    required this.standings,
  });

  factory Standings.fromJson(Map<String, dynamic> json) {
    return Standings(
      filters: Filters.fromJson(json['filters'] ?? {}),
      area: Area.fromJson(json['area'] ?? {}),
      competition: Competition.fromJson(json['competition'] ?? {}),
      season: Season.fromJson(json['season'] ?? {}),
      standings: (json['standings'] as List<dynamic>? ?? []).map((e) => StandingsData.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'filters': filters.toJson(),
      'area': area.toJson(),
      'competition': competition.toJson(),
      'season': season.toJson(),
      'standings': standings.map((e) => e.toJson()).toList(),
    };
  }
}

class StandingsData {
  final String? stage;
  final String? type;
  final dynamic group;
  final List<TableData> table;

  StandingsData({
    required this.stage,
    required this.type,
    required this.group,
    required this.table,
  });

  factory StandingsData.fromJson(Map<String, dynamic> json) {
    return StandingsData(
      stage: json['stage'] as String? ?? 'Unknown',
      type: json['type'] as String? ?? 'Unknown',
      group: json['group'],
      table: (json['table'] as List<dynamic>? ?? []).map((e) => TableData.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'stage': stage,
      'type': type,
      'group': group,
      'table': table.map((e) => e.toJson()).toList(),
    };
  }
}