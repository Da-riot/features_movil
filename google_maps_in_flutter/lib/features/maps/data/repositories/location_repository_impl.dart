// import '../../domain/entities/local.dart';
// import '../../domain/repository/locales_repository.dart';
// import '../datasourses/locales_data_sourse.dart';


import 'package:google_maps_in_flutter/features/maps/data/models/position_model.dart';

import '../../domain/entities/position.dart';

import '../../domain/repository/location_repository.dart';
import '../datasource/position_datasource.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationApiDataSourceImpl locationApiDataSourceImpl;

  LocationRepositoryImpl({required this.locationApiDataSourceImpl});

  @override
  Future<Position> getUbicacion() async {
    return await locationApiDataSourceImpl.getUbicacion();
  }
}