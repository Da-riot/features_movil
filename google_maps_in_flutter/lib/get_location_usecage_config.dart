// import 'features/maps/data/datasource/maps_data_source.dart';
// import 'features/maps/data/repositories/maps_respository_impl.dart';
import 'package:google_maps_in_flutter/features/maps/data/datasource/position_datasource.dart';

import 'features/maps/data/repositories/location_repository_impl.dart';
import 'features/maps/domain/usecase/get_location_usecase.dart';

class UsecaseMapsConfig {
  LocationApiDataSourceImpl? locationApiDataSourceImpl;
  LocationRepositoryImpl? locationRepositoryImpl;

  GetLocationUsecase? getLocationUsecase;

  UsecaseMapsConfig() {
    locationApiDataSourceImpl = LocationApiDataSourceImpl();
    locationRepositoryImpl = LocationRepositoryImpl(locationApiDataSourceImpl: locationApiDataSourceImpl!);

    getLocationUsecase = GetLocationUsecase(locationRepositoryImpl!);
  }
}
