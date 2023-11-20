import 'package:json_annotation/json_annotation.dart';

part 'competitions.g.dart';

@JsonSerializable()
class Competitions {
  Competitions({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.emblem,
    required this.plan,
    required this.numberOfAvailableSeasons,
    required this.lastUpdated,
  });

  late final int id;
  late final String name;
  late final String code;
  late final String type;
  late final String emblem;
  late final String plan;
  late final int numberOfAvailableSeasons;
  late final String lastUpdated;

  factory Competitions.fromJson(Map<String, dynamic> json) =>
      _$CompetitionsFromJson(json);
  Map<String, dynamic> toJson() => _$CompetitionsToJson(this);
}

class CompetitionBaseResponse {
  CompetitionBaseResponse({
    required this.competitions,
  });

  late final List<Competitions> competitions;

  CompetitionBaseResponse.fromJson(Map<String, dynamic> json) {
    competitions = List.from(json['competitions'])
        .map((e) => Competitions.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['competitions'] = competitions.map((e) => e.toJson()).toList();
    return data;
  }
}
