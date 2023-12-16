import 'package:smart_beds/common/models/plant.dart';

class Bed {
  final int id;
  final int userId;
  final Plant plant;
  final String soilType;
  double soilValue;
  double soilHumidity;
  final DateTime? wateringDate;
  final String name;

  Bed({
    required this.id,
    required this.userId,
    required this.plant,
    required this.soilType,
    required this.soilValue,
    required this.soilHumidity,
    required this.wateringDate,
    required this.name,
  });

  Bed copyWith({
    int? id,
    int? userId,
    Plant? plant,
    String? soilType,
    double? soilValue,
    double? soilHumidity,
    DateTime? wateringDate,
    String? name,
  }) {
    return Bed(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      plant: plant ?? this.plant,
      soilType: soilType ?? this.soilType,
      soilValue: soilValue ?? this.soilValue,
      soilHumidity: soilHumidity ?? this.soilHumidity,
      wateringDate: wateringDate ?? this.wateringDate,
      name: name ?? this.name,
    );
  }

  factory Bed.fromJson(Map<String, dynamic> json) {
    dynamic plantJson = json['plant'] ?? [];
    Plant plantList = Plant.fromJson(plantJson);

    return Bed(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      plant: plantList,
      soilType: json['soil_type'] ?? '',
      soilValue: json['soil_value'] ?? 0.0,
      soilHumidity: json['soil_humidity'] ?? 0.0,
      wateringDate: json['watering_date'] != null
          ? DateTime.parse(json['watering_date'])
          : null,
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson(int plantId) {
    return {
      "name": name,
      "plant_id": plantId,
      'soil_type': soilType,
      'soil_value': soilValue,
      'soil_humidity': soilHumidity,
      'watering_date':
          wateringDate != null ? wateringDate!.toIso8601String() : "",
    };
  }
}
