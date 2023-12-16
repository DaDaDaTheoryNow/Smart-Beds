class Plant {
  final String name;
  final String type;
  final String picture;
  final String description;
  final double recommendedHumidity;
  final int recommendedLightLevel;
  final int id;

  Plant({
    required this.name,
    required this.type,
    required this.picture,
    required this.description,
    required this.recommendedHumidity,
    required this.recommendedLightLevel,
    required this.id,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      picture: json['picture'] ?? '',
      description: json['description'] ?? '',
      recommendedHumidity: json['recommended_humidity'] ?? 0,
      recommendedLightLevel: json['recommended_light_level'] ?? 0,
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'picture': picture,
      'description': description,
      'recommended_humidity': recommendedHumidity,
      'recommended_light_level': recommendedLightLevel,
    };
  }
}
