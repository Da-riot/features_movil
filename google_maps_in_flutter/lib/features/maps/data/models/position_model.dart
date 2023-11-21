import '../../domain/entities/position.dart';

class PositionModel extends Position {
  PositionModel({
    required double latitud,
    required double longitud,
  }) : super(
          latitud: latitud,
          longitud: longitud,
        );

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return PositionModel(
      latitud: json['latitud'],
      longitud: json['longitud'],
    );
  }

  factory PositionModel.fromEntity(Position maps) {
    return PositionModel(
      latitud: maps.latitud,
      longitud: maps.longitud,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitud': latitud,
      'longitud': longitud,
    };
  }
}
