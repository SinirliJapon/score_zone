import 'package:json_annotation/json_annotation.dart';

part 'standings.g.dart';

@JsonSerializable()
class StandingsResponse {
  final Filters filters;
  final Area area;
  final Competition competition;
  final Season season;
  final List<StandingsData> standings;

  StandingsResponse({
    required this.filters,
    required this.area,
    required this.competition,
    required this.season,
    required this.standings,
  });

  factory StandingsResponse.fromJson(Map<String, dynamic> json) =>
      _$StandingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StandingsResponseToJson(this);
}

@JsonSerializable()
class Filters {
  final String season;

  Filters({required this.season});

  factory Filters.fromJson(Map<String, dynamic> json) =>
      _$FiltersFromJson(json);

  Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@JsonSerializable()
class Area {
  final int id;
  final String name;
  final String code;
  final String flag;

  Area(
      {required this.id,
      required this.name,
      required this.code,
      required this.flag});

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}

@JsonSerializable()
class Competition {
  final int id;
  final String name;
  final String code;
  final String type;
  final String emblem;

  Competition({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.emblem,
  });

  factory Competition.fromJson(Map<String, dynamic> json) =>
      _$CompetitionFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionToJson(this);
}

@JsonSerializable()
class Season {
  final int id;
  final String startDate;
  final String endDate;
  final int currentMatchday;
  final dynamic winner;

  Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    required this.winner,
  });

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}

@JsonSerializable()
class StandingsData {
  final String stage;
  final String type;
  final dynamic group;
  final List<TableData> table;

  StandingsData({
    required this.stage,
    required this.type,
    required this.group,
    required this.table,
  });

  factory StandingsData.fromJson(Map<String, dynamic> json) =>
      _$StandingsDataFromJson(json);

  Map<String, dynamic> toJson() => _$StandingsDataToJson(this);
}

@JsonSerializable()
class TableData {
  final int position;
  final Team team;
  final int playedGames;
  final int won;
  final int draw;
  final int lost;
  final int points;
  final int goalsFor;
  final int goalsAgainst;
  final int goalDifference;

  TableData({
    required this.position,
    required this.team,
    required this.playedGames,
    required this.won,
    required this.draw,
    required this.lost,
    required this.points,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDifference,
  });

  factory TableData.fromJson(Map<String, dynamic> json) =>
      _$TableDataFromJson(json);

  Map<String, dynamic> toJson() => _$TableDataToJson(this);
}

@JsonSerializable()
class Team {
  final int id;
  final String name;
  final String shortName;
  final String tla;
  final String crest;

  Team({
    required this.id,
    required this.name,
    required this.shortName,
    required this.tla,
    required this.crest,
  });

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
