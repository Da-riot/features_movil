// import '../repositories/local_repository.dart';

import '../repository/location_repository.dart';

class GetLocationUsecase {
  final LocationRepository locationRepository;

  GetLocationUsecase(this.locationRepository);

  Future<List> execute() async {
    print("al menos bloc");

    try {
      // Llama al repositorio para obtener la lista de locales
      // final locales = await mapsRepository.getUbicacion(data);
      final ubicacion = await locationRepository.getUbicacion();

      if (ubicacion.latitud != '' && ubicacion.longitud != "") {
        return [
          {
            "latitude": ubicacion.latitud,
            "longitud": ubicacion.longitud,
          }
        ]; // Devuelve la lista de locales
      } else {
        throw Exception('La lista de la ubicacion está vacía');
      }
    } catch (e) {
      print('Error al obtener Ubicacion: $e');
      throw e; // Puedes relanzar la excepción si lo prefieres
    }
  }
}
