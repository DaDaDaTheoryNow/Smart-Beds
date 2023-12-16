class PlantData {
  final double airHumidity;
  final double soilHumidity;
  final double soilValue;
  final String? wateringDate;
  final int lightLevel;

  PlantData({
    required this.airHumidity,
    required this.soilHumidity,
    required this.soilValue,
    required this.wateringDate,
    required this.lightLevel,
  });

  factory PlantData.fromJson(Map<String, dynamic> json) {
    return PlantData(
      airHumidity: json['air_humidity'] as double,
      soilHumidity: json['soil_humidity'] as double,
      soilValue: json['soil_value'] as double,
      wateringDate: json['watering_date'] as String?,
      lightLevel: json['light_level'] as int,
    );
  }
}
