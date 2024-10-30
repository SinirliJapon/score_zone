class Competition {
  final int? id;
  final String? name;
  final String? code;
  final String? type;
  final String? emblem;
  final String? plan;
  final int? numberOfAvailableSeasons;
  final String? lastUpdated;
  
  Competition({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.emblem,
    required this.plan,
    required this.numberOfAvailableSeasons,
    required this.lastUpdated,
  });

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      code: json['code'] as String? ?? 'Unknown',
      type: json['type'] as String? ?? 'Unknown',
      emblem: json['emblem'] as String? ?? 'Unknown',
      plan: json['plan'] as String? ?? 'Unknown',
      numberOfAvailableSeasons: json['numberOfAvailableSeasons'] as int? ?? 0,
      lastUpdated: json['lastUpdated'] as String? ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['name'] = name ?? 'Unknown';
    data['code'] = code ?? 'Unknown';
    data['type'] = type ?? 'Unknown';
    data['emblem'] = emblem ?? 'Unknown';
    data['plan'] = plan ?? 'Unknown';
    data['numberOfAvailableSeasons'] = numberOfAvailableSeasons ?? 0;
    data['lastUpdated'] = lastUpdated ?? 'Unknown';
    return data;
  }
}

class CompetitionBaseResponse {
  final List<Competition> competitions;

  CompetitionBaseResponse({required this.competitions});

  CompetitionBaseResponse.fromJson(Map<String, dynamic> json)
      : competitions = (json['competitions'] as List<dynamic>?)?.map((e) => Competition.fromJson(e as Map<String, dynamic>)).toList() ?? [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['competitions'] = competitions.map((e) => e.toJson()).toList();
    return data;
  }
}
