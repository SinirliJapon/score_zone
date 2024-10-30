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
