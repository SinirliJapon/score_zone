// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competitions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Competitions _$CompetitionsFromJson(Map<String, dynamic> json) => Competitions(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      type: json['type'] as String,
      emblem: json['emblem'] as String,
      plan: json['plan'] as String,
      numberOfAvailableSeasons: json['numberOfAvailableSeasons'] as int,
      lastUpdated: json['lastUpdated'] as String,
    );

Map<String, dynamic> _$CompetitionsToJson(Competitions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'type': instance.type,
      'emblem': instance.emblem,
      'plan': instance.plan,
      'numberOfAvailableSeasons': instance.numberOfAvailableSeasons,
      'lastUpdated': instance.lastUpdated,
    };
