import 'package:score_zone/model/competitions.dart';
import 'package:score_zone/model/standings.dart';

class MatchBaseResponse {
  MatchBaseResponse({
    required this.matches,
  });

  final List<Match> matches;

  MatchBaseResponse.fromJson(Map<String, dynamic> json)
      : matches = (json['matches'] as List<dynamic>?)
            ?.map((e) => Match.fromJson(e as Map<String, dynamic>))
            .toList() ?? [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matches'] = matches.map((e) => e.toJson()).toList();
    return data;
  }
}

class Match {
  final Area? area;
  final Competition? competition;
  final Season? season;
  final int? id;
  final DateTime? utcDate;
  final String? status;
  final int? matchday;
  final String? stage;
  final dynamic group;
  final DateTime? lastUpdated;
  final Team? homeTeam;
  final Team? awayTeam;
  final Score? score;
  final Odds? odds;
  final List<Referee>? referees;

  Match({
    required this.area,
    required this.competition,
    required this.season,
    required this.id,
    required this.utcDate,
    required this.status,
    required this.matchday,
    required this.stage,
    required this.group,
    required this.lastUpdated,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
    required this.odds,
    required this.referees,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        area: json['area'] != null ? Area.fromJson(json['area']) : null,
        competition: json['competition'] != null ? Competition.fromJson(json['competition']) : null,
        season: json['season'] != null ? Season.fromJson(json['season']) : null,
        id: json['id'] as int? ?? 0,
        utcDate: json['utcDate'] != null ? DateTime.parse(json['utcDate']) : null,
        status: json['status'] as String? ?? 'Unkown',
        matchday: json['matchday'] as int? ?? 0,
        stage: json['stage'] as String? ?? 'Unkown',
        group: json['group'],
        lastUpdated: json['lastUpdated'] != null ? DateTime.parse(json['lastUpdated']) : null,
        homeTeam: json['homeTeam'] != null ? Team.fromJson(json['homeTeam']) : null,
        awayTeam: json['awayTeam'] != null ? Team.fromJson(json['awayTeam']) : null,
        score: json['score'] != null ? Score.fromJson(json['score']) : null,
        odds: json['odds'] != null ? Odds.fromJson(json['odds']) : null,
        referees:
            json['referees'] != null ? List<Referee>.from(json['referees'].map((x) => Referee.fromJson(x))) : [],
      );

  Map<String, dynamic> toJson() => {
        'area': area?.toJson(),
        'competition': competition?.toJson(),
        'season': season?.toJson(),
        'id': id,
        'utcDate': utcDate?.toIso8601String(),
        'status': status,
        'matchday': matchday,
        'stage': stage,
        'group': group,
        'lastUpdated': lastUpdated?.toIso8601String(),
        'homeTeam': homeTeam?.toJson(),
        'awayTeam': awayTeam?.toJson(),
        'score': score?.toJson(),
        'odds': odds?.toJson(),
        'referees': referees != null ? List<dynamic>.from(referees!.map((x) => x.toJson())) : null,
      };
}

class Odds {
  String? msg;

  Odds({
    this.msg,
  });

  factory Odds.fromJson(Map<String, dynamic> json) => Odds(
        msg: json['msg'] as String? ?? 'Unknown',
      );

  Map<String, dynamic> toJson() => {
        'msg': msg,
      };
}

class Referee {
  final int? id;
  final String? name;
  final String? type;
  final String? nationality;

  Referee({
    this.id,
    this.name,
    this.type,
    this.nationality,
  });

  factory Referee.fromJson(Map<String, dynamic> json) => Referee(
        id: json['id'] as int? ?? 0,
        name: json['name'] as String? ?? 'Unknown',
        type: json['type'] as String? ?? 'Unkown',
        nationality: json['nationality'] as String? ?? 'Unknown',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'nationality': nationality,
      };
}

class Score {
  final String? winner;
  final String? duration;
  final Map<String, dynamic>? fullTime;
  final Map<String, dynamic>? halfTime;

  Score({
    this.winner,
    this.duration,
    this.fullTime,
    this.halfTime,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        winner: json['winner'] as String? ?? 'Unknown',
        duration: json['duration'] as String? ?? 'Unknown',
        fullTime: json['fullTime'] as Map<String, dynamic>? ?? {},
        halfTime: json['halfTime'] as Map<String, dynamic>? ?? {},
      );

  Map<String, dynamic> toJson() => {
        'winner': winner,
        'duration': duration,
        'fullTime': fullTime,
        'halfTime': halfTime,
      };
}
