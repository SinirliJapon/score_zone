import 'package:score_zone/model/competitions.dart';
import 'package:score_zone/model/standings.dart';

class ScorerResponse {
  final int count;
  final Filters filters;
  final Competition competition;
  final Season season;
  final List<Scorer> scorers;

  ScorerResponse({
    required this.count,
    required this.filters,
    required this.competition,
    required this.season,
    required this.scorers,
  });

  factory ScorerResponse.fromJson(Map<String, dynamic> json) {
    return ScorerResponse(
      count: json['count'] as int? ?? 0,
      filters: Filters.fromJson(json['filters'] as Map<String, dynamic>? ?? {}),
      competition: Competition.fromJson(json['competition'] as Map<String, dynamic>? ?? {}),
      season: Season.fromJson(json['season'] as Map<String, dynamic>? ?? {}),
      scorers: (json['scorers'] as List<dynamic>? ?? [])
          .map((e) => Scorer.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'filters': filters.toJson(),
      'competition': competition.toJson(),
      'season': season.toJson(),
      'scorers': scorers.map((e) => e.toJson()).toList(),
    };
  }
}

class Scorer {
  final Player? player;
  final Team? team;
  final int? playedMatches;
  final int? goals;
  final int? assists;
  final int? penalties;

  Scorer({
    this.player,
    this.team,
    this.playedMatches,
    this.goals,
    this.assists,
    this.penalties,
  });

  factory Scorer.fromJson(Map<String, dynamic> json) {
    return Scorer(
      player: Player.fromJson(json['player'] as Map<String, dynamic>? ?? {}),
      team: Team.fromJson(json['team'] as Map<String, dynamic>? ?? {}),
      playedMatches: json['playedMatches'] as int? ?? 0,
      goals: json['goals'] as int? ?? 0,
      assists: json['assists'] as int? ?? 0,
      penalties: json['penalties'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'player': player?.toJson(),
      'team': team?.toJson(),
      'playedMatches': playedMatches,
      'goals': goals,
      'assists': assists,
      'penalties': penalties,
    };
  }
}

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
  final Team? currentTeam;

  Player({
    required this.id,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.nationality,
    required this.section,
    this.position,
    this.shirtNumber,
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
      currentTeam: json['currentTeam'] as Team?,
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
