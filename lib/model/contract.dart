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
