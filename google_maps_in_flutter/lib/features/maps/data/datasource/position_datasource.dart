import 'package:location/location.dart';
import 'package:google_maps_in_flutter/features/maps/data/models/position_model.dart';

import '../../domain/entities/position.dart';

abstract class MapsDatasource {
  Future<PositionModel> getUbicacion();
}

class LocationApiDataSourceImpl implements MapsDatasource {
  @override
  Future<PositionModel> getUbicacion() async {
    Location location = Location();

    //   LocationData locationData = await location.getLocation();
    //   double latitud = locationData.latitude ?? 0.0;
    //   double longitud = locationData.longitude ?? 0.0;

    //   return Position(latitud: latitud, longitud: longitud);

    LocationData locationData = await location.getLocation();

    double latitud = locationData.latitude ?? 0.0;
    double longitud = locationData.longitude ?? 0.0;

    return PositionModel(latitud: latitud, longitud: longitud);
  }
}
