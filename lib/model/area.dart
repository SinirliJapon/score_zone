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
