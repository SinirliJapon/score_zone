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
