import 'package:score_zone/model/competitions.dart';
import 'package:score_zone/model/scorers.dart';

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

class Filters {
  final String? season;

  Filters({this.season});

  factory Filters.fromJson(Map<String, dynamic> json) {
    return Filters(
      season: json['season'] as String? ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'season': season,
    };
  }
}

class Area {
  final int? id;
  final String? name;
  final String? code;
  final String? flag;

  Area({
    required this.id,
    required this.name,
    required this.code,
    required this.flag,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      code: json['code'] as String? ?? 'Unknown',
      flag: json['flag'] as String? ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'flag': flag,
    };
  }
}

class Season {
  final int? id;
  final String? startDate;
  final String? endDate;
  final int? currentMatchday;
  final dynamic winner;

  Season({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.currentMatchday,
    required this.winner,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      id: json['id'] as int? ?? 0,
      startDate: json['startDate'] as String? ?? 'Unknown',
      endDate: json['endDate'] as String? ?? 'Unknown',
      currentMatchday: json['currentMatchday'] as int? ?? 1,
      winner: json['winner'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'startDate': startDate,
      'endDate': endDate,
      'currentMatchday': currentMatchday,
      'winner': winner,
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

  factory TableData.fromJson(Map<String, dynamic> json) {
    return TableData(
      position: json['position'] as int? ?? 0,
      team: Team.fromJson(json['team'] ?? {}),
      playedGames: json['playedGames'] as int? ?? 0,
      won: json['won'] as int? ?? 0,
      draw: json['draw'] as int? ?? 0,
      lost: json['lost'] as int? ?? 0,
      points: json['points'] as int? ?? 0,
      goalsFor: json['goalsFor'] as int? ?? 0,
      goalsAgainst: json['goalsAgainst'] as int? ?? 0,
      goalDifference: json['goalDifference'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'position': position,
      'team': team.toJson(),
      'playedGames': playedGames,
      'won': won,
      'draw': draw,
      'lost': lost,
      'points': points,
      'goalsFor': goalsFor,
      'goalsAgainst': goalsAgainst,
      'goalDifference': goalDifference,
    };
  }
}

class Contract {
  final String? start;
  final String? until;

  Contract({required this.start, required this.until});

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      start: json['start'] as String? ?? 'Unknown',
      until: json['until'] as String? ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start': start,
      'until': until,
    };
  }
}

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
      name: json['name']as String? ?? 'Unknown',
      dateOfBirth: json['dateOfBirth']as String? ?? 'Unknown',
      nationality: json['nationality']as String? ?? 'Unknown',
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
