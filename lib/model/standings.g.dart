// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandingsResponse _$StandingsResponseFromJson(Map<String, dynamic> json) =>
    StandingsResponse(
      filters: Filters.fromJson(json['filters'] as Map<String, dynamic>),
      area: Area.fromJson(json['area'] as Map<String, dynamic>),
      competition:
          Competition.fromJson(json['competition'] as Map<String, dynamic>),
      season: Season.fromJson(json['season'] as Map<String, dynamic>),
      standings: (json['standings'] as List<dynamic>)
          .map((e) => StandingsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StandingsResponseToJson(StandingsResponse instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'area': instance.area,
      'competition': instance.competition,
      'season': instance.season,
      'standings': instance.standings,
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      season: json['season'] as String,
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'season': instance.season,
    };

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      flag: json['flag'] as String,
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'flag': instance.flag,
    };

Competition _$CompetitionFromJson(Map<String, dynamic> json) => Competition(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      type: json['type'] as String,
      emblem: json['emblem'] as String,
    );

Map<String, dynamic> _$CompetitionToJson(Competition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'type': instance.type,
      'emblem': instance.emblem,
    };

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      id: json['id'] as int,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      currentMatchday: json['currentMatchday'] as int,
      winner: json['winner'],
    );

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'currentMatchday': instance.currentMatchday,
      'winner': instance.winner,
    };

StandingsData _$StandingsDataFromJson(Map<String, dynamic> json) =>
    StandingsData(
      stage: json['stage'] as String,
      type: json['type'] as String,
      group: json['group'],
      table: (json['table'] as List<dynamic>)
          .map((e) => TableData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StandingsDataToJson(StandingsData instance) =>
    <String, dynamic>{
      'stage': instance.stage,
      'type': instance.type,
      'group': instance.group,
      'table': instance.table,
    };

TableData _$TableDataFromJson(Map<String, dynamic> json) => TableData(
      position: json['position'] as int,
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      playedGames: json['playedGames'] as int,
      won: json['won'] as int,
      draw: json['draw'] as int,
      lost: json['lost'] as int,
      points: json['points'] as int,
      goalsFor: json['goalsFor'] as int,
      goalsAgainst: json['goalsAgainst'] as int,
      goalDifference: json['goalDifference'] as int,
    );

Map<String, dynamic> _$TableDataToJson(TableData instance) => <String, dynamic>{
      'position': instance.position,
      'team': instance.team,
      'playedGames': instance.playedGames,
      'won': instance.won,
      'draw': instance.draw,
      'lost': instance.lost,
      'points': instance.points,
      'goalsFor': instance.goalsFor,
      'goalsAgainst': instance.goalsAgainst,
      'goalDifference': instance.goalDifference,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      id: json['id'] as int,
      name: json['name'] as String,
      shortName: json['shortName'] as String,
      tla: json['tla'] as String,
      crest: json['crest'] as String,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortName': instance.shortName,
      'tla': instance.tla,
      'crest': instance.crest,
    };
